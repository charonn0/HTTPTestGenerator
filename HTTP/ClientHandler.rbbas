#tag Class
Protected Class ClientHandler
Inherits SSLSocket
	#tag Event
		Sub DataAvailable()
		  ' Worker is a property of this class.
		  ' Worker.Run is handled by the ThreadRun method
		  If Worker.State <> Thread.Running Then Worker.Run
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  If Worker <> Nil And Worker.State <> Thread.NotRunning Then Worker.Kill
		  RaiseEvent Error()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Constructor() -- From TCPSocket
		  Super.Constructor
		  Worker = New Thread
		  AddHandler Worker.Run, WeakAddressOf ThreadRun
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function GZip(MessageBody As String) As String
		  'This function requires the GZip plugin available at http://sourceforge.net/projects/realbasicgzip/
		  
		  #If GZipAvailable And TargetHasGUI Then'
		    Dim size As Single = MessageBody.LenB
		    If size > 2^26 Then Return MessageBody 'if bigger than 64MB, don't try compressing it.
		    MessageBody = GZip.Compress(MessageBody)
		    If GZip.Error <> 0 Then
		      Raise New RuntimeException
		    End If
		    Dim mb As New MemoryBlock(MessageBody.LenB + 8)
		    mb.Byte(0) = &h1F 'magic
		    mb.Byte(1) = &h8B 'magic
		    mb.Byte(2) = &h08 'use deflate
		    mb.StringValue(8, MessageBody.LenB) = MessageBody
		    Return mb
		  #Else
		    Return MessageBody
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ReadNextRequest() As HTTP.Request
		  If NthField(Me.Lookahead, CRLF + CRLF, 1).Trim = "" Then Return Nil
		  Dim clientrequest As HTTP.Request = Me.Read(InStr(Me.Lookahead, CRLF + CRLF) + 3)
		  If clientrequest.HasHeader("Content-Length") Then
		    Dim cl As Integer = Val(clientrequest.Header("Content-Length"))
		    If cl + 3 <= Me.Lookahead.LenB Then
		      Dim msg As String = Me.Read(cl + 3)
		      clientrequest.MessageBody = msg
		    Else ' still data coming
		      Dim d As New MemoryBlock(0)
		      Dim entity As New BinaryStream(d)
		      Do
		        entity.Write(Me.ReadAll)
		        App.YieldToNextThread
		      Loop Until entity.Length >= cl
		      clientrequest.MessageBody = d
		    End If
		  End If
		  Return clientrequest
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendMessage(HTTPMessage As HTTP.Response)
		  Dim s As String = HTTPMessage.ToString
		  Me.Write(s)
		  Me.Flush
		  RaiseEvent MessageSent(HTTPMessage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ThreadRun(Sender As Thread)
		  ' This method handles the Worker.Run() event. Receives and processes all requests made to the server,
		  ' raises the HandleRequest event, and sends the response to the client.
		  
		  #pragma Unused Sender
		  
		  Do Until InStr(Me.Lookahead, CRLF + CRLF) = 0
		    Dim doc As Response = ErrorPage(200)
		    Dim clientrequest As Request
		    clientrequest = ReadNextRequest()
		    Dim user, pass, pw As String
		    If clientrequest <> Nil Then
		      pw = DecodeBase64(Replace(clientrequest.Header("Authorization"), "Basic ", ""))
		      pass = NthField(pw, ":", 2)
		      user = NthField(pw, ":", 1)
		    End If
		    
		    ' start processing the request.
		    Select Case True
		    Case clientrequest = Nil
		      doc = ErrorPage(400) 'bad request
		      
		    Case AuthenticationRequired And Not Authenticate(clientrequest, user, pass, AuthenticationRealm)
		      doc = ErrorPage(401)
		      doc.Header("WWW-Authenticate") = "Basic realm=""" + AuthenticationRealm + """"
		      
		    Case clientrequest.ProtocolVersion < 1.0 Or clientrequest.ProtocolVersion >= 1.2
		      doc = ErrorPage(505) 'Unsupported protocol version
		      
		    Else
		      doc.ProtocolVersion = clientrequest.ProtocolVersion
		      If Not HandleRequest(clientrequest, doc) Then
		        ' No one handled the request, so we send an error message of some sort
		        Select Case clientrequest.Method
		        Case RequestMethod.HEAD, RequestMethod.GET
		          doc = ErrorPage(404)
		        Case RequestMethod.TRACE
		          doc = ErrorPage(200)
		          doc.Header("Content-Length") = Str(doc.MessageBody.LenB)
		          doc.Header("Content-Type") = "message/http"
		          doc.MessageBody = clientrequest.ToString(True)
		        Case RequestMethod.OPTIONS
		          doc = ErrorPage(200)
		          doc.Header("Allow") = "GET, HEAD, TRACE, OPTIONS"
		        Else
		          If clientrequest.MethodName <> "" And clientrequest.Method = RequestMethod.InvalidMethod Then
		            doc = ErrorPage(501) 'Not implemented
		          ElseIf clientrequest.MethodName = "" Then
		            doc = ErrorPage(400) 'bad request
		          ElseIf clientrequest.MethodName <> "" Then
		            doc = ErrorPage(405)
		            doc.Header("Allow") = "GET, HEAD, TRACE, OPTIONS"
		          End If
		        End Select
		      End If
		    End Select
		    
		    ' Verify that the resource is of an Acceptable ContentType (HTTP 1.1 only)
		    If EnforceContentType And ClientRequest.ProtocolVersion > 1.0 And doc.StatusCode < 300 And doc.StatusCode >= 200 Then
		      If Not clientrequest.Accepts(doc.ContentType) Then
		        Dim accepted As ContentType = doc.ContentType
		        doc = ErrorPage(406) 'Not Acceptable
		        doc.ContentType = accepted
		      End If
		    End If
		    
		    'If clientrequest.Method = RequestMethod.HEAD Then
		    'doc.MessageBody = ""
		    'Else
		    If doc.HasHeader("Content-Length") And Val(doc.Header("Content-Length")) <> doc.MessageBody.LenB Then
		      doc.Header("Content-Length") = Str(doc.MessageBody.LenB)
		    End If
		    
		    ' set this again in case they got overwritten
		    doc.Path = clientrequest.Path
		    If doc.StatusCode <> 505 Then doc.ProtocolVersion = clientrequest.ProtocolVersion ' 505 HTTP Version Not Supported
		    
		    ' set the Connection header if needed (default "close")
		    If clientrequest.Header("Connection") = "keep-alive" Then
		      doc.Header("Connection") = "keep-alive"
		    ElseIf clientrequest.ProtocolVersion > 1.0 Then
		      doc.Header("Connection") = "close"
		    End If
		    
		    ' Finally, send the response to the client
		    Me.SendMessage(doc)
		    If doc.Header("Connection") <> "keep-alive" Then
		      Me.Close
		    End If
		  Loop
		  
		Exception Err
		  If Err IsA EndException Or Err IsA ThreadEndException Then Raise Err
		  'Return an HTTP 500 Internal Server Error page.
		  Dim errpage As Response = ErrorPage(500)
		  errpage.Header("Connection") = "close"
		  Me.Purge
		  Me.SendMessage(errpage)
		  Me.Close
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Authenticate(ClientRequest As HTTP.Request, Username As String, Password As String, Realm As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HandleRequest(ClientRequest As HTTP.Request, ByRef ResponseDocument As HTTP.Response) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MessageSent(HTTPMessage As HTTP.Response)
	#tag EndHook


	#tag Property, Flags = &h0
		AuthenticationRealm As String = "Restricted Area"
	#tag EndProperty

	#tag Property, Flags = &h0
		AuthenticationRequired As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		EnforceContentType As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		UseGZip As Boolean = GZipAvailable
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Worker As Thread
	#tag EndProperty


	#tag Constant, Name = GZipAvailable, Type = Boolean, Dynamic = False, Default = \"False", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AuthenticationRealm"
			Group="Behavior"
			InitialValue="Restricted Area"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AuthenticationRequired"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificateFile"
			Visible=true
			Group="Behavior"
			Type="FolderItem"
			InheritedFrom="SSLSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificatePassword"
			Visible=true
			Group="Behavior"
			Type="String"
			InheritedFrom="SSLSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CertificateRejectionFile"
			Visible=true
			Group="Behavior"
			Type="FolderItem"
			InheritedFrom="SSLSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConnectionType"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
			InheritedFrom="SSLSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnforceContentType"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InheritedFrom="SSLSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="SSLSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="SSLSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Secure"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="SSLSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="SSLSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="SSLSocket"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
