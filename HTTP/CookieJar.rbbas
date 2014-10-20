#tag Class
Protected Class CookieJar
	#tag Method, Flags = &h0
		Sub Append(NewCookie As HTTP.Cookie)
		  mCookies.Append(NewCookie)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return mCookies.Ubound + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Index As Integer, NewCookie As HTTP.Cookie)
		  mCookies.Insert(Index, NewCookie)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(Index As Integer) As HTTP.Cookie
		  Return mCookies(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadFromFile(JarFile As FolderItem) As HTTP.CookieJar
		  Dim tis As TextInputStream = TextInputStream.Open(JarFile)
		  Dim cj As New HTTP.CookieJar
		  While Not tis.EOF
		    Dim line As String = tis.ReadLine
		    If Left(line.Trim, 1) = "#" Or Line = "" Then Continue ' comment line
		    If CountFields(Line, Chr(9)) <> 7 Then Continue ' Raise New UnsupportedFormatException
		    Dim domain, flag, path, secure, expiration, name, value As String
		    domain = NthField(line, Chr(9), 1)
		    flag = NthField(line, Chr(9), 2)
		    path = NthField(line, Chr(9), 3)
		    secure = NthField(line, Chr(9), 4)
		    expiration = NthField(line, Chr(9), 5)
		    name = NthField(line, Chr(9), 6)
		    value = NthField(line, Chr(9), 7)
		    Dim c As New HTTP.Cookie(Name + "=" + value)
		    c.Domain = domain
		    c.httpOnly = (flag = "TRUE")
		    c.Path = path
		    c.Expires = New Date(1970, 1, 1, 0, 0, 0, 0.0) 'UNIX epoch
		    c.Expires.TotalSeconds = c.Expires.TotalSeconds + Val(expiration)
		    cj.Append(c)
		  Wend
		  
		  Return cj
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Index As Integer)
		  mCookies.Remove(Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveExpired(ExpireSessionCookies As Boolean) As HTTP.Cookie()
		  Dim now As New Date
		  Dim stale() As HTTP.Cookie
		  For i As Integer = UBound(mCookies) DownTo 0
		    Dim c As HTTP.Cookie = mCookies(i)
		    If (c.Expires <> Nil And c.Expires.TotalSeconds < now.TotalSeconds) Or (c.Expires = Nil And ExpireSessionCookies) Then
		      stale.Append(c)
		      mCookies.Remove(i)
		    End If
		  Next
		  Return stale
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveAs(JarFile As FolderItem)
		  Dim tos As TextOutputStream = TextOutputStream.Create(JarFile)
		  tos.Delimiter = EndOfLine.Windows
		  tos.WriteLine("# Netscape HTTP Cookie File")
		  tos.WriteLine("# Domain" + Chr(9) + "Flag" + Chr(9) + "Path" + Chr(9) + "Secure" + Chr(9) + "Expiration" + Chr(9) + "Name" + Chr(9) + "Value")
		  For i As Integer = 0 To UBound(mCookies)
		    Dim c As HTTP.Cookie = mCookies(i)
		    Dim dat As String
		    If c.Expires <> Nil Then
		      Dim epoch As New Date(1970, 1, 1, 0, 0, 0, 0.0) 'UNIX epoch
		      dat = Format(c.Expires.TotalSeconds - epoch.TotalSeconds, "###############################0")
		    Else
		      dat = "0"
		    End If
		    tos.WriteLine(c.Domain + Chr(9) + Str(c.httpOnly) + Chr(9) + c.Path + Chr(9) + Str(c.Secure) + Chr(9) + dat + Chr(9) + c.Name + Chr(9) + c.Value)
		  Next
		  tos.WriteLine("")
		  tos.Close
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mCookies() As HTTP.Cookie
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
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
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
