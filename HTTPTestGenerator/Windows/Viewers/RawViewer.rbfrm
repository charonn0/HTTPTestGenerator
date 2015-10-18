#tag Window
Begin Window RawViewer
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
			SetTitle(type, CurrentMessage.MessageBody.LenB)
			SetViewer(type)
			SetMessage(CurrentMessage.MessageBody)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FormMenu() As Boolean Handles FormMenu.Action
			Dim type As HTTP.ContentType
			If CurrentMessage.ContentType.Accepts("multipart/form-data") Then
			type = "multipart/form-data"
			ElseIf CurrentMessage.ContentType.Accepts("application/x-www-form-urlencoded") Then
			type = "application/x-www-form-urlencoded"
			Else
			MsgBox("Invalid form type.")
			Return True
			End If
			SetViewer(type)
			SetTitle(type, CurrentMessage.MessageBody.LenB)
			SetMessage(CurrentMessage.MessageBody)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HTMLMenu() As Boolean Handles HTMLMenu.Action
			Dim type As ContentType = "text/html"
			SetTitle(type, CurrentMessage.MessageBody.LenB)
			SetViewer(type)
			SetMessage(CurrentMessage.MessageBody)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PlainTextMenu() As Boolean Handles PlainTextMenu.Action
			Dim type As ContentType = "text/plain"
			SetTitle(type, CurrentMessage.MessageBody.LenB)
			SetViewer(type)
			SetMessage(CurrentMessage.MessageBody)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SaveMenu() As Boolean Handles SaveMenu.Action
			'Dim data As MemoryBlock = CurrentMessage.MessageBody
			'If AutoDecompress And MsgBox("Would you like to decompress the message body before saving?", 4 + 32, "Compression was applied to this message.") = 6 Then
			'data = HTTP.GZipDecompress(data)
			'End If
			
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
			SetTitle(type, CurrentMessage.MessageBody.LenB)
			SetViewer(type)
			SetMessage(CurrentMessage.MessageBody)
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h1
		Protected Sub SetMessage(Message As MemoryBlock)
		  Dim data As MemoryBlock = Message
		  contentlen = data.Size
		  If AutoDecompress Then
		    If CurrentMessage.Header("Content-Encoding") = "gzip" Then
		      data = HTTP.GZipDecompress(data)
		    ElseIf CurrentMessage.Header("Content-Encoding") = "deflate" Then
		      data = HTTP.Inflate(data)
		    End If
		  End If
		  
		  If CurrentMessage.IsChunked Then data = HTTP.DecodeChunkedData(data)
		  CurrentView.ViewRaw(data, CurrentMessage.ContentType, contentlen)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetTitle(Type As HTTP.ContentType, Length As Integer)
		  Select Case True
		  Case AutoDecompress
		    Self.Title = "Message body - " + Type.ToString + " (decompressed, " + FormatBytes(Length) + ")"
		  Case Not AutoDecompress And CurrentMessage.IsCompressed
		    Self.Title = "Message body - " + Type.ToString + " (compressed, " + FormatBytes(Length) + ")"
		  Else
		    Self.Title = "Message body - " + Type.ToString + " (" + FormatBytes(Length) + ")"
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetViewer(Type As ContentType)
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
		  ContainerControl(CurrentView).SetFocus
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewRaw(Message As HTTP.Message)
		  Self.Title = "Message body - " + Message.ContentType.ToString
		  If Message.IsCompressed Then
		    AutoDecompress = zlib.IsAvailable And _
		    (MsgBox("Would you like to decompress the message body before viewing?", 4 + 32, "Compression was applied to this message.") = 6)
		    If AutoDecompress Then
		      Self.Title = "Message body - " + Message.ContentType.ToString + " (decompressed)"
		    Else
		      Self.Title = "Message body - " + Message.ContentType.ToString + " (compressed)"
		    End If
		  Else
		    Self.Title = "Message body - " + Message.ContentType.ToString
		  End If
		  CurrentMessage = Message
		  
		  If Message.IsCompressed And Not AutoDecompress Then
		    SetViewer("application/octet-stream")
		  Else
		    SetViewer(Message.ContentType)
		  End If
		  
		  Try
		    SetMessage(Message.MessageBody)
		  Catch
		    MsgBox("An error occured while decompressing the message body.")
		    Self.Close
		    Return
		  End Try
		  Me.ShowModal
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private AutoDecompress As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ContentLen As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentMessage As HTTP.Message
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentView As Viewer
	#tag EndProperty


#tag EndWindowCode

