#tag Class
Protected Class ClientHandler
Inherits SSLSocket
	#tag Event
		Sub DataAvailable()
		  ' Worker is a property of this class.
		  ' Worker.Run is handled by the ThreadRun method
		  If Worker.State <> Thread.Running Then 
		    Worker.Run
		  Else
		    RaiseEvent HTTPDebug("Input buffered for processing.", 1)
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  If Worker <> Nil And Worker.State <> Thread.NotRunning Then 
		    Worker.Kill
		    RaiseEvent HTTPDebug("Worker thread killed.", 2)
		  End If
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
		Protected Function ReadNextRequest() As HTTP.Request
		  RaiseEvent HTTPDebug("Processing next request.", 2)
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
		        Dim data As MemoryBlock = Me.ReadAll
		        RaiseEvent HTTPDebug("Read " + Str(data.Size) + " bytes", 1)
		        entity.Write(data)
		        App.YieldToNextThread
		      Loop Until entity.Length >= cl
		      clientrequest.MessageBody = d
		    End If
		  End If
		  RaiseEvent PeekRequest(clientrequest)
		  Return clientrequest
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendMessage(HTTPMessage As HTTP.Response)
		  Dim s As String = HTTPMessage.ToString
		  RaiseEvent HTTPDebug("Write " + Str(s.LenB) + " bytes.", 2)
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
		      RaiseEvent HTTPDebug("The request is malformed.", -1)
		      doc = ErrorPage(400) 'bad request
		      
		    Case AuthenticationRequired And Not Authenticate(clientrequest, user, pass, AuthenticationRealm)
		      RaiseEvent HTTPDebug("The request is unauthorized.", -1)
		      doc = ErrorPage(401) ' Unauthorized
		      doc.Header("WWW-Authenticate") = "Basic realm=""" + AuthenticationRealm + """"
		      
		    Case clientrequest.ProtocolVersion < 1.0 Or clientrequest.ProtocolVersion >= 1.2
		      RaiseEvent HTTPDebug("The request uses an unsupported HTTP version.", -1)
		      doc = ErrorPage(505) 'Unsupported protocol version
		      
		    Else
		      doc.ProtocolVersion = clientrequest.ProtocolVersion
		      If Not HandleRequest(clientrequest, doc) Then
		        ' No one handled the request, so we send an error message of some sort
		        Select Case clientrequest.Method
		        Case RequestMethod.HEAD, RequestMethod.GET
		          RaiseEvent HTTPDebug("The requested item was not found.", -1)
		          doc = ErrorPage(404) ' Not found
		        Case RequestMethod.TRACE
		          doc = ErrorPage(200) ' OK
		          doc.Header("Content-Length") = Str(doc.MessageBody.LenB)
		          doc.Header("Content-Type") = "message/http"
		          doc.MessageBody = clientrequest.ToString(True)
		        Case RequestMethod.OPTIONS
		          doc = ErrorPage(200)
		          doc.Header("Allow") = "GET, HEAD, TRACE, OPTIONS"
		        Else
		          If clientrequest.MethodName <> "" And clientrequest.Method = RequestMethod.InvalidMethod Then
		            If clientrequest.MethodName = "BREW" Or clientrequest.MethodName = "WHEN" Then
		              doc = ErrorPage(418) ' I'm a teapot
		              doc.Header("Content-Type") = "message/teapot"
		              RaiseEvent HTTPDebug("Compatibility mode: HTCPCP", 1)
		            Else
		              RaiseEvent HTTPDebug("The request used an unimplemented HTTP method.", -1)
		              doc = ErrorPage(501) 'Not implemented
		            End If
		          ElseIf clientrequest.MethodName = "" Then
		            RaiseEvent HTTPDebug("The request is malformed.", -1)
		            doc = ErrorPage(400) 'bad request
		          ElseIf clientrequest.MethodName <> "" Then
		            RaiseEvent HTTPDebug("The requested method is not allowed.", -1)
		            doc = ErrorPage(405) ' method not allowed
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
		        RaiseEvent HTTPDebug("Proactive content type negotiation failed.", -1)
		      End If
		    End If
		    
		    
		    If zlib.IsAvailable Then
		      Dim types() As String = Split(ClientRequest.Header("Accept-Encoding"), ",")
		      For i As Integer = 0 To UBound(types)
		        Dim ty As String = types(i).Trim
		        Select Case ty
		        Case "deflate"
		          Dim compressed As String = HTTP.Deflate(doc.MessageBody)
		          If compressed.LenB = clientrequest.MessageBody.LenB Then Exit For
		          doc.Header("Content-Encoding") = "deflate"
		          doc.MessageBody = compressed
		          RaiseEvent HTTPDebug("Compressed response with deflate.", 1)
		          Exit For
		          
		        Case "gzip"
		          Dim compressed As String = HTTP.GZipCompress(doc.MessageBody)
		          If compressed.LenB = clientrequest.MessageBody.LenB Then Exit For
		          doc.Header("Content-Encoding") = "gzip"
		          doc.MessageBody = compressed
		          RaiseEvent HTTPDebug("Compressed response with gzip.", 1)
		          Exit For
		        Else
		          Continue
		        End Select
		      Next
		    End If
		    
		    If doc.HasHeader("Content-Length") And Val(doc.Header("Content-Length")) <> doc.MessageBody.LenB Then
		      doc.Header("Content-Length") = Str(doc.MessageBody.LenB)
		    End If
		    If clientrequest.Method = RequestMethod.HEAD Then doc.MessageBody = ""
		    ' set this again in case they got overwritten
		    doc.Path = clientrequest.Path
		    If doc.StatusCode <> 505 Then doc.ProtocolVersion = clientrequest.ProtocolVersion ' 505 HTTP Version Not Supported
		    
		    ' set the Connection header if needed (default "close")
		    If clientrequest.Header("Connection") = "keep-alive" Then
		      doc.Header("Connection") = "keep-alive"
		      RaiseEvent HTTPDebug("The connection will be left open.", 1)
		    ElseIf clientrequest.ProtocolVersion > 1.0 Then
		      RaiseEvent HTTPDebug("The connection will be closed.", 1)
		      doc.Header("Connection") = "close"
		    End If
		    
		    ' Finally, send the response to the client
		    Me.SendMessage(doc)
		    If doc.Header("Connection") <> "keep-alive" Then
		      Me.Close
		    End If
		  Loop
		  
		  
		  
		Exception Err As RuntimeException
		  If Err IsA EndException Or Err IsA ThreadEndException Then Raise Err
		  'Return an HTTP 500 Internal Server Error page.
		  RaiseEvent HTTPDebug("A runtime error was not handled while processing the request.", -1)
		  Dim errpage As Response = ErrorPage(500)
		  errpage.Header("Connection") = "close"
		  'Me.Purge
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
		Event HTTPDebug(Message As String, Level As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MessageSent(HTTPMessage As HTTP.Response)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PeekRequest(ClientRequest As HTTP.Request)
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

	#tag Property, Flags = &h21
		Private Worker As Thread
	#tag EndProperty


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
