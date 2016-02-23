#tag Window
Begin ContainerControl FormGenerator
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   -256
   Backdrop        =   0
   Enabled         =   True
   EraseBackground =   True
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
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "-"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   27
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   242
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "+"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   6
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   242
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
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
      Height          =   232
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
   Begin RadioButton FormType
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Multipart"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   463
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   252
      Underline       =   ""
      Value           =   ""
      Visible         =   True
      Width           =   100
   End
   Begin RadioButton FormType1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "URL-Encoded"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   463
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   233
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   100
   End
   Begin PushButton FileAdd
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "File"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   49
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   242
      Underline       =   False
      Visible         =   True
      Width           =   36
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Sub Generate()
		  If FormType1.Value Then
		    Form = New HTTP.URLEncodedForm("")
		  Else
		    Form = New MultipartForm
		  End If
		  For i As Integer = 0 To HTTPForm.ListCount - 1
		    If HTTPForm.RowTag(i) <> Nil And HTTPForm.RowTag(i) IsA FolderItem Then
		      Dim f As FolderItem = HTTPForm.RowTag(i)
		      If Form IsA MultipartForm Then
		        Form.Element(HTTPForm.Cell(i, 0)) = f
		      Else
		        Form.Element(HTTPForm.Cell(i, 0)) = f.AbsolutePath
		        MsgBox("This form encoding cannot encode files. Form element '" + f.AbsolutePath + "' has been truncated.")
		      End If
		    Else
		      Form.Element(HTTPForm.Cell(i, 0)) = HTTPForm.Cell(i, 1)
		    End If
		  Next
		  Call Form.ToString
		  RaiseEvent FormGenerated(Form, Form.Type)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PurgeForm(Source As HTTP.FormInterface) As HTTP.URLEncodedForm
		  Dim f As New HTTP.URLEncodedForm("")
		  Dim c As Integer = Source.Count - 1
		  
		  For i As Integer = 0 To c
		    Dim name As String = Source.Name(i)
		    Dim v As Variant = Source.Element(name)
		    If v IsA FolderItem Then
		      f.Element(name) = FolderItem(v).AbsolutePath
		    Else
		      f.Element(name) = v
		    End If
		  Next
		  
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFormData(OldForm As HTTP.FormInterface)
		  Me.Form = Nil
		  HTTPForm.DeleteAllRows
		  If OldForm <> Nil Then
		    Form = OldForm
		    If OldForm IsA HTTP.URLEncodedForm Then ' URLEncoded
		      FormType1.Value = True
		    Else ' MultipartForm
		      FormType.Value = True
		    End If
		    
		    For i As Integer = 0 To OldForm.Count - 1
		      Dim n As String
		      Dim v As Variant
		      n = OldForm.Name(i)
		      v = OldForm.Element(n)
		      If v IsA FolderItem Then
		        Dim f As FolderItem = v
		        HTTPForm.AddRow(n, f.AbsolutePath)
		        HTTPForm.RowTag(HTTPForm.LastIndex) = f
		      Else
		        HTTPForm.AddRow(n, v)
		      End If
		      HTTPForm.CellType(HTTPForm.LastIndex, 0) = Listbox.TypeEditable
		      HTTPForm.CellType(HTTPForm.LastIndex, 1) = Listbox.TypeEditable
		    Next
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FormGenerated(Form As HTTP.FormInterface, FormType As HTTP.ContentType)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected Form As HTTP.FormInterface
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton2
	#tag Event
		Sub Action()
		  If HTTPForm.ListIndex > -1 And MsgBox("Remove this form element?", 4 + 48, "Confirm removal") = 6 Then
		    HTTPForm.RemoveRow(HTTPForm.ListIndex)
		    Generate()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  Dim i As Integer = 1
		  Dim nm As String = "New-Form-Element"
		  Dim name As String = nm
		  If Form <> Nil Then
		    Do Until Not Form.HasElement(name)
		      name = nm + Str(i)
		      i = i + 1
		    Loop
		  End If
		  HTTPForm.AddRow(name, "New-Form-Value", "")
		  HTTPForm.CellType(HTTPForm.LastIndex, 0) = Listbox.TypeEditable
		  HTTPForm.EditCell(HTTPForm.LastIndex, 0)
		  Generate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HTTPForm
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  Me.EditCell(row, column)
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  Generate()
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  If Me.ListCount > 0 Then
		    base.Append(New MenuItem("Reset form"))
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Reset form"
		    SetFormData(Nil)
		    Generate()
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events FormType
	#tag Event
		Sub Action()
		  If Form <> Nil Then
		    If Form IsA HTTP.MultipartForm Then
		      Form = Form
		    ElseIf Form IsA HTTP.URLEncodedForm Then
		      Dim f As HTTP.MultipartForm = Form
		      Form = f
		    End If
		  Else
		    Form = New HTTP.MultipartForm
		  End If
		  SetFormData(Form)
		  Generate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FormType1
	#tag Event
		Sub Action()
		  If Form <> Nil Then
		    If Form IsA HTTP.URLEncodedForm Then
		      Form = Form
		    ElseIf Form IsA HTTP.MultipartForm Then
		      Dim f As HTTP.URLEncodedForm
		      Try
		        f = Form
		      Catch Err As UnsupportedFormatException
		        f = New HTTP.URLEncodedForm("")
		        If MsgBox( _
		          "Warning: converting this form to '" + f.Type.ToString + _
		          "' will cause data loss. Are you sure you want to continue?", 48 + 4, "Incompatible form value") = 6 Then
		          f = PurgeForm(Form)
		        Else
		          FormType.Value = True
		          Return
		        End If
		      End Try
		      Form = f
		    End If
		  Else
		    Form = New HTTP.URLEncodedForm("")
		  End If
		  SetFormData(Form)
		  Generate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FileAdd
	#tag Event
		Sub Action()
		  If FormType1.Value Then
		    If MsgBox("Change form encoding to 'multipart/form-data'?", 4 + 48, "Current encoding does not support files") = 6 Then
		      FormType.Value = True
		    Else
		      Return
		    End If
		  End If
		  Dim f As FolderItem = GetOpenFolderItem("")
		  If f <> Nil Then
		    HTTPForm.AddRow(f.Name, f.AbsolutePath, "")
		    HTTPForm.RowTag(HTTPForm.LastIndex) = f
		  End If
		  Generate()
		End Sub
	#tag EndEvent
#tag EndEvents
