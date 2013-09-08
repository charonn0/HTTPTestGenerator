#tag Window
Begin Window Generator
   BackColor       =   -256
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   3.35e+2
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
   Width           =   7.47e+2
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   332
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   377
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "HTTP\rRaw"
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   1
      Visible         =   True
      Width           =   370
      Begin TextArea OutputLog
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
         Height          =   118
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   388
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   202
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   343
      End
      Begin HexViewer HexViewer1
         AcceptFocus     =   True
         AcceptTabs      =   True
         AutoDeactivate  =   True
         Backdrop        =   ""
         Bold            =   ""
         Border          =   True
         BorderColor     =   "&c808080"
         ByteBackgroundColor=   "&cFFFFFF00"
         ByteBackgroundColorAlt=   "&cC0C0C000"
         ByteColor       =   "&c0000FF00"
         BytesLittleEndian=   True
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   False
         GutterColor     =   "&cFFFFFF00"
         GutterColorAlt  =   "&cC0C0C000"
         Height          =   295
         HelpTag         =   ""
         Hilight         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   383
         LineNumbersColor=   "&c80000000"
         LineNumbersLittleEndian=   False
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         ShowOffsets     =   True
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextBackGroundColor=   "&cFFFFFF00"
         TextBackGroundColorAlt=   "&cC0C0C000"
         TextSize        =   ""
         Top             =   30
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   342
      End
      Begin ScrollBar ScrollBar1
         AcceptFocus     =   true
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   295
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   725
         LineStep        =   1
         LiveScroll      =   ""
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   100
         Minimum         =   0
         PageStep        =   20
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   30
         Value           =   0
         Visible         =   True
         Width           =   16
      End
      Begin Listbox ResponseHeaders
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
         Height          =   119
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Header Name	Header Value"
         Italic          =   False
         Left            =   388
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
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   52
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   343
         _ScrollWidth    =   -1
      End
      Begin PlacardButton ResponseHeaderView
         AcceptFocus     =   False
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   ""
         Bold            =   False
         DoubleBuffer    =   False
         Enabled         =   False
         EraseBackground =   True
         Height          =   25
         HelpTag         =   "Expanded Header View"
         Hilight         =   ""
         Icon            =   1571842047
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   706
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         Sticky          =   ""
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         TextColor       =   "&c00000000"
         textColorDown   =   "&c000000"
         TextFont        =   "System"
         TextSize        =   0
         Top             =   173
         Underline       =   False
         UseFocusRing    =   True
         Value           =   False
         Visible         =   True
         Width           =   25
      End
      Begin PlacardButton CookiesButton
         AcceptFocus     =   False
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   ""
         Bold            =   False
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   25
         HelpTag         =   ""
         Hilight         =   ""
         Icon            =   17051647
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   680
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         Sticky          =   ""
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         TextColor       =   "&c00000000"
         textColorDown   =   "&c000000"
         TextFont        =   "System"
         TextSize        =   0
         Top             =   173
         Underline       =   False
         UseFocusRing    =   True
         Value           =   False
         Visible         =   False
         Width           =   25
      End
      Begin Label Label3
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   391
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   1
         Text            =   "Response Headers"
         TextAlign       =   1
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   33
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   330
      End
      Begin Label Code
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   449
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   8
         TabPanelIndex   =   1
         Text            =   "000 No Error Code"
         TextAlign       =   0
         TextColor       =   "&cFF000000"
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   175
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   221
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   391
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   1
         Text            =   "Status:"
         TextAlign       =   2
         TextColor       =   "&c00000000"
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   175
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   54
      End
   End
   Begin SSLSocket Sock
      CertificateFile =   ""
      CertificatePassword=   ""
      CertificateRejectionFile=   ""
      ConnectionType  =   2
      Height          =   32
      Index           =   -2147483648
      Left            =   799
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
      Left            =   753
      LockedInPosition=   False
      Mode            =   0
      Period          =   200
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   14
      Width           =   32
   End
   Begin Label IPAddress
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   520
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   25
      TabPanelIndex   =   0
      Text            =   "000.000.000.000"
      TextAlign       =   2
      TextColor       =   "&c0000FF00"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   221
   End
   Begin RequestMain RequestMain1
      AcceptFocus     =   ""
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &hFFFFFF
      Backdrop        =   ""
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   335
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   366
   End
   Begin Canvas Canvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   332
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
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   8
   End
End
#tag EndWindow

#tag WindowCode
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
		  
		  Sock.Connect()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Update(Raw As String)
		  Response = New HTTP.Response(Raw)
		  Response.Path = TheURL
		  Code.Text = Str(Response.StatusCode) + " " + HTTP.CodeToMessage(Response.StatusCode)
		  Select Case Response.StatusCode
		  Case 200, 206
		    Code.TextColor = &c00808000
		  Case 301, 302, 304
		    Code.TextColor = &c00800000
		  Case 204, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 422, 426, 500, 501, 502, 503, 504, 505, 506, 509
		    Code.TextColor = &cFF000000
		    
		  End Select
		  ResponseHeaders.DeleteAllRows
		  For i As Integer = 0 To Response.Headers.Count - 1
		    Dim n, v As String
		    n = Response.Headers.Name(i)
		    v = Response.Headers.Value(n)
		    
		    ResponseHeaders.AddRow(n, v)
		  Next
		  CookiesButton.Visible = Response.Headers.CookieCount > 0
		  CookiesButton.Icon = cookie_icon_grey
		  CookiesButton.Invalidate(True)
		  CookiesButton.HelpTag = Str(Response.Headers.CookieCount) + " cookies"
		  ResponseHeaderView.Enabled = True
		  ResponseHeaderView.Icon = expand_icon
		  
		  If Sock.IsConnected Then
		    'IPAddress1.Text = "Open"
		    IPAddress.TextColor = &c00804000
		  Else
		    'IPAddress1.Text = "Closed by server"
		    'IPAddress1.TextColor = &c80808000
		    IPAddress.TextColor = &c80808000
		  End If
		  '#If HTTP.GZIPAvailable Then
		  'If Response.GetHeader("Content-Encoding") = "gzip" Then
		  'Me.Response.MessageBody = GZip.Uncompress(Me.Response.MessageBody, Me.Response.MessageBody.LenB^2)
		  'End If
		  '#endif
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private LastSplitterPos As Integer = &hFFFFFF
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MessageBodyRaw As String
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

#tag Events HexViewer1
	#tag Event
		Sub Open()
		  ' try to pick a fixed-width font
		  For i As Integer = FontCount - 1 DownTo 0
		    Dim fontname As String = Font(i)
		    If Left(fontname, 1) <> "@" Then
		      If fontname = "Courier" Or fontname = "Consolas" Then
		        Me.TextFont = fontname
		        Exit For
		      End If
		      If InStr(fontname, " mono") > 0 Or InStr(fontname, " fixed") > 0 Then
		        Me.TextFont = fontname
		      End If
		    End If
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Function Scrolled(LinesDelta As Integer, BytesDelta As Integer) As Boolean
		  #pragma Unused BytesDelta
		  ScrollBar1.Value = ScrollBar1.Value + LinesDelta
		  ScrollBar1.Maximum = Me.LineCount
		  Return True ' Since we're updating the offset in ScrollBar1.ValueChanged, we return true to prevent the HexViewer from updating it too.
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Dim i As Integer = Me.OffsetFromXY(X, Y)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ScrollBar1
	#tag Event
		Sub ValueChanged()
		  HexViewer1.Offset = Me.Value * HexViewer1.LineLength
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResponseHeaderView
	#tag Event
		Sub ValueChanged()
		  HeaderViewer.ShowHeaders(Response.Headers)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CookiesButton
	#tag Event
		Sub Open()
		  Me.Icon = cookie_icon_grey
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  Me.Icon = cookie_icon
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.Icon = cookie_icon_grey
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Dim allcookies() As Cookie
		  For i As Integer = 0 To Response.Headers.CookieCount - 1
		    allcookies.Append(Response.Headers.Cookie(i))
		  Next
		  CookieViewer.ShowCookies(AllCookies)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Code
	#tag Event
		Sub Open()
		  Me.Text = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Sock
	#tag Event
		Sub Connected()
		  Output = ""
		  IPAddress.Text = Me.RemoteAddress
		  IPAddress.TextColor = &c00804000
		  'IPAddress1.Text = "Connected"
		  IPAddress.TextColor = &c00804000
		  Me.Write(Request.ToString)
		  RequestMain1.URL.AddItem(RequestMain1.URL.Text)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DataAvailable()
		  'IPAddress1.Text = "Receiving"
		  IPAddress.TextColor = &c00804000
		  Output = Output + Me.ReadAll
		  RawText = Self.Request.ToString
		  OutputLog.Text = "-----------Request-----------" + CRLF + RawText + CRLF _
		  + "-----------Response-----------" + CRLF + OutPut + CRLF
		  Dim bs As New BinaryStream(RawText + CRLF + CRLF + Output)
		  HexViewer1.ShowData(bs)
		  ScrollBar1.Value = 0
		  ScrollBar1.Maximum = HexViewer1.LineCount
		  
		  DataReceivedTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error()
		  Select Case Me.LastErrorCode
		  Case 102
		    'IPAddress.Text = "Closed by host"
		    IPAddress.TextColor = &c80808000
		    
		  Case 103
		    Code.Text = SocketErrorMessage(Me.LastErrorCode)
		    ResponseHeaders.DeleteAllRows
		    IPAddress.TextColor = &cFF000000
		    IPAddress.Text = "Unable to connect"
		    OutputLog.Text = ""
		    
		  Else
		    IPAddress.Text = "Unable to connect"
		    IPAddress.TextColor = &cFF000000
		    OutputLog.Text = ""
		    Code.TextColor = &cFF000000
		    Code.Text = SocketErrorMessage(Me.LastErrorCode)
		  End Select
		  RequestMain1.Sender.Enabled = True
		  RequestMain1.Sender.Caption = "Send Request"
		  RequestMain1.ProgressBar1.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DataReceivedTimer
	#tag Event
		Sub Action()
		  Update(Output)
		  If Response.StatusCode = 301 Or Response.StatusCode = 302 Then
		    Dim redir As String = Response.GetHeader("Location")
		    Dim u As New HTTP.URI(redir)
		    If u.FQDN = "" Then
		      u = New HTTP.URI(TheURL)
		      u.ServerPath = redir
		    End If
		    If MsgBox("Response redirects to: " + u.ToString + ". Follow redirection?", 4 + 32, "HTTP Redirect") = 6 Then
		      RequestMain1.URL.Text = u.ToString
		      Perform()
		    End If
		  End If
		  Self.Refresh
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IPAddress
	#tag Event
		Sub Open()
		  Me.Text = "No response pending."
		  Me.TextColor = &c80808000
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
		Sub Perform()
		  Self.Perform()
		End Sub
	#tag EndEvent
	#tag Event
		Sub SetMessageData(Data As String)
		  MessageBodyRaw = Data
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.SplitterEastWest
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
		  #If TargetWin32 Then
		    'Dim mb As New MemoryBlock(1)
		    'mb.BooleanValue(0) = False
		    'Call SendMessage(RequestMain1.Handle, WM_SETREDRAW, mb, Nil)
		  #endif
		  mDown = True
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If Self.MouseX > 376 Then
		    If Self.Width <= 747 Then Return
		    Dim tpL, tpW As Integer
		    tpL = Me.Left + Me.Width + 4
		    tpW = Self.Width - RequestMain1.Width - Canvas1.Width
		    
		    'If tpW < 377 Then Return
		    'If Self.Width - tpL < 377 Then Return
		    If LastSplitterPos > Self.MouseX Then ' move right
		      If Self.Width - tpL <= 377 Then Return
		    Else ' move left
		      If tpL <= 383 Then Return
		    End If
		    Me.Left = Self.MouseX
		    LastSplitterPos = Me.Left
		    TabPanel1.Left = tpL
		    TabPanel1.Width = tpW
		    RequestMain1.Width = Me.Left
		    'Me.Refresh(False)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics)
		  If SplitterThumb = Nil Then SplitterThumb = New Picture(g.Width, g.Height, 24)
		  If SplitterThumb.Width <> g.Width Or SplitterThumb.Height <> g.Height Then SplitterThumb = New Picture(g.Width, g.Height, 24)
		  If Not mDown Then
		    SplitterThumb.Graphics.ForeColor = &cFFFFFF00
		  Else
		    SplitterThumb.Graphics.ForeColor =&cC0C0C000
		  End If
		  SplitterThumb.Graphics.FillRect(0, 0, g.Width, g.Height)
		  SplitterThumb.Graphics.ForeColor = &c80808000
		  SplitterThumb.Graphics.DrawLine(g.Width * 0.25, 0.25 * g.Height, g.Width * 0.25, 0.75 * g.Height)
		  SplitterThumb.Graphics.DrawLine(g.Width * 0.75, 0.25 * g.Height, g.Width * 0.75, 0.75 * g.Height)
		  g.DrawPicture(SplitterThumb, 0, 0)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  mDown = False
		  #If TargetWin32 Then
		    'Dim mb As New MemoryBlock(1)
		    'mb.BooleanValue(0) = True
		    'Call SendMessage(RequestMain1.Handle, WM_SETREDRAW, mb, Nil)
		    'RequestMain1.Refresh
		  #endif
		  Me.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
