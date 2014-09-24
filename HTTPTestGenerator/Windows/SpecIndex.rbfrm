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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.Left = Generator.Left + (Generator.Width - Me.Width) / 2
		  Me.Top = Generator.Top + (Generator.Height - Me.Height) / 2
		  Call HeaderDescription("")
		  Call MethodDescription("")
		  'Call RelationDescription("")
		  Call StatusCodeDescription(0)
		End Sub
	#tag EndEvent


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

	#tag Method, Flags = &h0
		Sub ShowHeader(HeaderName As String)
		  ShowMe()
		  CurrentItem = HeaderDescription(HeaderName)
		  If CurrentItem = Nil Then
		    Call MsgBox("No specification found for: " + HeaderName, 48, "Index entry not found")
		  Else
		    HelpIndex.Expanded(0) = True
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowMe()
		  Me.Show
		  If HelpIndex.ListCount < 1 Then
		    HelpIndex.DeleteAllRows
		    HelpIndex.AddFolder("Headers")
		    HelpIndex.AddFolder("Status Codes")
		    HelpIndex.AddFolder("Request Methods")
		    'HelpIndex.AddFolder("IRI Relations")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowMethod(MethodName As String)
		  ShowMe()
		  CurrentItem = MethodDescription(MethodName)
		  If CurrentItem = Nil Then
		    Call MsgBox("No specification found for: " + MethodName, 48, "Index entry not found")
		  Else
		    HelpIndex.Expanded(2) = True
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowRelation(RelationName As String)
		  ShowMe()
		  CurrentItem = RelationDescription(RelationName)
		  If CurrentItem = Nil Then
		    Call MsgBox("No specification found for: " + RelationName, 48, "Index entry not found")
		  Else
		    HelpIndex.Expanded(3) = True
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowStatusCode(StatusCode As Integer)
		  ShowMe()
		  CurrentItem = StatusCodeDescription(StatusCode)
		  If CurrentItem = Nil Then
		    Call MsgBox("No specification found for: " + Format(StatusCode, "000"), 48, "Index entry not found")
		  Else
		    HelpIndex.Expanded(1) = True
		  End If
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


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCurrentItem
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCurrentItem = value
			  SpecViewer1.CurrentItem = value
			End Set
		#tag EndSetter
		CurrentItem As JSONItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared Headers As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentItem As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Methods As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PopulateLock1 As Semaphore
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Relations As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared StatusCodes As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ThreadToken1 As Pair
	#tag EndProperty


#tag EndWindowCode

#tag Events HelpIndex
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim h() As JSONItem
		  Dim n() As String
		  
		  Select Case True
		  Case Me.Cell(row, 0) = "Headers"
		    For i As Integer = 0 To Headers.Count - 1
		      Dim j As JSONItem = Headers.Value(i)
		      h.Append(j)
		      n.Append(j.Value("header"))
		    Next
		    n.SortWith(h)
		    For i As Integer = UBound(h) DownTo 0
		      Dim j As JSONItem = h(i)
		      Me.InsertRow(row + 1, j.Value("header"), 1)
		      Me.RowTag(Me.LastIndex) = j
		      If CurrentItem <> Nil And CurrentItem.Lookup("header", "") = j.Value("header") Then
		        Me.ListIndex = Me.LastIndex
		      End If
		    Next
		    
		  Case Me.Cell(row, 0) = "Status Codes"
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
		      HelpIndex.InsertRow(row + 1, j.Value("code") + " " + j.Value("phrase"), 1)
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j
		      If CurrentItem <> Nil And CurrentItem.Lookup("code", -1) = j.Value("code") Then
		        HelpIndex.ListIndex = HelpIndex.LastIndex
		      End If
		    Next
		    
		  Case Me.Cell(row, 0) = "Request Methods"
		    For i As Integer = 0 To Methods.Count - 1
		      Dim j As JSONItem = Methods.Value(i)
		      h.Append(j)
		      n.Append(j.Value("method"))
		    Next
		    n.SortWith(h)
		    For i As Integer = UBound(h) DownTo 0
		      Dim j As JSONItem = h(i)
		      HelpIndex.InsertRow(row + 1, j.Value("method"), 1)
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j
		      If CurrentItem <> Nil And CurrentItem.Lookup("method", "") = j.Value("method") Then
		        HelpIndex.ListIndex = HelpIndex.LastIndex
		      End If
		    Next
		    
		  Case Me.Cell(row, 0) = "IRI Relations"
		    For i As Integer = 0 To Relations.Count - 1
		      Dim j As JSONItem = Relations.Value(i)
		      h.Append(j)
		      n.Append(j.Value("relation"))
		    Next
		    n.SortWith(h)
		    For i As Integer = UBound(h) DownTo 0
		      Dim j As JSONItem = h(i)
		      HelpIndex.InsertRow(row + 1, j.Value("relation"), 1)
		      HelpIndex.RowTag(HelpIndex.LastIndex) = j
		      If CurrentItem <> Nil And CurrentItem.Lookup("relation", "") = j.Value("relation") Then
		        HelpIndex.ListIndex = HelpIndex.LastIndex
		      End If
		    Next
		  End Select
		  
		  Me.ListIndex = Me.ListIndex
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  Select Case True
		  Case Me.ListIndex < 0
		    Return
		  Case Me.RowTag(Me.ListIndex) <> Nil And Me.RowTag(Me.ListIndex) IsA JSONItem
		    CurrentItem = Me.RowTag(Me.ListIndex)
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  If Me.ListIndex > -1 Then Me.Expanded(Me.ListIndex) = Not Me.Expanded(Me.ListIndex)
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
#tag Events PushButton1
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
