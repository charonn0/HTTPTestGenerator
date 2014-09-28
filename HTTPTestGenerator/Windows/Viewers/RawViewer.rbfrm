#tag Window
Begin Window RawViewer Implements Viewer
   BackColor       =   16777215
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   True
   Title           =   "Message body"
   Visible         =   True
   Width           =   600
   Begin PagePanel ViewContainer
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   1
      Panels          =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   600
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.Left = Generator.Left + (Generator.Width - Me.Width) / 2
		  Me.Top = Generator.Top + (Generator.Height - Me.Height) / 2
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ViewRaw(Message As String, Type As ContentType)
		  Self.Title = "Message body - " + Type.ToString
		  Dim c As Viewer
		  Select Case True
		  Case Type.Accepts("image/*")
		    c = New PictureView
		    
		  Case Type.Accepts("text/html"), Type.Accepts("text/*"), Type.Accepts("message/http")
		    c = New TextView
		    
		  Case Type.Accepts("application/octet-stream")
		    c = New HexView
		    
		  Case Type.Accepts("application/x-url-encoded"), Type.Accepts("multipart/form-data")
		    c = New FormView
		    
		  Else
		    c = New HexView
		    
		  End Select
		  ContainerControl(c).EmbedWithinPanel(ViewContainer, 0, 0, 0, ViewContainer.Width, ViewContainer.Height)
		  c.ViewRaw(Message, Type)
		  Me.ShowModal
		End Sub
	#tag EndMethod


#tag EndWindowCode

