#tag Module
Protected Module IDN
	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function GetLastError Lib "Kernel32" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function GetStringScripts Lib "Kernel32" (Flags As Integer, InputBuffer As Ptr, InputSize As Integer, ScriptsBuffer As Ptr, ScriptsSize As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function IdnToAscii Lib "Normaliz" (Flags As Integer, UnicodeStr As WString, UnicodeCount As Integer, ASCIIStr As Ptr, ASCIICount As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function IdnToUnicode Lib "Normaliz" (Flags As Integer, ASCIIStr As WString, ASCIICount As Integer, UnicodeStr As Ptr, UnicodeCount As Integer) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  Static avail As Boolean
		  If Not avail Then avail = System.IsFunctionAvailable("IdnToUnicode", "Normaliz")
		  Return avail
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PunyDecode(Data As String, Strict As Boolean = True) As String
		  If Not System.IsFunctionAvailable("IdnToUnicode", "Normaliz") Then Return Data
		  
		  Dim flags As Integer
		  If Not Strict Then flags = flags Or IDN_ALLOW_UNASSIGNED
		  Dim count As Integer = IdnToUnicode(flags, Data, -1, Nil, 0)
		  If count <> 0 Then
		    Dim out As New MemoryBlock(count * 2)
		    count = IdnToUnicode(flags, Data, -1, out, out.Size)
		    Return out.WString(0)
		  End If
		  
		  count = GetLastError()
		  Dim err As New UnsupportedFormatException
		  err.ErrorNumber = count
		  Raise err
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PunyEncode(Data As String, Strict As Boolean = True) As String
		  If Not System.IsFunctionAvailable("IdnToAscii", "Normaliz") Then Return Data
		  
		  Dim flags As Integer
		  If Not Strict Then flags = flags Or IDN_ALLOW_UNASSIGNED
		  Dim count As Integer = IdnToAscii(flags, Data, -1, Nil, 0)
		  If count <> 0 Then
		    Dim out As New MemoryBlock(count * 2)
		    count = IdnToAscii(flags, Data, -1, out, out.Size)
		    Return out.WString(0)
		  End If
		  
		  count = GetLastError()
		  Dim err As New UnsupportedFormatException
		  err.ErrorNumber = count
		  Raise err
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function StrComp(String1 As MemoryBlock, String2 As MemoryBlock, Mode As Integer) As Integer
		  If Not System.IsFunctionAvailable("GetStringScripts", "Kernel32") Then Return -2
		  
		  Dim sz As Integer = GetStringScripts(0, String1, String1.Size, Nil, 0)
		  Dim scripts1 As New MemoryBlock(sz)
		  sz = GetStringScripts(0, String2, String2.Size, Nil, 0)
		  Dim scripts2 As New MemoryBlock(sz)
		  Const VS_ALLOW_LATIN = &h0001
		  If GetStringScripts(0, String1, String1.Size, scripts1, scripts1.Size) <> scripts1.Size Or _
		    GetStringScripts(0, String2, String2.Size, scripts2, scripts2.Size) <> scripts2.Size Or _
		    Not VerifyScripts(VS_ALLOW_LATIN, scripts1, scripts1.Size, scripts2, scripts2.Size) Then
		    sz = GetLastError()
		    Dim err As New RuntimeException
		    err.ErrorNumber = sz
		    Raise err
		  End If
		  
		  Return REALbasic.StrComp(String1, String2, Mode)
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function VerifyScripts Lib "Kernel32" (Flags As Integer, LocaleScripts As Ptr, LocaleScriptsSize As Integer, TestScripts As Ptr, TestScriptsSize As Integer) As Boolean
	#tag EndExternalMethod


	#tag Constant, Name = IDN_ALLOW_UNASSIGNED, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = IDN_USE_STD3_ASCII_RULES, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
