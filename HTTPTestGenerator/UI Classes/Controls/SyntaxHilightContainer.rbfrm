#tag Window
Begin ContainerControl SyntaxHilightContainer
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   300
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   614
   Begin ScrollBar horizontalSB
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Maximum         =   0
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   284
      Value           =   0
      Visible         =   True
      Width           =   594
   End
   Begin CustomEditField SyntaxHilighter
      AcceptFocus     =   True
      AcceptTabs      =   True
      AutoCloseBrackets=   false
      AutocompleteAppliesStandardCase=   true
      AutoDeactivate  =   True
      AutoIndentNewLines=   true
      BackColor       =   16777215
      Backdrop        =   ""
      Border          =   true
      BorderColor     =   8947848
      BracketHighlightColor=   16776960
      CaretColor      =   0
      ClearHighlightedRangesOnTextChange=   False
      DirtyLinesColor =   16751001
      DisplayDirtyLines=   True
      DisplayInvisibleCharacters=   True
      DisplayLineNumbers=   true
      DisplayRightMarginMarker=   True
      DoubleBuffer    =   False
      EnableAutocomplete=   True
      Enabled         =   True
      EnableLineFoldings=   false
      enableLineFoldingSetting=   ""
      EraseBackground =   False
      GutterBackgroundColor=   15658734
      GutterSeparationLineColor=   8947848
      GutterWidth     =   0
      Height          =   281
      HelpTag         =   ""
      HighlightBlocksOnMouseOverGutter=   False
      HighlightMatchingBrackets=   true
      HighlightMatchingBracketsMode=   1
      ignoreRepaint   =   0
      IndentPixels    =   16
      IndentVisually  =   True
      Index           =   -2147483648
      InitialParent   =   ""
      KeepEntireTextIndented=   True
      Left            =   0
      leftMarginOffset=   4
      LineNumbersColor=   8947848
      LineNumbersTextFont=   "System"
      LineNumbersTextSize=   9
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      ReadOnly        =   True
      RightMarginAtPixel=   0
      RightScrollMargin=   150
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TabWidth        =   4
      Text            =   ""
      TextColor       =   0
      TextFont        =   "smallSystem"
      TextSelectionColor=   0
      TextSize        =   0
      ThickInsertionPoint=   true
      Top             =   0
      UseFocusRing    =   False
      Visible         =   True
      Width           =   594
   End
   Begin ScrollBar verticalSB
      AcceptFocus     =   true
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   277
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   598
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   True
      Maximum         =   0
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   4
      Value           =   0
      Visible         =   True
      Width           =   16
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub SetText(Text As String, Hilighting As HighlightDefinition)
		  SyntaxHilighter.Text = Text
		  SyntaxHilighter.SyntaxDefinition = Hilighting
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub toggleBookmark()
		  if SyntaxHilighter.LineHasBookmark(SyntaxHilighter.CaretLine) then
		    SyntaxHilighter.ClearBookmark(SyntaxHilighter.CaretLine)
		  else
		    SyntaxHilighter.AddBookmark(SyntaxHilighter.CaretLine)
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected lastLine As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events horizontalSB
	#tag Event
		Sub ValueChanged()
		  SyntaxHilighter.ScrollPositionx = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SyntaxHilighter
	#tag Event
		Sub Open()
		  //set the scrollbars
		  me.setScrollbars(horizontalSB, verticalSB)
		  Me.EraseBackground = False
		  Me.DoubleBuffer = True
		  //add a set of dummy autocomplete words.
		  'dim tmp() as String = autocompleteWords.Split
		  'dim word as String
		  '
		  'MyAutocomplete = new PaTrie
		  'dim Words as new Dictionary
		  '
		  'dim trimmed as String
		  'for each word in tmp
		  'trimmed = word.Trim
		  'if words.HasKey(trimmed) then
		  'Continue
		  'end if
		  'call MyAutocomplete.addKey(trimmed)
		  'autocompleteWordsList.AddRow(trimmed)
		  'words.Value(trimmed) = true
		  'next
		  
		  SyntaxHilighter.ClearDirtyLines
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function AutocompleteOptionsForPrefix(prefix as string) As AutocompleteOptions
		  //you can replace this with your own Autocomplete engine...
		  'dim options as new AutocompleteOptions
		  'dim commonPrefix as String
		  '
		  '//prefix is the word that triggered these Autocomplete options
		  'options.Prefix = prefix
		  '
		  '//options is the array that holds the different Autocomplete options for this word (prefix)
		  'options.Options = MyAutocomplete.wordsForPrefix(prefix, commonPrefix)
		  '
		  '//the longest common prefix of the different options
		  'options.LongestCommonPrefix = commonPrefix
		  '
		  'Return options
		End Function
	#tag EndEvent
	#tag Event
		Function ShouldTriggerAutocomplete(Key as string, hasAutocompleteOptions as boolean) As boolean
		  'Return Keyboard.AsyncKeyDown(53) //to use ESC (xcode, mail, coda...)
		  Return key = chr(9) and hasAutocompleteOptions and not Keyboard.OptionKey//to use tab, if there are options
		  'Return Keyboard.AsyncControlKey and Keyboard.AsyncKeyDown(49) //to use ctrl-space as in visual studio
		  'Return false 'no autocomplete, ever
		End Function
	#tag EndEvent
	#tag Event
		Sub SelChanged(line as integer, column as integer, length as integer)
		  'dim tmp as String = str(line)+":"+str(column)
		  'if length > 0 then tmp = tmp + " ("+str(length)+")"
		  
		  'fieldInfo.TextSelectionInfo = tmp
		  
		  'if lastLine <> line and SyntaxHilighter.SymbolCount > 0 then
		  'fieldInfo.currentSymbol = SyntaxHilighter.CaretSymbol
		  'end if
		  lastLine = line
		End Sub
	#tag EndEvent
	#tag Event
		Function UseBackgroundColorForLine(lineIndex as integer, byref lineBackgroundColor as color) As boolean
		  //Return false //remove this to have lines with alternate colors as background.
		  
		  
		  //highlight the currentLine.
		  if lineIndex = me.CaretLine then
		    lineBackgroundColor = &cFFFEE4 //light yellow
		    Return true
		  end if
		  
		  Return true //remove this to go back to alternating blue-white lines
		  
		  //alternate backgrounds...
		  if lineIndex mod 2 <> 0 then Return False
		  
		  lineBackgroundColor = RGB(237,243,255) //faint blue
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Sub PaintBelowLine(lineIndex as integer, g as graphics, x as integer, y as integer, w as integer, h as integer)
		  if lineIndex <> me.CaretLine then Return
		  
		  g.ForeColor = &CCCCCCC
		  g.DrawLine x, y + h - 1, x + w, y + h - 1
		  g.DrawLine x, y , x + w, y
		End Sub
	#tag EndEvent
	#tag Event
		Sub GutterClicked(onLine as integer, x as integer, y as integer)
		  #pragma unused onLine
		  #pragma unused x
		  #pragma unused y
		  if x < 10 then _
		  toggleBookmark
		End Sub
	#tag EndEvent
	#tag Event
		Sub PlaceholderSelected(placeholderLabel as String, lineIndex as integer, line as textLine, placeholder as textPlaceholder, doubleClick as Boolean)
		  #pragma unused placeholderLabel
		  #pragma unused lineIndex
		  #pragma unused line
		  #pragma unused placeholder
		  #pragma unused doubleClick
		  //I guess you could use placeholders as buttons somehow here...
		  'if doubleClick then
		  'me.SelText = placeholderLabel
		  'me.SelStart = line.offset + placeholder.offset
		  'me.SelLength = placeholderLabel.len
		  'end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub HighlightingComplete()
		  'if SyntaxHilighter.SymbolCount = 0 then fieldInfo.currentSymbol = nil
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChanged()
		  'SetWindowModified(me.IsDirty)
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as menuitem, x as integer, y as integer) As boolean
		  #pragma Unused x
		  #pragma Unused y
		  //Paul Rodman's Suggestion
		  if base.Count>0 then base.Append new MenuItem("-")
		  '//--
		  '
		  base.Append(New MenuItem("Cut"))
		  base.Append(New MenuItem("Copy"))
		  base.Append(New MenuItem("Paste"))
		  base.Append(New MenuItem("Clear"))
		  base.Append(New MenuItem("Select All"))
		  
		  Return true
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Clear"
		    SyntaxHilighter.SelText = ""
		    SyntaxHilighter.Redraw
		    Return true
		  Case "Copy"
		    SyntaxHilighter.copy
		    Return true
		  Case "Cut"
		    dim c as new Clipboard
		    c.Text = SyntaxHilighter.SelText
		    SyntaxHilighter.SelText = ""
		    SyntaxHilighter.Redraw
		    Return true
		  Case "Paste"
		    SyntaxHilighter.paste
		    Return true
		  Case "Select All"
		    SyntaxHilighter.SelectAll
		    SyntaxHilighter.redraw
		    Return true
		  End Select
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events verticalSB
	#tag Event
		Sub ValueChanged()
		  SyntaxHilighter.ScrollPosition = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
