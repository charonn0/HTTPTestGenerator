#tag Class
Protected Class HREFArea
Inherits TextArea
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If Not IsContextualClick Then
		    Dim v As Variant = FindLink(X, Y)
		    Dim tx As String = FindLinkText(X, Y)
		    If v <> Nil Then
		      ClickLink(v, tx)
		    Else
		      Return RaiseEvent MouseDown(X, Y)
		    End If
		  Else
		    Return RaiseEvent MouseDown(X, Y)
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim v As Variant = FindLink(X, Y)
		  If v <> Nil Then
		    Me.MouseCursor = System.Cursors.FingerPointer
		    
		  Else
		    Me.MouseCursor = System.Cursors.StandardPointer
		    
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.Styled = True
		  Me.ReadOnly = True
		  mScrollTimer = New Timer
		  mScrollTimer.Period = 1
		  mScrollTimer.Mode = Timer.ModeOff
		  AddHandler mScrollTimer.Action, WeakAddressOf ScrollTimerHandler
		  RaiseEvent Open()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub AppendLine()
		  Dim sr As New StyleRun
		  sr.Text = CRLF
		  Me.StyledText.AppendStyleRun(sr)
		  Me.Links.Append(Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  Me.Text = ""
		  Me.StyledText = Nil
		  ReDim Links(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindLink(X As Integer, Y As Integer) As Variant
		  Dim tst As Integer
		  tst = Me.CharPosAtXY(X, Y)
		  Dim stxt As StyledText = Me.StyledText
		  Dim c As Integer = stxt.StyleRunCount - 1
		  For i As Integer = 0 To c
		    If Links(i) Is Nil Then Continue
		    Dim st, op As Integer
		    Dim r As Range = stxt.StyleRunRange(i)
		    st = r.StartPos
		    op = r.EndPos
		    If tst >= st And tst <= op Then
		      Return Links(i)
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindLinkText(X As Integer, Y As Integer) As String
		  Dim tst As Integer
		  tst = Me.CharPosAtXY(X, Y)
		  Dim stxt As StyledText = Me.StyledText
		  Dim c As Integer = stxt.StyleRunCount - 1
		  For i As Integer = 0 To c
		    Dim r As Range = stxt.StyleRunRange(i)
		    If tst >= r.StartPos And tst <= r.EndPos Then
		      Return stxt.StyleRun(i).Text
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintOther(Text As StyleRun, LinkValue As Variant = Nil)
		  If App.CurrentThread <> Nil Then Break
		  
		  Me.StyledText.AppendStyleRun(Text)
		  Links.Append(LinkValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintRequest(Message As HTTP.Request)
		  Dim sr As New StyleRun
		  sr.TextColor = &c0000FF00
		  sr.Font = App.FixedWidthFont
		  
		  Dim remain As String = Message.ToString(True).Trim
		  
		  If Message.MethodName <> "" Then
		    remain = Replace(remain, Message.MethodName, "")
		    sr.Text = Message.MethodName
		    sr.Underline = True
		    Me.PrintOther(sr, Message.MethodName)
		    sr.Text = remain
		    sr.Underline = False
		  Else
		    sr.Text = remain
		  End If
		  Me.PrintOther(sr)
		  
		  'sr = New StyleRun
		  If Message.MessageBody.Trim.LenB > 0 Then
		    sr.Font = App.FixedWidthFont
		    sr.Text = CRLF + "View request body..."
		    sr.TextColor = &c80808000
		    sr.Underline = True
		    Me.PrintOther(sr, Message)
		  End If
		  sr.Text = CRLF + CRLF
		  sr.Underline = Not sr.Underline
		  Me.PrintOther(sr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintResponse(Message As HTTP.Response)
		  Dim sr As New StyleRun
		  sr.Font = App.FixedWidthFont
		  sr.TextColor = &c00800000
		  Dim remain As String = Message.ToString(True)
		  
		  If Message.StatusMessage <> "" Then
		    Dim msg As String = NthField(remain, CRLF, 1)
		    sr.Text = NthField(msg, " ", 1) + " "
		    Me.PrintOther(sr)
		    sr.Text = Right(msg, msg.Len - sr.Text.Len)
		    sr.Underline = True
		    Me.PrintOther(sr, Message.StatusCode)
		    sr.Underline = False
		    sr.Text = CRLF + Replace(remain, msg, "").Trim
		  Else
		    sr.Text = remain
		  End If
		  If sr.Text.Trim = "" Then sr.Text = " "
		  Me.PrintOther(sr)
		  
		  If Message.MessageBody.Trim.LenB > 0 Then
		    sr = New StyleRun
		    sr.Font = App.FixedWidthFont
		    sr.Text = CRLF + "View response body..."
		    sr.TextColor = &c80808000
		    sr.Underline = True
		    Me.PrintOther(sr, Message)
		  End If
		  sr.Text = CRLF + CRLF
		  sr.Underline = Not sr.Underline
		  Me.PrintOther(sr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ScrollTimerHandler(Sender As Timer)
		  #pragma Unused Sender
		  
		  If Me.SelLength <= 0 Then Me.SelStart = Me.Text.Len
		  #If TargetWin32 Then
		    Declare Function SendMessageW Lib "User32" (HWND As Integer, Msg As Integer, WParam As Integer, LParam As Ptr) As Integer
		    Const SB_BOTTOM = 7
		    Const WM_VSCROLL = &h115
		    Call SendMessageW(Me.Handle, WM_VSCROLL, SB_BOTTOM, Nil)
		  #Else
		    Me.ScrollPosition = Me.LineNumAtCharPos(Me.Text.Len)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollToEnd()
		  If App.CurrentThread = Nil Then
		    ScrollTimerHandler(mScrollTimer)
		  Else
		    mScrollTimer.Mode = Timer.ModeSingle
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ClickLink(LinkValue As Variant, LinkText As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseMove(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h1
		Protected LastX As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Links() As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mScrollTimer As Timer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="TextArea"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutomaticallyCheckSpelling"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Appearance"
			Type="String"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HideSelection"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LimitText"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mask"
			Visible=true
			Group="Behavior"
			Type="String"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Multiline"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Styled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="Color"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			InheritedFrom="TextArea"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="TextArea"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="TextArea"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
