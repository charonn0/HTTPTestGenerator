#tag Window
Begin Window Generator
   BackColor       =   -256
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   5.74e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1378869247
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "HTTP Request Generator"
   Visible         =   True
   Width           =   9.38e+2
   Begin SSLSocket Sock
      CertificateFile =   ""
      CertificatePassword=   ""
      CertificateRejectionFile=   ""
      ConnectionType  =   2
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   1000
      LockedInPosition=   False
      Scope           =   0
      Secure          =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   35
      Visible         =   True
      Width           =   32
   End
   Begin Timer DataReceivedTimer
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   1000
      LockedInPosition=   False
      Mode            =   0
      Period          =   200
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   79
      Visible         =   True
      Width           =   32
   End
   Begin RequestMain RequestMain1
      AcceptFocus     =   ""
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &hFFFFFF
      Backdrop        =   ""
      Enabled         =   True
      EraseBackground =   False
      HasBackColor    =   False
      Height          =   574
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      Security        =   ""
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   366
   End
   Begin Splitter Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      Height          =   574
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   367
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
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
   Begin ResponseMain ResponseMain1
      AcceptFocus     =   ""
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   16777215
      Backdrop        =   ""
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   574
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   377
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   561
   End
   Begin Timer TimeOut
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   1000
      LockedInPosition=   False
      Mode            =   0
      Period          =   10000
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   123
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  #If DebugBuild Then
		    'RequestMain1.URL.Text = "https://www.google.com/"
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  RequestMain1.Width = Canvas1.Left ' force the UI to update, otherwise the child windows don't resize properly
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function AboutItem() As Boolean Handles AboutItem.Action
			AboutWindow.Show
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function QuitMenu() As Boolean Handles QuitMenu.Action
			Quit()
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SpecIndexMenu() As Boolean Handles SpecIndexMenu.Action
			SpecIndex.ShowItem
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WebServerMenu() As Boolean Handles WebServerMenu.Action
			Dim serv As New MiniServer
			serv.Show
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub CancelRequest()
		  Sock.Disconnect
		  DataReceivedTimer.Mode = Timer.ModeOff
		  TimeOut.Mode = Timer.ModeOff
		  RequestMain1.Sender.Enabled = True
		  RequestMain1.Sender.Caption = "Send Request"
		  RequestMain1.ProgressBar1.Visible = False
		  RequestMain1.StopButton.Visible = False
		  ConnectOK = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CheckRobots(NewRequest As HTTP.Request) As Boolean
		  If Not RequestMain1.HonorRobots.Value Then Return False
		  
		  If mRobots = Nil Then mRobots = New Dictionary
		  Dim rbt As String
		  If mRobots.HasKey(NewRequest.Path.Host) Then
		    rbt = mRobots.Value(NewRequest.Path.Host)
		  Else
		    Dim rurl As New HTTP.URI(NewRequest.Path)
		    rurl.Path = "/robots.txt"
		    Dim file As FolderItem = GetTemporaryFolderItem
		    Dim sck As SocketCore
		    If rurl.Scheme = "https" Then
		      sck = New HTTPSecureSocket
		      HTTPSecureSocket(sck).Secure = True
		      HTTPSecureSocket(sck).ConnectionType = SSLSocket.TLSv1
		      HTTPSecureSocket(sck).Get(rurl.ToString, file)
		    Else
		      sck = New HTTPSocket
		      HTTPSocket(sck).Get(rurl.ToString, file)
		    End If
		    While Not sck.IsConnected And sck.LastErrorCode = 0
		      sck.Poll
		      App.DoEvents
		    Wend
		    While sck.IsConnected And sck.LastErrorCode = 0
		      sck.Poll
		      App.DoEvents
		    Wend
		    If file.Exists And file.Length > 0 Then
		      Dim bs As BinaryStream = BinaryStream.Open(file)
		      rbt = bs.Read(bs.Length)
		      bs.Close
		    Else
		      ResponseMain1.Log("Alert: robots.txt was not found." + EndOfLine.Windows, -1)
		    End If
		    If rbt.Trim <> "" Then mRobots.Value(rurl.Host) = rbt
		  End If
		  
		  
		  
		  
		  Dim blocked As Pair
		  Dim isvalid As Boolean = HTTP.IsRobotBlocked(rbt, NewRequest.Header("User-Agent"), NewRequest.Path.Path, blocked)
		  If isvalid And blocked <> Nil And MsgBox("The User-Agent '" + blocked.Left + "' is not allowed to access '" + blocked.Right + _
		    "' on '" + NewRequest.Path.Host + "'. Would you like to continue anyway?", 48 + 4, "Prohibited by robots.txt") <> 6 Then
		    ResponseMain1.Log("Alert: The request is prohibited by the website's robots.txt file!" + EndOfLine.Windows, -1)
		    CancelRequest()
		    Return True
		  ElseIf blocked <> Nil Then
		    ResponseMain1.Log("Alert: Proceeding with request in defiance of the website's robots.txt file!" + EndOfLine.Windows, -1)
		  Else
		    'ResponseMain1.Log("Alert: robots.txt does not prohibit this request, proceeding normally." + EndOfLine.Windows, -1)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HTTPDebugHandler(Sender As HTTP.Message, Message As String, Level As Integer)
		  #pragma Unused Sender
		  ResponseMain1.Log(Message, Level)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Perform(NewRequest As HTTP.Request)
		  If CurrentRequest <> Nil Then OldRequests.Append(CurrentRequest)
		  If CheckRobots(NewRequest) Then Return
		  
		  CurrentRequest = NewRequest
		  AddHandler CurrentRequest.HTTPDebug, WeakAddressOf HTTPDebugHandler
		  TimeOut.Mode = Timer.ModeSingle
		  Sock.Close
		  Sock.Address = CurrentRequest.Path.Host
		  Select Case RequestMain1.Security
		  Case 1 ' SSL2 only
		    sock.Secure = True
		    sock.ConnectionType = SSLSocket.SSLv2
		  Case 2 ' SSL3 only
		    sock.Secure = True
		    sock.ConnectionType = SSLSocket.SSLv3
		    
		  Case 3 ' SSL2/3
		    sock.Secure = True
		    sock.ConnectionType = SSLSocket.SSLv23
		    
		  Case 4 ' TLS only
		    sock.Secure = True
		    sock.ConnectionType = SSLSocket.TLSv1
		    
		  Else 'auto
		    If CurrentRequest.Path.Scheme = "https" Then
		      Sock.Secure = True
		      sock.ConnectionType = Sock.TLSv1
		    Else
		      Sock.Secure = False
		    End If
		  End Select
		  Dim p As Integer
		  If CurrentRequest.Path.Port > 0 Then
		    p = CurrentRequest.Path.Port
		  ElseIf Sock.Secure Then
		    p = 443
		  Else
		    p = 80
		  End If
		  Sock.Port = p
		  If sock.Secure Then
		    ResponseMain1.Log("Attempting a secure connection to '" + CurrentRequest.Path.Host + "' on port " + Format(p, "#####0") + EndOfLine, 1)
		  Else
		    ResponseMain1.Log("Attempting a connection to '" + CurrentRequest.Path.Host + "' on port " + Format(p, "#####0") + EndOfLine, 1)
		  End If
		  Sock.Connect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadNextResponse() As HTTP.Response
		  If InStr(Sock.Lookahead, CRLF + CRLF) = 0 Then Return Nil
		  Dim data As String = Sock.Read(InStr(Sock.Lookahead, CRLF + CRLF) + 3)
		  Dim h As HTTP.Headers = data
		  Dim body As New MemoryBlock(0)
		  Dim w As New BinaryStream(body)
		  w.Write(data + CRLF + CRLF)
		  Select Case True
		  Case h.CommaSeparatedValues("Content-Length") <> ""
		    Dim length As Integer = CDbl(h.CommaSeparatedValues("Content-Length"))
		    While w.Length < length
		      w.Write(sock.Read(Min(Sock.Lookahead.LenB, (length + data.LenB) - w.Length)))
		    Wend
		  Case h.CommaSeparatedValues("Transfer-Encoding") <> ""
		    Break
		    
		  Case h.CommaSeparatedValues("Connection") = "close"
		    
		  Else
		    Break
		  End Select
		  w.Close
		  Return data
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected BytesReceivedLast As UInt64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected BytesReceivedTotal As UInt64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected BytesSentLast As UInt64
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected BytesSentTotal As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ConnectOK As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentRequest As HTTP.Request
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentResponse As HTTP.Response
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastServerIP As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRobots As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldRequests() As HTTP.Request
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected OldResponses() As HTTP.Response
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PendindResponses() As HTTP.Response
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ResponseBuffer As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SplitterThumb As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events Sock
	#tag Event
		Sub Connected()
		  mLastServerIP = Me.RemoteAddress
		  ConnectOK = True
		  ResponseMain1.Log("Connected to '" + mLastServerIP + "' on port " + Format(CurrentRequest.Path.Port, "#####0") + EndOfLine, 1)
		  TimeOut.Reset
		  ResponseBuffer = ""
		  Self.Title = "HTTP Request Generator - connected to: " + Me.RemoteAddress
		  Dim s As String = CurrentRequest.ToString
		  BytesSentLast = s.LenB
		  BytesSentTotal = BytesSentTotal + BytesSentLast
		  Me.Write(s)
		  RequestMain1.AddHistoryItem(CurrentRequest.Path)
		  ResponseMain1.Log(CurrentRequest, 0)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error()
		  TimeOut.Mode = Timer.ModeOff
		  ResponseMain1.ViewResponse(Nil)
		  
		  RequestMain1.Sender.Enabled = True
		  RequestMain1.Sender.Caption = "Send Request"
		  RequestMain1.ProgressBar1.Visible = False
		  RequestMain1.StopButton.Visible = False
		  ConnectOK = False
		  If Me.LastErrorCode <> 102 Then
		    ResponseMain1.Log(HTTP.FormatSocketError(Me.LastErrorCode), -1)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function SendProgress(BytesSent As Integer, BytesLeft As Integer) As Boolean
		  #pragma Unused BytesLeft
		  TimeOut.Reset
		  'Dim sz As Integer = ResponseBuffer.LenB
		  BytesSentTotal = BytesSentTotal + BytesSent
		  BytesSentLast = BytesSent
		  
		  RequestMain1.SetProgress(BytesSentTotal * 100 / (BytesSentTotal + BytesLeft))
		End Function
	#tag EndEvent
	#tag Event
		Sub DataAvailable()
		  TimeOut.Reset
		  Dim newdata As String = Me.ReadAll
		  ResponseBuffer = ResponseBuffer + newdata
		  BytesReceivedLast = newdata.LenB
		  BytesReceivedTotal = BytesReceivedTotal + BytesReceivedLast
		  ResponseMain1.Log("Receiving data (" + FormatBytes(BytesReceivedLast) + ")...", 2)
		  DataReceivedTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
	#tag Event
		Sub SendComplete(UserAborted As Boolean)
		  ResponseMain1.Log("Sending data (" + FormatBytes(BytesSentLast) + ")...", 2)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DataReceivedTimer
	#tag Event
		Sub Action()
		  If CurrentResponse <> Nil Then OldResponses.Append(CurrentResponse)
		  CurrentResponse = ResponseBuffer'ReadNextResponse
		  If CurrentResponse = Nil Then Return
		  CurrentResponse.Path = New HTTP.URI(CurrentRequest.Path)
		  ResponseMain1.ViewResponse(CurrentResponse)
		  
		  Self.Title = "HTTP Request Generator - Viewing '" + CurrentRequest.Path.ToString + "'"
		  ResponseMain1.Log(CurrentResponse, 0)
		  
		  Select Case CurrentResponse.StatusCode
		  Case 301, 302, 307, 308
		    Dim redir As String = CurrentResponse.Header("Location")
		    Dim u As HTTP.URI = redir
		    If u.Host = "" Then
		      u = CurrentRequest.Path
		      u.Path = redir
		    End If
		    If MsgBox("Response redirects to: " + u.ToString + ". Follow redirection?", 4 + 32, "HTTP Redirect") = 6 Then
		      If CurrentRequest.MethodName <> "GET" And (CurrentResponse.StatusCode = 301 Or CurrentResponse.StatusCode = 302) Then
		        Dim msg As String = "Would you like to convert the request method from '" + CurrentRequest.MethodName + "' to 'GET'?"
		        If MsgBox(msg, 4 + 32, "Client behavior compatibility option") = 6 Then RequestMain1.RequestMethod.ListIndex = 0
		      End If
		      RequestMain1.URL.Text = u.ToString
		      RequestMain1.Perform()
		    End If
		  Case 401
		    Dim r As String = NthField(CurrentResponse.Header("WWW-Authenticate"), "=", 2)
		    Dim p As Pair = Authenticator.Authenticate(r, Sock.Secure, CurrentRequest.Path.Host, mLastServerIP)
		    If p <> Nil Then
		      Dim s As String = "Basic " + EncodeBase64(p.Left + ":" + p.Right)
		      RequestMain1.DeleteRequestHeader("Authorization")
		      RequestMain1.SetRequestHeader("Authorization", s)
		      RequestMain1.Perform()
		    End If
		  End Select
		  Select Case Sock.LastErrorCode
		  Case 102
		    If Not ConnectOK And Sock.Secure And RequestMain1.Security > 0 Then ' might be a problem with our ciphersuite
		      ResponseMain1.Log("Error: Secure connection failed.", -1)
		      ResponseMain1.Log("This may be due to an incompatible SSL/TLS version, in which case setting the connection security to ""Automatic"" might resolve the error." + EndOfLine, 1)
		    Else
		      ResponseMain1.Log(FormatSocketError(Sock.LastErrorCode) + EndOfLine, 1)
		    End If
		    
		  Case 103
		    ResponseMain1.Log(FormatSocketError(Sock.LastErrorCode) + EndOfLine, -1)
		  Case 0 ' no error
		    ' meh
		  Else
		    ResponseMain1.Log(FormatSocketError(Sock.LastErrorCode) + EndOfLine, -1)
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RequestMain1
	#tag Event
		Sub Perform(NewRequest As HTTP.Request)
		  If NewRequest <> Nil Then
		    RequestMain1.Sender.Enabled = False
		    RequestMain1.Sender.Caption = "Sending..."
		    RequestMain1.ProgressBar1.Visible = True
		    RequestMain1.StopButton.Visible = True
		    Self.Perform(NewRequest)
		  Else
		    CancelRequest()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Moved(DeltaX As Integer, DeltaY As Integer)
		  #pragma Unused DeltaX
		  #pragma Unused DeltaY
		  'If Sign(DeltaX) = -1 Then Break
		  ResponseMain1.Left = Me.Left + Me.Width + 1
		  ResponseMain1.Width = Self.Width - ResponseMain1.Left
		  RequestMain1.Width = Me.Left
		  Me.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResponseMain1
	#tag Event
		Sub Open()
		  #If TargetWin32 Then
		    Me.DoubleBuffer = True
		    Me.EraseBackground = False
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimeOut
	#tag Event
		Sub Action()
		  If MsgBox("Request timed out. Keep waiting?", 4 + 48, "No response") = 6 Then
		    Me.Reset
		  Else
		    Sock.Disconnect
		    ResponseMain1.Log("Error: Timed out.", -1)
		    RequestMain1.Sender.Enabled = True
		    RequestMain1.Sender.Caption = "Send Request"
		    RequestMain1.ProgressBar1.Visible = False
		    RequestMain1.StopButton.Visible = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
