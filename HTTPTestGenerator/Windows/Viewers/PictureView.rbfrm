#tag Window
Begin ContainerControl PictureView Implements Viewer
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   16777215
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   False
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
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
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
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   637
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   14
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  ImageView.Invalidate
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  Pic = Nil
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function Scale(Source As Picture, Ratio As Double = 1.0) As Picture
		  //Returns a scaled version of the passed Picture object.
		  //A ratio of 1.0 is 100% (no change,) 0.5 is 50% (half size) and so forth.
		  //This function should be cross-platform safe.
		  
		  Dim wRatio, hRatio As Double
		  wRatio = (Ratio * Source.width)
		  hRatio = (Ratio * Source.Height)
		  If wRatio = Source.Width And hRatio = Source.Height Then Return Source
		  Dim photo As New Picture(wRatio, hRatio)
		  Photo.Graphics.DrawPicture(Source, 0, 0, Photo.Width, Photo.Height, 0, 0, Source.Width, Source.Height)
		  Timer1.Mode = Timer.ModeSingle
		  Return photo
		  
		Exception
		  Return Source
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewRaw(Message As MemoryBlock, Type As HTTP.ContentType, ContentLen As Integer)
		  // Part of the Viewer interface.
		  mType = Type
		  mRaw = Message
		  mContentLength = ContentLen
		  ImageView.Refresh(False)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Picture.FromData(mRaw)
			End Get
		#tag EndGetter
		Image As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mContentLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRatio As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRaw As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mType As ContentType
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Pic As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events ImageView
	#tag Event
		Sub Paint(g As Graphics)
		  If Not App.UseGDIPlus Then App.UseGDIPlus = True
		  If g.Width <= 0 Or g.Height <= 0 Then Return
		  If Image <> Nil Then
		    If Pic = Nil Then
		      mratio = 1.0
		      If g.Width < Image.Width Then
		        mratio = g.Width / Image.Width
		      End If
		      If g.Height < Image.Height Then
		        mratio = Min(g.Height / Image.Height, mratio)
		      End If
		      Pic = Scale(Image, mratio)
		    End If
		    
		    Dim p As Picture = transparencycheckerboard
		    For i As Integer = 0 To g.Width Step p.Width
		      For j As Integer = 0 To g.Height Step p.Height
		        g.DrawPicture(p, i, j)
		      Next
		    Next
		    g.DrawPicture(Pic, (g.Width - Pic.Width) / 2, (g.Height - Pic.Height) / 2)
		  Else
		    Dim s As String = "Unknown image format."
		    'Dim gg As Graphics = buffer.Graphics
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
#tag Events Timer1
	#tag Event
		Sub Action()
		  Dim s As String = " (" + Format(mratio * 100, "##0.0#") + "%)"
		  RawViewer(Self.Window).SetTitle(mType, mContentLength)
		  Self.Window.Title = Self.Window.Title + s
		  
		End Sub
	#tag EndEvent
#tag EndEvents
