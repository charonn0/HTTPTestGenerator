#tag Class
Class URLEncodedForm
Implements FormInterface
	#tag Method, Flags = &h0
		Sub Constructor(urlencodedform As String)
		  Dim items() As String = Split(urlencodedform.Trim, "&")
		  Me.Form = New Dictionary
		  Dim dcount As Integer = UBound(items)
		  For i As Integer = 0 To dcount
		    Me.Form.Value(DecodeURLComponent(NthField(items(i), "=", 1))) = DecodeURLComponent(NthField(items(i), "=", 2))
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return Form.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Element(Name As String) As Variant
		  Return Form.Value(Name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Element(Name As String, Assigns Value As Variant)
		  If Value = "" Then
		    Form.Remove(Name)
		  Else
		    Form.Value(Name) = Value
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasElement(Name As String) As Boolean
		  Return Form.HasKey(Name)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(Index As Integer) As String
		  Dim s() As Variant = Form.Keys
		  Return s(Index).StringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  Dim data() As String
		  For Each key As String in Form.Keys
		    data.Append(EncodeURLComponent(Key) + "=" + EncodeURLComponent(Form.Value(key)))
		  Next
		  Return Join(data, "&")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As HTTP.ContentType
		  Return "application/x-url-encoded"
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Form As Dictionary
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
