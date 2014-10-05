#tag Module
Protected Module EditFieldGlobals
	#tag Method, Flags = &h0
		Function DarkerColor(extends forColor as color, offset as integer) As color
		  //get a darker color for the given color.
		  Return rgb( max(forColor.Red - offset, 0), max(forColor.green - offset, 0), max(forColor.blue - offset, 0))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InvertColor(extends input as Color) As color
		  Return rgb(255 - input.Red, 255 - input.Green, 255 - input.Blue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LighterColor(extends forColor as color, offset as integer) As color
		  //get a darker color for the given color.
		  Return rgb( min(forColor.Red + offset, 255), min(forColor.green + offset, 255), min(forColor.blue + offset, 255))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function loadMaskedPicture(image as picture) As picture
		  if Image = nil then Return nil
		  
		  dim newpic as Picture = New Picture(image.Width/2, Image.Height, 32)
		  NewPic.Graphics.DrawPicture Image, 0,0
		  NewPic.Mask.Graphics.DrawPicture Image, 0, 0, NewPic.Width, NewPic.Height, Image.Width/2, 0
		  
		  Return newpic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LongestCommonPrefixIndex(extends source as string, target as string) As integer
		  //finds the longest common prefix between 2 strings
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  dim n as Integer = min(source.len, Target.Len)
		  dim i as Integer
		  for i = 1 to n
		    if source.Mid(i,1) <> Target.Mid(i,1) then Exit for
		  next
		  Return i - 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SquaredColorDistance(color1 as Color, color2 as Color) As integer
		  Return pow(color1.Red * 0.299 - color2.Red * 0.299, 2) + pow(color1.Green * 0.587 - color2.Green * 0.587, 2) + pow(color1.Blue * 0.114 - color2.Blue * 0.114, 2)
		End Function
	#tag EndMethod


	#tag Note, Name = TextStorageType
		MemoryBlockStorageWide on Linux doesn't work right,
		but the MemoryBlockStorage works.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mBlocktrailimage = nil then
			    mBlocktrailimage = loadMaskedPicture(blockFoldedTrailMarker)
			  end if
			  
			  return mBlocktrailimage
			End Get
		#tag EndGetter
		BlockFoldedTrailImage As picture
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBlocktrailimage As picture
	#tag EndProperty


	#tag Constant, Name = CEF_VERSION, Type = String, Dynamic = False, Default = \"1.7.4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DebugIndentation, Type = Boolean, Dynamic = False, Default = \"false", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DebugTiming, Type = Boolean, Dynamic = False, Default = \"false", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STORAGE_ARRAY, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STORAGE_MEMORYBLOCK, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STORAGE_WIDEMEMORYBLOCK, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TextStorageType, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"1"
	#tag EndConstant

	#tag Constant, Name = UseOldRenderer, Type = Boolean, Dynamic = False, Default = \"false", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="blockFoldedTrailImage"
			Group="Behavior"
			InitialValue="0"
			Type="picture"
		#tag EndViewProperty
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
