#tag Module
Protected Module Specifications
	#tag Method, Flags = &h1
		Protected Function GlossaryDefinition(Term As String) As JSONItem
		  If HTTPGlossary = Nil Then HTTPGlossary = New JSONItem(glossary)
		  For i As Integer = 0 To HTTPGlossary.Count - 1
		    Dim item As JSONItem = HTTPGlossary.Value(i)
		    If item <> Nil And item.Lookup("word", "") = Term Then
		      Return item
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HasEntry(EntryName As Variant) As Boolean
		  Select Case True
		  Case EntryName = ""
		    Return False
		  Case HeaderDescription(EntryName) <> Nil
		    Return True
		  Case MethodDescription(EntryName) <> Nil
		    Return True
		  Case StatusCodeDescription(Val(EntryName)) <> Nil
		    Return True
		  Case GlossaryDefinition(EntryName) <> Nil
		    Return True
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HeaderDescription(HeaderName As String) As JSONItem
		  If Headers = Nil Then Headers = New JSONItem(HeaderDescriptions)
		  For i As Integer = 0 To Headers.Count - 1
		    Dim item As JSONItem = Headers.Value(i)
		    If item <> Nil And item.Lookup("header", "") = HeaderName Then
		      Return item
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MethodDescription(MethodName As String) As JSONItem
		  If Methods = Nil Then Methods = New JSONItem(MethodDescriptions)
		  For i As Integer = 0 To Methods.Count - 1
		    Dim item As JSONItem = Methods.Value(i)
		    If item <> Nil And item.Lookup("method", "") = MethodName Then
		      Return item
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RelationDescription(RelationName As String) As JSONItem
		  'If Relations = Nil Then Relations = New JSONItem(RelationDescriptions)
		  'For i As Integer = 0 To Relations.Count - 1
		  'Dim item As JSONItem = Relations.Value(i)
		  'If item <> Nil And item.Lookup("relation", "") = RelationName Then
		  'Return item
		  'End If
		  'Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StatusCodeDescription(StatusCode As Integer) As JSONItem
		  If StatusCodes = Nil Then StatusCodes = New JSONItem(StatusCodeDescriptions)
		  For i As Integer = 0 To StatusCodes.Count - 1
		    Dim item As JSONItem = StatusCodes.Value(i)
		    If item <> Nil And item.Lookup("code", 0) = StatusCode Then
		      Return item
		    End If
		  Next
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Headers As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HTTPGlossary As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Methods As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Relations As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StatusCodes As JSONItem
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
End Module
#tag EndModule
