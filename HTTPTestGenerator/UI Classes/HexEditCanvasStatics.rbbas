#tag Module
Protected Module HexEditCanvasStatics
	#tag Method, Flags = &h0
		Function HECConvertTextToBinary(aStr as string) As string
		  'given hex as text (i.e. 7F1B) convert it to binary data
		  dim newData as String
		  dim re as RegEx
		  dim rm as RegExMatch
		  dim count as Integer
		  dim sourceData, targetData as MemoryBlock
		  dim n1, n2 as Integer
		  
		  if aStr = "" then
		    Return ""
		  end if
		  re = new RegEx
		  re.SearchPattern = "\s+"
		  re.Options.ReplaceAllMatches = true
		  re.Options.TreatTargetAsOneLine = true
		  re.ReplacementPattern = ""
		  newData = re.Replace(aStr)
		  if (lenb(newData) mod 2) <> 0 then
		    Return ""
		  end if
		  re.SearchPattern = "[^0-9a-fA-F]"
		  rm = re.Search(newData)
		  if rm <> nil then
		    Return ""
		  end if
		  
		  newData = Uppercase(newData)
		  sourceData = NewMemoryBlock(lenb(newData))
		  targetData = NewMemoryBlock(lenb(newData)/2)
		  sourceData.StringValue(0, lenb(newData)) = newData
		  for count = 0 to sourceData.Size -1 Step 2
		    n1 = sourceData.Byte(count)
		    n2 = sourceData.Byte(count+1)
		    if n1 >= kACode then
		      n1 = (n1 - kACode) + 10
		    else
		      n1 = n1 - kZeroCode
		    end if
		    if n2 >= kACode then
		      n2 = (n2 - kACode) + 10
		    else
		      n2 = n2 - kZeroCode
		    end if
		    
		    targetData.Byte(count/2) = (n1*16)+n2
		  next
		  return targetData.StringValue(0,targetData.Size)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReasonableFonts(aFonts() as string)
		  dim i as Integer
		  dim fname as String
		  dim p as Picture
		  dim g as Graphics
		  
		  p = new Picture(16,16,32)
		  g = p.Graphics
		  Redim aFonts(-1)
		  g.TextSize = 12
		  for i = 0 to FontCount-1
		    g.TextFont = Font(i)
		    if g.StringWidth("iiiiiiiiii") = g.StringWidth("MMMMMMMMMM") then
		      aFonts.Append Font(i)
		    end if
		  next
		End Sub
	#tag EndMethod


	#tag Constant, Name = kACode, Type = Integer, Dynamic = False, Default = \"65", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kArrowDown, Type = Integer, Dynamic = False, Default = \"31", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kArrowLeft, Type = Integer, Dynamic = False, Default = \"28", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kArrowRight, Type = Integer, Dynamic = False, Default = \"29", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kArrowUp, Type = Integer, Dynamic = False, Default = \"30", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDeleteKey, Type = Integer, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFCode, Type = Integer, Dynamic = False, Default = \"70", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFontName, Type = String, Dynamic = False, Default = \"Andale Mono", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFontSize, Type = Integer, Dynamic = False, Default = \"12", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kInterTextSlop, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLACode, Type = Integer, Dynamic = False, Default = \"97", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLeftExtraSpace, Type = Integer, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLeftMargin, Type = Integer, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLFCode, Type = Integer, Dynamic = False, Default = \"102", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNineCode, Type = Integer, Dynamic = False, Default = \"57", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kRightMargin, Type = Integer, Dynamic = False, Default = \"15", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kZeroCode, Type = Integer, Dynamic = False, Default = \"48", Scope = Public
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
End Module
#tag EndModule
