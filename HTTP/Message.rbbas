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

	#tag Method, Flags = &h1
		Protected Function ToString(HeadersOnly As Boolean) As String
		  Dim data As String
		  If mHeaders.Count > 0 Then
		    If Me IsA HTTP.Request Then
		      data = mHeaders.Source + CRLF + CRLF
		    Else
		      data = mHeaders.Source(True) + CRLF + CRLF
		    End If
		  End If
		  If Not HeadersOnly Then data = data + Me.MessageBody
		  Return data
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim c As ContentType
			  If Me.HasHeader("Content-Type") Then
			    c = Me.Header("Content-Type")
			  Else
			    Dim s As String = NthField(Me.Path.Path, "/", CountFields(Me.Path.Path, "/"))
			    c = SpecialFolder.Temporary.Child(s)
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
		Path As HTTP.URI
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
