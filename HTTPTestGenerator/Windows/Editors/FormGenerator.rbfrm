#tag Window
Begin ContainerControl FormGenerator
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFF00FF
   Backdrop        =   0
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   False
   HasBackColor    =   False
   Height          =   270
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
   Transparent     =   True
   UseFocusRing    =   False
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
      Transparent     =   True
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
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
   Begin PrettyListBox HTTPForm
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
      ShowDropIndicator=   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin RadioButton FormType
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Multipart"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
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
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   252
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin RadioButton FormType1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "URL-Encoded"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
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
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   233
      Transparent     =   True
      Underline       =   False
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
      Transparent     =   True
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
		        Form.Element(HTTPForm.Cell(i, 0)) = f.NativePath
		        MsgBox("This form encoding cannot encode files. Form element '" + f.NativePath + "' has been truncated.")
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
		      f.Element(name) = FolderItem(v).NativePath
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
		        HTTPForm.AddRow(n, f.NativePath)
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
		  #pragma Unused row
		  #pragma Unused column
		  
		  Generate()
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  
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
		    HTTPForm.AddRow(f.Name, f.NativePath, "")
		    HTTPForm.RowTag(HTTPForm.LastIndex) = f
		  End If
		  Generate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
