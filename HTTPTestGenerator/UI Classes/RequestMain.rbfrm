#tag Window
Begin ContainerControl RequestMain
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
   Left            =   ""
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   ""
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   342
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
      Height          =   245
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
      SelectionType   =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   55
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   330
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   7
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
      Italic          =   False
      Left            =   72
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
      TabIndex        =   2
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
      Left            =   262
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
      Width           =   79
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
      Left            =   117
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   304
      Underline       =   False
      Visible         =   True
      Width           =   98
   End
   Begin PlacardButton EditCookies11
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   284
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      Sticky          =   ""
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      textColorDown   =   "&c000000"
      TextFont        =   "System"
      TextSize        =   0
      Top             =   301
      Underline       =   False
      UseFocusRing    =   True
      Value           =   False
      Visible         =   True
      Width           =   25
   End
   Begin PlacardButton RequestHeaderView11
      AcceptFocus     =   False
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      Bold            =   False
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   25
      HelpTag         =   "Expanded Header View"
      Hilight         =   ""
      Icon            =   1571842047
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   310
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      Sticky          =   ""
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      textColorDown   =   "&c000000"
      TextFont        =   "System"
      TextSize        =   0
      Top             =   301
      Underline       =   False
      UseFocusRing    =   True
      Value           =   False
      Visible         =   True
      Width           =   25
   End
   Begin PlacardButton EditRaw11
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
      Icon            =   978827263
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   258
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      Sticky          =   ""
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      textColorDown   =   "&c000000"
      TextFont        =   "System"
      TextSize        =   0
      Top             =   301
      Underline       =   False
      UseFocusRing    =   True
      Value           =   False
      Visible         =   True
      Width           =   25
   End
   Begin Label Label1
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
      Left            =   11
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "Request Headers"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   36
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   324
   End
   Begin ProgressBar ProgressBar1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   7
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   117
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   0
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   326
      Value           =   0
      Visible         =   False
      Width           =   98
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  Sender.Left = (Me.Width \ 2) - (Sender.Width \ 2)
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event Generate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GenerateHeaders()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetMessageData() As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetRequest() As HTTP.Request
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetResponse() As HTTP.Response
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Perform()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SetMessageData(Data As String)
	#tag EndHook


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  return RaiseEvent GetMessageData
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  RaiseEvent SetMessageData(value)
			End Set
		#tag EndSetter
		Protected MessageBodyRaw As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  return RaiseEvent GetRequest
			End Get
		#tag EndGetter
		Protected Request As HTTP.Request
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  return RaiseEvent GetResponse
			End Get
		#tag EndGetter
		Protected Response As HTTP.Response
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events RequestHeaders
	#tag Event
		Sub AddNew()
		  Dim p As Pair = HeaderEdit.GetHeader()
		  If p <> Nil Then
		    If p.Right IsA Date Then
		      RequestHeaders.AddRow(p.Left, HTTPDate(p.Right.DateValue), "")
		      'RequestHeaders.CellType(RequestHeaders.LastIndex, 0) = Listbox.TypeEditable
		      'RequestHeaders.EditCell(RequestHeaders.LastIndex, 0)
		    Else
		      RequestHeaders.AddRow(p.Left, p.Right, "")
		      'RequestHeaders.CellType(RequestHeaders.LastIndex, 0) = Listbox.TypeEditable
		      'RequestHeaders.EditCell(RequestHeaders.LastIndex, 0)
		    End If
		    RequestHeaders.RowTag(RequestHeaders.LastIndex) = p
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
	#tag Event
		Sub DoubleClick()
		  If Me.ListIndex > -1 Then
		    Dim data As Object = Me.RowTag(Me.ListIndex)
		    If data = Nil Then Return
		    If data IsA HTTPParse.Cookie Then
		      Dim p As HTTPParse.Cookie = HTTPParse.Cookie(data)
		      p = CookieEdit.GetCookie(p)
		      If p <> Nil Then
		        Me.Cell(Me.ListIndex, 0) = "Cookie"
		        Me.Cell(Me.ListIndex, 1) = p.Name + "=" + p.Value
		        Me.RowTag(Me.ListIndex) = p
		      End If
		    ElseIf data IsA Pair Then
		      Dim p As Pair = Pair(data)
		      p = HeaderEdit.GetHeader(p)
		      If p <> Nil Then
		        Me.Cell(Me.ListIndex, 0) = p.Left
		        If p.Right IsA Date Then
		          Me.Cell(Me.ListIndex, 1) = HTTPDate(p.Right.DateValue)
		        Else
		          Me.Cell(Me.ListIndex, 1) = p.Right
		        End If
		        Me.RowTag(Me.ListIndex) = p
		      End If
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.AddRow("Connection", "close")
		  Me.RowTag(Me.LastIndex) = "Connection":"close"
		  Me.AddRow("Accept", "text/html,*/*;q=0.8")
		  Me.RowTag(Me.LastIndex) = "Accept":"text/html,*/*;q=0.8"
		  Me.HeaderType(2) = Listbox.HeaderTypes.NotSortable
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events URL
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(key) = &h0D Or Asc(key) = &h03 Then
		    Perform()
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Sender
	#tag Event
		Sub Action()
		  Sender.Enabled = False
		  Sender.Caption = "Sending..."
		  ProgressBar1.Visible = True
		  Self.Refresh
		  Perform()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EditCookies11
	#tag Event
		Sub Open()
		  Me.Icon = cookie_icon_grey
		  Me.HelpTag = "Add a cookie to request"
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
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
		      RequestHeaders.RowTag(editindex) = c
		    Else
		      RequestHeaders.AddRow("Cookie", c.Name + "=" + c.Value, "")
		      RequestHeaders.RowTag(RequestHeaders.LastIndex) = c
		    End If
		  End If
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
#tag EndEvents
#tag Events RequestHeaderView11
	#tag Event
		Sub ValueChanged()
		  GenerateHeaders()
		  HeaderViewer.ShowHeaders(Request.Headers)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EditRaw11
	#tag Event
		Sub Open()
		  Me.HelpTag = "Edit HTTP request body"
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValueChanged()
		  Dim mnu As New MenuItem("EditRawMenu")
		  mnu.Append(New MenuItem("HTML form output"))
		  mnu.Append(New MenuItem("Edit raw"))
		  Dim res As MenuItem = mnu.PopUp
		  If res <> Nil Then
		    If Self.Request = Nil Then Generate()
		    Select Case res.Text
		    Case "HTML form output"
		      Dim formgen As New FormGenerator
		      Dim olddata As Dictionary = DecodeFormData(MessageBodyRaw)
		      Dim data As Dictionary = formgen.SetFormData(olddata)
		      If Data <> Nil Then
		        MessageBodyRaw = EncodeFormData(data)
		        
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
		        RequestHeaders.RowTag(RequestHeaders.LastIndex) = "Content-Type":"application/x-www-form-URLEncoded"
		        RequestHeaders.AddRow("Content-Length", Str(LenB(MessageBodyRaw)), "")
		        RequestHeaders.RowTag(RequestHeaders.LastIndex) = "Content-Length":Str(LenB(MessageBodyRaw))
		      End If
		    Case "Edit raw"
		      Dim raw As String = RawEditor.EditRaw(MessageBodyRaw)
		      If raw.Trim = "" Then Return
		      For i As Integer = RequestHeaders.ListCount - 1 DownTo 0
		        If RequestHeaders.Cell(i, 0) = "Content-Length" Then
		          RequestHeaders.RemoveRow(i)
		        End If
		      Next
		      MessageBodyRaw = raw
		      RequestHeaders.AddRow("Content-Length", Str(LenB(MessageBodyRaw)), "")
		      RequestHeaders.RowTag(RequestHeaders.LastIndex) = "Content-Length":Str(LenB(MessageBodyRaw))
		      
		    End Select
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
