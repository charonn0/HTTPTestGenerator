#tag Class
Class MultipartForm
Implements FormInterface
	#tag Method, Flags = &h0
		Sub Constructor()
		  mFormElements = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return mFormElements.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Element(Name As String) As Variant
		  Return mFormElements.Value(Name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Element(Name As String, Assigns Value As Variant)
		  If Value = Nil Then
		    mFormElements.Remove(Name)
		  Else
		    mFormElements.Value(Name) = Value
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FromString(FormData As String, Boundary As String = "") As MultipartForm
		  Dim form As New MultipartForm
		  If Boundary = "" Then
		    Boundary = NthField(FormData, EndOfLine.Windows, 1)
		    If Left(Boundary, Len("Content-Type:")) <> "Content-Type:" Then Raise New UnsupportedFormatException
		    Boundary = NthField(Boundary, "boundary=", 2).Trim
		  End If
		  Dim elements() As String = Split(FormData, "--" + Boundary)' + CRLF)
		  form.Boundary = Boundary
		  
		  Dim ecount As Integer = UBound(elements)
		  For i As Integer = 1 To ecount
		    Dim line As String = NthField(elements(i).LTrim, CRLF, 1)
		    Dim name As String = NthField(line, ";", 2)
		    name = NthField(name, "=", 2)
		    name = ReplaceAll(name, """", "")
		    If name.Trim = "" Then Continue For i
		    Dim j As Integer
		    Dim nm As String = name
		    Do Until Not form.HasElement(nm)
		      j = j + 1
		      nm = name + Str(j)
		    Loop
		    If CountFields(line, ";") < 3 Then 'form field
		      form.Element(nm) = NthField(elements(i), CRLF + CRLF, 2)
		    Else 'file field
		      Dim filename As String = NthField(line, ";", 3)
		      filename = NthField(filename, "=", 2)
		      filename = ReplaceAll(filename, """", "")
		      Dim tmp As FolderItem = SpecialFolder.Temporary.Child(filename)
		      Dim bs As BinaryStream = BinaryStream.Create(tmp, True)
		      Dim filedata As MemoryBlock = elements(i)
		      Dim t As Integer = InStr(filedata, CRLF + CRLF) + 3
		      filedata = filedata.StringValue(t, filedata.Size - t - 2)
		      bs.Write(filedata)
		      bs.Close
		      form.Element(nm) = tmp
		    End If
		  Next
		  
		  Return form
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasElement(Name As String) As Boolean
		  Return mFormElements.HasKey(Name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(Index As Integer) As String
		  Return mFormElements.Key(Index).StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Name(Index As Integer, Assigns NewName As String)
		  Dim nm As String = mFormElements.Key(Index)
		  Dim v As Variant = mFormElements.Value(nm)
		  mFormElements.Remove(nm)
		  mFormElements.Value(NewName) = v
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromForm As HTTP.FormInterface)
		  Me.Constructor()
		  Dim c As Integer = FromForm.Count
		  For i As Integer = 0 To c - 1
		    Dim n As String = FromForm.Name(i)
		    Me.Element(n) = FromForm.Element(n)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  If Boundary.Trim = "" Then
		    Boundary = "--" + Right(EncodeHex(MD5(Str(Microseconds))), 24) + "-bOuNdArY"
		  End If
		  
		  Dim data As New MemoryBlock(0)
		  Dim out As New BinaryStream(data)
		  'out.Write("Content-Type: multipart/form-data; boundary=" + Me.Boundary + CRLF + CRLF)
		  For Each key As String In mFormElements.Keys
		    If VarType(mFormElements.Value(Key)) = Variant.TypeString Then
		      out.Write("--" + Me.Boundary + CRLF)
		      out.Write("Content-Disposition: form-data; name=""" + key + """" + CRLF + CRLF)
		      out.Write(mFormElements.Value(key) + CRLF)
		    ElseIf mFormElements.Value(Key) IsA FolderItem Then
		      Dim file As FolderItem = mFormElements.Value(key)
		      out.Write("--" + Me.Boundary + CRLF)
		      out.Write("Content-Disposition: form-data; name=""" + key + """; filename=""" + File.Name + """" + CRLF)
		      Dim type As ContentType = file
		      out.Write("Content-Type: " + type.ToString + CRLF + CRLF)
		      Dim bs As BinaryStream = BinaryStream.Open(File)
		      out.Write(bs.Read(bs.Length) + CRLF)
		      bs.Close
		    ElseIf DebugBuild Then
		      Raise New TypeMismatchException ' Strings and folderitems only
		    End If
		  Next
		  
		  out.Write("--" + Me.Boundary + "--" + CRLF)
		  out.Close
		  Return data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As HTTP.ContentType
		  Return "multipart/form-data; Boundary=" + Boundary
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Boundary As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFormElements As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Boundary"
			Group="Behavior"
			InitialValue="--bOrEdOmSoFtBoUnDaRy"
			Type="String"
			EditorType="MultiLineEditor"
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
