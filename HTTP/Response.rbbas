#tag Class
Protected Class Response
Inherits HTTP.Message
	#tag Event
		Sub HTTPDebug(Message As String, Level As Integer)
		  RaiseEvent HTTPDebug(Message, Level)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1001
		Protected Sub Constructor(Raw As String)
		  Dim body As Integer = InStr(raw, CRLF + CRLF) + 3
		  Me.MessageBody = Right(raw, raw.Len - body)
		  raw = Replace(raw, Me.MessageBody, "").Trim
		  Dim line As String
		  line = NthField(raw, CRLF, 1)
		  raw = Replace(raw, line + CRLF, "")
		  raw = Replace(raw, Me.MessageBody, "")
		  // Calling the overridden superclass constructor.
		  Super.Constructor(raw)
		  Dim d As Double = CDbl(Replace(NthField(line, " ", 1).Trim, "HTTP/", ""))
		  If d > 0 Then Me.ProtocolVersion = d
		  Me.StatusCode = Val(NthField(line, " ", 2))
		  If Not Me.IsCompressed Then
		    'If Me.IsChunked Then Me.MessageBody = HTTP.DecodeChunkedData(Me.MessageBody)
		    If Me.ContentType.CharSet <> Nil Then MessageBody = DefineEncoding(MessageBody, Me.ContentType.CharSet)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Headers() As HTTP.Headers
		  Return mheaders
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(NewValue As String)
		  Me.Constructor(NewValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(HeadersOnly As Boolean = False) As String
		  Me.Header("Content-Type") = Me.ContentType.ToString
		  If Not Me.HasHeader("Date") Then Me.Header("Date") = HTTP.DateString(New Date)
		  Dim msg As String = CodeToMessage(Me.StatusCode)
		  Dim p As String = "HTTP/"
		  If Me.StatusCode = 418 Then p = "HTCPCP/" ' This breaks browsers
		  If mHeaders.Count > 0 Then RaiseEvent HTTPDebug("WARN: This response contains no headers.", -1)
		  Return p + Format(Me.ProtocolVersion, "##0.0##") + " " + Str(Me.StatusCode) + " " + msg + CRLF + Super.ToString(HeadersOnly)'
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event HTTPDebug(Message As String, Level As Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		StatusCode As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return CodeToMessage(Me.StatusCode)
			End Get
		#tag EndGetter
		StatusMessage As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageBody"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="HTTP.Message"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProtocolVersion"
			Group="Behavior"
			InitialValue="1.1"
			Type="Single"
			InheritedFrom="HTTP.Message"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusCode"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
