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
      Height          =   32
      Index           =   -2147483648
      Left            =   1000
      LockedInPosition=   False
      Scope           =   0
      Secure          =   ""
      TabPanelIndex   =   0
      Top             =   35
      Width           =   32
   End
   Begin Timer DataReceivedTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   1000
      LockedInPosition=   False
      Mode            =   0
      Period          =   200
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   79
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
      InitialParent   =   ""
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
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
      Height          =   32
      Index           =   -2147483648
      Left            =   1000
      LockedInPosition=   False
      Mode            =   0
      Period          =   10000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   123
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


	#tag Method, Flags = &h21
		Private Sub Generate()
		  Me.Request = ""
		  Me.Request.Method = HTTP.Method(RequestMain1.RequestMethod.Text)
		  If Me.Request.Method = HTTP.RequestMethod.InvalidMethod Then Me.Request.MethodName = RequestMain1.RequestMethod.Text
		  Me.Request.Path = RequestMain1.URL.Text
		  Me.Request.Path.Fragment = ""
		  If Me.Request.path.Path = "" Then Me.Request.path.Path = "/"
		  Me.Request.ProtocolVersion = CDbl(NthField(RequestMain1.ProtocolVer.Text, "/", 2))
		  GenerateHeaders()
		  Me.Request.MessageBody = MessageBodyRaw
		  
		  
		  'If gziprequest.Value Then
		  'Me.Request.SetHeader("Accept-Encoding", "gzip")
		  'End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GenerateHeaders()
		  If Request = Nil Then Return
		  
		  If Request.Path.Username <> "" Or Request.Path.Password <> "" Then
		    If MsgBox("Auto-set HTTP Authorization header?", 4 + 32, "User credentials detected in URL") = 6 Then
		      Request.Header("Authorization") = "Basic " + EncodeBase64(Request.Path.Username + ":" + Request.Path.Password)
		    End If
		  End If
		  
		  For i As Integer = 0 To RequestMain1.RequestHeaders.ListCount - 1
		    Me.Request.Header(RequestMain1.RequestHeaders.Cell(i, 0), True) = RequestMain1.RequestHeaders.Cell(i, 1)
		  Next
		  
		  If Not Me.Request.HasHeader("Host") And Me.Request.ProtocolVersion >= 1.1 Then
		    Me.Request.Header("Host") = Request.Path.Host
		  End If
		  
		  If Not Me.Request.HasHeader("Connection") And Me.Request.ProtocolVersion >= 1.1 Then
		    Me.Request.Header("Connection") = "close"
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Perform()
		  TimeOut.Mode = Timer.ModeSingle
		  Output = ""
		  Generate()
		  Sock.Close
		  Sock.Address = Request.Path.Host
		  If Request.Path.Scheme = "https" Then
		    Sock.Secure = True
		  Else
		    Sock.Secure = False
		  End If
		  If Request.Path.Port > 0 Then
		    Sock.Port = Request.Path.Port
		  ElseIf Sock.Secure Then
		    sock.Port = 443
		  Else
		    Sock.Port = 80
		  End If
		  
		  Sock.Connect()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PrintOutput(Req As HTTP.Request, Resp As HTTP.Response)
		  ResponseMain1.Log(Req, 0)
		  ResponseMain1.Log(Resp, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Update(Raw As String)
		  Response = Raw
		  Response.Path = New HTTP.URI(Request.Path)
		  ResponseMain1.ViewResponse(Response)
		  
		  Self.Title = "HTTP Request Generator - Viewing '" + Request.Path.ToString + "'"
		  '#If HTTP.GZIPAvailable Then
		  'If Response.GetHeader("Content-Encoding") = "gzip" Then
		  'Me.Response.MessageBody = GZip.Uncompress(Me.Response.MessageBody, Me.Response.MessageBody.LenB^2)
		  'End If
		  '#endif
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MessageBodyRaw As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Output As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RawText As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Request As HTTP.Request
	#tag EndProperty

	#tag Property, Flags = &h0
		RequestURL As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Response As HTTP.Response
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SendSz As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SplitterThumb As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events Sock
	#tag Event
		Sub Connected()
		  TimeOut.Reset
		  Output = ""
		  Self.Title = "HTTP Request Generator - connected to: " + Me.RemoteAddress
		  Dim s As String = Request.ToString
		  Me.Write(s)
		  SendSz = 0
		  RequestMain1.AddHistoryItem(RequestMain1.URL.Text)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error()
		  TimeOut.Mode = Timer.ModeOff
		  ResponseMain1.ViewResponse(Nil)
		  Select Case Me.LastErrorCode
		  Case 102
		    'ResponseMain1.IPAddress.Text = "Closed by host"
		    'ResponseMain1.IPAddress.TextColor = &c80808000
		    
		  Case 103
		    ResponseMain1.Log(FormatSocketError(Me.LastErrorCode), -1)
		  Else
		    ResponseMain1.Log(FormatSocketError(Me.LastErrorCode), -1)
		  End Select
		  RequestMain1.Sender.Enabled = True
		  RequestMain1.Sender.Caption = "Send Request"
		  RequestMain1.ProgressBar1.Visible = False
		  RequestMain1.StopButton.Visible = False
		End Sub
	#tag EndEvent
	#tag Event
		Function SendProgress(BytesSent As Integer, BytesLeft As Integer) As Boolean
		  #pragma Unused BytesLeft
		  Dim sz As Integer = MessageBodyRaw.LenB
		  SendSz = SendSz + BytesSent
		  RequestMain1.SetProgress(SendSz * 100 / sz)
		End Function
	#tag EndEvent
	#tag Event
		Sub DataAvailable()
		  TimeOut.Reset
		  Output = Output + Me.ReadAll
		  RawText = Self.Request.ToString
		  DataReceivedTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DataReceivedTimer
	#tag Event
		Sub Action()
		  Update(Output)
		  Dim resp, out As String
		  resp = NthField(Output, CRLF + CRLF, 1) + CRLF + CRLF
		  Out = Replace(Output, resp, "")
		  PrintOutput(Request, Response)
		  If Response.HasHeader("Content-Type") Then
		    Dim tp As ContentType = Response.Header("Content-Type")
		    If tp.CharSet <> Nil Then
		      Out = DefineEncoding(Out, tp.CharSet)
		    End If
		  End If
		  
		  If Response.ContentType = "message/http" Then
		    out = DefineEncoding(out, Encodings.UTF8)
		    out = ReplaceAll(out, CRLF, &u00B6 + EndOfLine.Windows) ' pilcrow
		  End If
		  
		  Select Case Response.StatusCode
		  Case 301, 302, 307, 308
		    Dim redir As String = Response.Header("Location")
		    Dim u As HTTP.URI = redir
		    If u.Host = "" Then
		      u = Request.Path
		      u.Path = redir
		    End If
		    If MsgBox("Response redirects to: " + u.ToString + ". Follow redirection?", 4 + 32, "HTTP Redirect") = 6 Then
		      RequestMain1.URL.Text = u.ToString
		      Perform()
		    End If
		  Case 401
		    Dim r As String = NthField(Response.Header("WWW-Authenticate"), "=", 2)
		    Dim p As Pair = Authenicator.Authenticate(r, Response.Path.Scheme = "https")
		    If p <> Nil Then
		      Dim s As String = "Basic " + EncodeBase64(p.Left + ":" + p.Right)
		      RequestMain1.RequestHeaders.AddRow("Authorization", s)
		      RequestMain1.RequestHeaders.RowTag(RequestMain1.RequestHeaders.LastIndex) = "Authorization":s
		      Perform()
		    End If
		  End Select
		  'Self.Refresh
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RequestMain1
	#tag Event
		Function GetMessageData() As String
		  Return MessageBodyRaw
		End Function
	#tag EndEvent
	#tag Event
		Function GetRequest() As HTTP.Request
		  Return Request
		End Function
	#tag EndEvent
	#tag Event
		Function GetResponse() As HTTP.Response
		  Return Response
		End Function
	#tag EndEvent
	#tag Event
		Sub SetMessageData(Data As String)
		  MessageBodyRaw = Data
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  #If TargetWin32 Then
		    Me.DoubleBuffer = True
		    Me.EraseBackground = False
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub Perform(Cancel As Boolean)
		  If Not Cancel Then
		    RequestMain1.Sender.Enabled = False
		    RequestMain1.Sender.Caption = "Sending..."
		    RequestMain1.ProgressBar1.Visible = True
		    RequestMain1.StopButton.Visible = True
		    'RequestMain1.Refresh
		    Perform()
		  Else
		    Sock.Disconnect
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub GenerateHeaders()
		  Self.GenerateHeaders
		End Sub
	#tag EndEvent
	#tag Event
		Sub Generate()
		  Self.Generate
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
		    ResponseMain1.Log("Timed out.", -1)
		    RequestMain1.Sender.Enabled = True
		    RequestMain1.Sender.Caption = "Send Request"
		    RequestMain1.ProgressBar1.Visible = False
		    RequestMain1.StopButton.Visible = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
