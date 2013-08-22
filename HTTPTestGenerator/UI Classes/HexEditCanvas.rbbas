#tag Class
Protected Class HexEditCanvas
Inherits Canvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  dim code as Integer
		  dim res as Boolean
		  
		  res = KeyDown(Key)
		  if res then
		    Return True
		  end if
		  
		  if Keyboard.CommandKey then
		    Return False
		  end if
		  
		  code = asc(Key)
		  
		  if code >= kArrowLeft and code <= kArrowDown Then
		    HandleKeyMovement(code, Keyboard.ShiftKey)
		    Return True
		  end if
		  
		  if not HandleTyping(key, False) then
		    Beep
		  end if
		  
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  dim curr as Integer
		  dim res as Boolean
		  
		  res = MouseDown(X, Y)
		  if res then
		    Return res
		  end if
		  PaintInsertion(me.Graphics, True)
		  if PointInText(x,y) then
		    mTextIsFocus = true
		  else
		    mTextIsFocus = False
		  end if
		  
		  if Keyboard.ShiftKey then
		    curr = PointToByteOffset(x,y)
		    if curr > mSelStart then
		      mClickStartOffset = mSelStart
		    else
		      mClickStartOffset = mSelStart + mSelLength
		    end if
		  else
		    mClickStartOffset = PointToByteOffset(x,y)
		    mSelStart = mClickStartOffset
		    mSelLength = 0
		  end if
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  dim current as Integer
		  dim lineOffset as Integer
		  dim newX, newY as Integer
		  
		  if y < 0 or y > me.Height then
		    if y < 0 then 
		      lineOffset = -1
		    else
		      lineOffset = 1
		    end if
		    me.SetTopLine GetTopLine + lineOffset
		    SetScrollPosition GetTopLine
		    if y < 0 then
		      newY = 1
		      newX = HexLeftSide
		    else
		      newY = (me.Height \ mXHeight) * mXHeight - 2
		      newX = me.Width
		    end if
		  else
		    newY = y
		    newX = x
		  end if
		  
		  current = PointToByteOffset(newx,newy)
		  if current  < mClickStartOffset then
		    mSelStart = current
		    mSelLength = mClickStartOffset - mSelStart
		    mSelDirection = -1
		  else
		    mSelStart = mClickStartOffset
		    mSelLength = current - mClickStartOffset
		    mSelDirection = 1
		  end if
		  me.Refresh
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  if mWriteable then
		    self.MouseCursor = System.Cursors.IBeam
		  else
		    self.MouseCursor = System.Cursors.StandardPointer
		  end if
		  MouseEnter
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  mBytesPerGroup = 2
		  mShowText = true
		  SetDisplayCharacteristics(me.Graphics)
		  CacheCommonData(me.Graphics)
		  mCharactersForOffset = -1
		  mSelStart = 0
		  mSelLength = 0
		  mWriteable = true
		  Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  'g.DrawString GetData(500,0), 0,0
		  dim x,y as Integer
		  SetDisplayCharacteristics(g)
		  'SanityChecks
		  CalculateDisplayedText
		  
		  
		  PaintBackground(g)
		  PaintSelection(g)
		  g.ForeColor = mTextColor
		  
		  if mCharactersForOffset <> 0 then
		    g.DrawString mOffsetsAsDisplayed,kLeftMargin,mXHeight
		    x = LeftHandWidth - (kLeftExtraSpace/2)
		    g.ForeColor = mDividerColor
		    g.DrawLine x, 0, x, g.Height
		    g.ForeColor = mTextColor
		  end if
		  g.DrawString mDataAsDisplayed, LeftHandWidth, mXHeight
		  if mShowText then
		    x = g.Width-(kRightMargin + mBytesPerLine * mMWidth)
		    g.DrawString mTextAsDisplayed, x, mXHeight
		    x = x - (mMWidth/2)
		    g.ForeColor = mDividerColor
		    g.DrawLine x, 0, x, g.Height
		    g.ForeColor = mTextColor
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Activate()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BlinkInsertion()
		  PaintInsertion(me.Graphics, mInsertionOn)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ByteIsVisible(aOffset as integer) As boolean
		  Return aOffset >= mFirstDisplayedOffset and aOffset < (mFirstDisplayedOffset + LinesDisplayed*mBytesPerLine)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CacheCommonData(g as graphics)
		  'dim g as Graphics
		  'g = me.Graphics
		  'SetDisplayCharacteristics(g)
		  mXHeight = g.StringHeight("X"+chr(13)+"X"+chr(13)+"X"+chr(13)+"X"+chr(13)+"X"+chr(13)+"X"+chr(13)+"X"+chr(13)+"X"+chr(13)+"X"+chr(13)+"X"+chr(13),65536)/10
		  mMWidth = g.StringWidth("MMMMMMMMMM")/10
		  mBackColor = rgb(255,255,255)
		  mTextColor = rgb(0,0,0)
		  mDividerColor = rgb(160,160,160)
		  mStripeColor = RGB(237,243,254)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CalculateDisplayedText()
		  dim leftWidth as Integer
		  dim rightWidth as Integer
		  dim interslop as Integer
		  dim availableWidth as Integer
		  dim g as Graphics
		  dim charSlots as Integer
		  dim slotsPerGroup as Integer
		  dim data as String
		  dim lines as Integer
		  dim i as Integer
		  dim work as String
		  dim savedWork as String
		  dim interim as String
		  dim b as Integer
		  dim line as String
		  dim re as RegEx
		  
		  g = me.Graphics
		  SetDisplayCharacteristics(g)
		  leftWidth = LeftHandWidth
		  rightWidth = kRightMargin
		  if mShowText then
		    interslop = kInterTextSlop
		  end if
		  
		  availableWidth = g.Width - (leftWidth+rightWidth+interslop)
		  charSlots = availableWidth / mMWidth
		  slotsPerGroup = (mBytesPerGroup*2)+1
		  if mShowText then
		    slotsPerGroup = slotsPerGroup+mBytesPerGroup
		  end if
		  mBytesPerLine = (charSlots\slotsPerGroup)* mBytesPerGroup
		  
		  SanityChecks
		  
		  lines = LinesDisplayed
		  data = GetData( mBytesPerLine*lines, mFirstDisplayedOffset)
		  
		  SetScrollMaximum max(0, (ceil(GetTotalDataLength()/mBytesPerLine))-lines)
		  SetScrollPageIncrement lines-1
		  SetScrollPosition GetTopLine 
		  
		  mOffsetsAsDisplayed = ""
		  mTextAsDisplayed = ""
		  mDataAsDisplayed= ""
		  for i = 0 to lines
		    mOffsetsAsDisplayed = mOffsetsAsDisplayed + OffsetTextForPosition(mFirstDisplayedOffset + (i*mBytesPerLine), GetOffsetCharLength) + chr(13)
		    work = left(data, mBytesPerLine)
		    savedWork = work
		    data = mid(data, mBytesPerLine+1)
		    
		    line = ""
		    for b = ((mBytesPerLine/mBytesPerGroup)-1) DownTo 0
		      'mBytesPerLine-mBytesPerGroup Step mBytesPerGroup
		      interim = leftb(work, mBytesPerGroup)
		      work = midb(work, mBytesPerGroup+1)
		      line = line + DataToHex(interim) + " "
		    next
		    mDataAsDisplayed = mDataAsDisplayed + line + chr(13)
		    
		    if mShowText then
		      'work = ReplaceAll(savedWork, chr(13), ".")
		      'work = ReplaceAll(work, chr(10), ".")
		      'work = ReplaceAll(work, chrb(0), ".")
		      're = new RegEx
		      're.SearchPattern = "["+mBadChars+"]"
		      're.ReplacementPattern = "\."
		      're.Options.ReplaceAllMatches = true
		      'work = re.Replace(savedWork)
		      work = mBadCharsRE.Replace(savedWork)
		      
		      mTextAsDisplayed = mTextAsDisplayed + work + chr(13)
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DataToHex(aString as string) As string
		  dim i as Integer
		  dim res as String
		  dim data as String
		  
		  data = aString
		  for i = 0 to lenb(aString)-1
		    res = res + right("0"+hex(ascb(data)), 2)
		    data = midb(data, 2)
		  next
		  Return res
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Deactivate()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DetermineBadCharacters(aFont as string, aSize as integer, g as graphics)
		  dim i as Integer
		  'dim g as Graphics
		  dim cWidth as Double
		  dim mWidth as Double
		  
		  'g = me.Graphics
		  mBadChars = "\000\x0A\x0D"
		  
		  mWidth = g.StringWidth("MMMMMMMMMM") / 10
		  for i = 1 to 255
		    if i <> 10 and i <> 13 then
		      cWidth = g.StringWidth(chrb(i) + chrb(i) + chrb(i) + chrb(i) + chrb(i) + chrb(i) + chrb(i) + chrb(i) + chrb(i) + chrb(i)) /10
		      if cWidth <> mWidth then
		        mBadChars = mBadChars + chrb(i)
		      end if
		    end if
		  Next
		  
		  mBadCharsRE = new RegEx
		  mBadCharsRE.SearchPattern = "["+mBadChars+"]"
		  mBadCharsRE.ReplacementPattern = "\."
		  mBadCharsRE.Options.ReplaceAllMatches = true
		  mBadCharsRE.Options.CaseSensitive = False
		  'mBadCharsRE.Options.UTF8 = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetOffsetCharLength() As integer
		  
		  if mCharactersForOffset > -1 Then
		    Return mCharactersForOffset
		  end if
		  return max(len(hex(GetTotalDataLength())), len(hex(LinesDisplayed*mBytesPerLine)))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTopLine() As integer
		  Return mFirstDisplayedOffset / mBytesPerLine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleKeyMovement(aKey as integer, aExtendSelection as boolean)
		  dim newStart as Integer
		  dim newLen as Integer
		  dim oldLen, oldStart as Integer
		  
		  if mInsertionOn then
		    PaintInsertion(me.Graphics, true)
		  end if
		  
		  if not aExtendSelection then
		    if mSelLength > 0 then
		      oldLen = mSelLength
		      oldStart = mSelStart
		    end if
		    Select case aKey
		    case kArrowLeft
		      newStart = mSelStart-1
		    case kArrowRight
		      newStart = (mSelStart+mSelLength) + 1
		    case kArrowUp
		      newStart = mSelStart - mBytesPerLine
		    case kArrowDown
		      newStart = (mSelStart+mSelLength) + mBytesPerLine
		    end Select
		    if newStart < 0 then
		      newStart = 0
		    elseif newStart > GetTotalDataLength() then
		      newStart = GetTotalDataLength()
		    end if
		    if mSelStart = newStart and mSelLength = 0 then
		      Beep
		    end if
		    mSelStart = newStart
		    mSelLength = 0
		    if oldLen > 0 then
		      UpdateByteRange(oldStart, oldLen)
		    end if
		    RevealByte(mSelStart)
		    PaintInsertion(me.Graphics, False)
		  else
		    newStart = mSelStart
		    newLen = mSelLength
		    if mSelLength = 0 then
		      if aKey = kArrowLeft or aKey = kArrowUp then
		        mSelDirection = -1
		      else
		        mSelDirection = 1
		      end if
		    end if
		    select case aKey
		    case kArrowLeft
		      if mSelDirection < 0 then
		        newStart = mSelStart - 1
		        newLen = mSelLength + 1
		      else
		        newLen = mSelLength - 1
		      end if
		    case kArrowRight
		      if mSelDirection < 0 then
		        newStart = mSelStart + 1
		        newLen = mSelLength - 1
		      else
		        newLen = mSelLength + 1
		      end if
		    case kArrowDown
		      if mSelDirection < 0 then
		        newStart = mSelStart + mBytesPerLine
		        newLen = mSelLength - mBytesPerLine
		        
		      else
		        newLen = mSelLength + mBytesPerLine
		      end if
		    case kArrowUp
		      if mSelDirection < 0 then
		        newStart = mSelStart - mBytesPerLine
		        newLen = mSelLength + mBytesPerLine
		      else
		        newLen = mSelLength - mBytesPerLine
		      end if
		    end Select
		    if newLen < 0 then
		      newStart = newStart + newLen
		      newLen = abs(newLen)
		      mSelDirection = -mSelDirection
		      if mSelDirection = 0 then
		        mSelDirection = -1
		      end if
		    end if
		    if newStart < 0 then
		      newLen = newLen + newStart 'newStart is neg so add it to subtract it
		      newStart = 0
		    elseif newStart > GetTotalDataLength() then
		      newLen = newLen - (newStart - GetTotalDataLength())
		      newStart = GetTotalDataLength()
		    elseif newStart + newLen > GetTotalDataLength() then
		      newLen = GetTotalDataLength() - newStart
		    end if
		    if mSelStart = newStart and mSelLength = newLen then
		      Beep
		    end if
		    oldStart = mSelStart
		    oldLen = mSelLength
		    mSelStart = newStart
		    mSelLength = newLen
		    if mSelDirection < 0 then
		      RevealByte(mSelStart)
		    else
		      RevealByte(mSelStart+mSelLength)
		    end if
		    UpdateByteRange(min(mSelStart, oldStart), max(mSelLength, oldLen))
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HandleTyping(aText as string, aForceBinary as boolean) As boolean
		  dim data as String
		  dim code as Integer
		  dim oldData as String
		  
		  if not mWriteable then
		    
		    Return False
		  end if
		  if lenb(aText) = 1 and ascb(aText) = kDeleteKey then
		    if mSelLength > 0 then
		      DeleteData mSelLength, mSelStart
		      mSelLength = 0
		    elseif mSelStart > 0 then
		      DeleteData 1, mSelStart-1
		      mSelStart = mSelStart - 1
		    else
		      Return False
		    end if
		    RevealByte(mSelStart)
		    me.UpdateByteRange mSelStart, &h7FFFFFFF
		    mOnLowNibble = False
		    
		    Return True
		  end if
		  
		  if TextIsFocus or aForceBinary then
		    InsertText(aText)
		    mOnLowNibble = False
		    mSelLength = 0
		    me.UpdateByteRange mSelStart, &h7FFFFFFF
		    mSelStart = mSelStart+lenb(aText)
		    mLastInsertion = mSelStart
		    Return true
		  end if
		  
		  if len(aText) < 1 then
		    Return False
		  end if
		  
		  if len(aText) = 1 then
		    'handle special case of typing vs. pasting
		    code = Asc(aText)
		    if (code >= kZeroCode and code <= kNineCode) or (code >= kACode and code <= kFCode) or (code >= kLACode and code <= kLFCode) then
		      
		    else
		      Return False
		    end if
		    if mLastInsertion <> mSelStart then
		      mOnLowNibble = False
		    end if
		    if not mOnLowNibble then
		      data = chrb(16*CDbl("&h"+aText))
		    else
		      data = chrb(CDbl("&h"+aText))
		    end if
		    
		  else
		    data = HECConvertTextToBinary(aText)
		    mOnLowNibble = False
		  end if
		  if data = "" then
		    Return False
		  end if
		  
		  if mSelLength > 0 then
		    ModifyData data, mSelStart, mSelLength
		    mOnLowNibble = lenb(data) = 1
		  else
		    if mOnLowNibble and lenb(data) = 1 then
		      oldData = GetData(1, mSelStart-1)
		      data = chrb(ascb(data) + ascb(oldData))
		      ModifyData data, mSelStart-1, 1
		      data = ""
		      mOnLowNibble = False
		    else
		      InsertData data, mSelStart
		      mOnLowNibble = lenb(data) = 1
		    end if
		  end if
		  
		  mSelLength = 0
		  mSelStart = mSelStart + lenb(data)
		  me.UpdateByteRange mSelStart-lenb(data), &h7FFFFFFF
		  mLastInsertion = mSelStart
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasSelection() As boolean
		  Return mSelLength > 0 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HexAreaWidth() As integer
		  if mShowText then
		    Return TextLeftSide - HexLeftSide - mMWidth - kInterTextSlop
		  end if
		  
		  Return me.Width - HexLeftSide
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HexIsFocus() As boolean
		  Return not TextIsFocus
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HexLeftSide() As integer
		  Return LeftHandWidth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InsertText(aText as string)
		  if mSelLength > 0 then
		    ModifyData aText, mSelStart, mSelLength
		  else
		    InsertData aText, mSelStart
		  end if
		  'me.UpdateByteRange mSelStart, &h7FFFFFFF
		  'mSelStart = mSelStart + lenb(aText)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LeftHandWidth() As integer
		  dim chars as Integer
		  
		  chars = GetOffsetCharLength
		  if chars < 1 then
		    Return kLeftMargin
		  end if
		  
		  Return kLeftMargin + kLeftExtraSpace + mMWidth*chars
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LinesDisplayed() As integer
		  Return me.Height\mXHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OffsetLeftSide() As integer
		  Return kLeftMargin
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OffsetTextForPosition(aOffset as integer, aCharsPerOffset as integer) As string
		  Return right("00000000"+Hex(aOffset), aCharsPerOffset)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PaintBackground(g as graphics)
		  dim i as Integer
		  'dim w as Double
		  
		  g.ForeColor = mBackColor
		  g.FillRect 0,0,me.Width, me.Height
		  
		  
		  
		  if mDrawStripes then
		    g.ForeColor = mStripeColor
		    for i = 0 to LinesDisplayed-1 Step 2
		      g.FillRect 0, i*mXHeight, g.Width, mXHeight
		    next
		  end if
		  
		  'g.ForeColor = rgb(0,0,0)
		  'w = HexLeftSide
		  'do
		  'g.DrawLine w,0, w, me.Height
		  'w = w + mMWidth
		  'loop until w >= TextLeftSide
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PaintInsertion(g as graphics, aErase as boolean)
		  dim line as Integer
		  dim offset as Integer
		  dim x, y as Integer
		  
		  if mWriteable and mSelLength = 0 then
		    if not ByteIsVisible(mSelStart) then
		      Return
		      
		    end if
		    line = (mSelStart - mFirstDisplayedOffset)\mBytesPerLine
		    offset = (mSelStart - mFirstDisplayedOffset) mod mBytesPerLine
		    y = line * mXHeight
		    if HexIsFocus then
		      x = (offset \ mBytesPerGroup) * (mMWidth * (mBytesPerGroup*2 + 1))
		      x = x + (offset mod mBytesPerGroup)*mMWidth*2 //*2 'cause 2 chars = 1 byte
		      x = x + LeftHandWidth
		    else
		      x = TextLeftSide + mMWidth*offset
		    end if
		    
		    if aErase then
		      if line mod 2 = 0  and mDrawStripes then
		        g.ForeColor = mStripeColor
		      else
		        g.ForeColor = rgb(255,255,255)
		      end if
		      mInsertionOn = False
		    else
		      g.ForeColor = rgb(0,0,0)
		      mInsertionOn = true
		    end if
		    g.DrawLine x-1, y+2, x-1, y+mXHeight
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PaintSelection(g as graphics)
		  dim startLine, startColumn as Integer
		  dim endLine, endColumn as Integer
		  dim offset as Integer
		  dim startByteFromLine, endByteFromLine as Integer
		  dim firstLine, middleLines, lastLine as RectShape
		  dim textFirstLine, textMiddleLines, textLastLine as RectShape
		  dim c as Color
		  dim fig as FigureShape
		  
		  
		  if mSelLength = 0 then
		    PaintInsertion(g, true)
		  else
		    if mSelStart >= mFirstDisplayedOffset + (mBytesPerLine * LinesDisplayed) then
		      Return
		    end if
		    if mSelStart + mSelLength < mFirstDisplayedOffset then
		      Return
		    end if
		    'g.ForeColor = rgb(0,75, 255)
		    offset = mSelStart - mFirstDisplayedOffset
		    if offset < 0 then
		      offset = 0
		    end if
		    startLine = offset / mBytesPerLine
		    startByteFromLine = (offset mod mBytesPerLine)
		    startColumn = (startByteFromLine \ mBytesPerGroup) * (mBytesPerGroup*2+1) + (startByteFromLine mod mBytesPerGroup)*2
		    'g.FillRect startColumn*mMWidth+LeftHandWidth, startLine*mXHeight, mMWidth, mXHeight
		    
		    offset = (mSelStart + mSelLength) - mFirstDisplayedOffset
		    if offset > LinesDisplayed * mBytesPerLine then
		      offset = LinesDisplayed *mBytesPerLine
		    end if
		    endLine = offset / mBytesPerLine
		    endByteFromLine = (offset mod mBytesPerLine)
		    endColumn = (endByteFromLine \ mBytesPerGroup) * (mBytesPerGroup*2+1) + (endByteFromLine mod mBytesPerGroup)*2
		    
		    'if startLine < GetTopLine then
		    'startLine = GetTopLine
		    'startColumn = 0
		    'end if
		    '
		    'if endLine > GetTopLine + LinesDisplayed then
		    'endLine = GetTopLine + LinesDisplayed
		    'endColumn = (mBytesPerLine \ mBytesPerGroup) * (mBytesPerGroup*2+1) + (mBytesPerLine mod mBytesPerGroup)*2
		    'end if
		    '
		    
		    if endLine < startLine then
		      Return
		    end if
		    if endLine <> startLine then
		      firstLine = new RectShape
		      firstLine.Width = HexAreaWidth - (startColumn*mMWidth)
		      firstLine.Height = mXHeight
		      firstLine.x = HexLeftSide+startColumn*mMWidth //+firstLine.Width/2
		      firstLine.y = startLine*mXHeight //+ firstLine.Height/2
		      
		      lastLine = new RectShape
		      lastLine.Height = mXHeight
		      lastLine.Width = endColumn * mMWidth
		      lastLine.x = HexLeftSide //+lastLine.Width/2
		      lastLine.y = endLine*mXHeight //+ lastLine.Height/2
		      if endLine > startLine + 1 then
		        'create middle lines
		        middleLines = new RectShape
		        middleLines.Width =  HexAreaWidth
		        middleLines.Height = (endLine-startLine-1)*mXHeight
		        middleLines.x = HexLeftSide //+middleLines.Width/2
		        middleLines.y = (startLine+1)*mXHeight //+ middleLines.Height/2
		      end if
		    else
		      firstLine = new RectShape
		      firstLine.Height = mXHeight
		      firstLine.Width = (endColumn - startColumn) * mMWidth
		      firstLine.x = HexLeftSide+startColumn*mMWidth //+firstLine.Width/2
		      firstLine.y = startLine*mXHeight //+ firstLine.Height/2
		    end if
		    
		    'Now calculate for the text area, if needed
		    if VisibilityOfText = true then
		      if endLine <> startLine then
		        textFirstLine = new RectShape
		        textFirstLine.Width = TextAreaWidth - (startByteFromLine * mMWidth)
		        textFirstLine.Height = mXHeight
		        textFirstLine.x = TextLeftSide+startByteFromLine*mMWidth
		        textFirstLine.y = startLine*mXHeight //+ firstLine.Height/2
		        
		        textLastLine = new RectShape
		        textLastLine.Height = mXHeight
		        textLastLine.Width = endByteFromLine * mMWidth
		        textLastLine.x = TextLeftSide //+lastLine.Width/2
		        textLastLine.y = endLine*mXHeight //+ lastLine.Height/2
		        if endLine > startLine + 1 then
		          'create middle lines
		          textMiddleLines = new RectShape
		          textMiddleLines.Width =  TextAreaWidth
		          textMiddleLines.Height = (endLine-startLine-1)*mXHeight
		          textMiddleLines.x = TextLeftSide //+middleLines.Width/2
		          textMiddleLines.y = (startLine+1)*mXHeight //+ middleLines.Height/2
		        end if
		      else
		        textFirstLine = new RectShape
		        textFirstLine.Height = mXHeight
		        textFirstLine.Width = (endByteFromLine - startByteFromLine) * mMWidth
		        textFirstLine.x = TextLeftSide+startByteFromLine*mMWidth //+firstLine.Width/2
		        textFirstLine.y = startLine*mXHeight //+ firstLine.Height/2
		      end if
		      
		    end if
		    
		    
		    fig = RectsToFigureShape(firstLine, middleLines, lastLine)
		    if fig <> nil then
		      if HexIsFocus then
		        fig.FillColor = HighlightColor
		      else
		        fig.fill = 0
		        fig.Border = 100
		        fig.BorderWidth = 2
		        fig.BorderColor = hsv(HighlightColor.hue, HighlightColor.saturation, HighlightColor.value/1.2)
		      end if
		      g.DrawObject fig
		    end if
		    
		    if VisibilityOfText = true then
		      fig = RectsToFigureShape(textFirstLine, textMiddleLines, textLastLine)
		      if fig <> nil then
		        if TextIsFocus then
		          fig.FillColor = HighlightColor
		        else
		          fig.fill = 0
		          fig.Border = 100
		          fig.BorderWidth = 2
		          fig.BorderColor = hsv(HighlightColor.hue, HighlightColor.saturation, HighlightColor.value/1.2)
		        end if
		        g.DrawObject fig
		      end if
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PointInText(x as integer, y as integer) As boolean
		  return mShowText and x > TextLeftSide
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PointToByteOffset(x as integer, y as integer) As integer
		  dim offset as Integer
		  dim slotsIn as Integer
		  dim bytesIn as Integer
		  
		  offset = (y \ mXHeight) * mBytesPerLine
		  if mShowText and mTextIsFocus then
		    offset = offset + ((x - TextLeftSide) / mMWidth)
		  else
		    'offset = offset + (x-HexLeftSide) \ mMWidth
		    slotsIn = (x - HexLeftSide) / mMWidth
		    if slotsIn >= (HexAreaWidth \ mMWidth) then
		      slotsIn = (HexAreaWidth \ mMWidth) - 2
		    end if
		    bytesIn = (slotsIn \ ((mBytesPerGroup *2) + 1)) * mBytesPerGroup
		    bytesIn = bytesIn + ((slotsIn mod ((mBytesPerGroup * 2) + 1))\2)
		    offset = offset + bytesIn
		  end if
		  
		  if offset + mFirstDisplayedOffset > GetTotalDataLength() then
		    Return GetTotalDataLength()
		  end if
		  
		  return offset + mFirstDisplayedOffset
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RectsToFigureShape(aR1 as rectshape, aR2 as rectshape, aR3 as rectshape) As figureShape
		  dim res as FigureShape
		  
		  
		  if ar1 <> nil then
		    res = new FigureShape
		    
		    res.AddLine ar1.x, ar1.y+ar1.Height, ar1.x, ar1.y
		    res.AddLine ar1.x, ar1.y, ar1.x + ar1.Width, ar1.y
		    res.AddLine ar1.x + ar1.Width, ar1.y, ar1.x + ar1.Width, ar1.y + ar1.Height
		    
		    if ar2 <> nil then
		      res.AddLine ar1.x + ar1.Width, ar1.y + ar1.Height, ar1.x + ar1.Width, ar2.y + ar2.Height
		      if ar3 <> nil and ar3.Height > 0 and ar3.Width > 0 then
		        res.AddLine ar1.x + ar1.Width, ar2.y + ar2.Height, ar3.x+ar3.Width, ar2.y + ar2.Height
		        res.AddLine ar3.x+ar3.Width, ar2.y + ar2.Height, ar3.x+ar3.Width, ar3.y + ar3.Height
		        res.AddLine ar3.x+ar3.Width, ar3.y + ar3.Height, ar3.x, ar3.y + ar3.Height
		        res.AddLine ar3.x, ar3.y + ar3.Height, ar3.x, ar2.y
		        if ar3.x <> ar1.x then
		          res.AddLine ar3.x, ar2.y, ar1.x, ar1.y + ar1.Height
		        end if
		      else
		        res.AddLine ar1.x + ar1.Width, ar2.y + ar2.Height, ar2.x, ar2.y + ar2.Height
		        res.AddLine ar2.x, ar2.y + ar2.Height, ar2.x, ar2.y
		        if ar1.x <> ar2.x then
		          res.AddLine ar2.x, ar2.y, ar1.x, ar1.y+ar1.Height
		        end if
		      end if
		    elseif ar3 <> nil and ar3.Height > 0 and ar3.Width > 0 then
		      res.AddLine ar1.x + ar1.Width, ar1.y + ar1.Height, ar3.x+ar3.Width, ar3.y
		      res.AddLine ar3.x+ar3.Width, ar3.y, ar3.x + ar3.Width, ar3.y + ar3.Height
		      res.AddLine ar3.x + ar3.Width, ar3.y + ar3.Height, ar3.x, ar3.y + ar3.Height
		      res.AddLine ar3.x, ar3.y + ar3.Height, ar3.x, ar3.y
		      if ar3.x <> ar1.x then
		        res.AddLine ar3.x, ar3.y, ar1.x, ar1.y + ar1.Height
		      end if
		    else
		      res.AddLine ar1.x + ar1.Width, ar1.y + ar1.Height, ar1.x, ar1.y + ar1.Height
		    end if
		  end if
		  Return res
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RevealByte(aOffset as integer)
		  
		  if aOffset < mFirstDisplayedOffset then
		    SetTopLine(aOffset\mBytesPerLine)
		    me.Refresh
		  elseif aOffset > (mFirstDisplayedOffset + (LinesDisplayed-1)*mBytesPerLine) then
		    SetTopLine((aOffset - (LinesDisplayed-1)*mBytesPerLine)\mBytesPerLine)
		    me.Refresh
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SanityChecks()
		  dim td as Integer
		  
		  td = GetTotalDataLength()
		  if mSelStart < 0 then
		    mSelStart = 0
		  end if
		  if mSelStart > td then
		    mSelStart = td
		  end if
		  if mSelStart + mSelLength > td then
		    mSelLength = td - mSelStart
		  end if
		  
		  if mFirstDisplayedOffset \ mBytesPerLine <> mFirstDisplayedOffset / mBytesPerLine then
		    mFirstDisplayedOffset = (mFirstDisplayedOffset \ mBytesPerLine) * mBytesPerLine
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectionLength() As integer
		  Return mSelLength
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectionStart() As integer
		  Return mSelStart
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetDisplayCharacteristics(aG as graphics)
		  dim fname as String
		  dim fsize as Integer
		  dim oldSize as Integer
		  
		  oldSize = aG.TextSize
		  
		  fname = GetFont()
		  if fname = "" then
		    fname = kFontName
		  end if
		  aG.TextFont = fname
		  
		  fsize = GetFontSize()
		  if fsize = 0 then
		    fsize = kFontSize
		  end if 
		  aG.TextSize = fsize
		  
		  if mLastFontName <> fname or oldSize <> fsize then
		    CacheCommonData(aG)
		    DetermineBadCharacters(fname, fsize, aG)
		  end if
		  mLastFontName = fname
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDrawStripes(aDraw as boolean)
		  mDrawStripes = aDraw
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetNumberOfCharactersForOffset(aChars as integer)
		  mCharactersForOffset = aChars
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSelection(aStart as integer, aLen as integer)
		  dim oldStart, oldLen as Integer
		  
		  oldStart = mSelStart
		  oldLen = mSelLength
		  if aLen < 0 then
		    mSelLength = abs(aLen)
		    mSelStart = aStart - mSelLength
		  else
		    mSelStart = aStart
		    mSelLength = aLen
		  end if
		  if mSelStart < 0 then 
		    mSelStart = 0
		  elseif mSelStart > GetTotalDataLength() then
		    mSelStart = GetTotalDataLength()
		  end if
		  
		  if mSelStart + mSelLength > GetTotalDataLength() then
		    mSelLength = GetTotalDataLength() - mSelStart
		  end if
		  me.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTopLine(aLine as integer)
		  dim line as Integer
		  line = min(ceil(GetTotalDataLength / mBytesPerLine)-LinesDisplayed, aLine)
		  line = max(0, line)
		  
		  
		  mFirstDisplayedOffset = line * mBytesPerLine
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisibilityOfText(aVisibility as boolean)
		  mShowText = aVisibility
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetWriteable(aWrite as boolean)
		  mWriteable = aWrite
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextAreaWidth() As integer
		  Return mMWidth * mBytesPerLine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextIsFocus() As boolean
		  Return mShowText and mTextIsFocus
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextLeftSide() As integer
		  Return me.Width - (kRightMargin + mMWidth*mBytesPerLine)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateByteRange(aStart as integer, aLen as integer)
		  me.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibilityOfText() As boolean
		  Return mShowText
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DeleteData(aLen as integer, aPosition as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetData(aLen as integer, aPosition as integer) As string
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetFont() As string
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetFontSize() As integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetTotalDataLength() As integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event InsertData(aData as string, aLoc as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(Key as string) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ModifyData(aNewData as string, aPosition as integer, aOldLength as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X as integer, Y as integer) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseEnter()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SetScrollMaximum(aMax as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SetScrollPageIncrement(aIncrement as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SetScrollPosition(aPos as integer)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected mBackColor As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mBadChars As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mBadCharsRE As regex
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mBytesPerGroup As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mBytesPerLine As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mCharactersForOffset As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mClickStartOffset As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mDataAsDisplayed As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mDividerColor As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mDrawStripes As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mFirstDisplayedOffset As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mInsertionOn As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastFontName As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastInsertion As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mMWidth As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mOffsetsAsDisplayed As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mOnLowNibble As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSelDirection As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSelLength As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSelStart As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mShowText As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mStripeColor As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTextAsDisplayed As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTextColor As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTextIsFocus As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mWriteable As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mXHeight As double
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
