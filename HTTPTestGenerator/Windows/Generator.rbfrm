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
   MaximizeButton  =   False
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
   Width           =   7.11e+2
   Begin SSLSocket Sock
      CertificateFile =   ""
      CertificatePassword=   ""
      CertificateRejectionFile=   ""
      ConnectionType  =   2
      Height          =   32
      Index           =   -2147483648
      Left            =   551
      LockedInPosition=   False
      Scope           =   0
      Secure          =   ""
      TabPanelIndex   =   0
      Top             =   502
      Width           =   32
   End
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
      Height          =   328
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   348
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   363
   End
   Begin Timer DataReceivedTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   505
      LockedInPosition=   False
      Mode            =   0
      Period          =   200
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   502
      Width           =   32
   End
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
      Height          =   100
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Header Name	Header Value	  \r\nConnection	close	\r\nAccept	*/*	"
      Italic          =   False
      Left            =   5
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   30
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   337
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
      InitialParent   =   ""
      InitialValue    =   "GET\r\nHEAD\r\nPOST\r\nTRACE\r\nDELETE\r\nPUT\r\nOPTIONS"
      Italic          =   False
      Left            =   5
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   4
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   65
   End
   Begin HintTextField URL
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
      HasText         =   False
      Height          =   22
      HelpTag         =   ""
      HintText        =   "Request URL"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   72
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   5
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
      InitialParent   =   ""
      InitialValue    =   "HTTP/1.1\r\nHTTP/1.0"
      Italic          =   False
      Left            =   262
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   4
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   79
   End
   Begin PushButton Sender
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Send"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   133
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   136
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin BevelButton CookiesButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   4
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
      Icon            =   29616127
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   299
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   306
      Underline       =   False
      Value           =   False
      Visible         =   False
      Width           =   22
   End
   Begin BevelButton ResponseHeaderView
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   False
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   "Expanded Header View"
      Icon            =   1571842047
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   320
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   305
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
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
      Height          =   100
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Header Name	Header Value"
      Italic          =   False
      Left            =   5
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   205
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   337
      _ScrollWidth    =   -1
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
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      Text            =   "000.000.000.000"
      TextAlign       =   0
      TextColor       =   "&c0000FF00"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   305
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   99
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   64
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      Text            =   "000 No Error Code"
      TextAlign       =   0
      TextColor       =   "&cFF000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   175
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   278
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   6
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
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
   Begin ProgressBar ProgressBar1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   10
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   5
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   159
      Value           =   0
      Visible         =   True
      Width           =   337
   End
   Begin BevelButton EditCookies
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   4
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
      Icon            =   29616127
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   298
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   133
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
   Begin BevelButton RequestHeaderView
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   4
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
      HelpTag         =   "Expanded Header View"
      Icon            =   1571842047
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   319
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   133
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
   Begin BevelButton EditRaw
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   4
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
      Icon            =   978827263
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   277
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   133
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub Generate()
		  mTheURL = Nil
		  Me.Request = New HTTP.Request()
		  Me.Request.Method = HTTP.Method(Me.RequestMethod.Text)
		  If Me.Request.Method = HTTP.RequestMethod.InvalidMethod Then Me.Request.MethodName = Me.RequestMethod.Text
		  Me.Request.Path = theURL
		  If Me.Request.path.ServerPath = "" Then Me.Request.path.ServerPath = "/"
		  Me.Request.ProtocolVersion = CDbl(NthField(ProtocolVer.Text, "/", 2))
		  GenerateHeaders()
		  Me.Request.MessageBody = Self.Request.MessageBody
		  
		  
		  'If gziprequest.Value Then
		  'Me.Request.SetHeader("Accept-Encoding", "gzip")
		  'End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GenerateHeaders()
		  If Request = Nil Then Generate()
		  For i As Integer = 0 To RequestHeaders.ListCount - 1
		    Me.Request.SetHeader(RequestHeaders.Cell(i, 0)) = RequestHeaders.Cell(i, 1)
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

	#tag Method, Flags = &h1000
		Sub Update(Raw As String)
		  Response = New HTTP.Response(Raw)
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mTheURL = Nil Then
			    mTheURL = New HTTP.URI(URL.Text)
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
		  Output = ""
		  IPAddress.Text = Me.RemoteAddress
		  IPAddress.TextColor = &c00804000
		  'IPAddress1.Text = "Connected"
		  IPAddress.TextColor = &c00804000
		  Me.Write(Request.ToString)
		  URL.AddItem(URL.Text)
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
		  
		  DataReceivedTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error()
		  Select Case Me.LastErrorCode
		  Case 102
		    'IPAddress1.Text = "Closed by server"
		    'IPAddress1.TextColor = &c80808000
		    IPAddress.TextColor = &c80808000
		    
		  Case 103
		    IPAddress.Text = TheURL.FQDN
		    'IPAddress1.Text = "Bad domain"
		    'IPAddress1.TextColor = &cFF000000
		    IPAddress.TextColor = &cFF000000
		    ResponseHeaders.DeleteAllRows
		    Code.Text = ""
		    
		  Else
		    'IPAddress1.Text = "Socket error: " + Str(Me.LastErrorCode)
		    'IPAddress1.TextColor = &cFF000000
		    IPAddress.TextColor = &cFF000000
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DataReceivedTimer
	#tag Event
		Sub Action()
		  Update(Output)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RequestHeaders
	#tag Event
		Function HeaderPressed(column as Integer) As Boolean
		  If column = 2 Then
		    Dim p As Pair = HeaderEdit.GetHeader()
		    If p <> Nil Then
		      If p.Right IsA Date Then
		        RequestHeaders.AddRow(p.Left, HTTPDate(p.Right.DateValue), "")
		        RequestHeaders.CellType(RequestHeaders.LastIndex, 0) = Listbox.TypeEditable
		        RequestHeaders.EditCell(RequestHeaders.LastIndex, 0)
		      Else
		        RequestHeaders.AddRow(p.Left, p.Right, "")
		        RequestHeaders.CellType(RequestHeaders.LastIndex, 0) = Listbox.TypeEditable
		        RequestHeaders.EditCell(RequestHeaders.LastIndex, 0)
		      End If
		    End If
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub AddNew()
		  Dim p As Pair = HeaderEdit.GetHeader()
		  If p <> Nil Then
		    If p.Right IsA Date Then
		      RequestHeaders.AddRow(p.Left, HTTPDate(p.Right.DateValue), "")
		      RequestHeaders.CellType(RequestHeaders.LastIndex, 0) = Listbox.TypeEditable
		      RequestHeaders.EditCell(RequestHeaders.LastIndex, 0)
		    Else
		      RequestHeaders.AddRow(p.Left, p.Right, "")
		      RequestHeaders.CellType(RequestHeaders.LastIndex, 0) = Listbox.TypeEditable
		      RequestHeaders.EditCell(RequestHeaders.LastIndex, 0)
		    End If
		  End If
		  GenerateHeaders()
		End Sub
	#tag EndEvent
	#tag Event
		Sub Remove(Row As Integer)
		  If MsgBox("Remove this header?", 52, "Confirm removal") = 6 Then
		    Me.RemoveRow(row)
		    GenerateHeaders()
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Sender
	#tag Event
		Sub Action()
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
	#tag EndEvent
#tag EndEvents
#tag Events CookiesButton
	#tag Event
		Sub Action()
		  Dim allcookies() As Cookie
		  For i As Integer = 0 To Response.Headers.CookieCount - 1
		    allcookies.Append(Response.Headers.Cookie(i))
		  Next
		  CookieViewer.ShowCookies(AllCookies)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  If Me.Enabled Then
		    Me.Icon = cookie_icon
		  Else
		    Me.Icon = cookie_icon_grey
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.Icon = cookie_icon_grey
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResponseHeaderView
	#tag Event
		Sub Action()
		  HeaderViewer.ShowHeaders(Response.Headers)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IPAddress
	#tag Event
		Sub Open()
		  Me.Text = ""
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
#tag Events EditCookies
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
		Sub Action()
		  Dim c As Cookie
		  Dim editindex As Integer = -1
		  
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
		    Else
		      RequestHeaders.AddRow("Cookie", c.Name + "=" + c.Value, "")
		    End If
		  End If
		  Me.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Icon = cookie_icon_grey
		  Me.HelpTag = "Add a cookie to request"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RequestHeaderView
	#tag Event
		Sub Action()
		  If Request <> Nil Then HeaderViewer.ShowHeaders(Request.Headers)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EditRaw
	#tag Event
		Sub Open()
		  Me.HelpTag = "Edit HTTP request body"
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  Dim mnu As New MenuItem("EditRawMenu")
		  mnu.Append(New MenuItem("HTML form output"))
		  mnu.Append(New MenuItem("Edit raw"))
		  Dim res As MenuItem = mnu.PopUp
		  If res <> Nil Then
		    If Self.Request = Nil Then Generate()
		    Select Case res.Text
		    Case "HTML form output"
		      Dim formgen As New FormGenerator
		      Dim olddata As Dictionary = DecodeFormData(Self.Request.MessageBody)
		      Dim data As Dictionary = formgen.SetFormData(olddata)
		      If Data <> Nil Then
		        Self.Request.MessageBody = EncodeFormData(data)
		        
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
		        
		        RequestHeaders.AddRow("Content-Type", "application/x-www-form-URLEncoded", "")
		        RequestHeaders.AddRow("Content-Length", Str(LenB(Self.Request.MessageBody)), "")
		      End If
		    Case "Edit raw"
		      Dim raw As String = RawEditor.EditRaw(Self.Request.MessageBody)
		      If raw.Trim = "" Then Return
		      For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		        If RequestHeaders.Cell(i, 0) = "Content-Length" Then
		          RequestHeaders.RemoveRow(i)
		        End If
		      Next
		      Self.Request.MessageBody = raw
		      RequestHeaders.AddRow("Content-Length", Str(LenB(Self.Request.MessageBody)), "")
		      
		    End Select
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
