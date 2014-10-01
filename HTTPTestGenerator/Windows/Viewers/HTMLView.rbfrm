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


#tag EndWindowCode

