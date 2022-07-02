#tag Class
Protected Class ChunkedStream
Implements Readable,Writeable
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Create(ChunkReceiver As Writeable) As HTTP.ChunkedStream
		  Dim stream As New ChunkedStream
		  stream.WriteStream = ChunkReceiver
		  Return stream
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EndOfFile() As Boolean
		  // Part of the Readable interface.
		  Return EOF()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOF() As Boolean
		  // Part of the Readable interface.
		  If ReadStream <> Nil Then Return ReadStream.EOF
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Flush()
		  // Part of the Writeable interface.
		  If WriteStream <> Nil Then WriteStream.Flush
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Open(ChunkedData As Readable) As HTTP.ChunkedStream
		  Dim stream As New ChunkedStream
		  stream.ReadStream = ChunkedData
		  Return stream
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(Count As Integer, encoding As TextEncoding = Nil) As String
		  // Part of the Readable interface.
		  If ReadStream = Nil Then Raise New IOException
		  If ReadBuffer = Nil Then ReadBuffer = New MemoryBlock(0)
		  Dim outstream As New BinaryStream(ReadBuffer)
		  outstream.Position = outstream.Length
		  
		  Do Until ReadStream.EOF Or outstream.Length >= Count
		    Dim char As String
		    While InStrB(char, CRLF) <= 0 And Not ReadStream.EOF
		      char = char + ReadStream.Read(1)
		    Wend
		    Dim sz As Integer = Val("&h" + NthField(char, ";", 1))
		    outstream.Write(ReadStream.Read(sz))
		    Call ReadStream.Read(2)
		  Loop
		  outstream.Close
		  Dim data As String = LeftB(ReadBuffer, Count)
		  If ReadBuffer.Size = Count Then
		    ReadBuffer = Nil
		  Else
		    ReadBuffer = RightB(ReadBuffer, ReadBuffer.Size - Count)
		  End If
		  If encoding <> Nil Then data = DefineEncoding(data, encoding)
		  Return data
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadError() As Boolean
		  // Part of the Readable interface.
		  Return ReadStream <> Nil And ReadStream.ReadError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(text As String)
		  // Part of the Writeable interface.
		  If WriteStream = Nil Then Raise New IOException
		  If BufferStream = Nil Then
		    WriteBuffer = New MemoryBlock(0)
		    BufferStream = New BinaryStream(WriteBuffer)
		  End If
		  BufferStream.Write(text)
		  If BufferStream.Length >= MinChunkSize Then
		    BufferStream.Close
		    WriteStream.Write(Hex(WriteBuffer.Size) + CRLF)
		    WriteStream.Write(WriteBuffer + CRLF)
		    WriteBuffer = Nil
		    BufferStream = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteError() As Boolean
		  // Part of the Writeable interface.
		  Return WriteStream.WriteError And WriteStream.WriteError
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private BufferStream As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h0
		MinChunkSize As Integer = 32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ReadBuffer As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ReadStream As Readable
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WriteBuffer As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WriteStream As Writeable
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinChunkSize"
			Visible=false
			Group="Behavior"
			InitialValue="1024"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
