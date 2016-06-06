#tag Window
Begin ContainerControl HexView Implements Viewer
   AcceptFocus     =   True
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   457
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   614
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
      ByteBackgroundColor=   &h00E9E9E9
      ByteBackgroundColorAlt=   "&cE9E9E900"
      ByteColor       =   "&c0000FF00"
      BytesLittleEndian=   True
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      GutterColor     =   "&cE9E9E900"
      GutterColorAlt  =   "&cE9E9E900"
      Height          =   457
      HelpTag         =   ""
      Hilight         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LineNumbersColor=   "&c80000000"
      LineNumbersLittleEndian=   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      ShowOffsets     =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextBackGroundColor=   "&cE9E9E900"
      TextBackGroundColorAlt=   "&cE9E9E900"
      TextFont        =   "System"
      TextSize        =   ""
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   594
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  If HexViewer1.LineCount > 0 Then
		    ScrollBar1.Maximum = HexViewer1.LineCount - (HexViewer1.VisibleLineCount \ 2)
		  Else
		    ScrollBar1.Maximum = 100
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ViewRaw(Message As BinaryStream, Type As HTTP.ContentType, ContentLen As Integer)
		  // Part of the Viewer interface.
		  HexViewer1.ShowData(Message, ContentLen)
		  mContentLength = ContentLen
		  mType = Type
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewRaw(Message As MemoryBlock, Type As HTTP.ContentType, ContentLen As Integer)
		  // Part of the Viewer interface.
		  Dim bs As New BinaryStream(Message)
		  Me.ViewRaw(bs, Type, ContentLen)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mContentLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mType As ContentType
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
#tag EndEvents
