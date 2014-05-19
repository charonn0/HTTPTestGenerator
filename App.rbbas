#tag Class
Protected Class App
Inherits Application
	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  Dim w As New ErrorHandler
		  Return w.ShowException(error)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FixedWidthFont() As String
		  ' try to pick a fixed-width font
		  Dim nm As String
		  If nm = "" Then
		    For i As Integer = FontCount - 1 DownTo 0
		      Dim fontname As String = Font(i)
		      If Left(fontname, 1) <> "@" Then
		        If fontname = "Consolas" Then
		          nm = fontname
		        End If
		        If InStr(fontname, " mono") > 0 Or InStr(fontname, " fixed") > 0 Then
		          nm = fontname
		        End If
		      End If
		    Next
		  End If
		  Return nm
		End Function
	#tag EndMethod


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
