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
   Begin ServerSocket Socket
      Height          =   32
      Index           =   -2147483648
      Left            =   619
      LockedInPosition=   False
      MaximumSocketsConnected=   10
      MinimumSocketsAvailable=   2
      Port            =   0
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   0
      Width           =   32
   End
   Begin HREFArea HTTPLog
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
      Height          =   296
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
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
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   583
   End
   Begin Timer LogTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   619
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   34
      Width           =   32
   End
   Begin Timer ListenTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   619
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   67
      Width           =   32
   End
   Begin ComboBox SecurityLevel
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   "No security\r\nAutomatic\r\nSSLv2 Only\r\nSSLv3 Only\r\nSSLv3 or SSLv2\r\nTLSv1 Only"
      Italic          =   False
      Left            =   313
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   298
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   103
   End
   Begin CheckBox AuthRequired
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Authenticate"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   203
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   301
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   98
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  If Socket.IsListening Then
		    If appQuitting Or MsgBox("Shut down the server?", 32 + 4, "The server is still running") = 6 Then
		      KillAllClients()
		    Else
		      Return True
		    End If
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function AuthenticateHandler(Sender As HTTP.ClientHandler, ClientRequest As HTTP.Request, Username As String, Password As String, Realm As String) As Boolean
		  #pragma Unused Sender
		  #pragma Unused ClientRequest
		  Return (Username = AuthenticationUser) And (Password = AuthenticationPass) And (Realm = AuthenticationRealm)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ConnectedHandler(Sender As HTTP.ClientHandler)
		  msgs.Append(1:"Client connecting from " + Sender.RemoteAddress + CRLF)
		  LogTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleRequestHandler(Sender As HTTP.ClientHandler, ClientRequest As HTTP.Request, ByRef ResponseDocument As HTTP.Response) As Boolean
		  Select Case ClientRequest.Method
		  Case RequestMethod.GET, RequestMethod.HEAD
		    Dim item As FolderItem = HTTP.FindFile(Me.DocumentRoot, ClientRequest.Path.Path)
		    If item <> Nil And Not item.Exists Then item = Nil
		    
		    Select Case True
		    Case item = Nil
		      ResponseDocument = HTTP.ErrorPage(404) ' Not Found
		      
		    Case item.Directory
		      If Not Me.DirectoryBrowsing Then
		        ResponseDocument = HTTP.ErrorPage(403) ' Forbidden
		      Else
		        ResponseDocument = New HTTP.DirectoryIndex(item, ClientRequest.Path.ToString)
		        ResponseDocument.StatusCode = 200
		        HTTP.DirectoryIndex(ResponseDocument).Populate
		      End If
		      
		    Case ClientRequest.Path.Path = "/" And Not item.Directory
		      Dim location As String
		      If Not Sender.Secure Then
		        location = "http://" + Sender.LocalAddress + ":" + Format(Sender.Port, "######") + "/" + Item.Name
		      Else
		        location = "https://" + Sender.LocalAddress + ":" + Format(Sender.Port, "######") + "/" + Item.Name
		      End If
		      ResponseDocument = HTTP.ErrorPage(302, Location) ' Found
		      
		    Else
		      Dim bs As BinaryStream = BinaryStream.Open(item)
		      ResponseDocument.MessageBody = bs.Read(bs.Length)
		      bs.Close
		      ResponseDocument.ContentType = item
		    End Select
		    
		    Select Case True
		    Case ClientRequest.RangeStart > ResponseDocument.MessageBody.LenB, _
		      ClientRequest.RangeStart < 0, _
		      ClientRequest.RangeEnd > ResponseDocument.MessageBody.LenB, _
		      ClientRequest.RangeEnd < 0, _
		      ClientRequest.RangeEnd - ClientRequest.RangeStart > ResponseDocument.MessageBody.LenB, _
		      ClientRequest.RangeEnd < ClientRequest.RangeStart
		      Dim sz As Integer = ResponseDocument.MessageBody.LenB
		      ResponseDocument = HTTP.ErrorPage(416) ' Requested Range is not Satisfiable
		      ResponseDocument.Header("Content-Range") = "bytes */" + Str(sz)
		      
		    Case ClientRequest.RangeEnd - ClientRequest.RangeStart > 0
		      ResponseDocument.StatusCode = 206 'partial content
		      ResponseDocument.Header("Content-Range") = "bytes " + _
		      Str(ClientRequest.RangeStart) + "-" + Str(ClientRequest.RangeEnd) + "/" + Str(ResponseDocument.MessageBody.LenB)
		      ResponseDocument.MessageBody = Mid(ResponseDocument.MessageBody, ClientRequest.RangeStart, ClientRequest.RangeEnd - ClientRequest.RangeStart + 1)
		    End Select
		    
		    ResponseDocument.Header("Content-Length") = Str(ResponseDocument.MessageBody.LenB)
		    Return True
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HTTPDebugHandler(Sender As HTTP.ClientHandler, Message As String, Level As Integer)
		  #pragma Unused Sender
		  msgs.Append(Level:Message)
		  LogTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub KillAllClients()
		  For i As Integer = 0 To UBound(Socks)
		    If Socks(i).Value = Nil Then Continue
		    HTTP.ClientHandler(Socks(i).Value).Disconnect
		  Next
		  ReDim Socks(-1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MessageSentHandler(Sender As HTTP.ClientHandler, Message As HTTP.Response)
		  #pragma Unused Sender
		  msgs.Append(Message)
		  LogTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PeekRequestHandler(Sender As HTTP.ClientHandler, ClientRequest As HTTP.Request)
		  #pragma Unused Sender
		  msgs.Append(ClientRequest)
		  LogTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AuthenticationPass As String
	#tag EndProperty

	#tag Property, Flags = &h0
		AuthenticationRealm As String = "Restricted Area"
	#tag EndProperty

	#tag Property, Flags = &h0
		AuthenticationRequired As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		AuthenticationUser As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CertificateFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		CertificatePassword As String
	#tag EndProperty

	#tag Property, Flags = &h0
		DirectoryBrowsing As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		DocumentRoot As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		EnforceContentType As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected GZip As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected IsListening As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LogLevel As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected msgs() As Variant
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RequestData As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Socks() As WeakRef
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
		      DocumentRoot = f
		      DirectoryBrowsing = True
		      Me.Caption = "Stop"
		      Dim sr As New StyleRun
		      sr.TextColor = &c00000000
		      sr.Text = "Starting up the server..." + CRLF + "Document root is: "
		      HTTPLog.PrintOther(sr)
		      sr.Underline = True
		      sr.TextColor = &c0000FF00
		      sr.Text = DocumentRoot.AbsolutePath
		      HTTPLog.PrintOther(sr, DocumentRoot)
		      sr.Text = CRLF + CRLF
		      sr.Underline = False
		      HTTPLog.PrintOther(sr)
		      Socket.Listen
		      ListenTimer.Mode = Timer.ModeMultiple
		    End If
		  Else
		    Me.Caption = "Listen"
		    Socket.StopListening
		    KillAllClients()
		    Dim sr As New StyleRun
		    sr.TextColor = &c00000000
		    sr.Bold = True
		    sr.Text = "Server stopped." + CRLF + CRLF
		    HTTPLog.PrintOther(sr)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Socket
	#tag Event
		Sub Error(ErrorCode as Integer)
		  PushButton1.Caption = "Listen"
		  Me.StopListening
		  Dim l, r As String
		  l = FormatSocketError(ErrorCode)
		  r = NthField(l, ": ", 2)
		  l = NthField(l, ": ", 1)
		  Dim sr As New StyleRun
		  sr.TextColor = &c80000000
		  sr.Bold = True
		  sr.Text = l
		  HTTPLog.PrintOther(sr)
		  sr.Bold = False
		  sr.Text = ": " + r + CRLF + CRLF
		  HTTPLog.PrintOther(sr)
		  KillAllClients()
		End Sub
	#tag EndEvent
	#tag Event
		Function AddSocket() As TCPSocket
		  Dim sock As New HTTP.ClientHandler
		  AddHandler sock.MessageSent, WeakAddressOf MessageSentHandler
		  AddHandler sock.HandleRequest, WeakAddressOf HandleRequestHandler
		  AddHandler sock.PeekRequest, WeakAddressOf PeekRequestHandler
		  AddHandler sock.Connected, WeakAddressOf ConnectedHandler
		  AddHandler sock.Authenticate, WeakAddressOf AuthenticateHandler
		  AddHandler sock.HTTPDebug, WeakAddressOf HTTPDebugHandler
		  If SecurityLevel.Text <> "No security" Then
		    sock.Secure = True
		    sock.CertificatePassword = CertificatePassword
		    sock.CertificateFile = CertificateFile
		    Select Case SecurityLevel.Text
		    Case "SSLv2 Only"
		      sock.ConnectionType = SSLSocket.SSLv2
		    Case "SSLv3 Only"
		      sock.ConnectionType = SSLSocket.SSLv3
		    Case "SSLv3 or SSLv2"
		      sock.ConnectionType = SSLSocket.SSLv23
		    Case "TLSv1 Only", "Automatic"
		      sock.ConnectionType = SSLSocket.TLSv1
		    End Select
		  End If
		  
		  sock.AuthenticationRequired = AuthenticationRequired
		  sock.AuthenticationRealm = AuthenticationRealm
		  sock.EnforceContentType = EnforceContentType
		  socks.Append(New WeakRef(sock))
		  Return sock
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events HTTPLog
	#tag Event
		Sub Open()
		  Me.TextFont = App.FixedWidthFont
		End Sub
	#tag EndEvent
	#tag Event
		Sub ClickLink(LinkValue As Variant, LinkText As String)
		  Select Case True
		  Case LinkValue IsA HTTP.Request
		    RawViewer.ViewRaw(HTTP.Request(LinkValue))
		    
		  Case LinkValue IsA HTTP.Response
		    RawViewer.ViewRaw(HTTP.Response(LinkValue))
		    
		  Case LinkValue IsA HTTP.URI
		    Dim u As HTTP.URI = HTTP.URI(LinkValue)
		    If u.Scheme = "" Then u.Scheme = "http"
		    If u.Scheme = "https" Then ' client doesn't work with https ATM
		      ShowURL(u.ToString)
		    Else
		      Generator.RequestMain1.URL.Text = u.ToString
		      Generator.RequestMain1.Perform()
		    End If
		    
		  Case LinkValue IsA FolderItem
		    FolderItem(LinkValue).Launch
		    
		  Else
		    SpecIndex.ShowItem(LinkText)
		  End Select
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  base.Append(New MenuItem("Clear log"))
		  Dim squelch As New MenuItem("&Verbosity")
		  
		  Dim verb As New MenuItem("HTTP Only")
		  If LogLevel = 0 Then verb.Checked = True
		  squelch.Append(verb)
		  
		  verb = New MenuItem("Socketry")
		  If LogLevel = 1 Then verb.Checked = True
		  squelch.Append(verb)
		  
		  verb = New MenuItem("Debug")
		  If LogLevel = 2 Then verb.Checked = True
		  squelch.Append(verb)
		  
		  base.Append(squelch)
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Clear log"
		    Me.Clear
		    Return True
		  Case "HTTP Only"
		    LogLevel = 0
		    
		  Case "Socketry"
		    LogLevel = 1
		  Case "Debug"
		    LogLevel = 2
		  End Select
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events LogTimer
	#tag Event
		Sub Action()
		  While msgs.Ubound > -1
		    Dim p As Variant = msgs(0)
		    msgs.Remove(0)
		    Select Case p
		    Case IsA HTTP.Request
		      HTTPLog.PrintRequest(p)
		    Case IsA HTTP.Response
		      HTTPLog.PrintResponse(p)
		    Case IsA Pair
		      Dim pp As Pair = p
		      If pp.Left <= LogLevel Then
		        Dim sr As New StyleRun
		        sr.Font = App.FixedWidthFont
		        sr.Text = pp.Right
		        sr.TextColor = &c00000000
		        HTTPLog.PrintOther(sr)
		      End If
		    Else
		      Break
		    End Select
		  Wend
		  HTTPLog.ScrollToEnd()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ListenTimer
	#tag Event
		Sub Action()
		  If Socket.IsListening Then
		    Dim sr As New StyleRun
		    sr.TextColor = &c00000000
		    sr.Bold = True
		    sr.Text = "Now listening on: "
		    HTTPLog.PrintOther(sr)
		    sr.Bold = False
		    sr.Text = Socket.NetworkInterface.IPAddress + ":" + Format(Socket.Port, "####0")
		    sr.Underline = True
		    Dim u As HTTP.URI = sr.Text
		    HTTPLog.PrintOther(sr, u)
		    sr.Underline = False
		    sr.Text = CRLF + CRLF
		    HTTPLog.PrintOther(sr)
		    Socket.Listen
		    Me.Mode = Timer.ModeOff
		    HTTPLog.ScrollToEnd()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SecurityLevel
	#tag Event
		Sub Change()
		  If Me.Text <> "No security" Then
		    Dim f As FolderItem = CertificateFile
		    Dim s As String = CertificateEntry.GetCert(f, "")
		    If s <> "" And f.Exists Then
		      CertificateFile = f
		      CertificatePassword = s
		    Else
		      Me.ListIndex = 0
		    End If
		  Else
		    CertificateFile.Delete
		    CertificateFile = Nil
		    CertificatePassword = ""
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AuthRequired
	#tag Event
		Sub Action()
		  If Me.Value Then
		    If Authenticator.SetCredentials(AuthenticationUser, AuthenticationPass, AuthenticationRealm, "Set authentication credentials") Then
		      AuthenticationRequired = True
		    Else
		      Me.Value = False
		    End If
		  Else
		    AuthenticationRequired = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
