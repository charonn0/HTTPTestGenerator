#tag Window
Begin ContainerControl MiniServer
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   False
   HasBackColor    =   False
   Height          =   253
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   ""
   LockLeft        =   ""
   LockRight       =   ""
   LockTop         =   ""
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   368
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
      Top             =   231
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
      Top             =   230
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
      TabStop         =   True
      Text            =   ":"
      TextAlign       =   0
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   231
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   8
   End
   Begin HTTP.QnDHTTPd Socket
      AllowDirectoryIndexPages=   True
      Authenticate    =   False
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      KeepListening   =   True
      LastHTTPCode    =   ""
      Left            =   336
      LockedInPosition=   False
      LogLevel        =   0
      Port            =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   32
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
      Left            =   282
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
      Top             =   231
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin TextArea TextArea1
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &h00C0C0C0
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   225
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   0
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   368
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
      TabStop         =   True
      Text            =   ""
      TextAlign       =   1
      TextColor       =   &h000080FF
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   232
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   63
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h1
		Protected RequestData As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Sequence As Integer
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
#tag Events Socket
	#tag Event
		Sub Error()
		  PushButton1.Caption = "Listen"
		End Sub
	#tag EndEvent
	#tag Event
		Sub PrintResponse(Response As String)
		  Dim s As String = NthField(Response, CRLF + CRLF, 1)
		  While Right(s, 4) <> CRLF + CRLF
		    s = s + CRLF
		  Wend
		  Dim sr As New StyleRun
		  sr.Text = RequestData
		  sr.TextColor = &c0000FF00
		  TextArea1.StyledText.AppendStyleRun(sr)
		  sr.Text = s
		  sr.TextColor = &c00800000
		  TextArea1.StyledText.AppendStyleRun(sr)
		  #If TargetWin32 Then
		    Declare Function SendMessageW Lib "User32" (HWND As Integer, Msg As Integer, WParam As Integer, LParam As Ptr) As Integer
		    Const SB_BOTTOM = 7
		    Const WM_VSCROLL = &h115
		    Call SendMessageW(TextArea1.Handle, WM_VSCROLL, SB_BOTTOM, Nil)
		  #Else
		    TextArea1.ScrollPosition = TextArea1.LineNumAtCharPos(TextArea1.Text.Len)
		  #endif
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub PrintRequest(Request As String)
		  RequestData = Request
		  While Right(RequestData, 4) <> CRLF + CRLF
		    RequestData = RequestData + CRLF
		  Wend
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
		      Socket.Page = f
		      Me.Caption = "Stop"
		      Socket.KeepListening = True
		      Socket.Listen
		      URLLink.Text = "http://" + Socket.NetworkInterface.IPAddress + ":" + port.Text
		    End If
		  Else
		    Me.Caption = "Listen"
		    Socket.KeepListening = False
		    Socket.Disconnect
		    URLLink.Text = ""
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextArea1
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
