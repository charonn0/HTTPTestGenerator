#tag Class
Protected Class SessionRecord
Inherits VariantVolume
	#tag Event
		Function DeserializeValue(ByteStream As Readable, Type As Integer, ByRef Value As Variant) As Boolean
		  If Type = TYPE_HTTP_REQUEST Or Type = TYPE_HTTP_RESPONSE Then
		    Dim data As New MemoryBlock(0)
		    Dim bs As New BinaryStream(data)
		    While Not ByteStream.EOF
		      bs.Write(ByteStream.Read(1))
		    Wend
		    bs.Close
		    Try
		      If Type = TYPE_HTTP_RESPONSE Then
		        Value = HTTP.Request(data)
		      Else
		        Value = HTTP.Response(data)
		      End If
		    Catch
		      Break
		    End Try
		    Return Value <> Nil
		  End If
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SerializeValue(ByteStream As Writeable, ByRef Type As Integer, Value As Variant) As Boolean
		  Select Case Value
		  Case IsA HTTP.Response
		    Dim h As HTTP.Response = Value
		    ByteStream.Write(h.ToString)
		    Type = TYPE_HTTP_RESPONSE
		    Return True
		    
		  Case IsA HTTP.Request
		    Dim h As HTTP.Request = Value
		    ByteStream.Write(h.ToString)
		    Type = TYPE_HTTP_REQUEST
		    Return True
		    
		  End Select
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function Create(RegFile As FolderItem) As HTTP.SessionRecord
		  Dim v As VariantVolume = Super.Create(RegFile)
		  If v = Nil Then Return Nil
		  v = Nil
		  
		  Return New HTTP.SessionRecord(RegFile.OpenAsVirtualVolume)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Open(RegFile As FolderItem) As HTTP.SessionRecord
		  Return HTTP.SessionRecord(Super.Open(RegFile))
		End Function
	#tag EndMethod


	#tag Constant, Name = TYPE_HTTP_REQUEST, Type = Double, Dynamic = False, Default = \"-99", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TYPE_HTTP_RESPONSE, Type = Double, Dynamic = False, Default = \"-98", Scope = Public
	#tag EndConstant


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
			Name="PathSeparator"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="VariantVolume"
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
