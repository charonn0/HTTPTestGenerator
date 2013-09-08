#tag Class
Protected Class HexViewer
Inherits BaseCanvas
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(key) = &h1F Then ' up arrow
		    If Not RaiseEvent Scrolled(1, LineLength) Then
		      Me.Offset = Me.Offset + LineLength
		    End If
		  ElseIf Asc(key) = &h1E Then ' down arrow
		    If Not RaiseEvent Scrolled(-1, LineLength * -1) Then
		      Me.Offset = Me.Offset - LineLength
		    End If
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  #pragma Unused deltaX
		  #pragma Unused X
		  #pragma Unused Y
		  Dim data As String
		  Stream.Position = Offset
		  Do Until Buffer.Graphics.StringWidth(data) >= Buffer.Graphics.Width - Buffer.Graphics.StringWidth(" 00")
		    Dim bt As Byte = Stream.ReadByte
		    data = data + " " + Left(Hex(bt) + "00", 2) + " "
		  Loop
		  
		  Dim linedelta, bytesdelta As Integer
		  If Sign(deltaY) = 1 Then ' scroll down
		    For i As Integer = 1 To deltaY
		      bytesdelta = bytesdelta + LineLength
		      linedelta = linedelta + 1
		    Next
		    
		  ElseIf Sign(deltaY) = -1 Then ' scroll up
		    
		    For i As Integer = deltaY To 0
		      bytesdelta = bytesdelta + LineLength
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
		Sub Open()
		  Me.UpdateClearsBackground = True
		  RaiseEvent Open
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint	(g As Graphics)
		  'g.ClearRect(0, 0, g.Width, g.Height)
		  g.AntiAlias = True
		  #If TargetWin32 Then
		    App.UseGDIPlus = False
		  #endif
		  Dim BinWidth As Integer
		  Dim gw, rowoffset As Integer
		  Dim alt As Boolean = True
		  If ShowOffsets Then
		    gw = g.StringWidth("0x00000000") + 2
		    'TopGutterGraphics = g.Clip(0, 0, g.Width, g.StringHeight("0x00000000", 99)) 'broken right now
		    TopGutterGraphics = g.Clip(0, 0, 0, 0)
		  Else
		    gw = 0
		    TopGutterGraphics = g.Clip(0, 0, 0, 0)
		  End If
		  TopGutterGraphics.TextSize = 0.75 * Me.TextSize
		  GutterGraphics = g.Clip(0, TopGutterGraphics.Height, gw, Buffer.Height - TopGutterGraphics.Height)
		  BinWidth = (0.80 * Me.Width) - GutterGraphics.Width
		  BinGraphics = g.Clip(GutterGraphics.Width, TopGutterGraphics.Height, BinWidth, Buffer.Height - TopGutterGraphics.Height)
		  Dim TextWidth As Integer = Me.Width - BinWidth - GutterGraphics.Width
		  TextGraphics = g.Clip(BinWidth + GutterGraphics.Width, TopGutterGraphics.Height, TextWidth, Buffer.Height - TopGutterGraphics.Height)
		  
		  If Stream = Nil Then Return
		  Dim TextHeight, row, column, bytewidth As Integer
		  Dim data, txt, hx As String
		  bytewidth = BinGraphics.StringWidth(" 00")
		  Stream.Position = Offset
		  row = LineFromOffset(Offset)
		  Do Until TextHeight > BinGraphics.Height Or Stream.EOF
		    rowoffset = Stream.Position
		    Do Until BinGraphics.StringWidth(data) >= BinGraphics.Width - bytewidth
		      Dim bt As Byte = Stream.ReadByte
		      hx = Hex(bt, 2)
		      data = data + " " + hx + " "
		      If bt < 33 Or bt > 127 Then
		        txt = txt + "."
		      Else
		        If Me.Encoding <> Nil Then
		          txt = txt + Me.Encoding.Chr(bt).Trim
		        Else
		          txt = txt + Chr(bt).Trim
		        End If
		      End If
		      If row = 0 Then
		        Dim header As String = Hex(column, 2)
		        Dim headerstart As Integer = GutterGraphics.Width + (bytewidth * column) + BinGraphics.StringWidth(" 00 ")
		        TopGutterGraphics.DrawString(" " + header, headerstart, TopGutterGraphics.Height)
		      End If
		      column = column + 1
		    Loop
		    
		    column = 1
		    TextHeight = TextHeight + LineHeight
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
		    BinGraphics.FillRect(0, TextHeight, BinGraphics.Width, LineHeight)
		    TextGraphics.FillRect(0, TextHeight, TextGraphics.Width, LineHeight)
		    GutterGraphics.FillRect(0, TextHeight, GutterGraphics.Width, LineHeight)
		    
		    TextGraphics.ForeColor = TextColor
		    BinGraphics.ForeColor = ByteColor
		    BinGraphics.DrawString(data, 0, TextHeight - 1)
		    TextGraphics.DrawString(txt, 0, TextHeight - 1)
		    GutterGraphics.ForeColor = LineNumbersColor
		    Dim linenumber As String = Hex(rowoffset, 8)
		    GutterGraphics.DrawString("0x" + linenumber, 0, TextHeight - 1)
		    data = ""
		    txt = ""
		    row = row + 1
		  Loop
		  g.DrawLine(BinGraphics.Width + GutterGraphics.Width - 1, 0, BinGraphics.Width + GutterGraphics.Width - 1, BinGraphics.Height)
		  If Me.Border Then
		    g.ForeColor = Me.BorderColor
		    g.DrawRect(0, 0, g.Width, g.Height)
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Shared Function Hex(Data As Integer, Width As Integer = 2) As String
		  Dim number As String = Left(REALbasic.Hex(Data) + "00000000", Width)
		  If TargetLittleEndian Then number = StrReverse(number)
		  Return number
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineCount() As Integer
		  If Stream = Nil Then Return 0
		  If Stream.Length Mod LineLength = 0 Then
		    Return Stream.Length \ LineLength
		  Else
		    Return (Stream.Length \ LineLength) + 1
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LineFromOffset(BytesOffset As UInt64) As Integer
		  If BytesOffset Mod LineLength = 0 Then
		    Return BytesOffset \ LineLength
		  Else
		    Return (BytesOffset \ LineLength) + 1
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineHeight() As Integer
		  Return BinGraphics.StringHeight("00", BinGraphics.Width)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LineLength() As Integer
		  ' the number of bytes each line represents
		  Dim data As String
		  Dim g As Graphics = Buffer.Graphics
		  Dim count As Integer
		  Do Until g.StringWidth(data) >= BinGraphics.Width - g.StringWidth(" 00")
		    data = data + " 00"
		    count = count + 1
		  Loop
		  Return count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OffsetFromLine(Line As Integer) As UInt64
		  Return LineLength * Line
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OffsetFromXY(X As Integer, Y As Integer) As Int64
		  Dim row As Integer = Y \ LineHeight
		  Dim column As Integer = X \ LineLength
		  Dim oldoffset As UInt64 = Me.Offset
		  Stream.Position = Me.Offset
		  For a As Integer = 0 To row
		    For b As Integer = 0 To column
		      If a = row And b = column Then
		        Dim ret As Int64 = Stream.Position + 1
		        Stream.Position = oldoffset
		        Return ret
		      End If
		    Next
		  Next
		  
		  Stream.Position = oldoffset
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowData(DataStream As BinaryStream)
		  Me.Stream = DataStream
		  Me.Stream.Position = 0
		  Offset = 0
		  Me.Refresh(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function StrReverse(s As String) As String
		  'from WFS
		  // Return s with the characters in reverse order.
		  
		  If Len(s) < 2 Then Return s
		  
		  Dim m As New MemoryBlock(s.LenB)
		  
		  Dim c As String
		  Dim pos, mpos, csize As Integer
		  pos = 1
		  mpos = m.Size
		  While mpos > 0
		    c = Mid(s, pos, 1)
		    csize = c.LenB
		    mpos = mpos - csize
		    m.StringValue(mpos, csize) = c
		    pos = pos + 1
		  Wend
		  
		  Return DefineEncoding(m.StringValue(0, m.Size), s.Encoding)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisibleLineCount() As Integer
		  Dim h As Integer = LineHeight
		  Return BinGraphics.Height \ h
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Scrolled(LinesDelta As Integer, BytesDelta As Integer) As Boolean
	#tag EndHook


	#tag Property, Flags = &h21
		Private BinGraphics As Graphics
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
			  Update()
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
			  Update()
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
			  Update()
			End Set
		#tag EndSetter
		ByteColor As Color
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
			  Update()
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
			  Update()
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
			  Update()
			End Set
		#tag EndSetter
		GutterColorAlt As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private GutterGraphics As Graphics
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
			  Update()
			End Set
		#tag EndSetter
		LineNumbersColor As Color
	#tag EndComputedProperty

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
		Private mOffset As UInt64
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mOffset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <= Stream.Length Then
			    mOffset = value
			    Update()
			  End If
			End Set
		#tag EndSetter
		Offset As UInt64
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
			  Update()
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
			  Update()
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
			  Update()
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
			  Update()
			End Set
		#tag EndSetter
		TextBackGroundColorAlt As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private TextGraphics As Graphics
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TopGutterGraphics As Graphics
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
			Name="Bold"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BaseCanvas"
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
			Name="Hilight"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BaseCanvas"
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
			Name="Italic"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BaseCanvas"
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
			Name="TextColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Group="Behavior"
			Type="Single"
			InheritedFrom="BaseCanvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BaseCanvas"
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
