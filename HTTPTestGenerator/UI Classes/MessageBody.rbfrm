#tag Window
Begin ContainerControl MessageBody
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   206
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
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   354
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Message body"
      Enabled         =   True
      Height          =   206
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   354
      Begin PagePanel PagePanel1
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   151
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Left            =   5
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         PanelCount      =   2
         Panels          =   ""
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   46
         Transparent     =   True
         Value           =   0
         Visible         =   True
         Width           =   346
         Begin Canvas NoBodyView
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            DoubleBuffer    =   True
            Enabled         =   True
            Height          =   151
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "PagePanel1"
            Left            =   5
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Top             =   46
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   346
         End
         Begin HexViewer HexViewer1
            AcceptFocus     =   False
            AcceptTabs      =   False
            AutoDeactivate  =   True
            Backdrop        =   0
            Bold            =   False
            Border          =   False
            BorderColor     =   &c00000000
            ByteBackgroundColor=   &cFFFFFF00
            ByteBackgroundColorAlt=   &cC0C0C000
            ByteColor       =   &c0000FF00
            BytesLittleEndian=   True
            DoubleBuffer    =   True
            Enabled         =   True
            GutterColor     =   &cFFFFFF00
            GutterColorAlt  =   &cC0C0C000
            Height          =   133
            HelpTag         =   ""
            Hilight         =   False
            Index           =   -2147483648
            InitialParent   =   "PagePanel1"
            Italic          =   False
            Left            =   5
            LineNumbersColor=   &c80000000
            LineNumbersLittleEndian=   False
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Offset          =   ""
            Scope           =   0
            SelectionEnd    =   ""
            SelectionStart  =   ""
            ShowOffsets     =   False
            StreamLen       =   ""
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            TextBackGroundColor=   &cFFFFFF00
            TextBackGroundColorAlt=   &cC0C0C000
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            Top             =   64
            Transparent     =   True
            UseFocusRing    =   True
            Visible         =   True
            Width           =   346
         End
         Begin Label MessageBodyFilePath
            AutoDeactivate  =   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "PagePanel1"
            Italic          =   False
            Left            =   5
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Multiline       =   False
            Scope           =   0
            Selectable      =   True
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   "X:\\Foo\\bar.bat"
            TextAlign       =   0
            TextColor       =   &c00000000
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   46
            Transparent     =   True
            Underline       =   False
            Visible         =   True
            Width           =   346
         End
      End
      Begin ComboBox MessageBodyType
         AutoComplete    =   True
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   "No body\r\nHTML form\r\nFile\r\nRaw/User defined"
         Italic          =   False
         Left            =   5
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   20
         Transparent     =   True
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   185
      End
      Begin Label MessageBodySize
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   True
         Left            =   193
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "0.0 KB"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   22
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   140
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub BodyChangedHandler(Sender As RawEditor, RawData As MemoryBlock)
		  #pragma Unused Sender
		  MessageBodySize.Text = "0 bytes"
		  NextRequest.MessageBody = RawData
		  
		  For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		    If RequestHeaders.Cell(i, 0) = "Content-Length" Then RequestHeaders.RemoveRow(i)
		  Next
		  RequestHeaders.AddRow("Content-Length", Str(LenB(NextRequest.MessageBody)), "")
		  RequestHeaders.RowTag(RequestHeaders.LastIndex) = "Content-Length":Str(LenB(NextRequest.MessageBody))
		  
		  MessageBodySize.Text = FormatBytes(LenB(NextRequest.MessageBody), 2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FormGeneratedHandler(Sender As FormGenerator, Form As HTTP.FormInterface, FormType As HTTP.ContentType)
		  #pragma Unused Sender
		  MessageBodySize.Text = "0 bytes"
		  If Form <> Nil Then
		    NextRequest.MessageBody = Form.ToString
		    
		    For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		      If RequestHeaders.Cell(i, 0) = "Content-Type" Then RequestHeaders.RemoveRow(i)
		    Next
		    For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		      If RequestHeaders.Cell(i, 0) = "Content-Length" Then RequestHeaders.RemoveRow(i)
		    Next
		    RequestHeaders.AddRow("Content-Type", FormType.ToString, "")
		    RequestHeaders.RowTag(RequestHeaders.LastIndex) = "Content-Type":FormType
		    RequestHeaders.AddRow("Content-Length", Str(LenB(NextRequest.MessageBody)), "")
		    RequestHeaders.RowTag(RequestHeaders.LastIndex) = "Content-Length":Str(LenB(NextRequest.MessageBody))
		    NextRequest.ContentType = FormType
		    MessageBodySize.Text = FormatBytes(LenB(NextRequest.MessageBody), 2)
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event NextRequest() As HTTP.Request
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ReadHeader(PendingHeaderName As String) As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RequestHeaders() As HeaderList
	#tag EndHook


	#tag Property, Flags = &h21
		Private Formtype As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MessageBodyDescription As String = "No message body defined"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MessageBodyFile As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events NoBodyView
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #pragma Unused areas
		  
		  If g.Width <= 0 Or g.Height <= 0 Then Return
		  Static mBuffer As Picture
		  
		  If mBuffer = Nil Or mBuffer.Width <> g.Width Or mBuffer.Height <> g.Height Then
		    mBuffer = New Picture(g.Width,g.Height, 32)
		    Dim gg As Graphics = mBuffer.Graphics
		    gg.ForeColor = &cC0C0C000
		    gg.FillRect(0, 0, gg.Width, gg.Height)
		    gg.ForeColor = &c00000000
		    gg.TextSize = 15
		    Dim w, h As Integer
		    Dim s As String
		    If MessageBodyFile = Nil Then
		      s = MessageBodyDescription
		    Else
		      s = MessageBodyFile.NativePath
		    End If
		    w = gg.StringWidth(s)
		    h = gg.StringHeight(s, w)
		    w = (gg.Width - w) / 2
		    h = (gg.Height - h) / 2
		    gg.DrawString(s, w, h)
		  End If
		  g.DrawPicture(mBuffer, 0, 0, g.Width, g.Height)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #pragma Unused action
		  
		  MessageBodyFile = Nil
		  If obj.Text <> "" Then
		    NextRequest.MessageBody = obj.Text
		    MessageBodyType.ListIndex = 3
		  ElseIf obj.FolderItem <> Nil And Obj.FolderItem.Exists And Not obj.FolderItem.Directory Then
		    MessageBodyFile = obj.FolderItem
		    MessageBodyType.ListIndex = 2
		  ElseIf obj.Picture <> Nil Then
		    NextRequest.MessageBody = obj.Picture.GetData(Picture.FormatPNG)
		    MessageBodyType.ListIndex = 3
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.AcceptFileDrop(FileTypes1.Any)
		  Me.AcceptTextDrop
		  Me.AcceptPictureDrop
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MessageBodyType
	#tag Event
		Sub Change()
		  Static lasttext As String
		  If lasttext = Me.Text Then Return
		  If NextRequest.MessageBody <> "" And MsgBox("Message body will be lost. Proceed?", 32 + 4, "Clear message body data?") <> 6 Then
		    Me.Text = lasttext
		    Return
		  End If
		  lasttext = Me.Text
		  Select Case Me.Text
		  Case "HTML form"
		    Dim formgen As New FormGenerator
		    AddHandler formgen.FormGenerated, WeakAddressOf FormGeneratedHandler
		    PagePanel1.Append
		    PagePanel1.Value = PagePanel1.PanelCount - 1
		    formgen.EmbedWithinPanel(PagePanel1, PagePanel1.Value, 0, 0, PagePanel1.Width, PagePanel1.Height)
		    If Not Formtype Then
		      Dim olddata As HTTP.URLEncodedForm
		      If NextRequest.MessageBody <> "" Then olddata = New HTTP.URLEncodedForm(NextRequest.MessageBody)
		      formgen.SetFormData(olddata)
		    Else
		      Try
		        Dim typ As ContentType = ReadHeader("Content-Type")
		        formgen.SetFormData(MultipartForm.FromString(NextRequest.MessageBody, typ.Boundary))
		      Catch UnsupportedFormatException
		        formgen.SetFormData(Nil)
		      End Try
		    End If
		    MessageBodyFile = Nil
		  Case "File"
		    If MessageBodyFile = Nil Then MessageBodyFile = GetOpenFolderItem("")
		    If MessageBodyFile <> Nil Then
		      Dim hview As New HexView
		      PagePanel1.Append
		      PagePanel1.Value = PagePanel1.PanelCount - 1
		      hview.EmbedWithinPanel(PagePanel1, PagePanel1.Value, 0, 0, PagePanel1.Width, PagePanel1.Height)
		      Dim bs As BinaryStream = BinaryStream.Open(MessageBodyFile)
		      NextRequest.MessageBody = bs.Read(bs.Length)
		      bs.Position = 0
		      hview.ViewRaw(bs, HTTP.MimeType(MessageBodyFile), MessageBodyFile.Length)
		      For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		        If RequestHeaders.Cell(i, 0) = "Content-Type" Then RequestHeaders.RemoveRow(i)
		      Next
		      For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		        If RequestHeaders.Cell(i, 0) = "Content-Length" Then RequestHeaders.RemoveRow(i)
		      Next
		      Dim type As HTTP.ContentType = HTTP.MIMEType(MessageBodyFile)
		      RequestHeaders.AddRow("Content-Type", type.ToString, "")
		      RequestHeaders.RowTag(RequestHeaders.LastIndex) = "Content-Type":type
		      RequestHeaders.AddRow("Content-Length", Str(LenB(NextRequest.MessageBody)), "")
		      RequestHeaders.RowTag(RequestHeaders.LastIndex) = "Content-Length":Str(LenB(NextRequest.MessageBody))
		    End If
		    
		    MessageBodySize.Text = FormatBytes(MessageBodyFile.Length)
		    
		  Case "Raw/User defined"
		    Dim rawed As New RawEditor
		    AddHandler rawed.BodyChanged, WeakAddressOf BodyChangedHandler
		    PagePanel1.Append
		    PagePanel1.Value = PagePanel1.PanelCount - 1
		    rawed.EmbedWithinPanel(PagePanel1, PagePanel1.Value, 0, 0, PagePanel1.Width, PagePanel1.Height)
		    rawed.EditRaw(NextRequest.MessageBody)
		    MessageBodyFile = Nil
		    
		  Case "No body"
		    NextRequest.MessageBody = ""
		    For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		      If RequestHeaders.Cell(i, 0) = "Content-Length" Then
		        RequestHeaders.RemoveRow(i)
		      End If
		    Next
		    For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		      If RequestHeaders.Cell(i, 0) = "Content-Type" Then
		        RequestHeaders.RemoveRow(i)
		      End If
		    Next
		    If PagePanel1.Value > 0 Then
		      PagePanel1.Remove(PagePanel1.Value)
		      PagePanel1.Value = 0
		    End If
		    MessageBodyDescription = "No message body defined"
		    MessageBodySize.Text = "0 bytes"
		    MessageBodyFile = Nil
		  End Select
		  NoBodyView.Invalidate(False)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
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
