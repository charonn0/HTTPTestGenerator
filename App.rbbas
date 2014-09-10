#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  App.UseGDIPlus = True
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  Dim w As New ErrorHandler
		  Return w.ShowException(error, DebugBuild)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FixedWidthFont() As String
		  ' try to pick a fixed-width font
		  
		  If FixedWidthFont.Trim <> "" Then Return FixedWidthFont
		  
		  Dim preferred() As String = Split("Consolas,Courier,Inconsolata,Lucida Console", ",")
		  For i As Integer = FontCount - 1 DownTo 0
		    Dim fontname As String = Font(i)
		    If Left(fontname, 1) = "@" Then Continue
		    For Each pref As String In preferred
		      If fontname = pref Then
		        FixedWidthFont = fontname
		        Return FixedWidthFont
		      End If
		    Next
		  Next
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected FixedWidthFont As String
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
