#tag Window
Begin ContainerControl HTMLView Implements Viewer
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   False
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
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   614
   Begin SyntaxHilightContainer SyntaxHilightContainer1
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   430
      HelpTag         =   ""
      Index           =   -2147483648
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
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   614
   End
   Begin ComboBox EncodingList
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   90
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   3
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   176
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Encoding:"
      TextAlign       =   2
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   4
      Transparent     =   False
      Underline       =   False
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
      Italic          =   False
      Left            =   272
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Incompatible encoding"
      TextAlign       =   0
      TextColor       =   &c000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   3
      Transparent     =   True
      Underline       =   False
      Visible         =   False
      Width           =   342
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Function ExtractLinks(HTML As String, BaseURL As String) As Pair()
		  Dim base As URIHelpers.URI = BaseURL
		  Dim hrefRegex As New Regex
		  hrefRegex.SearchPattern = "<A[^>]*?HREF\s*=\s*""([^""]+)""[^>]*?>([\s\S]*?)<\/A>"
		  hrefRegex.Options.CaseSensitive = False
		  Dim output() As Pair
		  dim r As RegExMatch = hrefRegex.Search(HTML)
		  Do Until r = Nil
		    Dim u As URIHelpers.URI = r.SubExpressionString(1)
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
		  RawViewer(Self.Window).SetTitle(t, mContentLength)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewRaw(Message As MemoryBlock, Type As HTTP.ContentType, ContentLen As Integer, DebugOutput As HTTP.DebugMessage = Nil)
		  Definition = New HighlightDefinition
		  Call Definition.LoadFromXml(HTMLSyntaxDef)
		  SyntaxHilightContainer1.SetText(Message, Definition)
		  mRaw = Message
		  mType = Type
		  Dim i As Integer
		  If mType.CharSet <> Nil Then
		    i = mEncodings.IndexOf(mType.CharSet.internetName)
		  Else
		    i = mEncodings.IndexOf("UTF-8")
		  End If
		  If i > -1 Then EncodingList.ListIndex = i
		  mContentLength = ContentLen
		  mDebugOutput = DebugOutput
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

	#tag Property, Flags = &h21
		Private mDebugOutput As HTTP.DebugMessage
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEncodings() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRaw As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mType As ContentType
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
		  If tx.IsValidData(mRaw) Then
		    data = DefineEncoding(mRaw, tx)
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
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BaseURL"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
