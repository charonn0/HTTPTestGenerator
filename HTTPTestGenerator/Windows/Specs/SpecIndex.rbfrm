#tag Window
Begin Window SpecIndex
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   3.56e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   True
   Title           =   "Specification Index"
   Visible         =   True
   Width           =   6.44e+2
   Begin Splitter Splitter1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   356
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   159
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   8
   End
   Begin SpecViewer SpecViewer1
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &hFFFFFF
      Backdrop        =   ""
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   350
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   172
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   5
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   466
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Untitled"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   -53
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -61
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   355
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   4
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "Index\rSearch"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   150
      Begin Listbox HelpIndex
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   True
         ColumnCount     =   1
         ColumnsResizable=   ""
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   ""
         EnableDragReorder=   ""
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   ""
         HeadingIndex    =   -1
         Height          =   316
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   ""
         Italic          =   ""
         Left            =   12
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
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   30
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   134
         _ScrollWidth    =   -1
      End
      Begin TextField SearchField
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   12
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   32
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   134
      End
      Begin Listbox SearchList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   True
         ColumnCount     =   1
         ColumnsResizable=   ""
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   ""
         EnableDragReorder=   ""
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   ""
         HeadingIndex    =   -1
         Height          =   290
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   ""
         Italic          =   ""
         Left            =   12
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
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   58
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   134
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
		  Call Specifications.HeaderDescription("")
		  Call Specifications.MethodDescription("")
		  'Call Specifications.RelationDescription("")
		  Call Specifications.StatusCodeDescription(0)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ExpandRow(Index As Integer)
		  HelpIndex.DeleteAllRows
		  HelpIndex.AddFolder("Headers")
		  HelpIndex.AddFolder("Status Codes")
		  HelpIndex.AddFolder("Request Methods")
		  If index > -1 Then
		    HelpIndex.Expanded(index) = True
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowItem(SearchFor As String = "")
		  Me.Show
		  Dim exp As Integer = SpecViewer1.ShowItem(SearchFor)
		  If exp > -1 Then
		    Me.ExpandRow(exp)
		  ElseIf exp > -1 Then
		    Call MsgBox("No specification found for: " + SearchFor, 48, "Index entry not found")
		  End If
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Splitter1
	#tag Event
		Sub Moved(DeltaX As Integer, DeltaY As Integer)
		  #pragma Unused DeltaX
		  #pragma Unused DeltaY
		  SpecViewer1.Left = Me.Left + Me.Width + 1
		  SpecViewer1.Width = Self.Width - SpecViewer1.Left
		  TabPanel1.Width = Me.Left
		  Me.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HelpIndex
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim h() As JSONItem
		  Dim n() As String
		  
		  Select Case True
		  Case Me.Cell(row, 0) = "Headers"
		    For i As Integer = 0 To Specifications.Headers.Count - 1
		      Dim j As JSONItem = Specifications.Headers.Value(i)
		      h.Append(j)
		      n.Append(j.Value("header"))
		    Next
		    n.SortWith(h)
		    For i As Integer = UBound(h) DownTo 0
		      Dim j As JSONItem = h(i)
		      Me.InsertRow(row + 1, j.Value("header"), 1)
		      Me.RowTag(Me.LastIndex) = j
		      If SpecViewer1.CurrentItem <> Nil And SpecViewer1.CurrentItem.Lookup("header", "") = j.Value("header") Then
		        Me.ListIndex = Me.LastIndex
		      End If
		    Next
		    
		  Case Me.Cell(row, 0) = "Status Codes"
		    For i As Integer = 0 To Specifications.StatusCodes.Count - 1
		      Dim j As JSONItem = Specifications.StatusCodes.Value(i)
		      h.Append(j)
		      Dim s As String = j.Value("code")
		      Select Case s
		      Case "1xx"
		        n.Append("099")
		      Case "2xx"
		        n.Append("199")
		      Case "3xx"
		        n.Append("299")
		      Case "4xx"
		        n.Append("399")
		      Case "5xx"
		        n.Append("499")
		      Else
		        n.Append(j.Value("code"))
		      End Select
		    Next
		    n.SortWith(h)
		    For i As Integer = UBound(h) DownTo 0
		      Dim j As JSONItem = h(i)
		      HelpIndex.InsertRow(row + 1, j.Value("code") + " " + j.Value("phrase"), 1)
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j
		      If SpecViewer1.CurrentItem <> Nil And SpecViewer1.CurrentItem.Lookup("code", -1) = j.Value("code") Then
		        HelpIndex.ListIndex = HelpIndex.LastIndex
		      End If
		    Next
		    
		  Case Me.Cell(row, 0) = "Request Methods"
		    For i As Integer = 0 To Specifications.Methods.Count - 1
		      Dim j As JSONItem = Specifications.Methods.Value(i)
		      h.Append(j)
		      n.Append(j.Value("method"))
		    Next
		    n.SortWith(h)
		    For i As Integer = UBound(h) DownTo 0
		      Dim j As JSONItem = h(i)
		      HelpIndex.InsertRow(row + 1, j.Value("method"), 1)
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j
		      If SpecViewer1.CurrentItem <> Nil And SpecViewer1.CurrentItem.Lookup("method", "") = j.Value("method") Then
		        HelpIndex.ListIndex = HelpIndex.LastIndex
		      End If
		    Next
		    
		  Case Me.Cell(row, 0) = "IRI Relations"
		    For i As Integer = 0 To Specifications.Relations.Count - 1
		      Dim j As JSONItem = Specifications.Relations.Value(i)
		      h.Append(j)
		      n.Append(j.Value("relation"))
		    Next
		    n.SortWith(h)
		    For i As Integer = UBound(h) DownTo 0
		      Dim j As JSONItem = h(i)
		      HelpIndex.InsertRow(row + 1, j.Value("relation"), 1)
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j
		      If SpecViewer1.CurrentItem <> Nil And SpecViewer1.CurrentItem.Lookup("relation", "") = j.Value("relation") Then
		        HelpIndex.ListIndex = HelpIndex.LastIndex
		      End If
		    Next
		  End Select
		  
		  Me.ListIndex = Me.ListIndex
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  If Me.ListIndex > -1 Then Me.Expanded(Me.ListIndex) = Not Me.Expanded(Me.ListIndex)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Me.ListIndex < 0 Then Return
		  Dim tag As Variant = Me.RowTag(Me.ListIndex)
		  Select Case True
		  Case Me.ListIndex < 0
		    Return
		  Case tag <> Nil And VarType(tag) = Variant.TypeString
		    Dim s As String = Me.RowTag(Me.ListIndex)
		    Call SpecViewer1.ShowItem(s)
		  Case tag IsA JSONItem
		    Dim j As JSONItem = tag
		    Call SpecViewer1.ShowItem(j)
		  Else
		    'Break
		  End Select
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
