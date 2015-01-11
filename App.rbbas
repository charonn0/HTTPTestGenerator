#tag Class
Protected Class App
Inherits Application
	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  Dim w As New ErrorHandler
		  Return w.ShowException(error, DebugBuild)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CleanMangledFunction(item as string) As string
		  'This method was written by SirG3 <TheSirG3@gmail.com>; http://fireyesoftware.com/developer/stackcleaner/
		  #If rbVersion >= 2005.5
		    
		    Static blacklist() As String
		    If UBound(blacklist) <= -1 Then
		      blacklist = Array(_
		      "REALbasic._RuntimeRegisterAppObject%%o<Application>", _
		      "_NewAppInstance", _'
		      "_Main", _
		      "% main", _
		      "REALbasic._RuntimeRun" _
		      )
		    End If
		    
		    If blacklist.indexOf( item ) >= 0 Then _
		    Exit Function
		    
		    Dim parts() As String = item.Split( "%" )
		    If ubound( parts ) < 2 Then _
		    Exit Function
		    
		    Dim func As String = parts( 0 )
		    Dim returnType As String
		    If parts( 1 ) <> "" Then _
		    returnType = parseParams( parts( 1 ) ).pop
		    Dim args() As String = parseParams( parts( 2 ) )
		    
		    If func.InStr( "$" ) > 0 Then
		      args( 0 ) = "Extends " + args( 0 )
		      func = func.ReplaceAll( "$", "" )
		      
		    Elseif ubound( args ) >= 0 And func.NthField( ".", 1 ) = args( 0 ) Then
		      args.remove( 0 )
		      
		    End If
		    
		    If func.InStr( "=" ) > 0 Then
		      Dim index As Integer = ubound( args )
		      
		      args( index ) = "Assigns " + args( index )
		      func = func.ReplaceAll( "=", "" )
		    End If
		    
		    If func.InStr( "*" ) > 0 Then
		      Dim index As Integer = ubound( args )
		      
		      args( index ) = "ParamArray " + args( index )
		      func = func.ReplaceAll( "*", "" )
		    End If
		    
		    Dim sig As String
		    If func.InStr( "#" ) > 0 Then
		      if returnType = "" Then
		        sig = "Event Sub"
		      Else
		        sig = "Event Function"
		      end if
		      func = func.ReplaceAll( "#", "" )
		      
		    ElseIf func.InStr( "!" ) > 0 Then
		      if returnType = "" Then
		        sig = "Shared Sub"
		      Else
		        sig = "Shared Function"
		      end if
		      func = func.ReplaceAll( "!", "" )
		      
		    Elseif returnType = "" Then
		      sig = "Sub"
		      
		    Else
		      sig = "Function"
		      
		    End If
		    
		    If ubound( args ) >= 0 Then
		      sig = sig + " " + func + "(" + Join( args, ", " ) + ")"
		      
		    Else
		      sig = sig + " " + func + "()"
		      
		    End If
		    
		    
		    If returnType <> "" Then
		      sig = sig + " As " + returnType
		    End If
		    
		    Return sig
		    
		  #Else
		    Return ""
		    
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CleanStack(error as RuntimeException) As string()
		  'This method was written by SirG3 <TheSirG3@gmail.com>; http://fireyesoftware.com/developer/stackcleaner/
		  Dim result() As String
		  
		  #If rbVersion >= 2005.5
		    For Each s As String In error.stack
		      Dim tmp As String = cleanMangledFunction( s )
		      
		      If tmp <> "" Then _
		      result.append( tmp )
		    Next
		    
		  #Else
		    // leave result empty
		    
		  #EndIf
		  
		  // we must return some sort of array (even if empty), otherwise REALbasic will return a "nil" array, causing a crash when trying to use the array.
		  // see http://realsoftware.com/feedback/viewreport.php?reportid=urvbevct
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixedWidthFont() As String
		  ' try to pick a fixed-width font
		  
		  If FixedWidthFont.Trim <> "" Then Return FixedWidthFont
		  Dim preferred() As String = Split("Consolas,Anonymous,Courier,Inconsolata,Lucida Console", ",")
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

	#tag Method, Flags = &h21
		Private Function ParseParams(input as string) As string()
		  'This method was written by SirG3 <TheSirG3@gmail.com>; http://fireyesoftware.com/developer/stackcleaner/
		  
		  Const kParamMode = 0
		  Const kObjectMode = 1
		  Const kIntMode = 2
		  Const kUIntMode = 3
		  Const kFloatingMode = 4
		  Const kArrayMode = 5
		  
		  Dim chars() As String = Input.Split( "" )
		  Dim funcTypes(), buffer As String
		  Dim arrays(), arrayDims(), byrefs(), mode As Integer
		  
		  For Each char As String In chars
		    Select Case mode
		    Case kParamMode
		      Select Case char
		      Case "i"
		        mode = kIntMode
		        
		      Case "u"
		        mode = kUIntMode
		        
		      Case "o"
		        mode = kObjectMode
		        
		      Case "b"
		        funcTypes.append( "Boolean" )
		        
		      Case "s"
		        funcTypes.append( "String" )
		        
		      Case "f"
		        mode = kFloatingMode
		        
		      Case "c"
		        funcTypes.append( "Color" )
		        
		      Case "A"
		        mode = kArrayMode
		        
		      Case "&"
		        byrefs.append( ubound( funcTypes ) + 1 )
		        
		      End Select
		      
		      
		    Case kObjectMode
		      If char = "<" Then _
		      Continue
		      
		      If char = ">" Then
		        funcTypes.append( buffer )
		        buffer = ""
		        mode = kParamMode
		        
		        Continue
		      End If
		      
		      buffer = buffer + char
		      
		      
		    Case kIntMode, kUIntMode
		      Dim intType As String = "Int"
		      
		      If mode = kUIntMode Then _
		      intType = "UInt"
		      
		      funcTypes.append( intType + Str( Val( char ) * 8 ) )
		      mode = kParamMode
		      
		      
		    Case kFloatingMode
		      If char = "4" Then
		        funcTypes.append( "Single" )
		        
		      Elseif char = "8" Then
		        funcTypes.append( "Double" )
		        
		      End If
		      
		      mode = kParamMode
		      
		    Case kArrayMode
		      arrays.append( ubound( funcTypes ) + 1 )
		      arrayDims.append( Val( char ) )
		      mode = kParamMode
		      
		    End Select
		  Next
		  
		  For i As Integer = 0 To ubound( arrays )
		    Dim arr As Integer = arrays( i )
		    Dim s As String = funcTypes( arr ) + "("
		    
		    For i2 As Integer = 2 To arrayDims( i )
		      s = s + ","
		    Next
		    
		    funcTypes( arr ) = s + ")"
		  Next
		  
		  For Each b As Integer In byrefs
		    funcTypes( b ) = "ByRef " + funcTypes( b )
		  Next
		  
		  Return funcTypes
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected FixedWidthFont As String
	#tag EndProperty


	#tag Constant, Name = IsGenerator, Type = Boolean, Dynamic = False, Default = \"True", Scope = Public
	#tag EndConstant

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
