#tag Class
Protected Class BaseCanvas
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If Me.Enabled Then Return RaiseEvent MouseDown(X, Y)
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If Me.Enabled Then RaiseEvent MouseDrag(X, Y)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  If Me.Enabled Then RaiseEvent MouseEnter()
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  If Me.Enabled Then RaiseEvent MouseExit()
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  If Me.Enabled Then RaiseEvent MouseMove(X, Y)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  If Me.Enabled Then RaiseEvent MouseUp(X, Y)
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  If Me.Enabled Then Return RaiseEvent MouseWheel(X, Y, deltaX, deltaY)
		End Function
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  #If RBVersion >= 2012 Then 'areas() was added in RS2012 R1
		    #pragma Unused areas
		  #endif
		  If UpdateClearsBackground Then
		    g.ClearRect(0, 0, g.Width, g.Height)
		  End If
		  If Buffer = Nil Or Buffer.Width <> g.Width Or Buffer.Height <> g.Height Then Update(False)
		  g.DrawPicture(buffer, 0, 0)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Enabled(Assigns b As Boolean)
		  RectControl(Me).Enabled = b
		  Me.Update()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Update(AndInvalidate As Boolean = True)
		  #pragma BreakOnExceptions Off
		  Dim g As Graphics
		  Try
		    #If TargetWin32 Then
		      If App.UseGDIPlus Then
		        buffer = New Picture(Me.Width, Me.Height)
		      Else
		        buffer = New Picture(Me.Width, Me.Height, 32)
		      End If
		    #else
		      buffer = New Picture(Me.Width, Me.Height)
		    #endif
		    g = Buffer.Graphics
		  Catch
		    Buffer = Nil
		    Return
		  End Try
		  #pragma BreakOnExceptions Default
		  g.Bold = Me.Bold
		  g.Italic = Me.Italic
		  g.TextFont = Me.TextFont
		  g.TextSize = Me.TextSize
		  g.Underline = Me.Underline
		  RaiseEvent Paint(g)
		  If Not Me.Enabled Then
		    //Converts the passed Picture to greyscale.
		    //Can take a few seconds on very large Pictures
		    //This function was *greatly* optimized by user 'doofus' on the RealSoftware forums:
		    //http://forums.realsoftware.com/viewtopic.php?f=1&t=42327&sid=4e724091fc9dd70fd5705110098adf67
		    
		    Dim surf As RGBSurface = Buffer.RGBSurface
		    
		    Dim greyColor(255) As Color //precompute the 256 grey colors
		    For i As Integer = 0 To 255
		      greyColor(i) = RGB(i, i, i)
		    Next
		    
		    Dim X, Y, intensity As Integer, c As Color
		    For X = 0 To Buffer.Width
		      For Y = 0 To Buffer.Height
		        c = surf.Pixel(X, Y)
		        intensity = c.Red * 0.30 + c.Green * 0.59 + c.Blue * 0.11
		        surf.Pixel(X, Y) = greyColor(intensity) //lookup grey
		      Next
		    Next
		    
		  ElseIf Me.Hilight Then
		    Dim map(255) As Integer
		    For i as Integer = 255 DownTo 0
		      map(i) = 255 + i + 15
		    next
		    Buffer.RGBSurface.Transform(map)
		  End If
		  
		  If AndInvalidate Then Me.Invalidate(False)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDrag(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseEnter()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseExit()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseMove(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseWheel(X As Integer, Y As Integer, deltaX As Integer, deltaY As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint	(g As Graphics)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mbold
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mbold = value
			  Update()
			End Set
		#tag EndSetter
		Bold As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBorder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBorder = value
			  Update()
			End Set
		#tag EndSetter
		Border As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBorderColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBorderColor = value
			  Update()
			End Set
		#tag EndSetter
		BorderColor As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected Buffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Hilight As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mitalic
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mitalic = value
			  Update()
			End Set
		#tag EndSetter
		Italic As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mbold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBorder As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBorderColor As Color = &c808080
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mitalic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mtextSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private munderline As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtextColor = value
			  Update()
			End Set
		#tag EndSetter
		TextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtextFont = value
			  Update()
			End Set
		#tag EndSetter
		TextFont As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mtextSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtextSize = value
			  Update()
			End Set
		#tag EndSetter
		TextSize As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return munderline
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  munderline = value
			  Update()
			End Set
		#tag EndSetter
		Underline As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected UpdateClearsBackground As Boolean = False
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hilight"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
