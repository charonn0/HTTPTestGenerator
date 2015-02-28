#tag Class
Protected Class EntityStream
	#tag Method, Flags = &h0
		Sub Constructor(SocketStream As TCPSocket, HTTPHeaders As HTTP.Headers)
		  mStream = SocketStream
		  Dim sz As Integer
		  
		  Select Case True
		  Case HTTPHeaders.CommaSeparatedValues("Content-Length") <> "" 
		    sz = Val(HTTPHeaders.CommaSeparatedValues("Content-Length"))
		    
		  Case HTTPHeaders.CommaSeparatedValues("Transfer-Encoding") <> ""
		    sz = -1
		    
		  Case HTTPHeaders.CommaSeparatedValues("Connection") = "close"
		    
		  Else
		    sz = -1
		    
		  End Select
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mStream As TCPSocket
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
