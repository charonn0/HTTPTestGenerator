#tag Window
Begin Window CookieViewer
   BackColor       =   &h00FFFFFF
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   190
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   True
   Title           =   "Cookies"
   Visible         =   True
   Width           =   724
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   6
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   190
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Cookie Name	Cookie Value	Expires	Domain	Path	Connection Type"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   724
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub ShowCookies(c() As Cookie)
		  Listbox1.DeleteAllRows
		  For i As Integer = 0 To UBound(c)
		    Listbox1.AddRow("")
		    Dim d As New Date
		    Listbox1.Cell(i, 0) = c(i).Name
		    Listbox1.Cell(i, 1) = c(i).Value
		    If c(i).Expires <> Nil And c(i).Expires.TotalSeconds - d.TotalSeconds >= 3600 Then
		      Listbox1.Cell(i, 2) = c(i).Expires.ShortDate + " " + c(i).Expires.ShortTime + " UTC " + Format(c(i).Expires.GMTOffset, "+-#0.0#")
		    Else
		      Listbox1.Cell(i, 2) = "End of session"
		    End If
		    Listbox1.Cell(i, 3) = c(i).Domain
		    Listbox1.Cell(i, 4) = c(i).Path
		    If c(i).Secure Then
		      Listbox1.Cell(i, 5) = "HTTPS Only"
		    Else
		      Listbox1.Cell(i, 5) = "HTTP Only"
		    End If
		    Listbox1.RowTag(i) = c(i)
		  Next
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim m As New MenuItem("Copy to request headers")
		  m.Tag = Me.RowTag(Me.RowFromXY(X, Y))
		  Base.Append(m)
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem.Text = "Copy to request headers" Then
		    Dim c As Cookie = hitItem.Tag
		    Generator.RequestMain1.RequestHeaders.AddRow("Cookie", c.Name + "=" + c.Value, "")
		    Generator.RequestMain1.RequestHeaders.RowTag(Generator.RequestMain1.RequestHeaders.LastIndex) = c
		    Return True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
