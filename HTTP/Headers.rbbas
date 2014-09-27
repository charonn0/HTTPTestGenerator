#tag Class
Protected Class Headers
Inherits InternetHeaders
	#tag Method, Flags = &h1000
		Sub Constructor(Data As String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  Dim lines() As String = data.Split(CRLF)
		  Dim lcount As Integer = UBound(lines)
		  For i As Integer = 0 To lcount
		    Dim line As String = lines(i)
		    If Instr(line, ": ") <= 1  Or line.Trim = "" Then Continue
		    Dim n, v As String
		    n = NthField(line, ": ", 1)
		    v = Right(line, line.Len - (n.Len + 2)).Trim
		    Select Case n
		    Case "Set-Cookie"
		      Cookies.Append(New Cookie(v))
		    Case "Cookie"
		      Dim cc() As Cookie = Cookie.ParseCookies(v)
		      For Each ci As Cookie In cc
		        Cookies.Append(ci)
		      Next
		    Else
		      Me.AppendHeader(n, v)
		    End Select
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cookie(Index As Integer) As Cookie
		  Return Cookies(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cookie(Index As Integer, Assigns NewCookie As Cookie)
		  #pragma BreakOnExceptions Off
		  If NewCookie = Nil Then
		    Cookies.Remove(Index)
		  Else
		    Cookies(Index) = NewCookie
		  End If
		  
		Exception OutOfBoundsException
		  If NewCookie <> Nil Then Cookies.Append(NewCookie)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CookieCount() As Integer
		  Return UBound(Cookies) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllHeaders()
		  Super.DeleteAllHeaders
		  ReDim Cookies(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Source(SetCookies As Boolean = False) As String
		  Dim data As String = Super.Source
		  
		  For Each c As Cookie In Me.Cookies
		    If SetCookies Then
		      data = data + CRLF + "Set-Cookie: " + c.ToString
		    Else
		      data = data + CRLF + "Cookie: " + c.Name + "=" + c.Value
		    End If
		  Next
		  
		  Return data
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Cookies() As Cookie
	#tag EndProperty


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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
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
