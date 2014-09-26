#tag Class
Protected Class HREFArea
Inherits TextArea
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim v As Variant = FindLink(X, Y)
		  If v <> Nil Then
		    LastX = X
		    LastY = Y
		    Dim tx As String = FindLinkText(X, Y)
		    Return ConstructContextualLinkMenu(v, tx, base, X, Y)
		  Else
		    Return RaiseEvent ConstructContextualMenu(base, x, y)
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Dim v As Variant = FindLink(LastX, LastY)
		  If v <> Nil Then
		    Return ContextualLinkMenuAction(hitItem)
		  Else
		    Return RaiseEvent ContextualMenuAction(hitItem)
		  End If
		End Function
	#tag EndEvent

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

	#tag Method, Flags = &h1
		Protected Function FindLink(X As Integer, Y As Integer) As Variant
		  Dim tst As Integer
		  tst = Me.CharPosAtXY(X, Y)
		  
		  For i As Integer = 0 To Me.StyledText.StyleRunCount - 1
		    If Links(i) Is Nil Then Continue
		    Dim st, op As Integer
		    st = Me.StyledText.StyleRunRange(i).StartPos
		    op = Me.StyledText.StyleRunRange(i).EndPos
		    If tst >= st And tst < op Then
		      Return Links(i)
		    End If
		  Next
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindLinkText(X As Integer, Y As Integer) As String
		  Dim tst As Integer
		  tst = Me.CharPosAtXY(X, Y)
		  
		  For i As Integer = 0 To Me.StyledText.StyleRunCount - 1
		    If tst >= Me.StyledText.StyleRunRange(i).StartPos And tst <= Me.StyledText.StyleRunRange(i).EndPos Then
		      Return Me.StyledText.StyleRun(i).Text
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintOther(Text As StyleRun)
		  Me.StyledText.AppendStyleRun(Text)
		  Links.Append(Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintRequest(Message As HTTP.Request)
		  Dim sr As New StyleRun
		  'sr.Font = App.FixedWidthFont
		  sr.Text = Message.ToString(True).Trim
		  sr.TextColor = &c0000FF00
		  Me.StyledText.AppendStyleRun(sr)
		  Links.Append(Nil)
		  
		  sr = New StyleRun
		  If Message.MessageBody.Trim.LenB > 0 Then
		    sr.Font = App.FixedWidthFont
		    sr.Text = CRLF + "View request body..." + CRLF + CRLF
		    sr.TextColor = &c0000FF00
		    sr.Underline = True
		    Links.Append(Message)
		  Else
		    sr.Text = CRLF + CRLF
		    Links.Append(Nil)
		  End If
		  Me.StyledText.AppendStyleRun(sr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintResponse(Message As HTTP.Response)
		  Dim sr As New StyleRun
		  'sr.Font = App.FixedWidthFont
		  sr.Text = Message.ToString(True).Trim
		  sr.TextColor = &c00800000
		  Me.StyledText.AppendStyleRun(sr)
		  Links.Append(Nil)
		  
		  If Message.MessageBody.Trim.LenB > 0 Then
		    sr = New StyleRun
		    sr.Font = App.FixedWidthFont
		    sr.Text = CRLF + "View response body..." + CRLF + CRLF
		    sr.TextColor = &c0000FF00
		    sr.Underline = True
		    Me.StyledText.AppendStyleRun(sr)
		    Links.Append(Message)
		  Else
		    AppendLine()
		    AppendLine()
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ClickLink(LinkValue As Variant, LinkText As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConstructContextualLinkMenu(LinkValue As Variant, LinkText As String, Base As MenuItem, X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ConstructContextualMenu(base As MenuItem, x As Integer, y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ContextualLinkMenuAction(Hititem As MenuItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ContextualMenuAction(hitItem As MenuItem) As Boolean
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
