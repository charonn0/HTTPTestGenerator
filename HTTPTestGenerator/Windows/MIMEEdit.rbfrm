#tag Window
Begin Window MIMEEdit
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.63e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   False
   Title           =   "Accept Types Editor"
   Visible         =   True
   Width           =   3.11e+2
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   ""
      ColumnWidths    =   "60%,20%"
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
      Height          =   263
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "MIME Type	Accept	Weight"
      Italic          =   ""
      Left            =   0
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
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   311
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Function Generate() As String
		  Dim output() As String
		  For i As Integer = 0 To Listbox1.ListCount - 1
		    If Listbox1.CellState(i, 1) = CheckBox.CheckedStates.Checked Then
		      Dim c As ContentType = Listbox1.RowTag(i)
		      c.Weight = CDbl(Listbox1.Cell(i, 2))
		      output.Append(c.ToString)
		    End If
		  Next
		  Return Join(output, ",")
		  
		  'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowMIME(InitialMIME As String = "")
		  Dim im() As ContentType 
		  If InitialMIME.Trim <> "" Then im = ContentType.ParseTypes(InitialMIME)
		  Dim skip() As String
		  For Each extension As String In WebServer.MIMETypes.Keys
		    Dim mime As String = WebServer.MIMETypes.Value(extension)
		    If skip.IndexOf(mime) > -1 Then Continue
		    skip.Append(mime)
		    Dim NewType As New ContentType(WebServer.MIMETypes.Value(extension).StringValue)
		    Listbox1.AddRow(WebServer.MIMETypes.Value(extension).StringValue, "", "1.0")
		    Listbox1.CellType(Listbox1.LastIndex, 1) = Listbox.TypeCheckbox
		    For Each ime As ContentType In im
		      If ime.Acceptance(NewType) >= 1.0 Then
		        Listbox1.CellState(Listbox1.LastIndex, 1) = CheckBox.CheckedStates.Checked
		      End If
		    Next
		    
		    Listbox1.CellType(Listbox1.LastIndex, 2) = Listbox.TypeEditableTextField
		    Listbox1.RowTag(Listbox1.LastIndex) = NewType
		  Next
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  If column = 1 Then
		    Dim r1, r2 As Boolean
		    r1 = Me.CellState(row1, column) = CheckBox.CheckedStates.Checked
		    r2 = Me.CellState(row2, column) = CheckBox.CheckedStates.Checked
		    If (r1 And r2) Or ((Not r1) And (Not r2)) Then
		      result = 0
		    ElseIf r1 Then
		      result = -1
		    Else
		      result = 1
		    End If
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  If column = 2 Then
		    Dim v As Single = CDbl(Me.Cell(row, column))
		    If v >= 1.001 Then
		      MsgBox("Weight must be between 0.0 and 1.0")
		      Me.EditCell(row, column)
		    End If
		  ElseIf column = 1 Then
		    HeaderEdit.HeaderValue.Text = Generate
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
