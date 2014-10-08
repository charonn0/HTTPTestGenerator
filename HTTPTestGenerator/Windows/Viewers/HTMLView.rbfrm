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
   Begin SyntaxHilightContainer SyntaxHilightContainer1
      AcceptFocus     =   ""
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &hFFFFFF
      Backdrop        =   ""
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   286
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   614
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
		  BaseURL = Message.Path.Host
		  
		  Dim def As New HighlightDefinition
		  Call def.LoadFromXml(HTMLSyntaxDef)
		  SyntaxHilightContainer1.SetText(Message.MessageBody, def)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BaseURL As String
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

#tag Events LinkList
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  If row < Me.ListCount And column = 1 Then
		    Dim u As HTTP.URI = Me.Cell(row, column)
		    If u.Host = "" Then u.Host = BaseURL
		    If u.Scheme = "" Then u.Scheme = "http"
		    Generator.RequestMain1.URL.Text = u.ToString
		    Generator.RequestMain1.Sender.Enabled = False
		    Generator.RequestMain1.Sender.Caption = "Sending..."
		    Generator.RequestMain1.ProgressBar1.Visible = True
		    Generator.RequestMain1.StopButton.Visible = True
		    Generator.Perform()
		    Return True
		  End If
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  If row < Me.ListCount And column = 1 Then
		    g.ForeColor = &c0000FF00
		    g.Underline = True
		  End If
		  
		End Function
	#tag EndEvent
#tag EndEvents
