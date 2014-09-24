#tag Window
Begin Window MiniServer
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   3.23e+2
   ImplicitInstance=   False
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
   Placement       =   0
   Resizeable      =   True
   Title           =   "HTTP Server"
   Visible         =   True
   Width           =   5.83e+2
   Begin TextField port
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   144
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   8080
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   301
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   53
   End
   Begin ComboBox nic
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   300
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   132
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   136
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   ":"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   301
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   8
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Listen"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   497
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   301
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label URLLink
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   207
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   True
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   ""
      TextAlign       =   1
      TextColor       =   &h000080FF
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   302
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   278
   End
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   295
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "Server Log\rHTTP Conversation"
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   583
      Begin TextArea HTTPLog
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &h00EFEFEF
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   259
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   5
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
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   28
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   569
      End
      Begin Listbox ServerLog
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   False
         Border          =   True
         ColumnCount     =   4
         ColumnsResizable=   True
         ColumnWidths    =   "60%,0,40%,0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   False
         EnableDragReorder=   False
         GridLinesHorizontal=   1
         GridLinesVertical=   1
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   258
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Log Data	Date	Type	Thread ID"
         Italic          =   False
         Left            =   10
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
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   31
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   563
         _ScrollWidth    =   -1
      End
   End
   Begin WebServer.FileServer Socket
      AuthenticationRealm=   "Restricted Area"
      AuthenticationRequired=   ""
      CertificatePassword=   ""
      DirectoryBrowsing=   True
      EnforceContentType=   True
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   619
      LockedInPosition=   False
      MaximumSocketsConnected=   10
      MinimumSocketsAvailable=   2
      Port            =   0
      Scope           =   0
      SessionTimeout  =   600
      TabPanelIndex   =   0
      Threading       =   True
      Top             =   0
      UseCompression  =   True
      UseSessions     =   True
      Width           =   32
   End
   Begin Timer LogTimer
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   621
      LockedInPosition=   False
      Mode            =   2
      Period          =   250
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   44
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h1
		Protected Messages() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RequestData As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Sequence As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Squelch As Integer = 1
	#tag EndProperty


#tag EndWindowCode

#tag Events nic
	#tag Event
		Sub Open()
		  Dim i As Integer
		  For i = 0 To System.NetworkInterfaceCount - 1
		    Me.AddRow(System.GetNetworkInterface(i).IPAddress)
		    If System.GetNetworkInterface(i).IPAddress <> "0.0.0.0" Then
		      Me.RowTag(i) = System.GetNetworkInterface(i)
		    End If
		  Next
		  For i = Me.ListCount - 1 DownTo 0
		    If Me.RowTag(i) = Nil Then
		      Me.RemoveRow(i)
		    Else
		      Me.ListIndex = i
		    End If
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  If Me.Caption = "Listen" Then
		    Dim f As FolderItem
		    Dim dlg As New SelectFolderDialog
		    dlg.Title = "Select server root directory"
		    f = dlg.ShowModal
		    If f <> Nil Then
		      If nic.Text.Trim <> "" And nic.ListIndex > -1 Then
		        Socket.NetworkInterface = nic.RowTag(nic.ListIndex)
		      Else
		        Socket.NetworkInterface = System.GetNetworkInterface(0)
		      End If
		      Socket.Port = Val(port.Text)
		      Socket.DocumentRoot = f
		      Socket.DirectoryBrowsing = True
		      Me.Caption = "Stop"
		      Socket.Listen
		      URLLink.Text = "http://" + Socket.NetworkInterface.IPAddress + ":" + port.Text
		    End If
		  Else
		    Me.Caption = "Listen"
		    Socket.StopListening
		    URLLink.Visible = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events URLLink
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
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  Generator.RequestMain1.URL.Text = Me.Text
		  Generator.RequestMain1.Sender.Enabled = False
		  Generator.RequestMain1.Sender.Caption = "Sending..."
		  Generator.RequestMain1.ProgressBar1.Visible = True
		  Generator.RequestMain1.StopButton.Visible = True
		  Generator.Perform()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HTTPLog
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  base.Append(New MenuItem("Clear log"))
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Clear log"
		    Me.Text = ""
		    Return True
		  End Select
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ServerLog
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #pragma Unused column
		  If row > Me.LastIndex Or Me.ListCount < 1 Then Return False
		  If Me.RowTag(row) <> Nil Then
		    g.ForeColor = Me.RowTag(row)
		    g.FillRect(0, 0, g.Width, g.Height)
		  End If
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  #pragma Unused row
		  #pragma Unused column
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function HeaderPressed(column as Integer) As Boolean
		  #pragma Unused column
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  base.Append(New MenuItem("Clear log"))
		  Dim mnu As New MenuItem("Set verbosity...")
		  mnu.Append(New MenuItem("Off"))
		  mnu.Append(New MenuItem("Errors Only"))
		  mnu.Append(New MenuItem("Normal"))
		  mnu.Append(New MenuItem("Debug"))
		  mnu.Append(New MenuItem("Socket"))
		  mnu.Append(New MenuItem("Trace"))
		  base.Append(mnu)
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Clear log"
		    Me.DeleteAllRows
		    Return True
		    
		  Case "Off"
		    Squelch = 4
		  Case "Errors Only"
		    Squelch = 3
		  Case "Normal"
		    Squelch = 1
		  Case "Debug"
		    Squelch = -1
		  Case "Trace"
		    Squelch = -3
		  Case "Socket"
		    Squelch = -2
		  End Select
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Socket
	#tag Event
		Sub Error(ErrorCode as Integer)
		  Dim msg As New Dictionary
		  msg.Value("Message") = FormatSocketError(ErrorCode)
		  msg.Value("Severity") = HTTP.BaseServer.Log_Error
		  If App.CurrentThread <> Nil Then
		    msg.Value("ThreadID") = App.CurrentThread.ThreadID
		  Else
		    msg.Value("ThreadID") = 0
		  End If
		  Messages.Insert(0, msg)
		  
		  PushButton1.Caption = "Listen"
		  Me.StopListening
		  URLLink.Visible = False
		  Dim sr As New StyleRun
		  sr.Font = App.FixedWidthFont
		  sr.Text = FormatSocketError(ErrorCode) + CRLF
		  sr.TextColor = &c80000000
		  HTTPLog.StyledText.AppendStyleRun(sr)
		  #If TargetWin32 Then
		    Declare Function SendMessageW Lib "User32" (HWND As Integer, Msg As Integer, WParam As Integer, LParam As Ptr) As Integer
		    Const SB_BOTTOM = 7
		    Const WM_VSCROLL = &h115
		    Call SendMessageW(HTTPLog.Handle, WM_VSCROLL, SB_BOTTOM, Nil)
		  #Else
		    HTTPLog.ScrollPosition = HTTPLog.LineNumAtCharPos(HTTPLog.Text.Len)
		  #endif
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function TamperRequest(ByRef Request As HTTP.Request) As Boolean
		  RequestData = Request.ToString
		  While Right(RequestData, 4) <> CRLF + CRLF
		    RequestData = RequestData + CRLF
		  Wend
		End Function
	#tag EndEvent
	#tag Event
		Function TamperResponse(ByRef Response As HTTP.Response) As Boolean
		  Dim s As String = NthField(Response.ToString, CRLF + CRLF, 1)
		  While Right(s, 4) <> CRLF + CRLF
		    s = s + CRLF
		  Wend
		  Dim sr As New StyleRun
		  sr.Font = App.FixedWidthFont
		  sr.Text = RequestData
		  sr.TextColor = &c0000FF00
		  HTTPLog.StyledText.AppendStyleRun(sr)
		  sr.Text = s
		  sr.TextColor = &c00800000
		  HTTPLog.StyledText.AppendStyleRun(sr)
		  #If TargetWin32 Then
		    Declare Function SendMessageW Lib "User32" (HWND As Integer, Msg As Integer, WParam As Integer, LParam As Ptr) As Integer
		    Const SB_BOTTOM = 7
		    Const WM_VSCROLL = &h115
		    Call SendMessageW(HTTPLog.Handle, WM_VSCROLL, SB_BOTTOM, Nil)
		  #Else
		    HTTPLog.ScrollPosition = HTTPLog.LineNumAtCharPos(HTTPLog.Text.Len)
		  #endif
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Log(Message As String, Severity As Integer)
		  Dim msg As New Dictionary
		  msg.Value("Message") = Message
		  msg.Value("Severity") = Severity
		  If App.CurrentThread <> Nil Then
		    msg.Value("ThreadID") = App.CurrentThread.ThreadID
		  Else
		    msg.Value("ThreadID") = 0
		  End If
		  Messages.Insert(0, msg)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LogTimer
	#tag Event
		Sub Action()
		  Dim message As String
		  Dim severity As Double
		  Dim ThreadID As String
		  While UBound(messages) > -1
		    Dim p As Dictionary = messages.Pop
		    message = P.Value("Message")
		    severity = p.Value("Severity")
		    If p.Value("ThreadID") <> 0 Then
		      ThreadID = "0x" + Left(Hex(p.Value("ThreadID")) + "00000000", 8)
		    Else
		      ThreadID = "Main Thread"
		    End If
		    message = ReplaceAll(message, WebServer.VirtualRoot, "virtual_root")
		    Dim lines() As String = Split(Message, EndOfLine)
		    Dim now As New Date
		    Dim lcount As Integer = UBound(lines)
		    For i As Integer = 0 To lcount
		      If lines(i).Trim <> "" Then
		        Select Case Severity
		        Case HTTP.BaseServer.Log_Request, HTTP.BaseServer.Log_Status
		          If Severity < squelch And squelch <> HTTP.BaseServer.Log_Response Then Continue While
		          If i = 0 And severity <> HTTP.BaseServer.Log_Status Then
		            ServerLog.AddRow(lines(i), now.ShortDate + " " + Now.LongTime, "HTTP Request", ThreadID)
		            ServerLog.RowPicture(ServerLog.LastIndex) = greenarrowright
		          ElseIf severity = HTTP.BaseServer.Log_Status Then
		            ServerLog.AddRow(lines(i), " ", " ", ThreadID)
		          Else
		            ServerLog.AddRow(lines(i), " ", " ")
		            ServerLog.RowPicture(ServerLog.LastIndex) = New Picture(greenarrowright.Width, greenarrowright.Height)
		          End If
		          
		          ServerLog.RowTag(ServerLog.LastIndex) = &c0080FF99
		          ServerLog.CellTag(ServerLog.LastIndex, 0) = severity
		          
		        Case HTTP.BaseServer.Log_Response
		          If Severity < squelch And squelch <> HTTP.BaseServer.Log_Request Then Continue While
		          
		          If i = 0 Then
		            ServerLog.AddRow(lines(i), now.ShortDate + " " + Now.LongTime, "HTTP Reply", ThreadID)
		            ServerLog.RowPicture(ServerLog.LastIndex) = blue_left_arrow
		          Else
		            ServerLog.AddRow(lines(i), " ", " ")
		            ServerLog.RowPicture(ServerLog.LastIndex) = New Picture(blue_left_arrow.Width, blue_left_arrow.Height)
		          End If
		          
		          ServerLog.RowTag(ServerLog.LastIndex) = &c00FF0099
		          ServerLog.CellTag(ServerLog.LastIndex, 0) = severity
		        Case HTTP.BaseServer.Log_Error
		          If Severity < squelch Then Continue While
		          If i = 0 Then
		            ServerLog.AddRow(lines(i), now.ShortDate + " " + Now.LongTime, "Error!", ThreadID)
		            ServerLog.RowPicture(ServerLog.LastIndex) = error
		          Else
		            ServerLog.AddRow(lines(i), " ", " ")
		            ServerLog.RowPicture(ServerLog.LastIndex) = New Picture(error.Width, error.Height)
		          End If
		          ServerLog.RowTag(ServerLog.LastIndex) = &cFF000099
		          ServerLog.CellTag(ServerLog.LastIndex, 0) = severity
		        Case HTTP.BaseServer.Log_Debug
		          If Severity < squelch Then Continue While
		          ServerLog.AddRow(lines(i), now.ShortDate + " " + Now.LongTime, "Debug", ThreadID)
		          ServerLog.RowTag(ServerLog.LastIndex) = &cFFFF0099
		          ServerLog.CellTag(ServerLog.LastIndex, 0) = severity
		          ServerLog.RowPicture(ServerLog.LastIndex) = debugIcon
		        Case HTTP.BaseServer.Log_Socket
		          If Severity < squelch Then Continue While
		          ServerLog.AddRow(lines(i), now.ShortDate + " " + Now.LongTime, "Socket", ThreadID)
		          ServerLog.RowTag(ServerLog.LastIndex) = &cC0C0C099
		          ServerLog.CellTag(ServerLog.LastIndex, 0) = severity
		          ServerLog.RowPicture(ServerLog.LastIndex) = socketIcon
		        Case HTTP.BaseServer.Log_Trace
		          If Severity < squelch Then Continue While
		          ServerLog.AddRow(lines(i), now.ShortDate + " " + Now.LongTime, "Trace", ThreadID)
		          ServerLog.RowTag(ServerLog.LastIndex) = &c80808099
		          ServerLog.CellTag(ServerLog.LastIndex, 0) = severity
		          ServerLog.RowPicture(ServerLog.LastIndex) = traceIcon
		        Else
		          ServerLog.AddRow(lines(i), now.ShortDate + " " + Now.LongTime, "Unspecified", ThreadID)
		          ServerLog.RowTag(ServerLog.LastIndex) = &cFFFFFF99
		          ServerLog.CellTag(ServerLog.LastIndex, 0) = severity
		        End Select
		      End If
		    Next
		    ServerLog.ScrollPosition = ServerLog.LastIndex
		  Wend
		End Sub
	#tag EndEvent
#tag EndEvents
