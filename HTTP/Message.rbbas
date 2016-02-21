#tag Class
Protected Class Message
	#tag Method, Flags = &h1
		Protected Sub Constructor(Headers As HTTP.Headers)
		  mHeaders = Headers
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(CopyFrom As HTTP.Message)
		  Me.ProtocolVersion = CopyFrom.ProtocolVersion
		  Me.Path = CopyFrom.Path
		  
		  If Me.ProtocolVersion > 1.11 Or Me.ProtocolVersion < 1.0 Then RaiseEvent HTTPDebug("Warn: Unknown HTTP version.", -1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllHeaders()
		  mHeaders.DeleteAllHeaders
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasHeader(HeaderName As String) As Boolean
		  For i As Integer = 0 To mHeaders.Count - 1
		    If mHeaders.Name(i) = HeaderName Then Return True
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Header(Headername As String) As String
		  For i As Integer = 0 To mHeaders.Count - 1
		    If mHeaders.Name(i) = headername Then
		      Return mHeaders.Value(i)
		    End If
		  Next
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Header(Name As String, AllowDuplicate As Boolean = False, Assigns Value As String)
		  If Not AllowDuplicate And Me.HasHeader(Name) Then mHeaders.Delete(Name)
		  mHeaders.AppendHeader(Name, Value)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsChunked() As Boolean
		  If Me.Header("Transfer-Encoding") = "chunked" Then Return True
		  
		  Dim i As Integer = InStrB(MessageBody, CRLF)
		  If i <= 0 Then Return False
		  If i > 64 Then Return False 'too big to be a chunk header
		  Dim hed, sz As String
		  hed = NthFieldB(MessageBody, CRLF, 1)
		  sz = NthField(hed, ";", 1)
		  If IsNumeric(sz) Then
		    Return Val("&h" + sz) > 0
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsCompressed() As Boolean
		  If Me.Header("Content-Encoding") = "deflate" Then Return True
		  If Me.Header("Content-Encoding") = "gzip" Then Return True
		  If LeftB(MessageBody, 2) = Chr(&h1F) + Chr(&h8B) Then Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ToString(HeadersOnly As Boolean) As String
		  Dim data As String
		  If Me IsA HTTP.Request Then
		    data = mHeaders.Source + CRLF + CRLF
		  Else
		    data = mHeaders.Source(True) + CRLF + CRLF
		  End If
		  If Not HeadersOnly Then data = data + Me.MessageBody
		  Return data
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event HTTPDebug(Message As String, Level As Integer)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim c As ContentType
			  If Me.HasHeader("Content-Type") Then
			    Dim s As String = Me.Header("Content-Type")
			    If s.Trim <> "" Then
			      c = Me.Header("Content-Type")
			    Else
			      c = "unspecified/unspecified"
			      RaiseEvent HTTPDebug("Warn: Content-Type is empty.", -1)
			    End If
			  ElseIf Me.Path <> Nil Then
			    Dim s As String = NthField(Me.Path.Path.ToString, "/", CountFields(Me.Path.Path.ToString, "/"))
			    c = SpecialFolder.Temporary.Child(s)
			  Else
			    c = "application/octet-stream"
			  End If
			  
			  If c.SuperType = "text" And c.CharSet = Nil Then
			    If Me.MessageBody.Encoding <> Nil Then c.CharSet = Me.MessageBody.Encoding
			  End If
			  
			  Return c
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Header("Content-Type") = value.ToString
			  If value.CharSet <> Nil Then MessageBody = DefineEncoding(MessageBody, value.CharSet)
			End Set
		#tag EndSetter
		ContentType As ContentType
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		MessageBody As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHeaders As Headers
	#tag EndProperty

	#tag Property, Flags = &h0
		Path As URIHelpers.URI
	#tag EndProperty

	#tag Property, Flags = &h0
		ProtocolVersion As Single = 1.1
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageBody"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProtocolVersion"
			Group="Behavior"
			InitialValue="1.1"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
