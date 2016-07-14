#tag Class
Protected Class DirectoryIndex
Inherits HTTP.Response
	#tag Method, Flags = &h0
		Sub Constructor(Target As FolderItem, ServerPath As String)
		  Me.Target = Target
		  Me.RequestPath = ServerPath
		  Super.Constructor("HTTP/1.0 200 OK" + CRLF)
		  Me.ContentType = "text/html"
		  'Dim d As New Date
		  'd.TotalSeconds = d.TotalSeconds + 60
		  'Me.Expires = d
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DoSorts(SubSort As Integer, Direction As Integer) As FolderItem()
		  #If Not DebugBuild Then
		    #pragma BoundsChecking Off
		    #pragma NilObjectChecking Off
		    #pragma BackgroundTasks Off
		    #pragma StackOverflowChecking Off
		  #endif
		  
		  Dim items() As FolderItem
		  If Target = Nil Then Return items
		  Dim sorter() As Integer
		  Dim names(), dirtypes() As String
		  Dim dates() As Double
		  Dim sizes() As UInt64
		  
		  Dim count As Integer = Me.Target.Count
		  For i As Integer = 1 To Count
		    Dim item As FolderItem = Me.Target.Item(i)
		    items.Append(item)
		    sorter.Append(i - 1)
		    If item.Directory Then
		      dirtypes.Append("0000AAAA")
		    Else
		      Dim type As ContentType = item
		      dirtypes.Append(type.ToString)
		    End If
		    
		    names.Append(item.Name)
		    dates.Append(item.ModificationDate.TotalSeconds)
		    sizes.Append(item.Length)
		  Next
		  
		  'For SubSort As Integer = 0 To SubSorts.Ubound
		  If SubSort > 0 Then
		    Select Case SubSort
		    Case Sort_Alpha
		      names.SortWith(sorter)
		    Case Sort_Type
		      dirtypes.SortWith(sorter)
		    Case Sort_Date
		      dates.SortWith(sorter)
		    Case Sort_Size
		      sizes.SortWith(sorter)
		    End Select
		  End If
		  'Next
		  Dim ret() As FolderItem
		  If Direction = 0 Then
		    Dim icount As Integer = UBound(items)
		    For i As Integer = 0 To icount
		      Dim item As FolderItem = items(sorter(i))
		      ret.Append(item)
		    Next
		  Else
		    Dim icount As Integer = UBound(items)
		    For i As Integer = icount DownTo 0
		      Dim item As FolderItem = items(sorter(i))
		      ret.Append(item)
		    Next
		  End If
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Populate()
		  #If Not DebugBuild Then
		    #pragma BoundsChecking Off
		    #pragma NilObjectChecking Off
		    #pragma BackgroundTasks Off
		    #pragma StackOverflowChecking Off
		  #endif
		  
		  Dim pagedata As String = IndexPage
		  Dim timestart, timestop As Double
		  timestart = Microseconds
		  Dim Items() As FolderItem
		  Dim dir As Integer
		  Dim ai As Integer = Me.RequestPath.Arguments.IndexOf("dir")
		  If ai > -1 Then dir = Val(Me.RequestPath.Arguments.Value(ai))
		  Dim aCount As Integer = RequestPath.Arguments.Count - 1
		  For i As Integer = 0 To aCount
		    Dim k, v As String
		    k = RequestPath.Arguments.Name(i)
		    v = RequestPath.Arguments.Value(i)
		    Select Case k
		    Case "Sort"
		      Select Case v
		      Case "A"
		        Items = DoSorts(Sort_Alpha, dir)
		      Case "D"
		        Items = DoSorts(Sort_Date, dir)
		      Case "S"
		        Items = DoSorts(Sort_Size, dir)
		      Case "T"
		        Items = DoSorts(Sort_Type, dir)
		      Else
		        Items = DoSorts(Sort_Alpha, dir)
		      End Select
		    End Select
		  Next
		  
		  If Items.Ubound = -1 Then Items = DoSorts(Sort_Alpha, dir)
		  Dim lines() As String
		  
		  Dim icount As Integer = UBound(Items)
		  For i As Integer = 0 To icount
		    Dim item As FolderItem = items(i)
		    Dim line As String = TableRow
		    Dim name, href, icon As String
		    name = item.Name
		    href = ReplaceAll(RequestPath.Path.ToString + "/" + name, "//", "/")
		    
		    While Name.len > 40
		      Dim start As Integer
		      Dim snip As String
		      start = Name.Len / 3
		      snip = mid(Name, start, 5)
		      Name = Replace(Name, snip, "...")
		    Wend
		    Dim c As String
		    If i Mod 2 <> 0 Then
		      c = "#FFFFFF"
		    Else
		      c = "#C0C0C0"
		    End If
		    line = ReplaceAll(line, "%ROWCOLOR%", c)
		    Dim type As ContentType = item
		    line = ReplaceAll(line, "%FILEPATH%", href)
		    line = ReplaceAll(line, "%FILENAME%", name)
		    if item.Directory Then
		      line = ReplaceAll(line, "%FILESIZE%", " - ")
		      line = ReplaceAll(line, "%FILETYPE%", "Directory")
		    Else
		      line = ReplaceAll(line, "%FILESIZE%", HTTP.FormatBytes(item.Length))
		      line = ReplaceAll(line, "%FILETYPE%", type.ToString)
		    End if
		    line = ReplaceAll(line, "%FILEICON%", icon)
		    line = ReplaceAll(line, "%FILEDATE%", item.ModificationDate.ShortDate + " " + item.ModificationDate.ShortTime)
		    lines.Append(line)
		  Next
		  If RequestPath.Path.ToString <> "/" Then
		    Dim s As String = RequestPath.Path.Parent.ToString
		    PageData = ReplaceAll(PageData, "%UPLINK%", "<a href=""" + s + """>Parent Directory</a>")
		  Else
		    PageData = ReplaceAll(PageData, "%UPLINK%", "")
		  End If
		  Dim head As String = TableHeader
		  If dir = 0 Then
		    head = ReplaceAll(head, "%DIRECTION%", "&amp;dir=1")
		  Else
		    head = ReplaceAll(head, "%DIRECTION%", "&amp;dir=0")
		  End If
		  pagedata = Replace(pagedata, "%TABLE%", head + Join(lines, EndOfLine))
		  pagedata = ReplaceAll(pagedata, "%PAGETITLE%", "Index of " + DecodeURLComponent(RequestPath.Path.ToString))
		  If Ubound(Items) + 1 = 1 Then
		    pagedata = Replace(pagedata, "%ITEMCOUNT%", "1 item.")
		  Else
		    pagedata = Replace(pagedata, "%ITEMCOUNT%", Format(Ubound(Items) + 1, "###,###,###") + " items.")
		  End If
		  
		  pagedata = Replace(pagedata, "%DAEMONVERSION%", HTTP.DaemonVersion)
		  timestop = Microseconds
		  timestart = timestop - timestart
		  Dim timestamp As String = Format(timestart / 1000, "###,##0.0#") + "ms"
		  pagedata = Replace(pagedata, "%TIME%", timestamp)
		  
		  Me.MessageBody = PageData
		  Me.ContentType = "text/html"
		  Me.Header("Content-Length") = Str(Me.MessageBody.LenB)
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private RequestPath As URIHelpers.URI
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Target As FolderItem
	#tag EndProperty


	#tag Constant, Name = IndexPage, Type = String, Dynamic = False, Default = \"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r<html xmlns\x3D\"http://www.w3.org/1999/xhtml\" lang\x3D\"en\">\r<head>\r<title>%PAGETITLE%</title>\r<style type\x3D\"text/css\">\r<!--\ra:link {\r\tcolor: #0000FF;\r\ttext-decoration: none;\r}\ra:visited {\r\ttext-decoration: none;\r\tcolor: #004080;\r}\ra:hover {\r\ttext-decoration: underline;\r\tcolor: #009966;\r}\ra:active {\r\ttext-decoration: none;\r\tcolor: #FF0000;\r}\r-->\r</style>\r</head>\r\r<body>\r<h1>%PAGETITLE%</h1><h2>%ITEMCOUNT%</h2>\r<p>%UPLINK%</p>\r<table width\x3D\"90%\" border\x3D\"0\" cellspacing\x3D\"5\" cellpadding\x3D\"4\">\r%TABLE%\r</table>\r<hr />\r<p><em>Powered by: %DAEMONVERSION% <br />\r%TIME%</em>\r</p>\r</body>\r</html>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Sort_Alpha, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Sort_Date, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Sort_Default, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Sort_Size, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Sort_Type, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TableHeader, Type = String, Dynamic = False, Default = \"<tr>\r    <td bgcolor\x3D\"#FFFFFF\"><a href\x3D\"\?sort\x3DA%DIRECTION%\">Name</a></td>\r    <td bgcolor\x3D\"#FFFFFF\"><a href\x3D\"\?sort\x3DD%DIRECTION%\">Last modified</a> </td>\r    <td bgcolor\x3D\"#FFFFFF\"><a href\x3D\"\?sort\x3DS%DIRECTION%\">Size</a></td>\r    <td bgcolor\x3D\"#FFFFFF\"><a href\x3D\"\?sort\x3DT%DIRECTION%\">Description</a></td>\r  </tr>", Scope = Private
	#tag EndConstant

	#tag Constant, Name = TableRow, Type = String, Dynamic = False, Default = \"    <tr>\r    <td width\x3D\"51%\" bgcolor\x3D\"%ROWCOLOR%\"><a href\x3D\"%FILEPATH%\">%FILENAME%</a></td>\r    <td width\x3D\"18%\" bgcolor\x3D\"%ROWCOLOR%\">%FILEDATE%</td>\r    <td width\x3D\"7%\" bgcolor\x3D\"%ROWCOLOR%\">%FILESIZE%</td>\r    <td width\x3D\"24%\" bgcolor\x3D\"%ROWCOLOR%\">%FILETYPE%</td>\r    </tr>\r    ", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="IncludeDateHeader"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="HTTP.Response"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageBody"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="HTTP.HTTPMessage"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProtocolVersion"
			Group="Behavior"
			Type="Single"
			InheritedFrom="HTTP.HTTPMessage"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusCode"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="HTTP.Response"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="HTTP.Response"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
