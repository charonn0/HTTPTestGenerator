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
   MenuBar         =   0
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
      Top             =   14
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
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
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
      EraseBackground =   False
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
		Function KeyDown(Key As String) As Boolean
		  If key = Chr(&h09) And Keyboard.AsyncControlKey Then 'ctrl+tab
		    If Keyboard.AsyncShiftKey Then
		      If ResponseMain1.Tabpanel1.Value = 0 Then
		        ResponseMain1.Tabpanel1.Value = ResponseMain1.Tabpanel1.PanelCount - 1
		      Else
		        ResponseMain1.Tabpanel1.Value = ResponseMain1.Tabpanel1.Value - 1
		      End If
		    Else
		      If ResponseMain1.Tabpanel1.Value = ResponseMain1.Tabpanel1.PanelCount - 1 Then
		        ResponseMain1.Tabpanel1.Value = 0
		      Else
		        ResponseMain1.Tabpanel1.Value = ResponseMain1.Tabpanel1.Value + 1
		      End If
		    End If
		    Return True
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub Generate()
		  mTheURL = Nil
		  Me.Request = New HTTP.Request()
		  Me.Request.Method = HTTP.Method(RequestMain1.RequestMethod.Text)
		  If Me.Request.Method = HTTP.RequestMethod.InvalidMethod Then Me.Request.MethodName = RequestMain1.RequestMethod.Text
		  Me.Request.Path = theURL
		  If Me.Request.path.ServerPath = "" Then Me.Request.path.ServerPath = "/"
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
		  If TheURL.Username <> "" Or TheURL.Password <> "" Then
		    If MsgBox("Auto-set HTTP Authorization header?", 4 + 32, "User credentials detected in URL") = 6 Then
		      Request.SetHeader("Authorization") = "Basic " + EncodeBase64(TheURL.Username + ":" + TheURL.Password)
		    End If
		  End If
		  
		  If Request = Nil Then Generate()
		  For i As Integer = 0 To RequestMain1.RequestHeaders.ListCount - 1
		    Me.Request.SetHeader(RequestMain1.RequestHeaders.Cell(i, 0)) = RequestMain1.RequestHeaders.Cell(i, 1)
		  Next
		  
		  If Not Me.Request.HasHeader("Host") And Me.Request.ProtocolVersion >= 1.1 Then
		    Me.Request.SetHeader("Host") = theURL.FQDN
		  End If
		  
		  If Not Me.Request.HasHeader("Connection") And Me.Request.ProtocolVersion >= 1.1 Then
		    Me.Request.SetHeader("Connection") = "close"
		  End If
		  
		  If Me.Request.Headers.AcceptableTypes.Ubound <= -1 Then
		    Me.Request.SetHeader("Accept") = "*/*"
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Perform()
		  TimeOut.Mode = Timer.ModeSingle
		  Sequence = Sequence + 1
		  Output = ""
		  Generate()
		  Sock.Close
		  Sock.Address = theURL.FQDN
		  If Request.Path.Protocol = "https" Then
		    Sock.Secure = True
		  Else
		    Sock.Secure = False
		  End If
		  If theURL.Port <> 0 Then
		    Sock.Port = theURL.Port
		  ElseIf Sock.Secure Then
		    sock.Port = 443
		  Else
		    Sock.Port = 80
		  End If
		  
		  If Sock.Secure Then
		    PrintLog("Attempting a secure connection to '" + TheURL.FQDN + "' on port " + Str(Sock.Port) + "...")
		  Else
		    PrintLog("Attempting a connection to '" + TheURL.FQDN + "' on port " + Str(Sock.Port) + "...")
		  End If
		  
		  Sock.Connect()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PrintLog(Line As String)
		  Dim sr As New StyleRun
		  sr.Text = Line + EndOfLine
		  Select Case Sequence Mod 2
		  Case 0
		    sr.TextColor = &c00000000
		  Case 1
		    sr.TextColor = &c80808000
		  End Select
		  sr.Font = App.FixedWidthFont
		  RequestMain1.LogOutput.StyledText.AppendStyleRun(sr)
		  RequestMain1.LogOutput.ScrollPosition = RequestMain1.LogOutput.ScrollPosition + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PrintOutput(Req As String, Resp As String)
		  Dim l As Integer = CountFields(req, CRLF) + CountFields(resp, CRLF) + 2
		  Dim sr As New StyleRun
		  sr.Text = "-----" + Format(Sequence, "000000000") + "-----" + CRLF
		  sr.TextColor = &c80808000
		  ResponseMain1.OutputLog.StyledText.AppendStyleRun(sr)
		  sr.Text = req
		  sr.TextColor = &c00800000
		  sr.Font = ResponseMain1.OutputLog.TextFont
		  ResponseMain1.OutputLog.StyledText.AppendStyleRun(sr)
		  sr.Text = resp
		  sr.TextColor = &c0000FF00
		  ResponseMain1.OutputLog.StyledText.AppendStyleRun(sr)
		  ResponseMain1.OutputLog.ScrollPosition = ResponseMain1.OutputLog.ScrollPosition + l
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Update(Raw As String)
		  Response = New HTTP.Response(Raw)
		  Response.Path = TheURL
		  ResponseMain1.Code.Text = Str(Response.StatusCode) + " " + HTTP.CodeToMessage(Response.StatusCode)
		  Select Case Response.StatusCode
		  Case 200, 206
		    ResponseMain1.Code.TextColor = &c00808000
		  Case 301, 302, 304
		    ResponseMain1.Code.TextColor = &c00800000
		  Case 204, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 422, 426, 500, 501, 502, 503, 504, 505, 506, 509
		    ResponseMain1.Code.TextColor = &cFF000000
		    
		  End Select
		  ResponseMain1.ResponseHeaders.DeleteAllRows
		  For i As Integer = 0 To Response.Headers.Count - 1
		    Dim n, v As String
		    n = Response.Headers.Name(i)
		    v = Response.Headers.Value(n)
		    
		    ResponseMain1.ResponseHeaders.AddRow(n, v)
		  Next
		  'ResponseMain1.CookiesButton.Visible = Response.Headers.CookieCount > 0
		  ResponseMain1.CookieList.DeleteAllRows
		  For i As Integer = 0 To Response.Headers.CookieCount - 1
		    Dim c As HTTPParse.Cookie = Response.Headers.Cookie(i)
		    ResponseMain1.CookieList.AddRow("")
		    Dim d As New Date
		    ResponseMain1.CookieList.Cell(ResponseMain1.CookieList.LastIndex, 0) = c.Name
		    ResponseMain1.CookieList.Cell(ResponseMain1.CookieList.LastIndex, 1) = c.Value
		    If c.Expires <> Nil And c.Expires.TotalSeconds - d.TotalSeconds >= 3600 Then
		      ResponseMain1.CookieList.Cell(ResponseMain1.CookieList.LastIndex, 2) = c.Expires.ShortDate + " " + c.Expires.ShortTime + " UTC " + Format(c.Expires.GMTOffset, "+-#0.0#")
		    Else
		      ResponseMain1.CookieList.Cell(ResponseMain1.CookieList.LastIndex, 2) = "End of session"
		    End If
		    ResponseMain1.CookieList.Cell(ResponseMain1.CookieList.LastIndex, 3) = c.Domain
		    ResponseMain1.CookieList.Cell(ResponseMain1.CookieList.LastIndex, 4) = c.Path
		    If c.Secure Then
		      ResponseMain1.CookieList.Cell(ResponseMain1.CookieList.LastIndex, 5) = "HTTPS Only"
		    Else
		      ResponseMain1.CookieList.Cell(ResponseMain1.CookieList.LastIndex, 5) = "HTTP Only"
		    End If
		    ResponseMain1.CookieList.RowTag(ResponseMain1.CookieList.LastIndex) = c
		  Next
		  
		  Self.Title = "HTTP Request Generator - Viewing '" + TheURL.ToString + "'"
		  If Sock.IsConnected Then
		    'ResponseMain1.IPAddress1.Text = "Open"
		    'ResponseMain1.IPAddress.TextColor = &c00804000
		  Else
		    'ResponseMain1.IPAddress1.Text = "Closed by server"
		    'ResponseMain1.IPAddress1.TextColor = &c80808000
		    'ResponseMain1.IPAddress.TextColor = &c80808000
		  End If
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

	#tag Property, Flags = &h21
		Private mSequence As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTheURL As HTTP.URI
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSequence
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSequence = value
			  PrintLog("Sequence: #" + Format(value, "000000000"))
			End Set
		#tag EndSetter
		Sequence As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private SplitterThumb As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mTheURL = Nil Then
			    mTheURL = New HTTP.URI(RequestMain1.URL.Text)
			  End If
			  return mTheURL
			End Get
		#tag EndGetter
		TheURL As HTTP.URI
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events Sock
	#tag Event
		Sub Connected()
		  TimeOut.Reset
		  If Me.Secure Then
		    Select Case Me.ConnectionType
		    Case Me.SSLv2
		      PrintLog("Secure connection established using SSLv2 only!.")
		    Case Me.SSLv23
		      PrintLog("Secure connection established using SSLv2 or SSLv3.")
		    Case Me.SSLv3
		      PrintLog("Secure connection established using SSLv3.")
		    Case Me.TLSv1
		      PrintLog("Secure connection established using TLSv1.")
		    End Select
		  Else
		    PrintLog("Connection established.")
		  End If
		  PrintLog("Remote host is at " + Me.RemoteAddress)
		  Output = ""
		  Self.Title = "HTTP Request Generator - connected to: " + Me.RemoteAddress
		  Dim s As String = Request.ToString
		  PrintLog("Sending request... (" + FormatBytes(s.LenB) + ")")
		  Me.Write(s)
		  SendSz = 0
		  RequestMain1.URL.AddItem(RequestMain1.URL.Text)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DataAvailable()
		  TimeOut.Reset
		  If DataReceivedTimer.Mode = Timer.ModeOff Then
		    PrintLog("Receiving data...")
		  End If
		  Output = Output + Me.ReadAll
		  RawText = Self.Request.ToString
		  DataReceivedTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error()
		  TimeOut.Mode = Timer.ModeOff
		  PrintLog(SocketErrorMessage(Me.LastErrorCode))
		  Select Case Me.LastErrorCode
		  Case 102
		    'ResponseMain1.IPAddress.Text = "Closed by host"
		    'ResponseMain1.IPAddress.TextColor = &c80808000
		    
		  Case 103
		    ResponseMain1.Code.Text = SocketErrorMessage(Me.LastErrorCode)
		    ResponseMain1.ResponseHeaders.DeleteAllRows
		  Else
		    ResponseMain1.Code.TextColor = &cFF000000
		    ResponseMain1.Code.Text = SocketErrorMessage(Me.LastErrorCode)
		  End Select
		  RequestMain1.Sender.Enabled = True
		  RequestMain1.Sender.Caption = "Send Request"
		  RequestMain1.ProgressBar1.Visible = False
		  RequestMain1.StopButton.Visible = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub SendComplete(UserAborted As Boolean)
		  If Not UserAborted Then
		    PrintLog("Send operation completed.")
		  Else
		    PrintLog("Send operation aborted!")
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function SendProgress(BytesSent As Integer, BytesLeft As Integer) As Boolean
		  Dim sz As Integer = MessageBodyRaw.LenB
		  SendSz = SendSz + BytesSent
		  RequestMain1.SetProgress(SendSz * 100 / sz)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events DataReceivedTimer
	#tag Event
		Sub Action()
		  Update(Output)
		  Dim resp, out As String
		  resp = NthField(Output, CRLF + CRLF, 1) + CRLF + CRLF
		  Out = Replace(Output, resp, "")
		  PrintOutput(RawText, resp)
		  ResponseMain1.OutputViewer1.TextArea1.Text = out
		  Dim bs As New BinaryStream(Out)
		  ResponseMain1.OutputViewer1.HexViewer1.ShowData(bs)
		  ResponseMain1.OutputViewer1.HexViewer1.Invalidate
		  ResponseMain1.OutputViewer1.ScrollBar1.Value = 0
		  ResponseMain1.OutputViewer1.ScrollBar1.Maximum = ResponseMain1.OutputViewer1.HexViewer1.LineCount
		  
		  If Response.StatusCode = 301 Or Response.StatusCode = 302 Then
		    Dim redir As String = Response.GetHeader("Location")
		    Dim u As New HTTP.URI(redir)
		    If u.FQDN = "" Then
		      u = New HTTP.URI(TheURL)
		      u.ServerPath = redir
		    End If
		    PrintLog("Redirect (" + Str(Response.StatusCode) + "): " + u.ToString)
		    If MsgBox("Response redirects to: " + u.ToString + ". Follow redirection?", 4 + 32, "HTTP Redirect") = 6 Then
		      PrintLog("Following...")
		      RequestMain1.URL.Text = u.ToString
		      Perform()
		    Else
		      PrintLog("Not following.")
		    End If
		  ElseIf Response.StatusCode = 401 Then
		    PrintLog("Not authenticated.")
		    Dim r As String = NthField(Response.Headers.Value("WWW-Authenticate"), "=", 2)
		    Dim p As Pair = Authenicator.Authenticate(r, Response.Path.Protocol = "https")
		    If p <> Nil Then
		      PrintLog("Authenticating...")
		      Dim s As String = "Basic " + EncodeBase64(p.Left + ":" + p.Right)
		      RequestMain1.RequestHeaders.AddRow("Authorization", s)
		      RequestMain1.RequestHeaders.RowTag(RequestMain1.RequestHeaders.LastIndex) = "Authorization":s
		      Perform()
		    End If
		  End If
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
		    RequestMain1.Sender.Enabled = True
		    RequestMain1.Sender.Caption = "Send Request"
		    RequestMain1.ProgressBar1.Visible = False
		    RequestMain1.StopButton.Visible = False
		    Sock.Close
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub GenerateHeaders()
		  Self.GenerateHeaders
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Moved(DeltaX As Integer, DeltaY As Integer)
		  'If Sign(DeltaX) = -1 Then Break
		  ResponseMain1.Left = Me.Left + Me.Width + 1
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
#tag EndEvents
#tag Events TimeOut
	#tag Event
		Sub Action()
		  If MsgBox("Request timed out. Keep waiting?", 4 + 48, "No response") = 6 Then
		    Me.Reset
		  Else
		    Sock.Close
		    PrintLog("Canceled.")
		    ResponseMain1.Code.TextColor = &c80808000
		    ResponseMain1.Code.Text = "Timed out."
		    RequestMain1.Sender.Enabled = True
		    RequestMain1.Sender.Caption = "Send Request"
		    RequestMain1.ProgressBar1.Visible = False
		    RequestMain1.StopButton.Visible = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
