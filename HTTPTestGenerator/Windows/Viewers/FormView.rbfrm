#tag Window
Begin ContainerControl FormView Implements Viewer
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   -256
   Backdrop        =   0
   Enabled         =   True
   EraseBackground =   False
   HasBackColor    =   False
   Height          =   270
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   ""
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   ""
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   561
   Begin Listbox HTTPForm
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
      Height          =   270
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Form Element	Value"
      Italic          =   False
      Left            =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub ViewRaw(Message As MemoryBlock, Type As HTTP.ContentType, ContentLen As Integer, DebugOutput As HTTP.DebugMessage = Nil)
		  // Part of the Viewer interface.
		  Me.Form = Nil
		  HTTPForm.DeleteAllRows
		  Select Case True
		  Case Type.Accepts("multipart/form-data")
		    Form = MultipartForm.FromString(Message, Type.Boundary)
		    
		  Case Type.Accepts("application/x-www-form-urlencoded")
		    Form = New URLEncodedForm(Message)
		    
		  Else
		    Raise New UnsupportedFormatException
		  End Select
		  
		  If Form = Nil Then
		    Self.Close
		    Return
		  End If
		  
		  For i As Integer = 0 To Form.Count - 1
		    Dim key As String = Form.Name(i)
		    If Form.Element(key) IsA FolderItem Then
		      Dim f As FolderItem = Form.Element(key)
		      HTTPForm.AddRow(key, f.AbsolutePath)
		      HTTPForm.RowTag(HTTPForm.LastIndex) = f
		    Else
		      HTTPForm.AddRow(key, Form.Element(key))
		    End If
		    HTTPForm.CellType(HTTPForm.LastIndex, 0) = Listbox.TypeEditable
		    HTTPForm.CellType(HTTPForm.LastIndex, 1) = Listbox.TypeEditable
		  Next
		  mContentLength = ContentLen
		  mDebugOutput = DebugOutput
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Form As HTTP.FormInterface
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mContentLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDebugOutput As HTTP.DebugMessage
	#tag EndProperty


#tag EndWindowCode

#tag Events HTTPForm
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  
		  If column = 1 Then
		    Dim tag As Variant = Me.RowTag(row)
		    If tag = Nil Then Return False
		    Select Case tag
		    Case IsA FolderItem
		      g.ForeColor = &c0000FF00
		      g.Underline = True
		      
		    End Select
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  
		  If column = 1 Then
		    Dim tag As Variant = Me.RowTag(row)
		    If tag = Nil Then Return False
		    Select Case tag
		    Case IsA FolderItem
		      #If TargetWin32 Then
		        SpecialFolder.System.Child("explorer.exe").Launch("/select, """ + FolderItem(tag).AbsolutePath + """")
		      #Else
		        FolderItem(tag).Parent.Launch
		      #endif
		      Return True
		      
		    End Select
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim row, column As Integer
		  row = Me.RowFromXY(x, y)
		  column = Me.ColumnFromXY(x, y)
		  
		  If column = 1 And row < Me.ListCount Then
		    Select Case Me.RowTag(row)
		    Case IsA FolderItem
		      Me.MouseCursor = System.Cursors.FingerPointer
		      Return
		    End Select
		  End If
		  Me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
#tag EndEvents
