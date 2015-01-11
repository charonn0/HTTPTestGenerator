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
   MenuBar         =   1443549183
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
		Sub EnableMenuItems()
		  For i As Integer = 0 To Self.MenuBar.Count - 1
		    Dim m As MenuItem = Self.MenuBar.Item(i)
		    m.Enabled = True
		    For j As Integer = 0 To m.Count - 1
		      m.Item(j).Enabled = True
		    Next
		  Next
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.Left = Window(1).Left + (Window(1).Width - Me.Width) / 2
		  Me.Top = Window(1).Top + (Window(1).Height - Me.Height) / 2
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function BinMenu() As Boolean Handles BinMenu.Action
			Dim type As ContentType = "application/octet-stream"
			Dim c As Viewer = SetViewer(Type)
			Self.Title = "Message body - " + Type.ToString
			c.ViewRaw(CurrentMessage)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FormMenu() As Boolean Handles FormMenu.Action
			Dim c As Viewer
			If CurrentMessage.ContentType.Accepts("multipart/form-data") Then
			c = SetViewer("multipart/form-data")
			ElseIf CurrentMessage.ContentType.Accepts("application/x-www-form-urlencoded") Then
			c = SetViewer("application/x-www-form-urlencoded")
			Else
			MsgBox("Invalid form type.")
			Return True
			End If
			Self.Title = "Message body - " + CurrentMessage.ContentType.ToString
			c.ViewRaw(CurrentMessage)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HTMLMenu() As Boolean Handles HTMLMenu.Action
			Dim type As ContentType = "text/html"
			Dim c As Viewer = SetViewer(Type)
			Self.Title = "Message body - " + Type.ToString
			c.ViewRaw(CurrentMessage)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PlainTextMenu() As Boolean Handles PlainTextMenu.Action
			Dim type As ContentType = "text/plain"
			Dim c As Viewer = SetViewer(Type)
			Self.Title = "Message body - " + Type.ToString
			c.ViewRaw(CurrentMessage)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SaveMenu() As Boolean Handles SaveMenu.Action
			Dim nm As String = CurrentMessage.Path.Path
			If CountFields(nm, "/") > 0 Then
			nm = NthField(nm, "/", CountFields(nm, "/"))
			Else
			nm = "untitled"
			End If
			Dim f As FolderItem = GetSaveFolderItem("", nm)
			If f <> Nil Then
			Dim bs As BinaryStream = BinaryStream.Create(f, True)
			bs.Write(CurrentMessage.MessageBody)
			bs.Close
			End If
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewPictureMenu() As Boolean Handles ViewPictureMenu.Action
			Dim type As ContentType = "image/*"
			Dim c As Viewer = SetViewer(Type)
			Self.Title = "Message body - " + Type.ToString
			c.ViewRaw(CurrentMessage)
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h1
		Protected Function SetViewer(Type As ContentType) As Viewer
		  If CurrentView <> Nil Then CurrentView.Close
		  Select Case True
		  Case Type.Accepts("image/*")
		    CurrentView = New PictureView
		    
		  Case Type.Accepts("text/html")
		    CurrentView = New HTMLView
		    
		  Case Type.Accepts("text/*"), Type.Accepts("message/http")
		    CurrentView = New TextView
		    
		  Case Type.Accepts("application/octet-stream")
		    CurrentView = New HexView
		    
		  Case Type.Accepts("application/x-www-form-urlencoded"), Type.Accepts("multipart/form-data")
		    CurrentView = New FormView
		    
		  Else
		    CurrentView = New HexView
		    
		  End Select
		  ContainerControl(CurrentView).EmbedWithinPanel(ViewContainer, 0, 0, 0, ViewContainer.Width, ViewContainer.Height)
		  Return CurrentView
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewRaw(Message As HTTP.Message)
		  Self.Title = "Message body - " + Message.ContentType.ToString
		  Dim c As Viewer = SetViewer(Message.ContentType)
		  CurrentMessage = Message
		  c.ViewRaw(Message)
		  Me.ShowModal
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private CurrentMessage As HTTP.Message
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentView As Viewer
	#tag EndProperty


#tag EndWindowCode

