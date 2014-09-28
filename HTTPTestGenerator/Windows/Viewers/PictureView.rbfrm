#tag Window
Begin ContainerControl PictureView Implements Viewer
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   16777215
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   457
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   614
   Begin Canvas ImageView
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   457
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   614
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub ViewRaw(Message As String, Type As ContentType)
		  // Part of the Viewer interface.
		  
		  RawData = Message
		  MIMEType = Type
		  Image = Picture.FromData(RawData)
		  ImageView.Invalidate
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Image As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MIMEType As ContentType
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RawData As MemoryBlock
	#tag EndProperty


#tag EndWindowCode

#tag Events ImageView
	#tag Event
		Sub Paint(g As Graphics)
		  If Image <> Nil Then
		    g.DrawPicture(Image, 0, 0)
		  Else
		    Dim s As String = "Unknown image format."
		    g.ForeColor = &cC0C0C000
		    g.FillRect(0, 0, g.Width, g.Height)
		    g.ForeColor = &c00000000
		    g.TextSize = 15
		    Dim w, h As Integer
		    w = g.StringWidth(s)
		    h = g.StringHeight(s, w)
		    w = (g.Width - w) / 2
		    h = (g.Height - h) / 2
		    g.DrawString(s, w, h)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
