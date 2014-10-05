#tag Window
Begin ContainerControl HTMLView Implements Viewer
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   16777215
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   457
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
   Begin Listbox LinkList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   159
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Link Text	Link Value"
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   298
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   614
      _ScrollWidth    =   -1
   End
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   280
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
      Height          =   277
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
      TabIndex        =   2
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   16
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Function ExtractLinks(HTML As String, BaseURL As String) As Pair()
		  Dim base As HTTP.URI = BaseURL
		  Dim hrefRegex As New Regex
		  hrefRegex.SearchPattern = "<A[^>]*?HREF\s*=\s*""([^""]+)""[^>]*?>([\s\S]*?)<\/A>"
		  hrefRegex.Options.CaseSensitive = False
		  Dim output() As Pair
		  dim r As RegExMatch = hrefRegex.Search(HTML)
		  Do Until r = Nil
		    Dim u As HTTP.URI = r.SubExpressionString(1)
		    If u.Host = "" Then u.Host = base.Host
		    output.Append(u:r.SubExpressionString(2))
		    r = hrefRegex.Search
		  Loop
		  Return output
		End Function
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

	#tag Method, Flags = &h0
		Sub ViewRaw(Message As HTTP.Message)
		  LinkList.DeleteAllRows
		  Dim p() As Pair = ExtractLinks(Message.MessageBody, "")
		  For i As Integer = 0 To UBound(p)
		    Dim u As HTTP.URI = p(i).Left
		    Dim t As String = p(i).Right
		    LinkList.AddRow(t, u.ToString)
		    LinkList.RowTag(LinkList.LastIndex) = u
		  Next
		  
		  SyntaxHilighter.Text = Message.MessageBody
		  Dim def As New HighlightDefinition
		  Call def.LoadFromXml(HTMLSyntaxDef)
		  SyntaxHilighter.SyntaxDefinition = def
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BaseURL As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastLine As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MIMEType As ContentType
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RawData As MemoryBlock
	#tag EndProperty


	#tag Constant, Name = HTMLSyntaxDef, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>\r<highlightDefinition version\x3D\"1.1\">\r\t<name>HTML</name>\r\r\t<blockStartMarker indent\x3D\"1\">(\?x)\r\t\t(&lt;(\?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|li|form|dl)\\b.*\?&gt;\r\t\t|&lt;!--(\?!.*--\\s*&gt;)\r\t\t|^&lt;!--\\ \\#tminclude\\ (\?&gt;.*\?--&gt;)$\r\t\t|&lt;\\\?(\?:php)\?.*\\b(if|for(each)\?|while)\\b.+:\r\t\t|\\{\\{\?(if|foreach|capture|literal|foreach|php|section|strip)\r\t\t|\\{\\s*($|\\\?&gt;\\s*$|//|/\\*(.*\\*/\\s*$|(\?!.*\?\\*/)))\r\t\t)</blockStartMarker>\r\t<blockEndMarker>(\?x)\r\t\t(&lt;/(\?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|li|form|dl)&gt;\r\t\t|^(\?!.*\?&lt;!--).*\?--\\s*&gt;\r\t\t|^&lt;!--\\ end\\ tminclude\\ --&gt;$\r\t\t|&lt;\\\?(\?:php)\?.*\\bend(if|for(each)\?|while)\\b\r\t\t|\\{\\{\?/(if|foreach|capture|literal|foreach|php|section|strip)\r\t\t|^[^{]*\\}\r\t\t)</blockEndMarker>\r\r\t<contexts defaultColor\x3D\"#0\" caseSensitive\x3D\"no\">\t\t\r\t\t<highlightContext name\x3D\"Comment\" highlightColor\x3D\"#236E25\">\r\t\t\t<startRegEx>&lt;!--</startRegEx>\r\t\t\t<endRegEx>--&gt;</endRegEx>\r\t\t\t<highlightContext name\x3D\"todos\" highlightColor\x3D\"#FF0000\" backgroundColor\x3D\"#FFFF00\">\r\t\t\t\t<keywords>\r                \t\t<string>TODO</string>\r\t\t\t\t<string>HACK</string>\r\t\t\t\t</keywords>\r\t\t\t</highlightContext>\t\r\t\t</highlightContext>\r\r\t\t<highlightContext name\x3D\"CDATA\" highlightColor\x3D\"#FF0000\">\r\t\t\t<startRegEx>&lt;!\\s*\\[CDATA\\s*\\[</startRegEx>\r\t\t\t<endRegEx>\\]\\s*\\]\\s*&gt;</endRegEx>\r\t\t</highlightContext>\r\t\t\r\t\t<highlightContext name\x3D\"Doctype\" highlightColor\x3D\"#236E25\">\r\t\t\t<startRegEx>&lt;!</startRegEx>\r\t\t\t<endRegEx>&gt;</endRegEx>\r\t\t</highlightContext>\r\t\t\r\t\t<highlightContext name\x3D\"Escape\" highlightColor\x3D\"#236E25\">\r\t\t\t<startRegEx>&lt;\\\?</startRegEx>\r\t\t\t<endRegEx>\\\?&gt;</endRegEx>\r\t\t</highlightContext>\r\t\t\t\t\t\r        <highlightContext name\x3D\"Tags\" highlightColor\x3D\"#881280\">\r            <entryRegEx>(&lt;[^&gt;]*&gt;)</entryRegEx>\r            \r            <highlightContext name\x3D\"Strings in Tags\" highlightColor\x3D\"#1A1AA6\">\r                <entryRegEx>(\"[^\"&gt;&lt;]*\")</entryRegEx>\r            </highlightContext>\r            \r            <highlightContext name\x3D\"Single Strings in Tags\" highlightColor\x3D\"#1A1AA6\">\r                <entryRegEx>(\'[^\'&gt;&lt;]*\')</entryRegEx>\r            </highlightContext>\r            \r            <highlightContext name\x3D\"Attributes in Tags\" highlightColor\x3D\"#994500\">\r                <entryRegEx>([\\w-]*)[ \\t]*\x3D(\?\x3D[ \\t]*\"[^\"&gt;&lt;]*\")</entryRegEx>\r            </highlightContext>    \r        </highlightContext>\r        \r        <highlightContext name\x3D\"Entities\" highlightColor\x3D\"#881280\" backgroundColor\x3D\"#FFFF00\">\r            <entryRegEx>(&amp;\\w{1\x2C8};)</entryRegEx>\r        </highlightContext>\r\r\t</contexts>\r</highlightDefinition>", Scope = Private
	#tag EndConstant


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
