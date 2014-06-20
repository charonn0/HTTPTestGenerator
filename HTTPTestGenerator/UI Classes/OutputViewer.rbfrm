#tag Window
Begin ContainerControl OutputViewer
   AcceptFocus     =   True
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   203
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
   Width           =   584
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   197
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   2
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   True
      TabDefinition   =   "HTTP\rResponse\rBinary\rHyperlinks"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   3
      Underline       =   ""
      Value           =   3
      Visible         =   True
      Width           =   582
      Begin TextArea OutputLog
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &h00EFEFEF
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   160
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   7
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
         Top             =   31
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   570
      End
      Begin TextArea TextArea1
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   158
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   9
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
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   33
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   566
      End
      Begin ScrollBar ScrollBar1
         AcceptFocus     =   true
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   160
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   559
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
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   32
         Value           =   0
         Visible         =   True
         Width           =   16
      End
      Begin HexViewer HexViewer1
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         Backdrop        =   ""
         Border          =   True
         BorderColor     =   &h00808080
         ByteBackgroundColor=   "&cFFFFFF00"
         ByteBackgroundColorAlt=   "&cDADADA00"
         ByteColor       =   "&c0000FF00"
         BytesLittleEndian=   True
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   False
         GutterColor     =   "&cFFFFFF00"
         GutterColorAlt  =   "&cDADADA00"
         Height          =   160
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   7
         LineNumbersColor=   "&c80000000"
         LineNumbersLittleEndian=   False
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         ScrollBackground=   True
         ShowOffsets     =   False
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextBackGroundColor=   "&cFFFFFF00"
         TextBackGroundColorAlt=   &h00DADADA
         TextFont        =   "System"
         Top             =   32
         UseFocusRing    =   True
         Visible         =   True
         Width           =   549
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
         Height          =   160
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "URL	Reference Count"
         Italic          =   ""
         Left            =   7
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
         Top             =   32
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


#tag EndWindowCode

#tag Events TabPanel1
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OutputLog
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  base.Append(New MenuItem("Clear log"))
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Clear log"
		    Me.Text = ""
		    Return True
		  End Select
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events TextArea1
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If key = Chr(&h09) And Keyboard.AsyncControlKey Then 'ctrl+tab
		    If Keyboard.AsyncShiftKey Then
		      If Tabpanel1.Value = 0 Then
		        Tabpanel1.Value = Tabpanel1.PanelCount - 1
		      Else
		        Tabpanel1.Value = Tabpanel1.Value - 1
		      End If
		    Else
		      If Tabpanel1.Value = Tabpanel1.PanelCount - 1 Then
		        Tabpanel1.Value = 0
		      Else
		        Tabpanel1.Value = Tabpanel1.Value + 1
		      End If
		    End If
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
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
		  ScrollBar1.Value = ScrollBar1.Value + LinesDelta
		  ScrollBar1.Maximum = Me.LineCount
		  Return True ' Since we're updating the offset in ScrollBar1.ValueChanged, we return true to prevent the HexViewer from updating it too.
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Listbox1
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  If row < Me.ListCount - 1 And column = 0 Then
		    g.ForeColor = &c0000FF00
		    g.Underline = True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
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
