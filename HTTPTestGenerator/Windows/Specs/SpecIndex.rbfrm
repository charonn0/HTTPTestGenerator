#tag Window
Begin Window SpecIndex
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   3.21e+2
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
   Width           =   6.25e+2
   Begin Splitter Splitter1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   321
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   179
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
      Height          =   320
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   175
      _ScrollWidth    =   -1
   End
   Begin Timer HistoryTimer
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   218
      LockedInPosition=   False
      Mode            =   2
      Period          =   150
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   350
      Width           =   32
   End
   Begin Rectangle Rectangle1
      AutoDeactivate  =   True
      BorderWidth     =   1
      BottomRightColor=   &h000000
      Enabled         =   True
      FillColor       =   "&cFFFFFFFF"
      Height          =   321
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   191
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      Top             =   0
      TopLeftColor    =   &h000000
      Visible         =   True
      Width           =   434
      Begin TextField ItemName
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
         InitialParent   =   "Rectangle1"
         Italic          =   ""
         Left            =   304
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   7
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   310
      End
      Begin Label SpecLink
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   ""
         Left            =   304
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         Text            =   "No Selection"
         TextAlign       =   0
         TextColor       =   &h000000FF
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   34
         Transparent     =   False
         Underline       =   True
         Visible         =   True
         Width           =   310
      End
      Begin HREFArea DescText
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
         Height          =   245
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   ""
         Left            =   304
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
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   66
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   310
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   ""
         Left            =   199
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         Text            =   "Abstract:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   64
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   100
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
         InitialParent   =   "Rectangle1"
         Italic          =   ""
         Left            =   199
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         Text            =   "Specification:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   34
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   100
      End
      Begin Label TypeLabel
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   ""
         Left            =   199
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   0
         Text            =   "No Selection:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   8
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   100
      End
      Begin PushButton PrevItem
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "<-"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   "View previous item"
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   ""
         Left            =   218
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   False
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   279
         Underline       =   ""
         Visible         =   False
         Width           =   21
      End
      Begin PushButton NextItem
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "->"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   "View next item"
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   ""
         Left            =   240
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   False
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   279
         Underline       =   ""
         Visible         =   False
         Width           =   21
      End
   End
   Begin Label LinkTarget
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   788
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      Text            =   "HTTP://WWW.GOOGLE.COM"
      TextAlign       =   2
      TextColor       =   &h00808080
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -78
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   342
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.Left = Window(1).Left + (Window(1).Width - Me.Width) / 2
		  Me.Top = Window(1).Top + (Window(1).Height - Me.Height) / 2
		  Call Specifications.HeaderDescription("")
		  Call Specifications.MethodDescription("")
		  'Call Specifications.RelationDescription("")
		  Call Specifications.StatusCodeDescription(0)
		  Call Specifications.GlossaryDefinition("")
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function CurrentItem() As JSONItem
		  If UBound(FwdHistory) > -1 Then Return FwdHistory(FwdHistory.Ubound)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DisplayItem(mItem As JSONItem)
		  DescText.Clear
		  Dim exp As Integer = -1
		  Select Case True
		  Case mItem = Nil
		    TypeLabel.Text = "No Selection:"
		    ItemName.Text = ""
		    SuppressChange = True
		    ExpandRow(exp)
		    SuppressChange = False
		    Return
		  Case mItem.HasName("method")
		    exp = 2
		    TypeLabel.Text = "Request Method:"
		    Dim s As String = mItem.Value("method")
		    If mItem.Value("safe").BooleanValue Then
		      s = s + " (safe; "
		    Else
		      s = s + " (unsafe; "
		    End If
		    
		    If mItem.Value("idempotent").BooleanValue Then
		      s = s + "idempotent; "
		    Else
		      s = s + "not idempotent; "
		    End If
		    
		    If mItem.Value("cacheable").BooleanValue Then
		      s = s + "cacheable) "
		    Else
		      s = s + "not cacheable)"
		    End If
		    ItemName.Text = s
		    
		  Case mItem.HasName("header")
		    exp = 0
		    TypeLabel.Text = "Header Name:"
		    ItemName.Text = mItem.Value("header")
		    
		  Case mItem.HasName("code")
		    exp = 1
		    TypeLabel.Text = "Status Code:"
		    ItemName.Text = mItem.Value("code") + " " + mItem.Value("phrase")
		    
		  Case mItem.HasName("word")
		    exp = 3
		    TypeLabel.Text = "Definition of:"
		    ItemName.Text = mItem.Value("word").StringValue.Titlecase
		    
		  Case mItem.HasName("relation")
		    TypeLabel.Text = "IRI Relation:"
		    ItemName.Text = mItem.Value("relation")
		    
		  End Select
		  Dim ds As String = mItem.Value("description")
		  If ds = "" Then ds = "No description available."
		  ProcessLinks(ds)
		  SpecLink.Text = mItem.Value("spec_title")
		  FwdHistory.Append(mItem)
		  SuppressChange = True
		  ExpandRow(exp)
		  SuppressChange = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ExpandRow(Index As Integer)
		  HelpIndex.DeleteAllRows
		  HelpIndex.AddFolder("Headers")
		  HelpIndex.AddFolder("Status Codes")
		  HelpIndex.AddFolder("Request Methods")
		  HelpIndex.AddFolder("Glossary")
		  If index > -1 Then
		    HelpIndex.Expanded(index) = True
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function HilightText(SearchString As String, StartPos As Integer = 1) As Integer
		  Dim i As Integer = InStr(StartPos, DescText.Text, SearchString)
		  If i > 0 Then
		    DescText.SelStart = i - 1
		    DescText.SelLength = SearchString.Len
		    Return i - 1 + SearchString.Len
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ProcessLinks(Text As String)
		  Dim lines() As String = Split(Text, "</link>")
		  Dim sr As New StyleRun
		  For i As Integer = 0 To UBound(lines)
		    Dim ln As String = lines(i)
		    Dim linktext, url As String
		    linktext = NthField(ln, ">", 2)
		    ln = Replace(ln, ">" + linktext, "")
		    url = NthField(ln, "<link=", 2)
		    Dim href As New StyleRun
		    sr.Text = NthField(ln, "<link=", 1)
		    href.Text = linktext
		    href.TextColor = &c0000FF00
		    href.Underline = True
		    DescText.PrintOther(sr)
		    DescText.PrintOther(href, url)
		  Next
		  sr.Text = CRLF
		  sr.Bold = Not sr.Bold
		  DescText.PrintOther(sr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SearchIndex(SearchFor As String) As JSONItem
		  Dim mItem As JSONItem
		  If Specifications.HasEntry(SearchFor) Then
		    Select Case True
		    Case Specifications.HeaderDescription(SearchFor) <> Nil
		      mItem = Specifications.HeaderDescription(SearchFor)
		    Case Specifications.MethodDescription(SearchFor) <> Nil
		      mItem = Specifications.MethodDescription(SearchFor)
		    Case Specifications.StatusCodeDescription(Val(SearchFor)) <> Nil
		      mItem = Specifications.StatusCodeDescription(Val(SearchFor))
		    Case Specifications.GlossaryDefinition(SearchFor) <> Nil
		      mItem = Specifications.GlossaryDefinition(SearchFor)
		    End Select
		  End If
		  Return mItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowItem(SearchFor As String = "")
		  If Not Me.Visible Then Me.Show
		  Dim js As JSONItem = SearchIndex(SearchFor)
		  If js = Nil And SearchFor <> "" Then
		    Call MsgBox("No specification found for: " + SearchFor, 48, "Index entry not found")
		  Else
		    DisplayItem(js)
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected FwdHistory() As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected History() As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentItem1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SuppressChange As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events Splitter1
	#tag Event
		Sub Moved(DeltaX As Integer, DeltaY As Integer)
		  #pragma Unused DeltaX
		  #pragma Unused DeltaY
		  Rectangle1.Left = Me.Left + Me.Width + 2
		  Rectangle1.Width = Self.Width - Rectangle1.Left
		  HelpIndex.Width = Me.Left - 2
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
		      Me.RowTag(Me.LastIndex) = j'.Value("header")
		      If Self.CurrentItem <> Nil And Self.CurrentItem.Lookup("header", "") = j.Value("header") Then
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
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j'.Value("code").StringValue
		      If Self.CurrentItem <> Nil And Self.CurrentItem.Lookup("code", -1) = j.Value("code") Then
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
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j'.Value("method")
		      If Self.CurrentItem <> Nil And Self.CurrentItem.Lookup("method", "") = j.Value("method") Then
		        HelpIndex.ListIndex = HelpIndex.LastIndex
		      End If
		    Next
		    
		  Case Me.Cell(row, 0) = "Glossary"
		    For i As Integer = 0 To Specifications.HTTPGlossary.Count - 1
		      Dim j As JSONItem = Specifications.HTTPGlossary.Value(i)
		      h.Append(j)
		      n.Append(j.Value("word"))
		    Next
		    n.SortWith(h)
		    For i As Integer = UBound(h) DownTo 0
		      Dim j As JSONItem = h(i)
		      HelpIndex.InsertRow(row + 1, j.Value("word").StringValue.Titlecase, 1)
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j'.Value("word")
		      If Self.CurrentItem <> Nil And Self.CurrentItem.Lookup("word", "") = j.Value("word") Then
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
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j'.Value("relation")
		      If Self.CurrentItem <> Nil And Self.CurrentItem.Lookup("relation", "") = j.Value("relation") Then
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
		  If SuppressChange Then
		    Return
		  End If
		  
		  Dim tag As Variant = Me.RowTag(Me.ListIndex)
		  Select Case True
		  Case Me.ListIndex < 0
		    Return
		  Case tag <> Nil And VarType(tag) = Variant.TypeString
		    Dim s As String = tag
		    ShowItem(s)
		  Case tag IsA JSONItem
		    Dim j As JSONItem = tag
		    DisplayItem(j)
		  Else
		    'Break
		  End Select
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HistoryTimer
	#tag Event
		Sub Action()
		  NextItem.Visible = (History.Ubound > -1)
		  PrevItem.Visible = (FwdHistory.Ubound > 0)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SpecLink
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Return Me.Text <> ""
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If CurrentItem <> Nil Then
		    ShowURL(CurrentItem.Value("spec_href"))
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DescText
	#tag Event
		Sub ClickLink(LinkValue As Variant, LinkText As String)
		  #pragma Unused LinkText
		  If Left(LinkValue, 3) = "rfc" Then ' spec URL
		    Dim u As HTTP.URI = "http://tools.ietf.org/html/" + LinkValue
		    ShowURL(u.ToString)
		  ElseIf Left(LinkValue, 4) = "http" Then ' web URL
		    ShowURL(LinkValue)
		  Else
		    SpecIndex.ShowItem(LinkValue)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PrevItem
	#tag Event
		Sub Action()
		  History.Append(FwdHistory.Pop)
		  DisplayItem(FwdHistory.Pop)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NextItem
	#tag Event
		Sub Action()
		  DisplayItem(History.Pop)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LinkTarget
	#tag Event
		Sub Open()
		  Me.Text = ""
		End Sub
	#tag EndEvent
#tag EndEvents
