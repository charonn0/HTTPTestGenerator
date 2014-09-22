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
      Height          =   356
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
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   156
      _ScrollWidth    =   -1
   End
   Begin Thread PopulateThread
      Height          =   32
      Index           =   -2147483648
      Left            =   579
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   -20
      Width           =   32
   End
   Begin Timer PopulateTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   579
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   22
      Width           =   32
   End
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
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   8
   End
   Begin SpecViewer SpecViewer1
      AcceptFocus     =   ""
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
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   5
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   466
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Shared Function HeaderDescription(HeaderName As String) As JSONItem
		  If Headers = Nil Then Headers = New JSONItem(HeaderDescriptions)
		  For i As Integer = 0 To Headers.Count - 1
		    Dim item As JSONItem = Headers.Value(i)
		    If item <> Nil And item.Lookup("header", "") = HeaderName Then
		      Return item
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function MethodDescription(MethodName As String) As JSONItem
		  If Methods = Nil Then Methods = New JSONItem(MethodDescriptions)
		  For i As Integer = 0 To Methods.Count - 1
		    Dim item As JSONItem = Methods.Value(i)
		    If item <> Nil And item.Lookup("method", "") = MethodName Then
		      Return item
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function RelationDescription(RelationName As String) As JSONItem
		  If Relations = Nil Then Relations = New JSONItem(RelationDescriptions)
		  For i As Integer = 0 To Relations.Count - 1
		    Dim item As JSONItem = Relations.Value(i)
		    If item <> Nil And item.Lookup("relation", "") = RelationName Then
		      Return item
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetItem(Item As JSONItem)
		  CurrentItem = Item
		  Select Case True
		  Case CurrentItem = Nil
		    SpecViewer1.TypeLabel.Text = "Unknown Item:"
		    SpecViewer1.ItemName.Text = "No Value"
		    Return
		  Case CurrentItem.HasName("method")
		    SpecViewer1.TypeLabel.Text = "Request Method:"
		    Dim s As String = CurrentItem.Value("method")
		    If CurrentItem.Value("safe").BooleanValue Then
		      s = s + " (safe; "
		    Else
		      s = s + " (unsafe; "
		    End If
		    
		    If CurrentItem.Value("idempotent").BooleanValue Then
		      s = s + "idempotent; "
		    Else
		      s = s + "not idempotent; "
		    End If
		    
		    If CurrentItem.Value("cacheable").BooleanValue Then
		      s = s + "cacheable) "
		    Else
		      s = s + "not cacheable)"
		    End If
		    
		    SpecViewer1.ItemName.Text = s
		  Case CurrentItem.HasName("header")
		    SpecViewer1.TypeLabel.Text = "Header Name:"
		    SpecViewer1.ItemName.Text = CurrentItem.Value("header")
		  Case CurrentItem.HasName("code")
		    SpecViewer1.TypeLabel.Text = "Status Code:"
		    SpecViewer1.ItemName.Text = CurrentItem.Value("code") + " " + CurrentItem.Value("phrase")
		  Case CurrentItem.HasName("relation")
		    SpecViewer1.TypeLabel.Text = "IRI Relation:"
		    SpecViewer1.ItemName.Text = CurrentItem.Value("relation")
		  End Select
		  SpecViewer1.DescText.Text = ReplaceAll(CurrentItem.Value("description"), """", "")
		  If SpecViewer1.DescText.Text = "" Then SpecViewer1.DescText.Text = "No description available."
		  SpecViewer1.SpecLink.Text = CurrentItem.Value("spec_title")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowHeader(HeaderName As String)
		  Me.Show
		  HelpIndex.DeleteAllRows
		  HelpIndex.AddFolder("Headers")
		  HelpIndex.AddFolder("Status Codes")
		  HelpIndex.AddFolder("Request Methods")
		  HelpIndex.AddFolder("IRI Relations")
		  HelpIndex.Expanded(0) = True
		  SetItem(HeaderDescription(HeaderName))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowMethod(MethodName As String)
		  Me.Show
		  HelpIndex.DeleteAllRows
		  HelpIndex.AddFolder("Headers")
		  HelpIndex.AddFolder("Status Codes")
		  HelpIndex.AddFolder("Request Methods")
		  HelpIndex.AddFolder("IRI Relations")
		  HelpIndex.Expanded(2) = True
		  SetItem(MethodDescription(MethodName))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowRelation(RelationName As String)
		  Me.Show
		  HelpIndex.DeleteAllRows
		  HelpIndex.AddFolder("Headers")
		  HelpIndex.AddFolder("Status Codes")
		  HelpIndex.AddFolder("Request Methods")
		  HelpIndex.AddFolder("IRI Relations")
		  HelpIndex.Expanded(3) = True
		  SetItem(RelationDescription(RelationName))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowStatusCode(StatusCode As Integer)
		  Me.Show
		  HelpIndex.DeleteAllRows
		  HelpIndex.AddFolder("Headers")
		  HelpIndex.AddFolder("Status Codes")
		  HelpIndex.AddFolder("Request Methods")
		  HelpIndex.AddFolder("IRI Relations")
		  HelpIndex.Expanded(1) = True
		  SetItem(StatusCodeDescription(StatusCode))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function StatusCodeDescription(StatusCode As Integer) As JSONItem
		  If StatusCodes = Nil Then StatusCodes = New JSONItem(StatusCodeDescriptions)
		  For i As Integer = 0 To StatusCodes.Count - 1
		    Dim item As JSONItem = StatusCodes.Value(i)
		    If item <> Nil And item.Lookup("code", 0) = StatusCode Then
		      Return item
		    End If
		  Next
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private CurrentItem As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Headers As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Methods As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PopulateLock As Semaphore
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Relations As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared StatusCodes As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ThreadToken As Pair
	#tag EndProperty


#tag EndWindowCode

#tag Events HelpIndex
	#tag Event
		Sub ExpandRow(row As Integer)
		  Select Case True
		  Case Me.Cell(row, 0) = "Headers"
		    ThreadToken = 1:row
		    If Headers = Nil Then
		      PopulateThread.Run
		    Else
		      PopulateTimer.Mode = Timer.ModeSingle
		    End If
		    
		  Case Me.Cell(row, 0) = "Status Codes"
		    ThreadToken = 4:row
		    If StatusCodes = Nil Then
		      PopulateThread.Run
		    Else
		      PopulateTimer.Mode = Timer.ModeSingle
		    End If
		    
		  Case Me.Cell(row, 0) = "Request Methods"
		    ThreadToken = 2:row
		    If Methods = Nil Then
		      PopulateThread.Run
		    Else
		      PopulateTimer.Mode = Timer.ModeSingle
		    End If
		    
		  Case Me.Cell(row, 0) = "IRI Relations"
		    ThreadToken = 3:row
		    If Relations = Nil Then
		      PopulateThread.Run
		    Else
		      PopulateTimer.Mode = Timer.ModeSingle
		    End If
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  Select Case True
		  Case Me.ListIndex < 0
		    Return
		  Case Me.RowTag(Me.ListIndex) <> Nil And Me.RowTag(Me.ListIndex) IsA JSONItem
		    SetItem(Me.RowTag(Me.ListIndex))
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopulateThread
	#tag Event
		Sub Run()
		  Select Case ThreadToken.Left
		  Case 1 ' Headers
		    Call HeaderDescription("")
		    
		  Case 2 ' Methods
		    Call MethodDescription("")
		    
		  Case 3 ' Relations
		    Call RelationDescription("")
		    
		  Case 4 ' Codes
		    Call StatusCodeDescription(0)
		    
		  End Select
		  PopulateTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopulateTimer
	#tag Event
		Sub Action()
		  Select Case ThreadToken.Left
		  Case 1 ' Headers
		    Dim h() As JSONItem
		    Dim n() As String
		    For i As Integer = 0 To Headers.Count - 1
		      Dim j As JSONItem = Headers.Value(i)
		      h.Append(j)
		      n.Append(j.Value("header"))
		    Next
		    n.SortWith(h)
		    For i As Integer = UBound(h) DownTo 0
		      Dim j As JSONItem = h(i)
		      HelpIndex.InsertRow(ThreadToken.Right + 1, j.Value("header"), 1)
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j
		      If CurrentItem <> Nil And CurrentItem.Lookup("header", "") = j.Value("header") Then
		        HelpIndex.ListIndex = HelpIndex.LastIndex
		      End If
		    Next
		    
		  Case 2 ' Methods
		    Dim h() As JSONItem
		    Dim n() As String
		    For i As Integer = 0 To Methods.Count - 1
		      Dim j As JSONItem = Methods.Value(i)
		      h.Append(j)
		      n.Append(j.Value("method"))
		    Next
		    n.SortWith(h)
		    For i As Integer = UBound(h) DownTo 0
		      Dim j As JSONItem = h(i)
		      HelpIndex.InsertRow(ThreadToken.Right + 1, j.Value("method"), 1)
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j
		      If CurrentItem <> Nil And CurrentItem.Lookup("method", "") = j.Value("method") Then
		        HelpIndex.ListIndex = HelpIndex.LastIndex
		      End If
		    Next
		    
		  Case 3 ' Relations
		    Dim h() As JSONItem
		    Dim n() As String
		    For i As Integer = 0 To Relations.Count - 1
		      Dim j As JSONItem = Relations.Value(i)
		      h.Append(j)
		      n.Append(j.Value("relation"))
		    Next
		    n.SortWith(h)
		    For i As Integer = UBound(h) DownTo 0
		      Dim j As JSONItem = h(i)
		      HelpIndex.InsertRow(ThreadToken.Right + 1, j.Value("relation"), 1)
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j
		      If CurrentItem <> Nil And CurrentItem.Lookup("relation", "") = j.Value("relation") Then
		        HelpIndex.ListIndex = HelpIndex.LastIndex
		      End If
		    Next
		    
		  Case 4 ' Codes
		    Dim h() As JSONItem
		    Dim n() As String
		    For i As Integer = 0 To StatusCodes.Count - 1
		      Dim j As JSONItem = StatusCodes.Value(i)
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
		      HelpIndex.InsertRow(ThreadToken.Right + 1, j.Value("code") + " " + j.Value("phrase"), 1)
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j
		      If CurrentItem <> Nil And CurrentItem.Lookup("code", -1) = j.Value("code") Then
		        HelpIndex.ListIndex = HelpIndex.LastIndex
		      End If
		    Next
		    
		  End Select
		  HelpIndex.ListIndex = HelpIndex.ListIndex
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Splitter1
	#tag Event
		Sub Moved(DeltaX As Integer, DeltaY As Integer)
		  #pragma Unused DeltaX
		  #pragma Unused DeltaY
		  SpecViewer1.Left = Me.Left + Me.Width + 1
		  SpecViewer1.Width = Self.Width - SpecViewer1.Left
		  HelpIndex.Width = Me.Left
		  Me.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SpecViewer1
	#tag Event
		Sub ViewSpec()
		  If CurrentItem <> Nil Then
		    ShowURL(CurrentItem.Value("spec_href"))
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function GetSpec() As String
		  If CurrentItem <> Nil Then
		    Return CurrentItem.Value("spec_title")
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
