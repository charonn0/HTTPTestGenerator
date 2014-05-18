#tag Window
Begin Window ErrorHandler
   BackColor       =   16777215
   Backdrop        =   0
   CloseButton     =   False
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   100
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   300
   MaximizeButton  =   False
   MaxWidth        =   600
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   25
   MinimizeButton  =   False
   MinWidth        =   425
   Placement       =   1
   Resizeable      =   True
   Title           =   "Error"
   Visible         =   True
   Width           =   469
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   47
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "An unhandled error has caused the application to stop working. "
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   5
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   409
   End
   Begin TextArea errorStack
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   16777215
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   -6
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   13
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   66
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   False
      Width           =   443
   End
   Begin PushButton QuitApp
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Quit"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   321
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   72
      Underline       =   False
      Visible         =   True
      Width           =   135
   End
   Begin PushButton SendError
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Send Error"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   72
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
   Begin Canvas Icon
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   35
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   5
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   5
      UseFocusRing    =   True
      Visible         =   True
      Width           =   35
   End
   Begin PushButton IgnoreError
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Ignore"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   188
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   72
      Underline       =   False
      Visible         =   False
      Width           =   83
   End
   Begin Label ShowHide
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   31
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "Show technical details"
      TextAlign       =   0
      TextColor       =   8421504
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   44
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   178
   End
   Begin DisclosureTriangle DisclosureTriangle1
      AcceptFocus     =   True
      AutoDeactivate  =   True
      Enabled         =   True
      Facing          =   0
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   45
      Value           =   False
      Visible         =   True
      Width           =   18
   End
   Begin PushButton CopyError
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Copy Error"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   72
      Underline       =   False
      Visible         =   True
      Width           =   83
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Shared Function CleanMangledFunction(item as string) As string
		  'This method was originally written by SirG3 <TheSirG3@gmail.com>; http://fireyesoftware.com/developer/stackcleaner/
		  #If rbVersion >= 2005.5
		    Static blacklist() As String
		    If UBound(blacklist) <= -1 Then
		      blacklist = Array("REALbasic._RuntimeRegisterAppObject%%o<Application>", _
		      "_NewAppInstance", "_Main", _
		      "% main", _
		      "REALbasic._RuntimeRun" _
		      )
		    End If
		    
		    If blacklist.indexOf(item) >= 0 Then Return ""
		    
		    Dim parts() As String = item.Split("%")
		    If ubound(parts) < 2 Then Return ""
		    
		    Dim func As String = parts(0)
		    Dim returnType As String
		    If parts(1) <> "" Then returnType = parseParams(parts(1)).pop
		    Dim args() As String = parseParams(parts(2))
		    
		    If func.InStr("$") > 0 Then
		      args(0) = "Extends " + args(0)
		      func = func.ReplaceAll("$", "")
		      
		    Elseif ubound(args) >= 0 And func.NthField(".", 1) = args(0) Then
		      args.remove(0)
		      
		    End If
		    
		    If func.InStr("=") > 0 Then
		      Dim index As Integer = ubound(args)
		      
		      args(index) = "Assigns " + args(index)
		      func = func.ReplaceAll("=", "")
		    End If
		    
		    If func.InStr("*") > 0 Then
		      Dim index As Integer = ubound(args)
		      
		      args(index) = "ParamArray " + args(index)
		      func = func.ReplaceAll("*", "")
		    End If
		    
		    Dim sig As String
		    If func.InStr("#") > 0 Then
		      If returnType = "" Then
		        sig = "Event Sub"
		      Else
		        sig = "Event Function"
		      End If
		      func = func.ReplaceAll("#", "")
		      
		    Elseif func.InStr("!") > 0 Then
		      If returnType = "" Then
		        sig = "Shared Sub"
		      Else
		        sig = "Shared Function"
		      End If
		      func = func.ReplaceAll("!", "")
		      
		    Elseif returnType = "" Then
		      sig = "Sub"
		      
		    Else
		      sig = "Function"
		      
		    End If
		    
		    If ubound(args) >= 0 Then
		      sig = sig + " " + func + "(" + Join(args, ", ") + ")"
		      
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
		 Shared Function CleanStack(error as RuntimeException) As string()
		  'This method was written by SirG3 <TheSirG3@gmail.com>; http://fireyesoftware.com/developer/stackcleaner/
		  Dim result() As String
		  
		  #If rbVersion >= 2005.5
		    For Each s As String In error.stack
		      Dim tmp As String = cleanMangledFunction(s)
		      If tmp <> "" Then result.append(tmp)
		      
		    Next
		    
		  #Else
		    // leave result empty
		    
		  #EndIf
		  
		  // we must return some sort of array (even if empty), otherwise REALbasic will return a "nil" array, causing a crash when trying to use the array.
		  // see http://realsoftware.com/feedback/viewreport.php?reportid=urvbevct
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ParseParams(input as string) As string()
		  'This method was written by SirG3 <TheSirG3@gmail.com>; http://fireyesoftware.com/developer/stackcleaner/
		  
		  Const kParamMode = 0
		  Const kObjectMode = 1
		  Const kIntMode = 2
		  Const kUIntMode = 3
		  Const kFloatingMode = 4
		  Const kArrayMode = 5
		  
		  Dim chars() As String = Input.Split("")
		  Dim funcTypes(), buffer As String
		  Dim arrays(), arrayDims(), byrefs(), mode As Integer
		  
		  For Each char As String In chars
		    Select Case mode
		    Case kParamMode
		      Select Case char
		      Case "v"
		        funcTypes.append( "Variant" )
		        
		      Case "i"
		        mode = kIntMode
		        
		      Case "u"
		        mode = kUIntMode
		        
		      Case "o"
		        mode = kObjectMode
		        
		      Case "b"
		        funcTypes.append("Boolean")
		        
		      Case "s"
		        funcTypes.append("String")
		        
		      Case "f"
		        mode = kFloatingMode
		        
		      Case "c"
		        funcTypes.append("Color")
		        
		      Case "A"
		        mode = kArrayMode
		        
		      Case "&"
		        byrefs.append(ubound(funcTypes) + 1)
		        
		      End Select
		      
		      
		    Case kObjectMode
		      If char = "<" Then Continue
		      
		      If char = ">" Then
		        funcTypes.append(buffer)
		        buffer = ""
		        mode = kParamMode
		        
		        Continue
		      End If
		      
		      buffer = buffer + char
		      
		      
		    Case kIntMode, kUIntMode
		      Dim intType As String = "Int"
		      
		      If mode = kUIntMode Then intType = "UInt"
		      
		      funcTypes.append(intType + Str(Val(char) * 8))
		      mode = kParamMode
		      
		      
		    Case kFloatingMode
		      If char = "4" Then
		        funcTypes.append("Single")
		        
		      Elseif char = "8" Then
		        funcTypes.append("Double")
		        
		      End If
		      
		      mode = kParamMode
		      
		    Case kArrayMode
		      arrays.append(ubound(funcTypes) + 1)
		      arrayDims.append(Val(char))
		      mode = kParamMode
		      
		    End Select
		  Next
		  
		  For i As Integer = 0 To ubound(arrays)
		    Dim arr As Integer = arrays(i)
		    Dim s As String = funcTypes(arr) + "("
		    
		    For i2 As Integer = 2 To arrayDims(i)
		      s = s + ","
		    Next
		    
		    funcTypes(arr) = s + ")"
		  Next
		  
		  For Each b As Integer In byrefs
		    funcTypes(b) = "ByRef " + funcTypes(b)
		  Next
		  
		  Return funcTypes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowException(Error As RuntimeException, Ignorable As Boolean = False) As Boolean
		  IgnoreError.Visible = Ignorable
		  Dim trace As String = StackTrace(Error)
		  errorStack.Text = trace
		  Me.ShowModal
		  Return IgnoreIt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function StackTrace(Err As RuntimeException) As String
		  Dim d As New Date
		  Dim stack() As String = CleanStack(Err)
		  Dim mesg As String
		  If Err.Message.Trim = "" Then
		    mesg = mesg + "No additional details"
		  Else
		    mesg = mesg + Err.Message
		  End If
		  Dim Error As String = _
		  "Runtime Exception:" + EndOfLine + _
		  "Date: " + d.SQLDateTime + EndOfLine + _
		  "Exception type: " + Introspection.GetType(Err).FullName + EndOfLine + _
		  "Guru meditation: 0x" + Left(Hex(Err.ErrorNumber) + "00000000", 8) + EndOfLine + _
		  "Guru consultation: " + mesg + EndOfLine + _
		  EndOfLine + _
		  "Stack at last call to Raise:" + EndOfLine + EndOfLine + _
		  Join(stack, "     " + EndOfLine) + EndOfLine
		  Return Error
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private IgnoreIt As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private lastheight As Integer = 204
	#tag EndProperty


#tag EndWindowCode

#tag Events QuitApp
	#tag Event
		Sub Action()
		  Quit()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SendError
	#tag Event
		Sub Action()
		  ShowURL("http://www.boredomsoft.org/contactus.bs")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Icon
	#tag Event
		Sub Paint(g As Graphics)
		  g.DrawStopIcon(0, 0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IgnoreError
	#tag Event
		Sub Action()
		  Select Case MsgBox("Are you sure you want to ignore this error?", 48 + 4, "Not recommended")
		  Case 6
		    IgnoreIt = True
		    Self.Close
		  Case 7
		    IgnoreIt = False
		    Return
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ShowHide
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		  Me.Underline = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = System.Cursors.StandardPointer
		  Me.Underline = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  DisclosureTriangle1.Value = Not DisclosureTriangle1.Value
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events DisclosureTriangle1
	#tag Event
		Sub Action()
		  If Me.Value Then
		    Self.Height = lastheight
		    errorStack.Visible = True
		    ShowHide.Text = "Hide technical details"
		  Else
		    lastheight = Self.Height
		    errorStack.Visible = False
		    Self.Height = 100
		    ShowHide.Text = "Show technical details"
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CopyError
	#tag Event
		Sub Action()
		  Dim cb As New Clipboard
		  cb.Text = errorStack.Text
		End Sub
	#tag EndEvent
#tag EndEvents
