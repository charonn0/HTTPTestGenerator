#tag Class
Protected Class Request
Inherits HTTP.Message
	#tag Event
		Sub HTTPDebug(Message As String, Level As Integer)
		  RaiseEvent HTTPDebug(Message, Level)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Accepts(Type As ContentType) As Boolean
		  If Me.HasHeader("Accept") Then
		    Dim t() As ContentType = ContentType.ParseTypes(Me.Header("Accept"))
		    For x As Integer = 0 To UBound(t)
		      If t(x).Accepts(Type) Then Return True
		    Next
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(Data As String)
		  Dim line As String
		  line = NthField(data.Trim, CRLF, 1)
		  
		  If CountFields(line.Trim, " ") <> 3 Then
		    Super.Constructor(New HTTP.Headers)
		    Return
		  End If
		  
		  data = Replace(data, line + CRLF, "")
		  Dim h As String = NthField(data, CRLF + CRLF, 1)
		  data = Replace(data, h + CRLF + CRLF, "")
		  // Calling the overridden superclass constructor.
		  Super.Constructor(h)
		  Me.MessageBody = Replace(data, h, "")
		  
		  Me.Method = Method(NthField(line, " ", 1).Trim)
		  If Me.Method = RequestMethod.InvalidMethod Then Me.MethodName = NthField(line, " ", 1).Trim
		  
		  Me.Path = NthField(line, " ", 2)
		  Me.ProtocolVersion = CDbl(Replace(NthField(line, " ", 3).Trim, "HTTP/", ""))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cookie(CookieName As String) As String
		  For i As Integer = 0 To mHeaders.CookieCount - 1
		    If mHeaders.Cookie(i).Name = CookieName Then Return mHeaders.Cookie(i).Value
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Headers() As HTTP.Headers
		  Return mHeaders
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsModifiedSince(SinceWhen As Date) As Boolean
		  If SinceWhen = Nil Then Return False
		  If HasHeader("If-Modified-Since") Then
		    Dim d1 As Date
		    d1 = DateString(Me.Header("If-Modified-Since"))
		    Return SinceWhen.TotalSeconds > d1.TotalSeconds
		    
		  ElseIf HasHeader("If-Unmodified-Since") Then
		    Dim d1 As Date
		    d1 = DateString(Me.Header("If-Unmodified-Since"))
		    Return SinceWhen.TotalSeconds < d1.TotalSeconds
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MethodName() As String
		  Select Case Me.Method
		  Case RequestMethod.GET
		    Return "GET"
		    
		  Case RequestMethod.DELETE
		    Return "DELETE"
		    
		  Case RequestMethod.HEAD
		    Return "HEAD"
		    
		  Case RequestMethod.POST
		    Return "POST"
		    
		  Case RequestMethod.PUT
		    Return "PUT"
		    
		  Case RequestMethod.TRACE
		    Return "TRACE"
		    
		  Case RequestMethod.OPTIONS
		    Return "OPTIONS"
		    
		  Else
		    Return mTrueMethodName
		  End Select
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MethodName(Assigns Name As String)
		  'converts a string into an HTTP.RequestMethod. Stores the original string in mTrueMethodName and the
		  'HTTP.RequestMethod in the Method Property
		  Me.Method = Method(Name)
		  mTrueMethodName = Name
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(NewRequest As String)
		  Me.Constructor(NewRequest)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(HeadersOnly As Boolean = false) As String
		  Dim p As URI = Path.ToString
		  p.Scheme = ""
		  p.Host = ""
		  Dim data As String = MethodName + " " + p.ToString + " " + "HTTP/" + Format(ProtocolVersion, "#.0") + CRLF
		  If HeadersOnly Then
		    Dim msgsz As Integer = Me.MessageBody.LenB
		    If mHeaders.Count <= 0 And mHeaders.CookieCount <= 0 Then RaiseEvent HTTPDebug("Warning: This request contains no headers.", -1)
		    If Me.HasHeader("Content-Length") Then
		      If Val(Me.Header("Content-Length")) <> msgsz Then 
		        RaiseEvent HTTPDebug("Warning: The 'Content-Length' header does not match the message body's length.", -1)
		      End If
		    ElseIf msgsz > 0 Then
		      RaiseEvent HTTPDebug("Alert: No length specified for the message body.", -1)
		    End If
		    
		    For Each h As String In Array("Location", "Host", "Referer")
		      If Not Me.HasHeader(h) Then Continue
		      Dim target As URI = Me.Header(h)
		      If target.Username <> "" Or target.Password <> "" Then
		        'http://tools.ietf.org/html/rfc7230#section-2.7.1
		        RaiseEvent HTTPDebug("Warning: The URL specified by a '" + h + "' header must not include the username or password components.", -1)
		      End If
		    Next
		    
		    If msgsz = 0 And Me.Header("Expect") = "100-Continue" Then
		      'http://tools.ietf.org/html/rfc7231#section-5.1.1
		      RaiseEvent HTTPDebug("Warning: The 'Expect: 100-Continue' header is illegal if the request does not include a message body.", -1)
		    End If
		    
		    Select Case Me.MethodName
		    Case "GET"
		      ' http://tools.ietf.org/html/rfc7231#section-4.3.1
		      If msgsz > 0 Then RaiseEvent HTTPDebug("Alert: The semantics of a message body in a GET request are undefined, and might be rejected by some servers.", -1)
		      
		    Case "HEAD"
		      'http://tools.ietf.org/html/rfc7231#section-4.3.2
		      If msgsz > 0 Then RaiseEvent HTTPDebug("Warning: HEAD requests may not include a message body.", -1)
		      
		    Case "TRACE"
		      'http://tools.ietf.org/html/rfc7231#section-4.3.8
		      If msgsz > 0 Then RaiseEvent HTTPDebug("Warning: TRACE requests may not include a message body.", -1)
		      If Me.HasHeader("Authorization") Then RaiseEvent HTTPDebug("Warning: TRACE requests should not include 'Authorization' headers.", -1)
		      If Me.HasHeader("Cookie") Then RaiseEvent HTTPDebug("Alert: TRACE requests should not include 'Cookie' headers.", -1)
		      
		    Case "POST"
		      If msgsz = 0 Then RaiseEvent HTTPDebug("Alert: This POST request does not contain a message body.", -1)
		      If Not Me.HasHeader("Content-Type") Then RaiseEvent HTTPDebug("Alert: This POST request does not specify the Content-Type of the message body.", -1)
		      
		    End Select
		    
		    If Me.ProtocolVersion > 1.0 Then
		      If Not Me.HasHeader("Connection") Then RaiseEvent HTTPDebug("Warning: This request does not include the mandatory 'Connection' header.", -1)
		      If Not Me.HasHeader("Host") Then RaiseEvent HTTPDebug("Warning: This request does not include the mandatory 'Host' header.", -1)
		    Else
		      If Not Me.HasHeader("Host") Then RaiseEvent HTTPDebug("Alert: This request does not include a 'Host' header, and may fail on or be rejected by some servers.", -1)
		    End If
		    
		    
		  End If
		  data = data + Super.ToString(HeadersOnly)
		  
		  Return data
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event HTTPDebug(Message As String, Level As Integer)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMethod
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMethod = value
			  
			  Select Case Me.Method
			  Case RequestMethod.GET
			    mTrueMethodName = "GET"
			    
			  Case RequestMethod.DELETE
			    mTrueMethodName = "DELETE"
			    
			  Case RequestMethod.HEAD
			    mTrueMethodName = "HEAD"
			    
			  Case RequestMethod.POST
			    mTrueMethodName = "POST"
			    
			  Case RequestMethod.PUT
			    mTrueMethodName = "PUT"
			    
			  Case RequestMethod.TRACE
			    mTrueMethodName = "TRACE"
			    
			  Case RequestMethod.OPTIONS
			    mTrueMethodName = "OPTIONS"
			    
			  Case RequestMethod.CONNECT
			    mTrueMethodName = "CONNECT"
			    
			  End Select
			  
			  
			End Set
		#tag EndSetter
		Method As RequestMethod
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMethod As RequestMethod
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTrueMethodName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Me.HasHeader("Range") Then
			    Dim range As String = Me.Header("Range")
			    range = NthField(range, "=", 2)
			    Dim stop As Integer = Val(NthField(range, "-", 2).Trim)
			    Return stop
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Header("Range") = "bytes=" + Format(Me.RangeStart, "###################0") + "-" + Format(value, "###################0")
			End Set
		#tag EndSetter
		RangeEnd As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Me.HasHeader("Range") Then
			    Dim range As String = Me.Header("Range")
			    range = NthField(range, "=", 2)
			    Dim start As Integer = Val(NthField(range, "-", 1).Trim)
			    Return start
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Header("Range") = "bytes=" + Format(value, "###################0") + "-" + Format(Me.RangeEnd, "###################0")
			End Set
		#tag EndSetter
		RangeStart As Int64
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
