#tag Class
Protected Class HexViewer
Inherits Canvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(key) = &h1F Then ' up arrow
		    If Not RaiseEvent Scrolled(1, BytesPerLine) Then
		      Me.Offset = Me.Offset + BytesPerLine
		    End If
		  ElseIf Asc(key) = &h1E Then ' down arrow
		    If Not RaiseEvent Scrolled(-1, BytesPerLine * -1) Then
		      Me.Offset = Me.Offset - BytesPerLine
		    End If
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Me.SelectionStart = OffsetFromXY(X, Y)
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  Me.SelectionEnd = OffsetFromXY(X, Y)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Me.SelectionEnd = OffsetFromXY(X, Y)
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  #pragma Unused deltaX
		  #pragma Unused X
		  #pragma Unused Y
		  If Stream = Nil Then Return False
		  Dim linedelta, bytesdelta As Integer
		  If Sign(deltaY) = 1 Then ' scroll down
		    For i As Integer = 1 To deltaY
		      bytesdelta = bytesdelta + BytesPerLine
		      linedelta = linedelta + 1
		    Next
		    
		  ElseIf Sign(deltaY) = -1 Then ' scroll up
		    
		    For i As Integer = deltaY To 0
		      bytesdelta = bytesdelta + BytesPerLine
		      linedelta = linedelta + 1
		    Next
		    
		    bytesdelta = bytesdelta * -1
		    linedelta = linedelta * -1
		    
		  End If
		  
		  If Not RaiseEvent Scrolled(linedelta, bytesdelta) Then
		    Me.Offset = Me.Offset + bytesdelta
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  If Buffer = Nil Or Buffer.Width <> g.Width Or Buffer.Height <> g.Height Or LastPaintedOffset <> mOffset Then 'redraw needed
		    #If TargetWin32 Then
		      App.UseGDIPlus = False ' UseGDIPlus makes the text blurry
		    #endif
		    Buffer = New Picture(g.Width, g.Height, 32)
		    Dim gg As Graphics = Buffer.Graphics
		    gg.AntiAlias = True
		    Dim TextHeight As Integer
		    CreateGraphics(gg)
		    
		    If Stream = Nil Then
		      DrawBlank(TextHeight)
		    Else
		      'DrawSelection()
		      DrawMain(TextHeight)
		    End If
		    
		    ' draw the borders
		    gg.ForeColor = GutterColor
		    gg.FillRect(0, TextHeight, gg.Width, gg.Height - TextHeight)
		    gg.ForeColor = Me.BorderColor
		    gg.DrawLine(BinGraphics.Width + GutterGraphics.Width - 1, 0, BinGraphics.Width + GutterGraphics.Width - 1, BinGraphics.Height)
		    gg.DrawLine(GutterGraphics.Width - 1, 0, GutterGraphics.Width - 1, BinGraphics.Height)
		    If Me.Border Then
		      gg.DrawRect(0, 0, gg.Width, gg.Height)
		    End If
		  End If
		  g.DrawPicture(Buffer, 0, 0)
		  LastPaintedOffset = mOffset
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function BytesPerLine() As Integer
		  ' the number of bytes each line represents
		  Dim data As String
		  Dim count As Integer
		  If BinGraphics <> Nil Then
		    Do Until BinGraphics.StringWidth(data) >= BinGraphics.Width - BinGraphics.StringWidth(" 00")
		      data = data + " 00"
		      count = count + 1
		    Loop
		  End If
		  Return count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateGraphics(g As Graphics)
		  Dim gw As Integer
		  If ShowOffsets Then ' if we're showing line offsets, calculate the needed width. If not, use 0
		    Dim tmp As String
		    For i As Integer = 1 To 6
		      tmp = tmp + "0"
		    Next
		    gw = g.StringWidth(tmp) + 1
		  Else
		    gw = 0
		  End If
		  
		  ' GutterGraphics represents the left-hand column for line offsets
		  GutterGraphics = g.Clip(0, 0, gw, Buffer.Height)
		  
		  ' BinGraphics represents the central byte-oriented area
		  If ShowOffsets Then
		    BinGraphics = g.Clip(GutterGraphics.Width, 0, (0.75 * Me.Width) - GutterGraphics.Width + g.StringWidth(" "), Buffer.Height)
		  Else
		    BinGraphics = g.Clip(GutterGraphics.Width, 0, (0.75 * Me.Width) - GutterGraphics.Width, Buffer.Height)
		  End If
		  
		  ' TextGraphics represents the right-hand ASCII text column
		  TextGraphics = g.Clip(BinGraphics.Width + GutterGraphics.Width, 0, Me.Width - BinGraphics.Width - GutterGraphics.Width, Buffer.Height)
		  ' end Graphics' construct
		  
		  BinGraphics.TextFont = Me.TextFont
		  TextGraphics.TextFont = Me.TextFont
		  GutterGraphics.TextFont = Me.TextFont
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawBlank(ByRef TextHeight As Integer)
		  Dim rowoffset As Integer
		  Dim alt As Boolean
		  Do Until TextHeight > BinGraphics.Height
		    If alt Then
		      BinGraphics.Forecolor = ByteBackgroundColorAlt
		      TextGraphics.Forecolor = TextBackGroundColorAlt
		      GutterGraphics.ForeColor = GutterColorAlt
		    Else
		      BinGraphics.Forecolor = ByteBackgroundColor
		      TextGraphics.Forecolor = TextBackGroundColor
		      GutterGraphics.ForeColor = GutterColor
		    End If
		    alt = Not alt
		    
		    BinGraphics.FillRect(0, TextHeight - LineHeight, BinGraphics.Width, LineHeight)
		    TextGraphics.FillRect(0, TextHeight - LineHeight, TextGraphics.Width, LineHeight)
		    GutterGraphics.FillRect(0, TextHeight - LineHeight, GutterGraphics.Width, LineHeight)
		    GutterGraphics.ForeColor = LineNumbersColor
		    Dim linenumber As String = Hex(rowoffset, 6, LineNumbersLittleEndian)
		    GutterGraphics.DrawString(linenumber, 0, TextHeight - 1)
		    TextHeight = TextHeight + LineHeight
		  Loop
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawMain(ByRef TextHeight As Integer)
		  Dim rowOffset As UInt64
		  Dim data, txt, hx As String
		  Dim alt As Boolean = (Offset Mod (BytesPerLine * 2) = 0) And ScrollBackground
		  Dim row, column, bytewidth As Integer
		  bytewidth = BinGraphics.StringWidth(".00")
		  Stream.Position = Offset
		  Do Until TextHeight > BinGraphics.Height Or Stream.EOF
		    rowoffset = Stream.Position
		    Dim selstart, selend As Integer
		    Dim pos As Integer
		    selstart = -1
		    Do Until BinGraphics.StringWidth(data) >= BinGraphics.Width - bytewidth
		      If Stream.EOF Then
		        data = data + " "
		        Exit Do
		      End If
		      
		      ' Read one byte from the stream and hexify it
		      ' add the hexed byte string to txt
		      Dim bt As Byte = Stream.ReadByte
		      hx = Hex(bt, 2, BytesLittleEndian)
		      data = data + " " + hx' + " "
		      If bt < 33 Or bt > 127 Then
		        txt = txt + "."
		      Else
		        If Me.Encoding <> Nil Then
		          txt = txt + Me.Encoding.Chr(bt).Trim
		        Else
		          txt = txt + Chr(bt).Trim
		        End If
		      End If
		      column = column + 1
		      If pos + Offset >= SelectionStart And pos + Offset <= SelectionEnd And selstart > -1 Then
		        If selstart = -1 Then selstart = pos + Offset
		      ElseIf selstart > -1 Then
		        selend = pos + Offset
		      End If
		      pos = pos + 1
		    Loop
		    
		    column = 1
		    ' TextHeight represents the bottom of the most recently added line.
		    TextHeight = TextHeight + LineHeight
		    
		    ' Draw backgrounds, alternating colors with each line
		    If alt Then
		      BinGraphics.Forecolor = ByteBackgroundColorAlt
		      TextGraphics.Forecolor = TextBackGroundColorAlt
		      GutterGraphics.ForeColor = GutterColorAlt
		    Else
		      BinGraphics.Forecolor = ByteBackgroundColor
		      TextGraphics.Forecolor = TextBackGroundColor
		      GutterGraphics.ForeColor = GutterColor
		    End If
		    alt = Not alt
		    BinGraphics.FillRect(0, TextHeight - LineHeight, BinGraphics.Width, LineHeight)
		    TextGraphics.FillRect(0, TextHeight - LineHeight, TextGraphics.Width, LineHeight)
		    GutterGraphics.FillRect(0, TextHeight - LineHeight, GutterGraphics.Width, LineHeight)
		    
		    If SelStart > -1 Then
		      BinGraphics.ForeColor = &c0080FF00
		      BinGraphics.FillRect(selstart * bytewidth, 0, selend * bytewidth, LineHeight)
		    End If
		    
		    ' draw the text
		    TextGraphics.ForeColor = TextColor
		    BinGraphics.ForeColor = ByteColor
		    BinGraphics.DrawString(data, 0, TextHeight - 2) ' hexified bytes
		    TextGraphics.DrawString(txt, 0, TextHeight - 2) ' ASCII characters
		    
		    ' line offsets
		    GutterGraphics.ForeColor = LineNumbersColor
		    Dim linenumber As String = Hex(rowoffset, 5, LineNumbersLittleEndian)
		    GutterGraphics.DrawString(linenumber, 0, TextHeight - 2)
		    ' done
		    data = ""
		    txt = ""
		    row = row + 1
		    pos = 0
		  Loop
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawSelection()
		  Dim TextHeight, pos, bytewidth, col As Integer
		  pos = Offset
		  bytewidth = BinGraphics.StringWidth(".00")
		  
		  Do Until TextHeight > BinGraphics.Height Or pos > Stream.Length
		    Do Until col > BytesPerLine
		      If pos >= Me.SelectionStart And pos <= Me.SelectionEnd Then
		        BinGraphics.ForeColor = &c0080FF00
		        Dim x, y, w, h As Integer
		        x = col * bytewidth
		        y = textheight
		        w = bytewidth
		        h = LineHeight
		        BinGraphics.FillRect(x, y, w, h)
		      End If
		      col = col + 1
		      pos = pos + 1
		    Loop
		    col = 0
		    TextHeight = TextHeight + LineHeight
		  Loop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DumpStream() As String
		  Dim p As Integer = Stream.Position
		  Stream.Position = 0
		  Dim data As MemoryBlock = Stream.Read(Stream.Length)
		  Stream.Position = p
		  Return data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Hex(Data As Integer, Width As Integer = 2, LittleEndian As Boolean) As String
		  Dim tmp As String
		  For i As Integer = 1 To Width
		    tmp = tmp + "0"
		  Next
		  Dim number As String = Left(REALbasic.Hex(Data) + tmp, Width)
		  If TargetLittleEndian Then
		    If Not LittleEndian Then number = StrReverse(number)
		  Else
		    If LittleEndian Then number = StrReverse(number)
		  End If
		  Return number
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineCount() As Integer
		  If Stream = Nil Then Return 0
		  If Stream.Length Mod BytesPerLine = 0 Then
		    Return Stream.Length \ BytesPerLine
		  Else
		    Return (Stream.Length \ BytesPerLine) + 1
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LineFromOffset(BytesOffset As UInt64) As Integer
		  Dim bpl As Integer = BytesPerLine
		  If BytesOffset Mod bpl = 0 Then
		    Return BytesOffset \ bpl
		  Else
		    Return (BytesOffset \ bpl) + 1
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineHeight() As Integer
		  Return BinGraphics.StringHeight("00", BinGraphics.Width)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OffsetFromLine(Line As Integer) As UInt64
		  Return BytesPerLine * Line
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OffsetFromXY(X As Integer, Y As Integer) As UInt64
		  If Stream = Nil Then Return -1
		  'Dim row As Integer = Y \ LineHeight
		  'Dim column As Integer = X \ BinGraphics.Width
		  'Dim oldoffset As UInt64 = Me.Offset
		  'Stream.Position = Me.Offset
		  'For a As Integer = 0 To row
		  'For b As Integer = 0 To column
		  'If a = row And b = column Then
		  'Dim ret As Int64 = Stream.Position + 1
		  'Stream.Position = oldoffset
		  'Return ret
		  'Else
		  'Call Stream.ReadByte
		  'End If
		  'Next
		  'Next
		  '
		  'Stream.Position = oldoffset
		  'Return -1
		  
		  Dim line As Integer = Y \ LineHeight
		  Dim o As Integer = OffsetFromLine(line)
		  Stream.Position = o
		  Dim w, bytewidth As Integer
		  Dim pos As Int64 = -1
		  bytewidth = BinGraphics.StringWidth(".00")
		  'w = bytewidth
		  For i As Integer = 1 To BytesPerLine
		    If Stream.EOF Then
		      Stream.Position = Offset
		      Exit For
		    End If
		    Call Stream.ReadByte
		    If X > w And X < w + bytewidth Then
		      pos = Stream.Position
		      Stream.Position = Offset
		      Exit For
		    End If
		    w = w + bytewidth
		  Next
		  Return pos
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowData(DataStream As BinaryStream)
		  Me.Stream = DataStream
		  Me.Stream.Position = 0
		  LastPaintedOffset = -1
		  Offset = 0
		  'Me.Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function StrReverse(InputData As String) As String
		  Dim output As String = DefineEncoding("", InputData.Encoding)
		  For i As Integer = InputData.Len DownTo 1
		    output = output + Mid(InputData, i, 1)
		  Next
		  Return output
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Update()
		  LastPaintedOffset = -1
		  Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleLineCount() As Integer
		  Dim h As Integer = LineHeight
		  Return BinGraphics.Height \ h
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Scrolled(LinesDelta As Integer, BytesDelta As Integer) As Boolean
	#tag EndHook


	#tag Property, Flags = &h21
		Private BinGraphics As Graphics
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBorder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBorder = value
			  Me.Update
			End Set
		#tag EndSetter
		Border As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBorderColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBorderColor = value
			  Me.Update
			End Set
		#tag EndSetter
		BorderColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Buffer As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mByteBackgroundColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mByteBackgroundColor = value
			  Me.Update
			End Set
		#tag EndSetter
		ByteBackgroundColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mByteBackgroundColorAlt
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mByteBackgroundColorAlt = value
			  Me.Update
			End Set
		#tag EndSetter
		ByteBackgroundColorAlt As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mByteColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mByteColor = value
			  Me.Update
			End Set
		#tag EndSetter
		ByteColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBytesLittleEndian
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBytesLittleEndian = value
			  Me.Update
			End Set
		#tag EndSetter
		BytesLittleEndian As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEncoding
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEncoding = value
			  Me.Update
			End Set
		#tag EndSetter
		Encoding As TextEncoding
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mGutterColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGutterColor = value
			  Me.Update
			End Set
		#tag EndSetter
		GutterColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mGutterColorAlt
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGutterColorAlt = value
			  Me.Update
			End Set
		#tag EndSetter
		GutterColorAlt As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private GutterGraphics As Graphics
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastPaintedOffset As Integer = -1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLineNumbersColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLineNumbersColor = value
			  Me.Update
			End Set
		#tag EndSetter
		LineNumbersColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLineNumbersLittleEndian
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLineNumbersLittleEndian = value
			  Me.Update
			End Set
		#tag EndSetter
		LineNumbersLittleEndian As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBorder As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBorderColor As Color = &c808080
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mByteBackgroundColor As Color = &cFFFFFF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mByteBackgroundColorAlt As Color = &cEAFFFF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mByteColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBytesLittleEndian As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEncoding As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGutterColor As Color = &cC0C0C000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGutterColorAlt As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumbersColor As Color = &c0000FF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLineNumbersLittleEndian As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOffset As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionEnd As Int64 = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectionStart As Int64 = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowOffsets As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStreamLen As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextBackGroundColor As Color = &cFFFFFF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextBackGroundColorAlt As Color = &cEAFFFF00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextColor As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextFont As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mOffset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Stream = Nil Or value >= Stream.Length Then Return
			  mOffset = value
			  Me.Update
			End Set
		#tag EndSetter
		Offset As UInt64
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ScrollBackground As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSelectionEnd
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectionEnd = value
			  Me.Update
			End Set
		#tag EndSetter
		SelectionEnd As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSelectionStart
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectionStart = value
			  Me.Update
			End Set
		#tag EndSetter
		SelectionStart As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mShowOffsets
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mShowOffsets = value
			  Me.Update
			End Set
		#tag EndSetter
		ShowOffsets As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Stream As BinaryStream
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Stream.Length
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Stream.Length = value
			  Me.Update
			End Set
		#tag EndSetter
		StreamLen As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextBackGroundColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextBackGroundColor = value
			  Me.Update
			End Set
		#tag EndSetter
		TextBackGroundColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTextBackGroundColorAlt
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTextBackGroundColorAlt = value
			  Me.Update
			End Set
		#tag EndSetter
		TextBackGroundColorAlt As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtextFont = value
			  Me.Update
			End Set
		#tag EndSetter
		TextFont As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private TextGraphics As Graphics
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
			Name="Border"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ByteBackgroundColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cFFFFFF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ByteBackgroundColorAlt"
			Visible=true
			Group="Behavior"
			InitialValue="&cC0C0C000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ByteColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c0000FF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BytesLittleEndian"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
			Name="GutterColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cFFFFFF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GutterColorAlt"
			Visible=true
			Group="Behavior"
			InitialValue="&cC0C0C000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
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
			Group="Initial State"
			Type="String"
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
			Name="LineNumbersColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c80000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineNumbersLittleEndian"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
			Name="ScrollBackground"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowOffsets"
			Visible=true
			Group="Behavior"
			Type="Boolean"
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
			Name="TextBackGroundColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cFFFFFF00"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextBackGroundColorAlt"
			Visible=true
			Group="Behavior"
			InitialValue="&cC0C0C000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
