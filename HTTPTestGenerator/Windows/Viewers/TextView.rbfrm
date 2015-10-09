#tag Window
Begin ContainerControl TextView Implements Viewer
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
   Begin TextArea PlainText
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &h00FFFFFF
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   430
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   27
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   614
   End
   Begin PopupMenu EncodingList
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   3
      Underline       =   ""
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
      TabIndex        =   2
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
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub ViewRaw(Message As MemoryBlock, Type As HTTP.ContentType)
		  PlainText.Text = Message
		  mRaw = Message
		  mType = Type
		  Self.Window.Title = "Message body - " + Type.ToString
		  If Type.CharSet <> Nil Then
		    Dim i As Integer = mEncodings.IndexOf(Type.CharSet.internetName)
		    If i > -1 Then EncodingList.ListIndex = i
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mEncodings() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRaw As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mType As HTTP.ContentType
	#tag EndProperty


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
		  Dim data As String = DefineEncoding(mRaw, tx)
		  PlainText.Text = ConvertEncoding(data, Encodings.UTF8)
		  Dim t As HTTP.ContentType = mType.ToString
		  t.CharSet = tx
		  Self.Window.Title = "Message body - " + t.ToString
		  
		Exception Err As OutOfBoundsException
		  Self.Window.Title = "Message body - " + mType.ToString
		  PlainText.Text = mRaw
		End Sub
	#tag EndEvent
#tag EndEvents
