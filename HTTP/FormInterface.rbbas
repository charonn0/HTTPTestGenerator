#tag Interface
Protected Interface FormInterface
	#tag Method, Flags = &h0
		Function Count() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Element(Name As String) As Variant
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Element(Name As String, Assigns Value As Variant)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasElement(Name As String) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(Index As Integer) As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As HTTP.ContentType
		  
		End Function
	#tag EndMethod


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
End Interface
#tag EndInterface
