#tag Class
Class Cookie
Inherits Pair
	#tag Method, Flags = &h1000
		Sub Constructor(Raw As String)
		  'accepts a single raw Cookie string (e.g. "SessionID=12345; Port=80; httpOnly")
		  Dim l, r, m, data As String
		  
		  If InStr(Raw, ";") > 0 Then
		    data = NthField(Raw, ";", 1)
		    m = NthField(Raw, data + ";", 2).Trim
		  Else
		    data = raw
		  End If
		  l = NthField(data, "=", 1)
		  r = Right(data, data.Len - l.Len - 1)
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(left As Variant, right As Variant) -- From Pair
		  Super.Constructor(l, r)
		  
		  If m <> "" Then
		    Dim items() As String = Split(m, ";")
		    For Each item As String In items
		      Dim k, v As String
		      k = NthField(item, "=", 1)
		      v = NthField(item, "=", 2)
		      Select Case k.Trim
		      Case "Domain"
		        Me.Domain = v
		      Case "Path"
		        Me.Path = v
		      Case "Expires"
		        Me.Expires = DateString(v)
		      Case "Port"
		        Me.Port = Val(v)
		      Case "Secure"
		        Me.Secure = True
		      Case "httpOnly"
		        Me.httpOnly = True
		      Else
		        ExtraParams.Value(k) = v
		        
		      End Select
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  'Returns the cookie name
		  Return Me.Left.StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherCookie As Cookie) As Integer
		  If OtherCookie Is Nil Then Return 1
		  If OtherCookie.Name = Me.Name And OtherCookie.Value = Me.Value And Me.OriginCompare(OtherCookie) Then Return 0
		  Return StrComp(Me.Name, OtherCookie.Name, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OriginCompare(CompareTo As Cookie) As Boolean
		  'Compares the metadata of the passed cookie to the instant cookie
		  If CompareTo.Domain <> Me.Domain Then Return False
		  If CompareTo.Path <> Me.Path Then Return False
		  If CompareTo.Port <> Me.Port Then Return False
		  If CompareTo.Secure <> Me.Secure Then Return False
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ParseCookies(Cookies As String) As Cookie()
		  ' Parses a multi-field Cookie: header into and array of Cookie objects.
		  ' DO NOT USE THIS METHOD TO PARSE Set-Cookie: HEADERS! Use Cookie.Constructor(String) instead.
		  ' e.g. "Name1=Value1;Name2=Value2;Name3=Value3"
		  
		  Dim s() As String = Split(Cookies, ";")
		  Dim ret() As Cookie
		  Dim scount As Integer = UBound(s)
		  For x As Integer = 0 To scount
		    If s(x).Trim = "" Then Continue
		    Dim l, r As String
		    l = NthField(s(x).Trim, "=", 1)
		    r = NthField(s(x).Trim, "=", 2)
		    // Calling the superclass constructor.
		    // Constructor(left As Variant, right As Variant) -- From Pair
		    Dim c As New Cookie(l, r)
		    ret.Append(c)
		  Next
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  'serialize the object
		  Dim data As String = Me.Name + "=" + Me.Value
		  
		  If Me.Expires <> Nil Then
		    Dim now As New Date
		    If Me.Expires.TotalSeconds > now.TotalSeconds Then
		      data = data + "; expires=" + DateString(Me.Expires)
		    End If
		  End If
		  
		  If Me.Path <> "" Then
		    data = data + "; path=" + Me.Path
		  End If
		  
		  If Me.Port > 0 Then
		    data = data + "; port=" + Str(Me.Port)
		  End If
		  
		  If Me.Secure Then
		    data = data + "; secure"
		  End If
		  
		  If Me.httpOnly Then
		    data = data + "; httpOnly"
		  End If
		  
		  Return data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value() As String
		  'Returns the cookie value
		  Return Me.Right.StringValue
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Domain As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Expires As Date
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mExtraParams = Nil Then mExtraParams = New Dictionary
			  return mExtraParams
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mExtraParams = value
			End Set
		#tag EndSetter
		ExtraParams As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		httpOnly As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExtraParams As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Path As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Port As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		Secure As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Domain"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpOnly"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Path"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Secure"
			Group="Behavior"
			Type="Boolean"
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
