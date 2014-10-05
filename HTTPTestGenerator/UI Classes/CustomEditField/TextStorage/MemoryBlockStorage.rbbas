#tag Class
Protected Class MemoryBlockStorage
Implements IBufferStorage
	#tag Method, Flags = &h0
		Function ByteAt(offset as Integer) As Integer
		  Return Storage.Byte(offset)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(size as integer)
		  Storage = new MemoryBlock(size)
		  
		  // since this storage class can only handle single-byte characters, multi-byte strings need to be converted
		  #if TargetWin32
		    mSingleByteEncoding = encodings.WindowsANSI
		  #elseif TargetLinux
		    mSingleByteEncoding = encodings.ISOLatin1
		  #else
		    mSingleByteEncoding = encodings.MacRoman
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy(from as IbufferStorage, fromIndex as integer, localIndex as integer, length as integer)
		  #if not DebugBuild
		    #pragma DisableBackgroundTasks
		    #pragma DisableBoundsChecking
		    #pragma DisableAutoWaitCursor
		  #endif
		  
		  if from.size = 0 or length = 0 then Return //nuthin' to copy
		  dim src as MemoryBlockStorage = MemoryBlockStorage(from)
		  
		  me.Storage.StringValue(localIndex, min(length, storage.Size - localIndex)) = src.Storage.StringValue(fromIndex, min(length, src.Size - fromIndex))
		  me.mSingleByteEncoding = src.mSingleByteEncoding
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As integer
		  Return Storage.Size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Size(assigns length as integer)
		  // Part of the IBufferStorage interface.
		  Storage.Size = length
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(index as integer, length as integer) As string
		  // Part of the IBufferStorage interface.
		  if length = 0 then Return ""
		  if index >= Size then Return ""
		  
		  Return me.Storage.StringValue(index, min(length, storage.Size - index)).DefineEncoding(mSingleByteEncoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StringValue(index as integer, length as integer, assigns value as string)
		  // Part of the IBufferStorage interface.
		  if length = 0 then Return
		  
		  //Couldn't make memory blocks work correclty with multi-byte chars, so I force the data to be single-byte by re-encoding it.
		  if value.encoding<> nil and (value.Encoding.Equals(encodings.UTF8) or value.Encoding.Equals(encodings.UTF16)) then
		    value = value.ConvertEncoding(mSingleByteEncoding)
		  end if
		  
		  Storage.StringValue(index, length) = value
		End Sub
	#tag EndMethod


	#tag Note, Name = Info
		Text storage as a MemoryBlock
	#tag EndNote


	#tag Property, Flags = &h21
		Private mSingleByteEncoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Storage As memoryBlock
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
