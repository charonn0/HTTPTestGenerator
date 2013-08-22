#tag Window
Begin ContainerControl MessageView
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   -256
   Backdrop        =   0
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   384
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
   UseFocusRing    =   False
   Visible         =   True
   Width           =   569
   Begin PagePanel PagePanel1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   384
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   4
      Panels          =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Top             =   3
      Value           =   0
      Visible         =   True
      Width           =   569
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   17
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         Text            =   "Message Body:"
         TextAlign       =   0
         TextColor       =   "&c00000000"
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   7
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin HTMLViewer HTMLViewer1
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   344
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Top             =   23
         Visible         =   True
         Width           =   569
      End
      Begin Canvas ImagePreview
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   384
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   3
         UseFocusRing    =   True
         Visible         =   True
         Width           =   569
      End
      Begin Label Status
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   3
         Text            =   ""
         TextAlign       =   0
         TextColor       =   "&c00000000"
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   367
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   569
      End
      Begin LinkLabel LinkLabel1
         ActiveColor     =   "&cFF000000"
         AltText         =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Draggable       =   False
         Enabled         =   True
         Height          =   20
         HilightColor    =   "&c00FFFF00"
         HoverPeriod     =   250
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   426
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         ResetPeriod     =   1000
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   1
         Text            =   "View as media"
         TextAlign       =   2
         TextColor       =   "&c0000FF00"
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   6
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   137
      End
      Begin LinkLabel PageTitle
         ActiveColor     =   "&cFF000000"
         AltText         =   ""
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Draggable       =   False
         Enabled         =   True
         Height          =   20
         HilightColor    =   "&c00FFFF00"
         HoverPeriod     =   250
         Index           =   -2147483648
         InitialParent   =   "PagePanel1"
         Italic          =   False
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         ResetPeriod     =   1000
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   3
         Text            =   ""
         TextAlign       =   0
         TextColor       =   "&c0000FF00"
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   3
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   569
      End
   End
   Begin TextArea Message1
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   "&cFFFFFF00"
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   354
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   408
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin HexEditCanvas Message
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      Height          =   361
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   23
      UseFocusRing    =   True
      Visible         =   True
      Width           =   569
   End
   Begin ScrollBar HexBar
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   361
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   572
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   23
      Value           =   0
      Visible         =   True
      Width           =   16
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function Scale(Source As Picture, Ratio As Double = 1.0) As Picture
		  //Returns a scaled version of the passed Picture object.
		  //A ratio of 1.0 is 100% (no change,) 0.5 is 50% (half size) and so forth.
		  //This function should be cross-platform safe.
		  
		  Dim wRatio, hRatio As Double
		  wRatio = (Ratio * Source.width)
		  hRatio = (Ratio * Source.Height)
		  If wRatio = Source.Width And hRatio = Source.Height Then Return Source
		  Dim photo As New Picture(wRatio, hRatio, Source.Depth)
		  Photo.Graphics.DrawPicture(Source, 0, 0, Photo.Width, Photo.Height, 0, 0, Source.Width, Source.Height)
		  Return photo
		  
		Exception
		  Return Source
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetData(Raw As String, MIME As String)
		  PreviewPic = Nil
		  mSData = Raw
		  
		  Select Case NthField(MIME, ";", 1)
		  Case "image/png", "image/jpg", "image/jpeg", "image/bmp"
		    PreviewPic = Picture.FromData(Raw)
		    PreviewPanel = 1
		  Case "text/html", "text/xhtml"
		    PreviewPanel = 2
		    Dim f As FolderItem = GetTemporaryFolderItem()
		    f.Name = "preview.html"
		    Dim bs As BinaryStream = BinaryStream.Create(f, True)
		    bs.Write(mSData)
		    bs.Close
		    HTMLViewer1.LoadPage(f)
		  Else
		    PreviewPanel = 0
		  End Select
		  
		  PagePanel1.Value = PreviewPanel
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private LastValue As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mQuietScroll As boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResponse As HTTP.Response
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSData As string
	#tag EndProperty

	#tag Property, Flags = &h0
		PreviewPanel As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		PreviewPic As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		RequestURL As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mResponse
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mResponse = value
			  mSData = Me.Response.MessageBody
			  PagePanel1.Value = 0
			End Set
		#tag EndSetter
		Response As HTTP.Response
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events HTMLViewer1
	#tag Event
		Sub StatusChanged(newStatus as String)
		  Status.Text = newStatus
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Dim f As FolderItem = GetTemporaryFolderItem()
		  f.name = "blank.html"
		  Dim bs As BinaryStream = BinaryStream.Create(f, True)
		  bs.Write("<HTML><head>Blank</head><body>&nbsp; <!-- this page intentionally blank --></body></HTML>")
		  bs.Close
		  Me.LoadPage(f)
		End Sub
	#tag EndEvent
	#tag Event
		Sub TitleChanged(newTitle as String)
		  PageTitle.Text = newTitle
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DocumentComplete(URL as String)
		  Self.RequestURL = URL
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ImagePreview
	#tag Event
		Sub Paint(g As Graphics)
		  #If RBVersion >= 2012 Then 'areas() was added in RS2012 R1
		    #pragma Unused areas
		  #endif
		  If PreviewPic <> Nil Then
		    If PreviewPic.Width > g.Width Or PreviewPic.Height > g.Height Then
		      Dim ratio As Double
		      If PreviewPic.Width > PreviewPic.Height Then
		        ratio = g.Width / PreviewPic.Width
		      Else
		        ratio = g.Height / PreviewPic.Height
		      End If
		      PreviewPic = Scale(PreviewPic, ratio)
		    End If
		    g.DrawPicture(PreviewPic, 0, 0)
		    
		  Else
		    g.ClearRect(0, 0, g.Width, g.Height)
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LinkLabel1
	#tag Event
		Sub Action()
		  If Response <> Nil Then
		    SetData(Response.MessageBody, Response.Headers.Value("Content-Type"))
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PageTitle
	#tag Event
		Sub Action()
		  ShowURL(Self.RequestURL)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Message
	#tag Event
		Function GetFont() As string
		  Return "Courier"
		  'Return "Comic Sans"
		End Function
	#tag EndEvent
	#tag Event
		Sub DeleteData(aLen as integer, aPosition as integer)
		  mSData = leftb(mSData, aPosition) + midb(mSData,aPosition+aLen+1)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ModifyData(aNewData as string, aPosition as integer, aOldLength as integer)
		  mSData = leftb(mSData, aPosition) + aNewData + midb(mSData,aPosition+aOldLength+1)
		End Sub
	#tag EndEvent
	#tag Event
		Sub SetScrollPosition(aPos as integer)
		  mQuietScroll = true
		  HexBar.Value = aPos - 32767
		  mQuietScroll = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.AcceptFileDrop "special/any"
		  me.SetDrawStripes(True)
		End Sub
	#tag EndEvent
	#tag Event
		Sub SetScrollPageIncrement(aIncrement as integer)
		  mQuietScroll = true
		  HexBar.PageStep = aIncrement
		  mQuietScroll = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub SetScrollMaximum(aMax as integer)
		  mQuietScroll = true
		  HexBar.Maximum = aMax - 32767
		  HexBar.Minimum = -32767
		  mQuietScroll = False
		End Sub
	#tag EndEvent
	#tag Event
		Function GetTotalDataLength() As integer
		  Return lenb(mSData)
		End Function
	#tag EndEvent
	#tag Event
		Function GetData(aLen as integer, aPosition as integer) As string
		  Return midb(mSData, aPosition+1, aLen)
		End Function
	#tag EndEvent
	#tag Event
		Sub InsertData(aData as string, aLoc as integer)
		  mSData = leftb(mSData, aLoc) + aData + midb(mSData,aLoc+1)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  'if obj.FolderItemAvailable then
		  'OpenFile obj.FolderItem
		  'end if
		End Sub
	#tag EndEvent
	#tag Event
		Function GetFontSize() As integer
		  'Return 12
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events HexBar
	#tag Event
		Sub ValueChanged()
		  'if not mQuietScroll then
		  'if not mQuietScroll then
		  'Message.SetTopLine(me.Value +32767 )
		  'Message.Refresh
		  'end if
		  If (me.Value + 32767) > 0 Then
		    Message.SetTopLine(me.Value + LastValue)
		    LastValue = me.Value + LastValue
		  Else
		    Message.SetTopLine(me.Value - LastValue)
		    LastValue = me.Value + LastValue
		  End If
		  
		  Message.Refresh(False)
		  'end if
		End Sub
	#tag EndEvent
#tag EndEvents
