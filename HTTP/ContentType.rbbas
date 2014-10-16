#tag Class
Class ContentType
	#tag Method, Flags = &h0
		Function Acceptance(OtherType As ContentType) As Single
		  'Returns a Single that is <=1. This is the comparative "weight" of the match between the
		  'two types. A weight of 1 has the highest Acceptance
		  If Not OtherType.Accepts(Me) Then Return 0.0
		  Return (OtherType.Weight + Me.Weight) / 2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Accepts(OtherType As ContentType) As Boolean
		  ' Returns True if the OtherType is compatible with the current type. Use the Acceptance method to
		  ' determine which ContentType is preferred if more than one is accepted.
		  ' Only the SuperType and SubType are compared; optional parts like CharSet are not considered.
		  
		  If OtherType.SuperType <> Me.SuperType And OtherType.SuperType <> "*" And Me.SuperType <> "*" Then Return False
		  If OtherType.SubType <> Me.SubType And OtherType.SubType <> "*" And Me.SubType <> "*" Then Return False
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(Raw As String)
		  'Accepts a single raw ContentType string (e.g. "text/html; CharSet=UTF-8")
		  'For strings that might contain multiple entries, use ContentType.ParseTypes
		  
		  If InStr(Raw, "/") = 0 Then Raise New UnsupportedFormatException
		  
		  If InStr(Raw, ";") > 0 Then
		    Dim fields() As String = Split(raw, ";")
		    Dim fcount As Integer = Ubound(fields)
		    For i As Integer = 0 To fcount
		      Dim entry As String = fields(i)
		      If InStr(entry, "/") > 0 Then
		        If NthField(entry, "/", 1).Trim <> "" Then
		          SuperType = NthField(entry, "/", 1).Trim
		        Else
		          SuperType = "*"
		        End If
		        
		        If NthField(entry, "/", 2).Trim <> "" Then
		          SubType = NthField(entry, "/", 2).Trim
		        Else
		          SubType = "*"
		        End If
		      Else
		        Select Case NthField(entry, "=", 1).Trim
		        Case "q"
		          Weight = CDbl(NthField(entry, "=", 2))
		        Case "charset"
		          Dim nm As String = NthField(entry, "=", 2)
		          For e As Integer = 0 To Encodings.Count' - 1
		            If Encodings.Item(e).internetName = nm Then
		              Me.CharSet = Encodings.Item(e)
		              Exit For e
		            End If
		          Next
		        Case "boundary"
		          Boundary = NthField(entry, "boundary=", 2).Trim
		        End Select
		      End If
		      
		    Next
		    
		  Else
		    If NthField(Raw, "/", 1).Trim <> "" Then
		      SuperType = NthField(Raw, "/", 1).Trim
		    Else
		      SuperType = "*"
		    End If
		    
		    If NthField(Raw, "/", 2).Trim <> "" Then
		      SubType = NthField(Raw, "/", 2).Trim
		    Else
		      SubType = "*"
		    End If
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherType As String) As Integer
		  ' Allows you to compare a ContentType directly to a String.
		  ' If the String would be Accepted this method returns 0 (equivalence)
		  ' Otherwise, performs a lexicographic comparison
		  ' e.g.
		  '     If MyContentType = "text/html" Then
		  
		  If Me.Accepts(New ContentType(OtherType)) Then Return 0
		  Return StrComp(Me.ToString, OtherType, 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromFile As FolderItem)
		  ' Pass a folderitem to construct a ContentType object based on the file name extension. The FolderItem need not exist.
		  
		  Dim t As String = "application/octet-stream"
		  If FromFile <> Nil Then t = MIMETypes.Lookup(NthField(FromFile.Name, ".", CountFields(FromFile.Name, ".")), t)
		  Me.Constructor(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(OtherType As String)
		  ' Allows you to convert a string into a ContentType
		  ' e.g.
		  '     MyContentType = "text/html"
		  
		  Me.Constructor(OtherType)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ParseTypes(Raw As String) As ContentType()
		  'parses a multi-field content-type string into and array of ContentType objects
		  'e.g. "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
		  Dim fields() As String
		  If InStr(Raw, ",") > 0 Then 'multiple types
		    fields = Split(raw, ",")
		  Else
		    fields.Append(raw)
		  End If
		  Dim types() As ContentType
		  Dim fcount As Integer = Ubound(fields)
		  For i As Integer = 0 To fcount
		    types.Append(New ContentType(fields(i)))
		  Next
		  Return types
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  'serializes the object
		  
		  Dim data As String = SuperType + "/" + SubType
		  If Me.Weight < 1 Then
		    data = data + "; q=" + Format(Me.Weight, ".##")
		  End If
		  If Me.CharSet <> Nil And Me.CharSet.internetName <> "" Then
		    data = data + "; CharSet=" + Me.CharSet.internetName
		  End If
		  Return Data
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		#tag Note
			Optional; only useful in MultipartForms
		#tag EndNote
		Boundary As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Optional; the character encoding of the content.
		#tag EndNote
		CharSet As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h0
		SubType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SuperType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Optional; a number between 0.0 and 1.0 representing the weight of the type (1=highest weight)
		#tag EndNote
		Weight As Single = 1.0
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Boundary"
			Group="Behavior"
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
			Name="SubType"
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
			Name="SuperType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Weight"
			Group="Behavior"
			InitialValue="1.0"
			Type="Single"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
