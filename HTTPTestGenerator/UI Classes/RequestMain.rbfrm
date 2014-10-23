#tag Window
Begin ContainerControl RequestMain
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   False
   HasBackColor    =   False
   Height          =   428
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
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   366
   Begin HeaderList RequestHeaders
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   True
      ColumnWidths    =   "47%, 48%, *"
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
      Height          =   355
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Header Name	Header Value	  "
      Italic          =   False
      Left            =   5
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   66
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   354
      _ScrollWidth    =   -1
   End
   Begin ComboBox RequestMethod
      AutoComplete    =   True
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   "GET\r\nHEAD\r\nPOST\r\nPUT\r\nTRACE\r\nOPTIONS\r\nDELETE\r\nCONNECT\r\nACL\r\nBASELINE-CONTROL\r\nBIND\r\nCHECKIN\r\nCHECKOUT\r\nCOPY\r\nLABEL\r\nLINK\r\nLOCK\r\nMERGE\r\nMKACTIVITY\r\nMKCALENDAR\r\nMKCOL\r\nMKREDIRECTREF\r\nMKWORKSPACE\r\nMOVE\r\nORDERPATCH\r\nPATCH\r\nPROPFIND\r\nPROPPATCH\r\nREBIND\r\nREPORT\r\nSEARCH\r\nUNBIND\r\nUNCHECKOUT\r\nUNLINK\r\nUNLOCK\r\nUPDATE\r\nUPDATEREDIRECTREF\r\nVERSION-CONTROL"
      Italic          =   False
      Left            =   5
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   7
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   72
   End
   Begin TextField URL
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      CueText         =   "Request URL"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   82
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   8
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   188
   End
   Begin ComboBox ProtocolVer
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   "HTTP/1.1\r\nHTTP/1.0"
      Italic          =   False
      Left            =   273
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   7
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   92
   End
   Begin PushButton Sender
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Send Request"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   127
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   33
      Underline       =   False
      Visible         =   True
      Width           =   98
   End
   Begin ProgressBar ProgressBar1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   7
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   119
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Maximum         =   0
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   57
      Value           =   0
      Visible         =   False
      Width           =   124
   End
   Begin BevelButton EditRaw
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   "Edit request body"
      Icon            =   978827263
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   317
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   ""
      TextUnit        =   0
      Top             =   42
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
   Begin BevelButton EditCookies
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &h00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   "Edit request cookies"
      Icon            =   17051647
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   339
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &h00000000
      TextFont        =   "System"
      TextSize        =   ""
      TextUnit        =   0
      Top             =   42
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
   Begin BevelButton StopButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   1880547327
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   228
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   ""
      TextUnit        =   0
      Top             =   33
      Underline       =   False
      Value           =   False
      Visible         =   False
      Width           =   23
   End
   Begin BevelButton EditSecurity
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   "Edit connection security"
      Icon            =   635267071
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   295
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   ""
      TextUnit        =   0
      Top             =   42
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  #If TargetWin32 Then
		    Me.DoubleBuffer = True
		    Me.EraseBackground = False
		  #endif
		  NextRequest = ""
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  Sender.Left = (Me.Width \ 2) - (Sender.Width \ 2)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddHistoryItem(URL As HTTP.URI)
		  If History = Nil Then History = New Dictionary
		  History.Value(URL.ToString) = URL
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Generate()
		  Dim oldbody As String
		  If NextRequest <> Nil Then oldbody = NextRequest.MessageBody
		  NextRequest = ""
		  NextRequest.MessageBody = oldbody
		  NextRequest.Method = HTTP.Method(RequestMethod.Text)
		  If NextRequest.Method = HTTP.RequestMethod.InvalidMethod Then NextRequest.MethodName = RequestMethod.Text
		  NextRequest.Path = URL.Text
		  NextRequest.Path.Fragment = ""
		  If NextRequest.path.Path = "" Then NextRequest.path.Path = "/"
		  NextRequest.ProtocolVersion = CDbl(NthField(ProtocolVer.Text, "/", 2))
		  
		  
		  Dim u As HTTP.URI = URL.Text
		  If u.Username <> "" Or u.Password <> "" Then
		    If MsgBox("Auto-set HTTP Authorization header?", 4 + 32, "User credentials detected in URL") = 6 Then
		      NextRequest.Header("Authorization") = "Basic " + EncodeBase64(u.Username + ":" + u.Password)
		      u.Username = ""
		      u.Password = ""
		      URL.Text = u.ToString
		    End If
		  End If
		  
		  For i As Integer = 0 To RequestHeaders.ListCount - 1
		    NextRequest.Header(RequestHeaders.Cell(i, 0), True) = RequestHeaders.Cell(i, 1)
		  Next
		  
		  If Not NextRequest.HasHeader("Host") And NextRequest.ProtocolVersion >= 1.1 Then
		    NextRequest.Header("Host") = u.Host
		  End If
		  
		  If Not NextRequest.HasHeader("Connection") And NextRequest.ProtocolVersion >= 1.1 Then
		    NextRequest.Header("Connection") = "close"
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Perform()
		  Me.Generate()
		  RaiseEvent Perform(NextRequest)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SearchHistory(Search As String) As HTTP.URI()
		  If History = Nil Then History = New Dictionary
		  Dim res() As HTTP.URI
		  
		  For Each u As String In History.Keys
		    If InStr(u, Search) > 0 Or Search = "" Then
		      res.Append(History.Value(u))
		    End If
		  Next
		  
		  Return res
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProgress(Percent As Integer)
		  ProgressBar1.Maximum = 100
		  If Percent >= 0 Then
		    ProgressBar1.Value = Percent
		  Else
		    ProgressBar1.Value = 100 + Percent
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Perform(NewRequest As HTTP.Request)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Formtype As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected History As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected NextRequest As HTTP.Request
	#tag EndProperty

	#tag Property, Flags = &h0
		Security As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events RequestHeaders
	#tag Event
		Sub Open()
		  Me.AddRow("Connection", "close")
		  Me.RowTag(Me.LastIndex) = "Connection":"close"
		  Me.AddRow("Accept", "text/html,*/*;q=0.8")
		  Me.RowTag(Me.LastIndex) = "Accept":"text/html,*/*;q=0.8"
		  Me.HeaderType(2) = Listbox.HeaderTypes.NotSortable
		  Me.TextFont = App.FixedWidthFont
		  Me.AcceptTextDrop
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #pragma Unused action
		  If Obj.TextAvailable Then
		    Dim s() As String = Split(obj.Text, CRLF)
		    For Each cs As String In s
		      If cs.Trim = "" Then Continue
		      Dim c As New Cookie(cs)
		      Me.AddRow("Cookie", c.Name + "=" + c.Value)
		      Me.RowTag(Me.LastIndex) = c
		    Next
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base As MenuItem, x As Integer, y As Integer) As Boolean
		  base.Append(New MenuItem("Clear all cookies"))
		  Dim row As Integer = Me.RowFromXY(X, Y)
		  If row > -1 Then
		    Dim m As New MenuItem("View spec...")
		    m.Tag = Me.RowTag(Me.RowFromXY(X, Y))
		    base.Append(m)
		  End If
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem As MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "View spec..."
		    Dim c As Pair = hitItem.Tag
		    If Not c IsA Cookie Then
		      SpecIndex.ShowItem(c.Left)
		    Else
		      SpecIndex.ShowItem("Cookie")
		    End If
		    Return True
		  Case "Clear all cookies"
		    For i As Integer = Me.ListCount - 1 DownTo 0
		      If Me.RowTag(i) <> Nil And Me.RowTag(i) IsA HTTP.Cookie Then
		        Me.RemoveRow(i)
		      End If
		    Next
		    Return True
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Sub Cleared()
		  NextRequest = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RequestMethod
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events URL
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(key) = &h0D Or Asc(key) = &h03 And Not Keyboard.AsyncControlKey Then
		    Self.Perform()
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
		  Me.AcceptTextDrop
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(Obj As DragItem, action As Integer)
		  #pragma Unused action
		  If Obj.TextAvailable Then
		    Dim u As HTTP.URI = Obj.Text
		    Me.Text = u.ToString
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub KeyUp(Key As String)
		  If Asc(Key) = &h1F Then  //Down arrow
		    Dim res() As HTTP.URI = SearchHistory(Me.Text)
		    If UBound(res) > -1 Then
		      Dim mnu As New MenuItem("History")
		      For Each item As HTTP.URI In res
		        Dim mnuitem As New MenuItem(item.ToString)
		        mnuitem.Tag = item
		        mnu.Append(mnuitem)
		      Next
		      Dim choice As MenuItem = mnu.PopUp(TrueWindow.Left + Me.Left, TrueWindow.Top + Me.Top + Me.Height)
		      If choice <> Nil Then
		        Me.Text = choice.Text
		      End If
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProtocolVer
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
		  Me.SelLength = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Sender
	#tag Event
		Sub Action()
		  Self.Perform()
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EditRaw
	#tag Event
		Sub Action()
		  Dim mnu As New MenuItem("EditRawMenu")
		  mnu.Append(New MenuItem("HTML form output"))
		  mnu.Append(New MenuItem("Edit raw"))
		  mnu.Append(New MenuItem("Clear all"))
		  Dim res As MenuItem = mnu.PopUp
		  If res <> Nil Then
		    'RaiseEvent Generate()
		    Select Case res.Text
		    Case "HTML form output"
		      Dim formgen As New FormGenerator
		      Dim formraw As Variant
		      If Not Formtype Then
		        Dim olddata As HTTP.URLEncodedForm
		        If NextRequest.MessageBody <> "" Then olddata = New HTTP.URLEncodedForm(NextRequest.MessageBody)
		        formraw = formgen.SetFormData(olddata)
		      Else
		        Try
		          Dim typ As ContentType = NextRequest.ContentType
		          formraw = formgen.SetFormData(MultipartForm.FromString(NextRequest.MessageBody, typ.Boundary))
		        Catch UnsupportedFormatException
		          formraw = formgen.SetFormData(Nil)
		        End Try
		      End If
		      If formraw IsA MultipartForm Then
		        Formtype = True
		      Else
		        Formtype = False
		      End If
		      Dim Type As String
		      If formraw <> Nil Then
		        If formraw IsA HTTP.URLEncodedForm Then
		          If HTTP.URLEncodedForm(formraw).Count = 0 Then Return
		          NextRequest.MessageBody = HTTP.URLEncodedForm(formraw).ToString
		          Type = "application/x-www-form-urlencoded"
		        Else
		          Dim m As MultipartForm = formraw
		          If m.Count = 0 Then Return
		          NextRequest.MessageBody = m.ToString
		          Type = "multipart/form-data; boundary=" + m.Boundary
		        End If
		        
		        For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		          If RequestHeaders.Cell(i, 0) = "Content-Type" Then
		            RequestHeaders.RemoveRow(i)
		          End If
		        Next
		        For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		          If RequestHeaders.Cell(i, 0) = "Content-Length" Then
		            RequestHeaders.RemoveRow(i)
		          End If
		        Next
		        RequestHeaders.AddRow("Content-Type", type, "")
		        RequestHeaders.RowTag(RequestHeaders.LastIndex) = "Content-Type":type
		        RequestHeaders.AddRow("Content-Length", Str(LenB(NextRequest.MessageBody)), "")
		        RequestHeaders.RowTag(RequestHeaders.LastIndex) = "Content-Length":Str(LenB(NextRequest.MessageBody))
		        
		      End If
		      
		    Case "Edit raw"
		      Dim raw As String = RawEditor.EditRaw(NextRequest.MessageBody)
		      If raw.Trim = "" Then Return
		      For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		        If RequestHeaders.Cell(i, 0) = "Content-Length" Then
		          RequestHeaders.RemoveRow(i)
		        End If
		      Next
		      NextRequest.MessageBody = raw
		      RequestHeaders.AddRow("Content-Length", Str(LenB(NextRequest.MessageBody)), "")
		      RequestHeaders.RowTag(RequestHeaders.LastIndex) = "Content-Length":Str(LenB(NextRequest.MessageBody))
		      
		    Case "Clear all"
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
		    End Select
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EditCookies
	#tag Event
		Sub Action()
		  Dim mnu As New MenuItem("EditCookieMenu")
		  mnu.Append(New MenuItem("Add cookie..."))
		  mnu.Append(New MenuItem("Load cookies from a file..."))
		  Dim res As MenuItem = mnu.PopUp
		  If res <> Nil Then
		    Select Case res.Text
		    Case "Add cookie..."
		      Dim editindex As Integer = -1
		      Dim c As Cookie
		      
		      If RequestHeaders.ListIndex > -1 And RequestHeaders.Cell(RequestHeaders.ListIndex, 0) = "Cookie" Then
		        Dim n, v As String
		        n = NthField(RequestHeaders.Cell(RequestHeaders.ListIndex, 1), "=", 1)
		        v = NthField(RequestHeaders.Cell(RequestHeaders.ListIndex, 1), "=", 2)
		        c = New Cookie(n, v)
		        editindex = RequestHeaders.ListIndex
		      End If
		      c = CookieEdit.GetCookie(c)
		      If c <> Nil Then
		        If editindex > -1 Then
		          RequestHeaders.Cell(editindex, 1) = c.Name + "=" + c.Value
		          RequestHeaders.RowTag(editindex) = c
		        Else
		          RequestHeaders.AddRow("Cookie", c.Name + "=" + c.Value, "")
		          RequestHeaders.RowTag(RequestHeaders.LastIndex) = c
		        End If
		      End If
		      
		    Case "Load cookies from a file..."
		      Dim f As FolderItem = GetOpenFolderItem(FileTypes1.NetscapeCookieJar)
		      If f <> Nil Then
		        Dim cj As HTTP.CookieJar = HTTP.CookieJar.LoadFromFile(f)
		        For i As Integer = 0 To cj.Count - 1
		          Dim c As Cookie = cj.Item(i)
		          RequestHeaders.AddRow("Cookie", c.Name + "=" + c.Value, "")
		          RequestHeaders.RowTag(RequestHeaders.LastIndex) = c
		        Next
		      End If
		    End Select
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Open()
		  Me.HelpTag = "Cancel request"
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  RaiseEvent Perform(Nil)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EditSecurity
	#tag Event
		Sub Action()
		  Dim mnu As New MenuItem("EditSecurityMenu")
		  Dim chld As New MenuItem("Automatic")
		  chld.Checked = (Security = 0)
		  mnu.Append(chld)
		  
		  chld = New MenuItem("SSLv2 Only")
		  chld.Checked = (Security = 1)
		  mnu.Append(chld)
		  
		  chld = New MenuItem("SSLv3 Only")
		  chld.Checked = (Security = 2)
		  mnu.Append(chld)
		  
		  chld = New MenuItem("SSLv3 or SSLv2")
		  chld.Checked = (Security = 3)
		  mnu.Append(chld)
		  
		  chld = New MenuItem("TLSv1 Only")
		  chld.Checked = (Security = 4)
		  mnu.Append(chld)
		  
		  Dim res As MenuItem = mnu.PopUp
		  If res <> Nil Then
		    Select Case res.Text
		    Case "Automatic"
		      Security = 0
		      
		    Case "SSLv2 Only"
		      Security = 1
		      
		    Case "SSLv3 Only"
		      Security = 2
		      
		    Case "SSLv3 or SSLv2"
		      Security = 3
		      
		    Case "TLSv1 Only"
		      Security = 4
		    End Select
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
