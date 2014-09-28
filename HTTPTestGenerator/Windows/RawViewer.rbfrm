#tag Window
Begin Window RawViewer
   BackColor       =   16777215
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   True
   Title           =   "Message body"
   Visible         =   True
   Width           =   600
   Begin PagePanel PagePanel1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   4
      Panels          =   ""
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   1
      Visible         =   True
      Width           =   600
      Begin TextArea PlainText
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &h00FFFFFF
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   385
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   6
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   6
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   588
      End
      Begin HexViewer HexViewer1
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         Backdrop        =   ""
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
         Height          =   386
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   8
         LineNumbersColor=   "&c80000000"
         LineNumbersLittleEndian=   ""
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         ScrollBackground=   ""
         ShowOffsets     =   False
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextBackGroundColor=   "&cFFFFFF00"
         TextBackGroundColorAlt=   "&cC0C0C000"
         TextFont        =   "System"
         Top             =   8
         UseFocusRing    =   True
         Visible         =   True
         Width           =   565
      End
      Begin ScrollBar ScrollBar1
         AcceptFocus     =   true
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   386
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   578
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
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   8
         Value           =   0
         Visible         =   True
         Width           =   16
      End
      Begin Canvas ImageView
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   ""
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   386
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   8
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   8
         UseFocusRing    =   True
         Visible         =   True
         Width           =   584
      End
      Begin Listbox Listbox1
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   True
         ColumnCount     =   2
         ColumnsResizable=   ""
         ColumnWidths    =   "75%"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   ""
         EnableDragReorder=   ""
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   182
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         InitialValue    =   "URL	Reference Count"
         Italic          =   ""
         Left            =   15
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   58
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   570
         _ScrollWidth    =   -1
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.Left = Generator.Left + (Generator.Width - Me.Width) / 2
		  Me.Top = Generator.Top + (Generator.Height - Me.Height) / 2
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  ScrollBar1.Maximum = HexViewer1.LineCount - (HexViewer1.VisibleLineCount \ 2)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub ShowData()
		  Self.Title = "Message body - " + MIMEType.ToString
		  Select Case True
		  Case MIMEType.Accepts("image/*")
		    Image = Picture.FromData(RawData)
		    ImageView.Invalidate
		    PagePanel1.Value = 2
		    
		  Case MIMEType.Accepts("text/html")
		    PlainText.Text = RawData
		    PagePanel1.Value = 0
		    
		  Case MIMEType.Accepts("text/*"), MIMEType.Accepts("message/http")
		    PlainText.Text = RawData
		    PagePanel1.Value = 0
		    
		  Case MIMEType.Accepts("application/octet-stream")
		    Dim bs As New BinaryStream(RawData)
		    HexViewer1.ShowData(bs)
		    PagePanel1.Value = 1
		    
		  Else
		    Dim bs As New BinaryStream(RawData)
		    HexViewer1.ShowData(bs)
		    PagePanel1.Value = 1
		    
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowLinks(l() As String)
		  Listbox1.DeleteAllRows
		  Dim links As New Dictionary
		  For i As Integer = 0 To UBound(l)
		    Dim x As Integer = Links.Lookup(l(i), 0)
		    If x = 0 Then
		      Listbox1.AddRow(l(i), "1", "0")
		    Else
		      For j As Integer = 0 To Listbox1.ListCount - 1
		        If Listbox1.Cell(j, 0) = l(i) Then
		          Listbox1.Cell(j, 1) = Format(x, "###,##0")
		        End If
		      Next
		    End If
		    x = x + 1
		    Links.Value(l(i)) = x
		  Next
		  Me.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewRaw(Message As String, Type As ContentType)
		  RawData = Message
		  MIMEType = Type
		  Me.ShowData
		  Me.ShowModal
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Image As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MIMEType As ContentType
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RawData As MemoryBlock
	#tag EndProperty


#tag EndWindowCode

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
#tag Events ScrollBar1
	#tag Event
		Sub ValueChanged()
		  HexViewer1.Offset = Me.Value * HexViewer1.BytesPerLine
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ImageView
	#tag Event
		Sub Paint(g As Graphics)
		  If Image <> Nil Then
		    g.DrawPicture(Image, 0, 0)
		  Else
		    Dim s As String = "Unknown image format."
		    g.ForeColor = &cC0C0C000
		    g.FillRect(0, 0, g.Width, g.Height)
		    g.ForeColor = &c00000000
		    g.TextSize = 15
		    Dim w, h As Integer
		    w = g.StringWidth(s)
		    h = g.StringHeight(s, w)
		    w = (g.Width - w) / 2
		    h = (g.Height - h) / 2
		    g.DrawString(s, w, h)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Listbox1
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused row
		  #pragma Unused column
		  #pragma Unused x
		  #pragma Unused y
		  If row < Me.ListCount And column = 0 Then
		    g.ForeColor = &c0000FF00
		    g.Underline = True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  If row < Me.ListCount  And column = 0 Then
		    Generator.RequestMain1.Sender.Enabled = False
		    Generator.RequestMain1.Sender.Caption = "Sending..."
		    Generator.RequestMain1.ProgressBar1.Visible = True
		    Generator.RequestMain1.StopButton.Visible = True
		    'RequestMain1.Refresh
		    Generator.RequestMain1.URL.Text = Me.Cell(row, 0)
		    Generator.Perform()
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  If column = 1 Then
		    Dim l, r As Integer
		    l = Val(Me.Cell(row1, 1))
		    r = Val(Me.Cell(row2, 1))
		    If l = r Then result = 0
		    If l > r Then result = 1
		    If l < r Then result = -1
		    Return True
		  End If
		  
		End Function
	#tag EndEvent
#tag EndEvents
