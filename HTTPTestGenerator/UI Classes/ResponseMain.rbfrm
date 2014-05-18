#tag Window
Begin ContainerControl ResponseMain
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   16777215
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   470
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   561
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   470
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "HTTP\rRaw"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   561
      Begin Listbox ResponseHeaders
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   2
         ColumnsResizable=   True
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   124
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Header Name	Header Value"
         Italic          =   False
         Left            =   11
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   52
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   534
         _ScrollWidth    =   -1
      End
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
         Height          =   118
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   11
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
         Top             =   340
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   534
      End
      Begin HexViewer HexViewer1
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         Backdrop        =   ""
         Bold            =   ""
         ByteBackgroundColor=   "&cFFFFFF00"
         ByteBackgroundColorAlt=   "&cC0C0C000"
         ByteColor       =   "&c0000FF00"
         BytesLittleEndian=   True
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   False
         GutterColor     =   "&cFFFFFF00"
         GutterColorAlt  =   "&cC0C0C000"
         Height          =   433
         HelpTag         =   ""
         Hilight         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   6
         LineNumbersColor=   "&c80000000"
         LineNumbersLittleEndian=   False
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         ShowOffsets     =   True
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextBackGroundColor=   "&cFFFFFF00"
         TextBackGroundColorAlt=   "&cC0C0C000"
         TextFont        =   "System"
         TextSize        =   ""
         Top             =   30
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   533
      End
      Begin ScrollBar ScrollBar1
         AcceptFocus     =   true
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   433
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   539
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
         Top             =   30
         Value           =   0
         Visible         =   True
         Width           =   16
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   17
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   1
         Text            =   "Response Headers"
         TextAlign       =   1
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   29
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   521
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   11
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   1
         Text            =   "Status:"
         TextAlign       =   2
         TextColor       =   "&c00000000"
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   315
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   54
      End
      Begin Label Code
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   72
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   8
         TabPanelIndex   =   1
         Text            =   "000 No Error Code"
         TextAlign       =   0
         TextColor       =   "&cFF000000"
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   315
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   221
      End
      Begin PlacardButton ResponseHeaderView
         AcceptFocus     =   False
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   ""
         Bold            =   False
         DoubleBuffer    =   False
         Enabled         =   False
         EraseBackground =   True
         Height          =   25
         HelpTag         =   "Expanded Header View"
         Hilight         =   ""
         Icon            =   1571842047
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   520
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         Sticky          =   ""
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         TextColor       =   "&c00000000"
         textColorDown   =   "&c000000"
         TextFont        =   "System"
         TextSize        =   0
         Top             =   311
         Underline       =   False
         UseFocusRing    =   True
         Value           =   False
         Visible         =   True
         Width           =   25
      End
      Begin Listbox CookieList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   6
         ColumnsResizable=   True
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   117
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Cookie	Value	Expires	Domain	Path	Restrictions"
         Italic          =   False
         Left            =   11
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   11
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   182
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   534
         _ScrollWidth    =   -1
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Hook, Flags = &h0
		Event GetMessageData() As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetRequest() As HTTP.Request
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetResponse() As HTTP.Response
	#tag EndHook


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  return RaiseEvent GetMessageData
			End Get
		#tag EndGetter
		Protected MessageBodyRaw As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  return RaiseEvent GetRequest
			End Get
		#tag EndGetter
		Protected Request As HTTP.Request
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  return RaiseEvent GetResponse
			End Get
		#tag EndGetter
		Protected Response As HTTP.Response
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events TabPanel1
	#tag Event
		Sub Change()
		  HexViewer1.Enabled = (Me.Value = 1)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResponseHeaders
	#tag Event
		Sub Change()
		  ' try to pick a fixed-width font
		  For i As Integer = FontCount - 1 DownTo 0
		    Dim fontname As String = Font(i)
		    If Left(fontname, 1) <> "@" Then
		      If fontname = "Courier" Or fontname = "Consolas" Then
		        Me.TextFont = fontname
		        Exit For
		      End If
		      If InStr(fontname, " mono") > 0 Or InStr(fontname, " fixed") > 0 Then
		        Me.TextFont = fontname
		      End If
		    End If
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OutputLog
	#tag Event
		Sub Open()
		  ' try to pick a fixed-width font
		  For i As Integer = FontCount - 1 DownTo 0
		    Dim fontname As String = Font(i)
		    If Left(fontname, 1) <> "@" Then
		      If fontname = "Courier" Or fontname = "Consolas" Then
		        Me.TextFont = fontname
		        Exit For
		      End If
		      If InStr(fontname, " mono") > 0 Or InStr(fontname, " fixed") > 0 Then
		        Me.TextFont = fontname
		      End If
		    End If
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HexViewer1
	#tag Event
		Sub Open()
		  ' try to pick a fixed-width font
		  For i As Integer = FontCount - 1 DownTo 0
		    Dim fontname As String = Font(i)
		    If Left(fontname, 1) <> "@" Then
		      If fontname = "Courier" Or fontname = "Consolas" Then
		        Me.TextFont = fontname
		        Exit For
		      End If
		      If InStr(fontname, " mono") > 0 Or InStr(fontname, " fixed") > 0 Then
		        Me.TextFont = fontname
		      End If
		    End If
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Function Scrolled(LinesDelta As Integer, BytesDelta As Integer) As Boolean
		  #pragma Unused BytesDelta
		  ScrollBar1.Value = ScrollBar1.Value + LinesDelta
		  ScrollBar1.Maximum = Me.LineCount
		  Return True ' Since we're updating the offset in ScrollBar1.ValueChanged, we return true to prevent the HexViewer from updating it too.
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
#tag Events Code
	#tag Event
		Sub Open()
		  Me.Text = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResponseHeaderView
	#tag Event
		Sub ValueChanged()
		  HeaderViewer.ShowHeaders(Response.Headers)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CookieList
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim m As New MenuItem("Copy to request headers")
		  m.Tag = Me.RowTag(Me.RowFromXY(X, Y))
		  Base.Append(m)
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem.Text = "Copy to request headers" Then
		    Dim c As Cookie = hitItem.Tag
		    Generator.RequestMain1.RequestHeaders.AddRow("Cookie", c.Name + "=" + c.Value, "")
		    Generator.RequestMain1.RequestHeaders.RowTag(Generator.RequestMain1.RequestHeaders.LastIndex) = c
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Dim c As Cookie = Me.RowTag(Me.ListIndex)
		  CookieEdit.ShowCookie(c)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  ' try to pick a fixed-width font
		  For i As Integer = FontCount - 1 DownTo 0
		    Dim fontname As String = Font(i)
		    If Left(fontname, 1) <> "@" Then
		      If fontname = "Courier" Or fontname = "Consolas" Then
		        Me.TextFont = fontname
		        Exit For
		      End If
		      If InStr(fontname, " mono") > 0 Or InStr(fontname, " fixed") > 0 Then
		        Me.TextFont = fontname
		      End If
		    End If
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
