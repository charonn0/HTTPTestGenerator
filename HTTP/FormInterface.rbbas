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


End Interface
#tag EndInterface
