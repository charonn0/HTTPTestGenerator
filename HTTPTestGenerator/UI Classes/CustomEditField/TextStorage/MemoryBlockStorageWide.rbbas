#tag Class
Protected Class MemoryBlockStorageWide
Implements IBufferStorage
	#tag Method, Flags = &h0
		Function ByteAt(offset as Integer) As Integer
		  if Storage.LittleEndian then
		    Return Storage.Byte(offset * BytesPerChar)
		  else
		    Return Storage.Byte(offset * BytesPerChar + BytesPerChar - 1)
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(size as integer)
		  //since we'll be storing all strings as wstrings, we need 2 - 4 bytes per char.
		  Storage = new MemoryBlock(size * BytesPerChar)
		  
		  //looks like wstring uses 4 bytes when running under OSX, and 2 in windows XP
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy(from as IbufferStorage, fromIndex as integer, localIndex as integer, length as integer)
		  #if not DebugBuild
		    #pragma DisableBackgroundTasks
		    #pragma DisableBoundsChecking
		    #pragma DisableAutoWaitCursor
		  #endif
		  
		  //indexes and length all have to be multiplied by BytesPerChar
		  fromIndex = fromIndex * BytesPerChar
		  localIndex = localIndex * BytesPerChar
		  length = length * BytesPerChar
		  
		  if from.size = 0 or length = 0 then Return //nuthin' to copy
		  dim src as MemoryBlockStorageWide = MemoryBlockStorageWide(from)
		  
		  Storage.StringValue(localIndex, min(length, storage.Size - localIndex)) = src.Storage.StringValue(fromIndex, min(length, src.Size * BytesPerChar - fromIndex))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As integer
		  Return Storage.Size / BytesPerChar
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Size(assigns length as integer)
		  // Part of the IBufferStorage interface.
		  Storage.Size = length * BytesPerChar
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(index as integer, length as integer) As string
		  // Part of the IBufferStorage interface.
		  if length = 0 then Return ""
		  if index >= Size then Return ""
		  
		  index = index * BytesPerChar
		  length = length * BytesPerChar
		  
		  //trailing 2 - 4 bytes needed to hold a null ending.
		  dim tmp as new MemoryBlock(length + BytesPerChar)
		  tmp.StringValue(0, length) = Storage.StringValue(index, min(length, storage.Size - index))
		  
		  #if TargetLinux
		    return tmp.WString(0) // this uses UTF-16, no BOM
		  #else
		    return tmp.WString(0)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StringValue(index as integer, length as integer, assigns value as string)
		  // Part of the IBufferStorage interface.
		  if length = 0 then Return
		  
		  index = index * BytesPerChar
		  length = length * BytesPerChar
		  
		  //trailing 4 bytes needed to hold a null ending.
		  dim tmp as new MemoryBlock(value.LenB * BytesPerChar + 2*BytesPerChar) // Linux adds a BOM at the start
		  tmp.WString(0) = value
		  
		  //copy to local storage, without null terminator char.
		  #if TargetLinux
		    dim n as UInt32 = tmp.UInt32Value(0)
		    if n = &hFFFE or n = &hFEFF then
		      // remove the BOM
		      Storage.StringValue(index, length) = tmp.StringValue(BytesPerChar, length)
		    else
		      Storage.StringValue(index, length) = tmp.StringValue(0, length)
		    end
		  #else
		    Storage.StringValue(index, length) = tmp.StringValue(0, length)
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = Info
		Text storage as a MemoryBlock
	#tag EndNote


	#tag Property, Flags = &h21
		Private Storage As memoryBlock
	#tag EndProperty


	#tag Constant, Name = BytesPerChar, Type = Double, Dynamic = False, Default = \"4", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"4"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"2"
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
