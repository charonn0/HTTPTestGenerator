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
   Begin SyntaxHilightContainer SyntaxHilightContainer1
      AcceptFocus     =   ""
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &hFFFFFF
      Backdrop        =   ""
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   430
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
      Top             =   27
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   614
   End
   Begin ComboBox EncodingList
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   90
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   3
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   176
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   7
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "Encoding:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   4
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   71
   End
   Begin Label Incompatible
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   272
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "Incompatible encoding"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   3
      Transparent     =   True
      Underline       =   ""
      Visible         =   False
      Width           =   342
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
		Protected Sub SetTitle(encoding As TextEncoding)
		  Dim t As ContentType = mType.ToString
		  t.CharSet = encoding
		  Dim ttl As String
		  Select Case True
		  Case mContentLength < RawData.Size
		    ttl = "Message body - " + t.ToString + " (decompressed, " + FormatBytes(RawData.Size) + ")"
		  Case mContentLength > RawData.Size
		    ttl = "Message body - " + t.ToString + " (compressed, " + FormatBytes(RawData.Size) + ")"
		  Else
		    ttl = "Message body - " + t.ToString + " (" + FormatBytes(RawData.Size) + ")"
		  End Select
		  Self.Window.Title = ttl
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewRaw(Message As MemoryBlock, Type As HTTP.ContentType, ContentLen As Integer)
		  'LinkList.DeleteAllRows
		  'Dim p() As Pair = ExtractLinks(Message, "")
		  'For i As Integer = 0 To UBound(p)
		  'Dim u As HTTP.URI = p(i).Left
		  'Dim t As String = p(i).Right
		  'LinkList.AddRow(t, u.ToString)
		  'LinkList.RowTag(LinkList.LastIndex) = u
		  'Next
		  'BaseURL = Message.Path.Host
		  'Self.Title = "Message body - " + Type.ToString
		  Definition = New HighlightDefinition
		  Call Definition.LoadFromXml(HTMLSyntaxDef)
		  SyntaxHilightContainer1.SetText(Message, Definition)
		  RawData = Message
		  mType = Type
		  If mType.CharSet <> Nil Then
		    Dim i As Integer = mEncodings.IndexOf(mType.CharSet.internetName)
		    If i > -1 Then EncodingList.ListIndex = i
		  End If
		  mContentLength = ContentLen
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BaseURL As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Definition As HighlightDefinition
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mContentLength As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEncodings() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mType As ContentType
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RawData As MemoryBlock
	#tag EndProperty


	#tag Constant, Name = HTMLSyntaxDef, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>\r<highlightDefinition version\x3D\"1.1\">\r\t<name>HTML</name>\r\r\t<blockStartMarker indent\x3D\"1\">(\?x)\r\t\t(&lt;(\?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|li|form|dl)\\b.*\?&gt;\r\t\t|&lt;!--(\?!.*--\\s*&gt;)\r\t\t|^&lt;!--\\ \\#tminclude\\ (\?&gt;.*\?--&gt;)$\r\t\t|&lt;\\\?(\?:php)\?.*\\b(if|for(each)\?|while)\\b.+:\r\t\t|\\{\\{\?(if|foreach|capture|literal|foreach|php|section|strip)\r\t\t|\\{\\s*($|\\\?&gt;\\s*$|//|/\\*(.*\\*/\\s*$|(\?!.*\?\\*/)))\r\t\t)</blockStartMarker>\r\t<blockEndMarker>(\?x)\r\t\t(&lt;/(\?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|li|form|dl)&gt;\r\t\t|^(\?!.*\?&lt;!--).*\?--\\s*&gt;\r\t\t|^&lt;!--\\ end\\ tminclude\\ --&gt;$\r\t\t|&lt;\\\?(\?:php)\?.*\\bend(if|for(each)\?|while)\\b\r\t\t|\\{\\{\?/(if|foreach|capture|literal|foreach|php|section|strip)\r\t\t|^[^{]*\\}\r\t\t)</blockEndMarker>\r\r\t<contexts defaultColor\x3D\"#0\" caseSensitive\x3D\"no\">\t\t\r\t\t<highlightContext name\x3D\"Comment\" highlightColor\x3D\"#236E25\">\r\t\t\t<startRegEx>&lt;!--</startRegEx>\r\t\t\t<endRegEx>--&gt;</endRegEx>\r\t\t\t<highlightContext name\x3D\"todos\" highlightColor\x3D\"#FF0000\" backgroundColor\x3D\"#FFFF00\">\r\t\t\t\t<keywords>\r                \t\t<string>TODO</string>\r\t\t\t\t<string>HACK</string>\r\t\t\t\t</keywords>\r\t\t\t</highlightContext>\t\r\t\t</highlightContext>\r\r\t\t<highlightContext name\x3D\"CDATA\" highlightColor\x3D\"#FF0000\">\r\t\t\t<startRegEx>&lt;!\\s*\\[CDATA\\s*\\[</startRegEx>\r\t\t\t<endRegEx>\\]\\s*\\]\\s*&gt;</endRegEx>\r\t\t</highlightContext>\r\t\t\r\t\t<highlightContext name\x3D\"Doctype\" highlightColor\x3D\"#236E25\">\r\t\t\t<startRegEx>&lt;!</startRegEx>\r\t\t\t<endRegEx>&gt;</endRegEx>\r\t\t</highlightContext>\r\t\t\r\t\t<highlightContext name\x3D\"Escape\" highlightColor\x3D\"#236E25\">\r\t\t\t<startRegEx>&lt;\\\?</startRegEx>\r\t\t\t<endRegEx>\\\?&gt;</endRegEx>\r\t\t</highlightContext>\r\t\t\t\t\t\r        <highlightContext name\x3D\"Tags\" highlightColor\x3D\"#881280\">\r            <entryRegEx>(&lt;[^&gt;]*&gt;)</entryRegEx>\r            \r            <highlightContext name\x3D\"Strings in Tags\" highlightColor\x3D\"#1A1AA6\">\r                <entryRegEx>(\"[^\"&gt;&lt;]*\")</entryRegEx>\r            </highlightContext>\r            \r            <highlightContext name\x3D\"Single Strings in Tags\" highlightColor\x3D\"#1A1AA6\">\r                <entryRegEx>(\'[^\'&gt;&lt;]*\')</entryRegEx>\r            </highlightContext>\r            \r            <highlightContext name\x3D\"Attributes in Tags\" highlightColor\x3D\"#994500\">\r                <entryRegEx>([\\w-]*)[ \\t]*\x3D(\?\x3D[ \\t]*\"[^\"&gt;&lt;]*\")</entryRegEx>\r            </highlightContext>    \r        </highlightContext>\r        \r        <highlightContext name\x3D\"Entities\" highlightColor\x3D\"#881280\" backgroundColor\x3D\"#FFFF00\">\r            <entryRegEx>(&amp;\\w{1\x2C8};)</entryRegEx>\r        </highlightContext>\r\r\t</contexts>\r</highlightDefinition>", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events EncodingList
	#tag Event
		Sub Open()
		  Dim ec() As TextEncoding
		  Dim namecount As New Dictionary
		  For i As Integer = 0 To Encodings.Count - 1
		    Dim t As TextEncoding = Encodings.Item(i)
		    Dim c As Integer = namecount.Lookup(t.internetName, 0)
		    namecount.Value(t.internetName) = c + 1
		    Dim nm As String
		    If c > 0 Then
		      nm = t.internetName + " (Alternate)"
		    Else
		      nm = t.internetName
		    End If
		    mEncodings.Append(nm)
		    ec.Append(t)
		  Next
		  mEncodings.SortWith(ec)
		  For i As Integer = 0 To UBound(mEncodings)
		    Me.AddRow(mEncodings(i))
		    Me.RowTag(Me.ListCount - 1) = ec(i)
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  Dim tx As TextEncoding = Me.RowTag(Me.ListIndex)
		  Dim data As String
		  If tx.IsValidData(RawData) Then
		    data = DefineEncoding(RawData, tx)
		    Incompatible.Visible = False
		  Else
		    Incompatible.Visible = True
		  End If
		  SyntaxHilightContainer1.SetText(ConvertEncoding(data, Encodings.UTF8), Definition)
		  SetTitle(tx)
		  
		Exception Err As OutOfBoundsException
		  Self.Window.Title = "Message body - " + mType.ToString
		  SyntaxHilightContainer1.SetText(data, Definition)
		End Sub
	#tag EndEvent
#tag EndEvents
