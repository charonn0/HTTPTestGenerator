#tag Window
Begin ContainerControl HexView Implements Viewer
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   4.57e+2
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   3.2e+1
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   3.2e+1
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   6.14e+2
   Begin ScrollBar ScrollBar1
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   457
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   598
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   16
   End
   Begin HexViewer HexViewer1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   ""
      Bold            =   ""
      Border          =   True
      BorderColor     =   &h00808080
      ByteBackgroundColor=   "&cFFFFFF00"
      ByteBackgroundColorAlt=   "&cC0C0C000"
      ByteColor       =   "&c0000FF00"
      BytesLittleEndian=   True
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      GutterColor     =   "&cFFFFFF00"
      GutterColorAlt  =   "&cC0C0C000"
      Height          =   457
      HelpTag         =   ""
      Hilight         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LineNumbersColor=   "&c80000000"
      LineNumbersLittleEndian=   ""
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      ShowOffsets     =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextBackGroundColor=   "&cFFFFFF00"
      TextBackGroundColorAlt=   "&cC0C0C000"
      TextFont        =   "System"
      TextSize        =   ""
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   594
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  ScrollBar1.Maximum = HexViewer1.LineCount - (HexViewer1.VisibleLineCount \ 2)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ViewRaw(Message As String, Type As ContentType)
		  // Part of the Viewer interface.
		  
		  RawData = Message
		  MIMEType = Type
		  Dim bs As New BinaryStream(RawData)
		  HexViewer1.ShowData(bs)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected MIMEType As ContentType
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RawData As MemoryBlock
	#tag EndProperty


#tag EndWindowCode

#tag Events ScrollBar1
	#tag Event
		Sub ValueChanged()
		  HexViewer1.Offset = Me.Value * HexViewer1.BytesPerLine
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HexViewer1
	#tag Event
		Function Scrolled(LinesDelta As Integer, BytesDelta As Integer) As Boolean
		  #pragma Unused BytesDelta
		  ScrollBar1.Maximum = HexViewer1.LineCount - (HexViewer1.VisibleLineCount \ 2)
		  ScrollBar1.Value = ScrollBar1.Value + LinesDelta
		  Return True ' Since we're updating the offset in ScrollBar1.ValueChanged, we return true to prevent the HexViewer from updating it too.
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
		End Sub
	#tag EndEvent
#tag EndEvents