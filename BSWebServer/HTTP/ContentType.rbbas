#tag Class
Class ContentType
	#tag Method, Flags = &h0
		Function Acceptance(OtherType As ContentType) As Single
		  'Returns a Single that is <=1. This is the comparative "weight" of the match between the
		  'two types. A weight of 1 has the highest Acceptance
		  If Not OtherType.Accepts(Me) Then Return 0.0
		  Return (OtherType.Weight + Me.Weight) / 2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Accepts(OtherType As ContentType) As Boolean
		  ' Returns True if the OtherType is compatible with the current type. Use the Acceptance method to
		  ' determine which ContentType is preferred if more than one is accepted.
		  ' Only the SuperType and SubType are compared; optional parts like CharSet are not considered.
		  
		  If OtherType.SuperType <> Me.SuperType And OtherType.SuperType <> "*" And Me.SuperType <> "*" Then Return False
		  If OtherType.SubType <> Me.SubType And OtherType.SubType <> "*" And Me.SubType <> "*" Then Return False
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub AddType(FileExtension As String, MIMEName As String)
		  MIMETypes.Value(FileExtension) = MIMEName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(TargetFile As FolderItem)
		  ' Pass a folderitem to construct a ContentType object based on the file name extension. The FolderItem need not exist.
		  
		  Dim t As String = "application/octet-stream"
		  If TargetFile <> Nil Then t = MIMETypes.Lookup(NthField(TargetFile.Name, ".", CountFields(TargetFile.Name, ".")), t)
		  Me.Constructor(t)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Raw As String)
		  'Accepts a single raw ContentType string (e.g. "text/html; CharSet=UTF-8")
		  'For strings that might contain multiple entries, use ContentType.ParseTypes
		  
		  If InStr(Raw, "/") = 0 Then Raise New UnsupportedFormatException
		  
		  If InStr(Raw, ";") > 0 Then
		    Dim fields() As String = Split(raw, ";")
		    Dim fcount As Integer = Ubound(fields)
		    For i As Integer = 0 To fcount
		      Dim entry As String = fields(i)
		      If InStr(entry, "/") > 0 Then
		        If NthField(entry, "/", 1).Trim <> "" Then
		          SuperType = NthField(entry, "/", 1).Trim
		        Else
		          SuperType = "*"
		        End If
		        
		        If NthField(entry, "/", 2).Trim <> "" Then
		          SubType = NthField(entry, "/", 2).Trim
		        Else
		          SubType = "*"
		        End If
		      Else
		        Select Case NthField(entry, "=", 1).Trim
		        Case "q"
		          Weight = CDbl(NthField(entry, "=", 2))
		        Case "charset"
		          Dim nm As String = NthField(entry, "=", 2)
		          For e As Integer = 0 To Encodings.Count' - 1
		            If Encodings.Item(e).internetName = nm Then
		              Me.CharSet = Encodings.Item(e)
		              Exit For e
		            End If
		          Next
		        Case "boundary"
		          Boundary = NthField(entry, "boundary=", 2).Trim
		        End Select
		      End If
		      
		    Next
		    
		  Else
		    If NthField(Raw, "/", 1).Trim <> "" Then
		      SuperType = NthField(Raw, "/", 1).Trim
		    Else
		      SuperType = "*"
		    End If
		    
		    If NthField(Raw, "/", 2).Trim <> "" Then
		      SubType = NthField(Raw, "/", 2).Trim
		    Else
		      SubType = "*"
		    End If
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetIcon(ext As String) As String
		  ext = Lowercase(ext)
		  
		  Select Case ext
		  Case "exe", "com", "scr", "pif", "dll", "deb", "rpm"
		    Return "/" + WebServer.VirtualRoot + "/img/bin.png"
		    
		  Case "js", "cs", "c", "h", "vbs", "vbe", "bat", "cmd", "sh", "ini", "reg"
		    Return "/" + WebServer.VirtualRoot + "/img/script.png"
		    
		  Case "rbp", "rbbas", "rbvcp", "rbfrm", "rbres"
		    Return "/" + WebServer.VirtualRoot + "/img/xojo.png"
		    
		  Case "folder"
		    Return "/" + WebServer.VirtualRoot + "/img/dir.png"
		    
		  Case "txt", "md"
		    Return "/" + WebServer.VirtualRoot + "/img/txt.png"
		    
		  Case "htm", "html"
		    Return "/" + WebServer.VirtualRoot + "/img/html.png"
		    
		  Case "css"
		    Return "/" + WebServer.VirtualRoot + "/img/css.png"
		    
		  Case "xml", "xsl"
		    Return "/" + WebServer.VirtualRoot + "/img/xml.png"
		    
		  Case "jpg", "jpeg", "png", "bmp", "gif", "tif"
		    Return "/" + WebServer.VirtualRoot + "/img/image.png"
		    
		  Case "mov", "mp4", "m4v", "avi", "mpg", "mpeg", "wmv", "mkv"
		    Return "/" + WebServer.VirtualRoot + "/img/mov.png"
		    
		  Case "ttf", "otf", "pfb", "pfm"
		    Return "/" + WebServer.VirtualRoot + "/img/font.png"
		    
		  Case "zip", "tar", "rar", "7zip", "bzip", "gzip", "7z", "tgz", "gz", "z"
		    Return "/" + WebServer.VirtualRoot + "/img/zip.png"
		    
		  Case "wav"
		    Return "/" + WebServer.VirtualRoot + "/img/wav.png"
		    
		  Case "mp3", "m4a", "m4b", "m4p", "ogg", "flac"
		    Return "/" + WebServer.VirtualRoot + "/img/mus.png"
		    
		  Case "pdf", "ps"
		    Return "/" + WebServer.VirtualRoot + "/img/pdf.png"
		    
		  Case "xls", "xlsx"
		    Return "/" + WebServer.VirtualRoot + "/img/xls.png"
		    
		  Case "doc", "docx"
		    Return "/" + WebServer.VirtualRoot + "/img/doc.png"
		    
		  Else ' This returns the default icon
		    Return "/" + WebServer.VirtualRoot + "/img/unknown.png"
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetType(FileName As String) As ContentType
		  Dim ext As String = NthField(FileName, ".", CountFields(FileName, "."))
		  If MIMETypes.HasKey(ext) Then
		    Return New ContentType(MIMETypes.Value(ext).StringValue)
		  End If
		  Return New ContentType("application/octet-stream")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherType As String) As Integer
		  ' Allows you to compare a ContentType directly to a String.
		  ' If the String would be Accepted this method returns 0 (equivalence)
		  ' Otherwise, performs a lexicographic comparison
		  ' e.g.
		  '     If MyContentType = "text/html" Then
		  
		  If Me.Accepts(New ContentType(OtherType)) Then Return 0
		  Return StrComp(Me.ToString, OtherType, 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ParseTypes(Raw As String) As ContentType()
		  'parses a multi-field content-type string into and array of ContentType objects
		  'e.g. "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
		  Dim fields() As String
		  If InStr(Raw, ",") > 0 Then 'multiple types
		    fields = Split(raw, ",")
		  Else
		    fields.Append(raw)
		  End If
		  Dim types() As ContentType
		  Dim fcount As Integer = Ubound(fields)
		  For i As Integer = 0 To fcount
		    types.Append(New ContentType(fields(i)))
		  Next
		  Return types
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub RemoveType(FileExtension As String)
		  If MIMETypes.HasKey(FileExtension) Then
		    MIMETypes.Remove(FileExtension)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  'serializes the object
		  
		  Dim data As String = SuperType + "/" + SubType
		  If Me.Weight < 1 Then
		    data = data + "; q=" + Format(Me.Weight, ".##")
		  End If
		  If Me.CharSet <> Nil Then
		    data = data + "; CharSet=" + Me.CharSet.internetName
		  End If
		  Return Data
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		#tag Note
			Optional; only useful in MultipartForms
		#tag EndNote
		Boundary As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Optional; the character encoding of the content.
		#tag EndNote
		CharSet As TextEncoding
	#tag EndProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Static mMIMEType As Dictionary
			  If mMIMEType = Nil Then
			    mMIMEType = New Dictionary( _
			    "123":"application/vnd.lotus-1-2-3", _
			    "3dml":"text/vnd.in3d.3dml", _
			    "3g2":"video/3gpp2", _
			    "3gp":"video/3gpp", _
			    "7z":"application/x-7z-compressed", _
			    "aab":"application/x-authorware-bin", _
			    "aac":"audio/x-aac", _
			    "aam":"application/x-authorware-map", _
			    "aas":"application/x-authorware-seg", _
			    "abw":"application/x-abiword", _
			    "ac":"application/pkix-attr-cert", _
			    "acc":"application/vnd.americandynamics.acc", _
			    "ace":"application/x-ace-compressed", _
			    "acu":"application/vnd.acucobol", _
			    "acutc":"application/vnd.acucorp", _
			    "adp":"audio/adpcm", _
			    "aep":"application/vnd.audiograph", _
			    "afp":"application/vnd.ibm.modcap", _
			    "ahead":"application/vnd.ahead.space", _
			    "ai":"application/postscript", _
			    "aif":"audio/x-aiff", _
			    "aifc":"audio/x-aiff", _
			    "aiff":"audio/x-aiff", _
			    "air":"application/vnd.adobe.air-application-installer-package+zip", _
			    "ait":"application/vnd.dvb.ait", _
			    "ami":"application/vnd.amiga.ami", _
			    "apk":"application/vnd.android.package-archive", _
			    "application":"application/x-ms-application", _
			    "apr":"application/vnd.lotus-approach", _
			    "asc":"application/pgp-signature", _
			    "asf":"video/x-ms-asf", _
			    "asm":"text/x-asm", _
			    "aso":"application/vnd.accpac.simply.aso", _
			    "asx":"video/x-ms-asf", _
			    "atc":"application/vnd.acucorp", _
			    "atom":"application/atom+xml", _
			    "atomcat":"application/atomcat+xml", _
			    "atomsvc":"application/atomsvc+xml", _
			    "atx":"application/vnd.antix.game-component", _
			    "au":"audio/basic", _
			    "avi":"video/x-msvideo", _
			    "aw":"application/applixware", _
			    "azf":"application/vnd.airzip.filesecure.azf", _
			    "azs":"application/vnd.airzip.filesecure.azs", _
			    "azw":"application/vnd.amazon.ebook", _
			    "bat":"application/x-msdownload", _
			    "bcpio":"application/x-bcpio", _
			    "bdf":"application/x-font-bdf", _
			    "bdm":"application/vnd.syncml.dm+wbxml", _
			    "bed":"application/vnd.realvnc.bed", _
			    "bh2":"application/vnd.fujitsu.oasysprs", _
			    "bmi":"application/vnd.bmi", _
			    "bmp":"image/bmp", _
			    "book":"application/vnd.framemaker", _
			    "box":"application/vnd.previewsystems.box", _
			    "bs":"text/html", _
			    "btif":"image/prs.btif", _
			    "bz":"application/x-bzip", _
			    "bz2":"application/x-bzip2", _
			    "c":"text/x-c", _
			    "c11amc":"application/vnd.cluetrust.cartomobile-config", _
			    "c11amz":"application/vnd.cluetrust.cartomobile-config-pkg", _
			    "c4d":"application/vnd.clonk.c4group", _
			    "c4f":"application/vnd.clonk.c4group", _
			    "c4g":"application/vnd.clonk.c4group", _
			    "c4p":"application/vnd.clonk.c4group", _
			    "c4u":"application/vnd.clonk.c4group", _
			    "cab":"application/vnd.ms-cab-compressed", _
			    "car":"application/vnd.curl.car", _
			    "cat":"application/vnd.ms-pki.seccat", _
			    "cc":"text/x-c", _
			    "ccxml":"application/ccxml+xml", _
			    "cdbcmsg":"application/vnd.contact.cmsg", _
			    "cdkey":"application/vnd.mediastation.cdkey", _
			    "cdmia":"application/cdmi-capability", _
			    "cdmic":"application/cdmi-container", _
			    "cdmid":"application/cdmi-domain", _
			    "cdmio":"application/cdmi-object", _
			    "cdmiq":"application/cdmi-queue", _
			    "cdx":"chemical/x-cdx", _
			    "cdxml":"application/vnd.chemdraw+xml", _
			    "cdy":"application/vnd.cinderella", _
			    "cer":"application/pkix-cert", _
			    "cgm":"image/cgm", _
			    "chat":"application/x-chat", _
			    "chm":"application/vnd.ms-htmlhelp", _
			    "chrt":"application/vnd.kde.kchart", _
			    "cif":"chemical/x-cif", _
			    "cii":"application/vnd.anser-web-certificate-issue-initiation", _
			    "cil":"application/vnd.ms-artgalry", _
			    "cla":"application/vnd.claymore", _
			    "class":"application/java-vm", _
			    "clkk":"application/vnd.crick.clicker.keyboard", _
			    "clkp":"application/vnd.crick.clicker.palette", _
			    "clkt":"application/vnd.crick.clicker.template", _
			    "clkw":"application/vnd.crick.clicker.wordbank", _
			    "clkx":"application/vnd.crick.clicker", _
			    "clp":"application/x-msclip", _
			    "cmc":"application/vnd.cosmocaller", _
			    "cmdf":"chemical/x-cmdf", _
			    "cml":"chemical/x-cml", _
			    "cmp":"application/vnd.yellowriver-custom-menu", _
			    "cmx":"image/x-cmx", _
			    "cod":"application/vnd.rim.cod", _
			    "com":"application/x-msdownload", _
			    "conf":"text/plain", _
			    "cpio":"application/x-cpio", _
			    "cpp":"text/x-c", _
			    "cpt":"application/mac-compactpro", _
			    "crd":"application/x-mscardfile", _
			    "crl":"application/pkix-crl", _
			    "crt":"application/x-x509-ca-cert", _
			    "cryptonote":"application/vnd.rig.cryptonote", _
			    "csh":"application/x-csh", _
			    "csml":"chemical/x-csml", _
			    "csp":"application/vnd.commonspace", _
			    "css":"text/css", _
			    "csv":"text/csv", _
			    "cu":"application/cu-seeme", _
			    "curl":"text/vnd.curl", _
			    "cww":"application/prs.cww", _
			    "cxx":"text/x-c", _
			    "dae":"model/vnd.collada+xml", _
			    "daf":"application/vnd.mobius.daf", _
			    "dataless":"application/vnd.fdsn.seed", _
			    "davmount":"application/davmount+xml", _
			    "dcurl":"text/vnd.curl.dcurl", _
			    "dd2":"application/vnd.oma.dd2+xml", _
			    "ddd":"application/vnd.fujixerox.ddd", _
			    "deb":"application/x-debian-package", _
			    "def":"text/plain", _
			    "der":"application/x-x509-ca-cert", _
			    "dfac":"application/vnd.dreamfactory", _
			    "dif":"video/x-dv", _
			    "dir":"application/x-director", _
			    "dis":"application/vnd.mobius.dis", _
			    "djvu":"image/vnd.djvu", _
			    "dll":"application/x-msdownload", _
			    "dna":"application/vnd.dna", _
			    "doc":"application/msword", _
			    "docm":"application/vnd.ms-word.document.macroenabled.12", _
			    "docx":"application/vnd.openxmlformats-officedocument.wordprocessingml.document", _
			    "dot":"application/msword", _
			    "dotm":"application/vnd.ms-word.template.macroenabled.12", _
			    "dotx":"application/vnd.openxmlformats-officedocument.wordprocessingml.template", _
			    "dp":"application/vnd.osgi.dp", _
			    "dpg":"application/vnd.dpgraph", _
			    "dsc":"text/prs.lines.tag", _
			    "dssc":"application/dssc+der", _
			    "dtb":"application/x-dtbook+xml", _
			    "dtd":"application/xml-dtd", _
			    "dv":"video/x-dv", _
			    "dvi":"application/x-dvi", _
			    "dwf":"model/vnd.dwf", _
			    "dwg":"image/vnd.dwg", _
			    "dxf":"image/vnd.dxf", _
			    "dxp":"application/vnd.spotfire.dxp", _
			    "ecma":"application/ecmascript", _
			    "edm":"application/vnd.novadigm.edm", _
			    "edx":"application/vnd.novadigm.edx", _
			    "efif":"application/vnd.picsel", _
			    "ei6":"application/vnd.pg.osasli", _
			    "eml":"message/rfc822", _
			    "emma":"application/emma+xml", _
			    "eot":"application/vnd.ms-fontobject", _
			    "eps":"application/postscript", _
			    "epub":"application/epub+zip", _
			    "es3":"application/vnd.eszigno3+xml", _
			    "esf":"application/vnd.epson.esf", _
			    "et3":"application/vnd.eszigno3+xml", _
			    "etx":"text/x-setext", _
			    "exe":"application/x-msdownload", _
			    "exi":"application/exi", _
			    "ext":"application/vnd.novadigm.ext", _
			    "ez":"application/andrew-inset", _
			    "ez2":"application/vnd.ezpix-album", _
			    "ez3":"application/vnd.ezpix-package", _
			    "f4v":"video/x-f4v", _
			    "fbs":"image/vnd.fastbidsheet", _
			    "fcs":"application/vnd.isac.fcs", _
			    "fdf":"application/vnd.fdf", _
			    "fe_launch":"application/vnd.denovo.fcselayout-link", _
			    "fg5":"application/vnd.fujitsu.oasysgp", _
			    "fh":"image/x-freehand", _
			    "fig":"application/x-xfig", _
			    "fli":"video/x-fli", _
			    "flo":"application/vnd.micrografx.flo", _
			    "flv":"video/x-flv", _
			    "flw":"application/vnd.kde.kivio", _
			    "flx":"text/vnd.fmi.flexstor", _
			    "fly":"text/vnd.fly", _
			    "fm":"application/vnd.framemaker", _
			    "fnc":"application/vnd.frogans.fnc", _
			    "fpx":"image/vnd.fpx", _
			    "frame":"application/vnd.framemaker", _
			    "fsc":"application/vnd.fsc.weblaunch", _
			    "fst":"image/vnd.fst", _
			    "ftc":"application/vnd.fluxtime.clip", _
			    "fti":"application/vnd.anser-web-funds-transfer-initiation", _
			    "fvt":"video/vnd.fvt", _
			    "fxp":"application/vnd.adobe.fxp", _
			    "fxpl":"application/vnd.adobe.fxp", _
			    "fzs":"application/vnd.fuzzysheet", _
			    "g2w":"application/vnd.geoplan", _
			    "g3":"image/g3fax", _
			    "g3w":"application/vnd.geospace", _
			    "gac":"application/vnd.groove-account", _
			    "gdl":"model/vnd.gdl", _
			    "geo":"application/vnd.dynageo", _
			    "gex":"application/vnd.geometry-explorer", _
			    "ggb":"application/vnd.geogebra.file", _
			    "ggt":"application/vnd.geogebra.tool", _
			    "ghf":"application/vnd.groove-help", _
			    "gif":"image/gif", _
			    "gim":"application/vnd.groove-identity-message", _
			    "gmx":"application/vnd.gmx", _
			    "gnumeric":"application/x-gnumeric", _
			    "gph":"application/vnd.flographit", _
			    "gqf":"application/vnd.grafeq", _
			    "gqs":"application/vnd.grafeq", _
			    "gram":"application/srgs", _
			    "gre":"application/vnd.geometry-explorer", _
			    "grv":"application/vnd.groove-injector", _
			    "grxml":"application/srgs+xml", _
			    "gsf":"application/x-font-ghostscript", _
			    "gtar":"application/x-gtar", _
			    "gtm":"application/vnd.groove-tool-message", _
			    "gtw":"model/vnd.gtw", _
			    "gv":"text/vnd.graphviz", _
			    "gxt":"application/vnd.geonext", _
			    "h":"text/x-c", _
			    "h261":"video/h261", _
			    "h263":"video/h263", _
			    "h264":"video/h264", _
			    "hal":"application/vnd.hal+xml", _
			    "hbci":"application/vnd.hbci", _
			    "hdf":"application/x-hdf", _
			    "hlp":"application/winhlp", _
			    "hpgl":"application/vnd.hp-hpgl", _
			    "hpid":"application/vnd.hp-hpid", _
			    "hps":"application/vnd.hp-hps", _
			    "hqx":"application/mac-binhex40", _
			    "htke":"application/vnd.kenameaapp", _
			    "htm":"text/html", _
			    "html":"text/html", _
			    "hvd":"application/vnd.yamaha.hv-dic", _
			    "hvp":"application/vnd.yamaha.hv-voice", _
			    "hvs":"application/vnd.yamaha.hv-script", _
			    "i2g":"application/vnd.intergeo", _
			    "icc":"application/vnd.iccprofile", _
			    "ice":"x-conference/x-cooltalk", _
			    "icm":"application/vnd.iccprofile", _
			    "ico":"image/x-icon", _
			    "ics":"text/calendar", _
			    "ief":"image/ief", _
			    "ifm":"application/vnd.shana.informed.formdata", _
			    "igl":"application/vnd.igloader", _
			    "igm":"application/vnd.insors.igm", _
			    "igs":"model/iges", _
			    "igx":"application/vnd.micrografx.igx", _
			    "iif":"application/vnd.shana.informed.interchange", _
			    "imp":"application/vnd.accpac.simply.imp", _
			    "ims":"application/vnd.ms-ims", _
			    "in":"text/plain", _
			    "ipfix":"application/ipfix", _
			    "ipk":"application/vnd.shana.informed.package", _
			    "irm":"application/vnd.ibm.rights-management", _
			    "irp":"application/vnd.irepository.package+xml", _
			    "itp":"application/vnd.shana.informed.formtemplate", _
			    "ivp":"application/vnd.immervision-ivp", _
			    "ivu":"application/vnd.immervision-ivu", _
			    "jad":"text/vnd.sun.j2me.app-descriptor", _
			    "jam":"application/vnd.jam", _
			    "jar":"application/java-archive", _
			    "java":"text/x-java-source", _
			    "jisp":"application/vnd.jisp", _
			    "jlt":"application/vnd.hp-jlyt", _
			    "jnlp":"application/x-java-jnlp-file", _
			    "joda":"application/vnd.joost.joda-archive", _
			    "jp2":"image/jp2", _
			    "jpe":"image/jpeg", _
			    "jpeg":"image/jpeg", _
			    "jpg":"image/jpeg", _
			    "jpgv":"video/jpeg", _
			    "jpm":"video/jpm", _
			    "js":"application/javascript", _
			    "json":"application/json", _
			    "karbon":"application/vnd.kde.karbon", _
			    "kfo":"application/vnd.kde.kformula", _
			    "kia":"application/vnd.kidspiration", _
			    "kml":"application/vnd.google-earth.kml+xml", _
			    "kmz":"application/vnd.google-earth.kmz", _
			    "kne":"application/vnd.kinar", _
			    "kon":"application/vnd.kde.kontour", _
			    "kpr":"application/vnd.kde.kpresenter", _
			    "ksp":"application/vnd.kde.kspread", _
			    "ktr":"application/vnd.kahootz", _
			    "ktx":"image/ktx", _
			    "ktz":"application/vnd.kahootz", _
			    "kwd":"application/vnd.kde.kword", _
			    "lasxml":"application/vnd.las.las+xml", _
			    "latex":"application/x-latex", _
			    "lbd":"application/vnd.llamagraphics.life-balance.desktop", _
			    "lbe":"application/vnd.llamagraphics.life-balance.exchange+xml", _
			    "les":"application/vnd.hhe.lesson-player", _
			    "link66":"application/vnd.route66.link66+xml", _
			    "list":"text/plain", _
			    "list3820":"application/vnd.ibm.modcap", _
			    "listafp":"application/vnd.ibm.modcap", _
			    "log":"text/plain", _
			    "lostxml":"application/lost+xml", _
			    "lrm":"application/vnd.ms-lrm", _
			    "ltf":"application/vnd.frogans.ltf", _
			    "lwp":"application/vnd.lotus-wordpro", _
			    "m1v":"video/mpeg", _
			    "m21":"application/mp21", _
			    "m2a":"audio/mpeg", _
			    "m2v":"video/mpeg", _
			    "m3a":"audio/mpeg", _
			    "m3u":"audio/x-mpegurl", _
			    "m3u8":"application/x-mpegurl", _
			    "m4a":"audio/mp4a-latm", _
			    "m4p":"audio/mp4a-latm", _
			    "m4v":"video/x-m4v", _
			    "ma":"application/mathematica", _
			    "mac":"image/x-macpaint", _
			    "mads":"application/mads+xml", _
			    "mag":"application/vnd.ecowin.chart", _
			    "maker":"application/vnd.framemaker", _
			    "manifest":"text/cache-manifest", _
			    "mathml":"application/mathml+xml", _
			    "mb":"application/mathematica", _
			    "mbk":"application/vnd.mobius.mbk", _
			    "mbox":"application/mbox", _
			    "mc1":"application/vnd.medcalcdata", _
			    "mcd":"application/vnd.mcd", _
			    "mcurl":"text/vnd.curl.mcurl", _
			    "md":"text/plain", _
			    "mdb":"application/x-msaccess", _
			    "mdi":"image/vnd.ms-modi", _
			    "meta4":"application/metalink4+xml", _
			    "mets":"application/mets+xml", _
			    "mfm":"application/vnd.mfmp", _
			    "mgp":"application/vnd.osgeo.mapguide.package", _
			    "mgz":"application/vnd.proteus.magazine", _
			    "mid":"audio/midi", _
			    "midi":"audio/midi", _
			    "mif":"application/vnd.mif", _
			    "mime":"message/rfc822", _
			    "mj2":"video/mj2", _
			    "mlp":"application/vnd.dolby.mlp", _
			    "mmd":"application/vnd.chipnuts.karaoke-mmd", _
			    "mmf":"application/vnd.smaf", _
			    "mmr":"image/vnd.fujixerox.edmics-mmr", _
			    "mny":"application/x-msmoney", _
			    "mobi":"application/x-mobipocket-ebook", _
			    "mods":"application/mods+xml", _
			    "mov":"video/quicktime", _
			    "movie":"video/x-sgi-movie", _
			    "mp2":"audio/mpeg", _
			    "mp21":"application/mp21", _
			    "mp2a":"audio/mpeg", _
			    "mp3":"audio/mpeg", _
			    "mp4":"video/mp4", _
			    "mp4a":"audio/mp4", _
			    "mp4s":"application/mp4", _
			    "mp4v":"video/mp4", _
			    "mpc":"application/vnd.mophun.certificate", _
			    "mpe":"video/mpeg", _
			    "mpeg":"video/mpeg", _
			    "mpg":"video/mpeg", _
			    "mpg4":"video/mp4", _
			    "mpga":"audio/mpeg", _
			    "mpkg":"application/vnd.apple.installer+xml", _
			    "mpm":"application/vnd.blueice.multipass", _
			    "mpn":"application/vnd.mophun.application", _
			    "mpp":"application/vnd.ms-project", _
			    "mpt":"application/vnd.ms-project", _
			    "mpy":"application/vnd.ibm.minipay", _
			    "mqy":"application/vnd.mobius.mqy", _
			    "mrc":"application/marc", _
			    "mrcx":"application/marcxml+xml", _
			    "mscml":"application/mediaservercontrol+xml", _
			    "mseed":"application/vnd.fdsn.mseed", _
			    "mseq":"application/vnd.mseq", _
			    "msf":"application/vnd.epson.msf", _
			    "msh":"model/mesh", _
			    "msi":"application/x-msdownload", _
			    "msl":"application/vnd.mobius.msl", _
			    "msty":"application/vnd.muvee.style", _
			    "mts":"model/vnd.mts", _
			    "mus":"application/vnd.musician", _
			    "musicxml":"application/vnd.recordare.musicxml+xml", _
			    "mvb":"application/x-msmediaview", _
			    "mwf":"application/vnd.mfer", _
			    "mxf":"application/mxf", _
			    "mxl":"application/vnd.recordare.musicxml", _
			    "mxml":"application/xv+xml", _
			    "mxs":"application/vnd.triscape.mxs", _
			    "mxu":"video/vnd.mpegurl", _
			    "n-gage":"application/vnd.nokia.n-gage.symbian.install", _
			    "n3":"text/n3", _
			    "nb":"application/mathematica", _
			    "nbp":"application/vnd.wolfram.player", _
			    "nc":"application/x-netcdf", _
			    "ncx":"application/x-dtbncx+xml", _
			    "ngdat":"application/vnd.nokia.n-gage.data", _
			    "nlu":"application/vnd.neurolanguage.nlu", _
			    "nml":"application/vnd.enliven", _
			    "nnd":"application/vnd.noblenet-directory", _
			    "nns":"application/vnd.noblenet-sealer", _
			    "nnw":"application/vnd.noblenet-web", _
			    "npx":"image/vnd.net-fpx", _
			    "nsf":"application/vnd.lotus-notes", _
			    "oa2":"application/vnd.fujitsu.oasys2", _
			    "oa3":"application/vnd.fujitsu.oasys3", _
			    "oas":"application/vnd.fujitsu.oasys", _
			    "obd":"application/x-msbinder", _
			    "odb":"application/vnd.oasis.opendocument.database", _
			    "odc":"application/vnd.oasis.opendocument.chart", _
			    "odf":"application/vnd.oasis.opendocument.formula", _
			    "odft":"application/vnd.oasis.opendocument.formula-template", _
			    "odg":"application/vnd.oasis.opendocument.graphics", _
			    "odi":"application/vnd.oasis.opendocument.image", _
			    "odm":"application/vnd.oasis.opendocument.text-master", _
			    "odp":"application/vnd.oasis.opendocument.presentation", _
			    "ods":"application/vnd.oasis.opendocument.spreadsheet", _
			    "odt":"application/vnd.oasis.opendocument.text", _
			    "oga":"audio/ogg", _
			    "ogg":"audio/ogg", _
			    "ogv":"video/ogg", _
			    "org":"application/vnd.lotus-organizer", _
			    "osf":"application/vnd.yamaha.openscoreformat", _
			    "osfpvg":"application/vnd.yamaha.openscoreformat.osfpvg+xml", _
			    "otc":"application/vnd.oasis.opendocument.chart-template", _
			    "otf":"application/x-font-otf", _
			    "otg":"application/vnd.oasis.opendocument.graphics-template", _
			    "oth":"application/vnd.oasis.opendocument.text-web", _
			    "oti":"application/vnd.oasis.opendocument.image-template", _
			    "otp":"application/vnd.oasis.opendocument.presentation-template", _
			    "ots":"application/vnd.oasis.opendocument.spreadsheet-template", _
			    "ott":"application/vnd.oasis.opendocument.text-template", _
			    "oxt":"application/vnd.openofficeorg.extension", _
			    "p10":"application/pkcs10", _
			    "p12":"application/x-pkcs12", _
			    "p7b":"application/x-pkcs7-certificates", _
			    "p7c":"application/pkcs7-mime", _
			    "p7m":"application/pkcs7-mime", _
			    "p7r":"application/x-pkcs7-certreqresp", _
			    "p7s":"application/pkcs7-signature", _
			    "p8":"application/pkcs8", _
			    "pas":"text/x-pascal", _
			    "paw":"application/vnd.pawaafile", _
			    "pbd":"application/vnd.powerbuilder6", _
			    "pbm":"image/x-portable-bitmap", _
			    "pcf":"application/x-font-pcf", _
			    "pcl":"application/vnd.hp-pcl", _
			    "pclxl":"application/vnd.hp-pclxl", _
			    "pct":"image/pict", _
			    "pcurl":"application/vnd.curl.pcurl", _
			    "pcx":"image/x-pcx", _
			    "pdb":"application/vnd.palm", _
			    "pfa":"application/x-font-type1", _
			    "pfr":"application/font-tdpfr", _
			    "pgm":"image/x-portable-graymap", _
			    "pgn":"application/x-chess-pgn", _
			    "pic":"image/pict", _
			    "pict":"image/pict", _
			    "pki":"application/pkixcmp", _
			    "pkipath":"application/pkix-pkipath", _
			    "plb":"application/vnd.3gpp.pic-bw-large", _
			    "plc":"application/vnd.mobius.plc", _
			    "plf":"application/vnd.pocketlearn", _
			    "pls":"application/pls+xml", _
			    "pml":"application/vnd.ctc-posml", _
			    "png":"image/png", _
			    "pnm":"image/x-portable-anymap", _
			    "pnt":"image/x-macpaint", _
			    "pntg":"image/x-macpaint", _
			    "portpkg":"application/vnd.macports.portpkg", _
			    "potm":"application/vnd.ms-powerpoint.template.macroenabled.12", _
			    "potx":"application/vnd.openxmlformats-officedocument.presentationml.template", _
			    "ppam":"application/vnd.ms-powerpoint.addin.macroenabled.12", _
			    "ppd":"application/vnd.cups-ppd", _
			    "ppm":"image/x-portable-pixmap", _
			    "pps":"application/vnd.ms-powerpoint", _
			    "ppsm":"application/vnd.ms-powerpoint.slideshow.macroenabled.12", _
			    "ppsx":"application/vnd.openxmlformats-officedocument.presentationml.slideshow", _
			    "ppt":"application/vnd.ms-powerpoint", _
			    "pptm":"application/vnd.ms-powerpoint.presentation.macroenabled.12", _
			    "pptx":"application/vnd.openxmlformats-officedocument.presentationml.presentation", _
			    "prc":"application/x-mobipocket-ebook", _
			    "pre":"application/vnd.lotus-freelance", _
			    "prf":"application/pics-rules", _
			    "ps":"application/postscript", _
			    "psb":"application/vnd.3gpp.pic-bw-small", _
			    "psd":"image/vnd.adobe.photoshop", _
			    "psf":"application/x-font-linux-psf", _
			    "pskcxml":"application/pskc+xml", _
			    "ptid":"application/vnd.pvi.ptid1", _
			    "pub":"application/x-mspublisher", _
			    "pvb":"application/vnd.3gpp.pic-bw-var", _
			    "pwn":"application/vnd.3m.post-it-notes", _
			    "pyv":"video/vnd.ms-playready.media.pyv", _
			    "qam":"application/vnd.epson.quickanime", _
			    "qbo":"application/vnd.intu.qbo", _
			    "qfx":"application/vnd.intu.qfx", _
			    "qps":"application/vnd.publishare-delta-tree", _
			    "qt":"video/quicktime", _
			    "qti":"image/x-quicktime", _
			    "qtif":"image/x-quicktime", _
			    "qxd":"application/vnd.quark.quarkxpress", _
			    "ra":"audio/x-pn-realaudio", _
			    "ram":"audio/x-pn-realaudio", _
			    "rar":"application/x-rar-compressed", _
			    "ras":"image/x-cmu-raster", _
			    "rbbas":"application/x-REALbasic-Project", _
			    "rbo":"application/x-REALbasic-Project", _
			    "rbp":"application/x-REALbasic-Project", _
			    "rbvcp":"application/x-REALbasic-Project", _
			    "rcprofile":"application/vnd.ipunplugged.rcprofile", _
			    "rdf":"application/rdf+xml", _
			    "rdz":"application/vnd.data-vision.rdz", _
			    "rep":"application/vnd.businessobjects", _
			    "res":"application/x-dtbresource+xml", _
			    "rgb":"image/x-rgb", _
			    "rif":"application/reginfo+xml", _
			    "rl":"application/resource-lists+xml", _
			    "rlc":"image/vnd.fujixerox.edmics-rlc", _
			    "rld":"application/resource-lists-diff+xml", _
			    "rm":"application/vnd.rn-realmedia", _
			    "rmp":"audio/x-pn-realaudio-plugin", _
			    "rms":"application/vnd.jcp.javame.midlet-rms", _
			    "rnc":"application/relax-ng-compact-syntax", _
			    "roff":"text/troff", _
			    "rp9":"application/vnd.cloanto.rp9", _
			    "rpss":"application/vnd.nokia.radio-presets", _
			    "rpst":"application/vnd.nokia.radio-preset", _
			    "rq":"application/sparql-query", _
			    "rs":"application/rls-services+xml", _
			    "rsd":"application/rsd+xml", _
			    "rss":"application/rss+xml", _
			    "rtf":"application/rtf", _
			    "rtx":"text/richtext", _
			    "saf":"application/vnd.yamaha.smaf-audio", _
			    "sbml":"application/sbml+xml", _
			    "sc":"application/vnd.ibm.secure-container", _
			    "scd":"application/x-msschedule", _
			    "scm":"application/vnd.lotus-screencam", _
			    "scq":"application/scvp-cv-request", _
			    "scs":"application/scvp-cv-response", _
			    "scurl":"text/vnd.curl.scurl", _
			    "sda":"application/vnd.stardivision.draw", _
			    "sdc":"application/vnd.stardivision.calc", _
			    "sdd":"application/vnd.stardivision.impress", _
			    "sdkm":"application/vnd.solent.sdkm+xml", _
			    "sdp":"application/sdp", _
			    "sdw":"application/vnd.stardivision.writer", _
			    "see":"application/vnd.seemail", _
			    "seed":"application/vnd.fdsn.seed", _
			    "sema":"application/vnd.sema", _
			    "semd":"application/vnd.semd", _
			    "semf":"application/vnd.semf", _
			    "ser":"application/java-serialized-object", _
			    "setpay":"application/set-payment-initiation", _
			    "setreg":"application/set-registration-initiation", _
			    "sfd-hdstx":"application/vnd.hydrostatix.sof-data", _
			    "sfs":"application/vnd.spotfire.sfs", _
			    "sgl":"application/vnd.stardivision.writer-global", _
			    "sgml":"text/sgml", _
			    "sh":"application/x-sh", _
			    "shar":"application/x-shar", _
			    "shf":"application/shf+xml", _
			    "sig":"application/pgp-signature", _
			    "sis":"application/vnd.symbian.install", _
			    "sit":"application/x-stuffit", _
			    "sitx":"application/x-stuffitx", _
			    "skp":"application/vnd.koan", _
			    "sldm":"application/vnd.ms-powerpoint.slide.macroenabled.12", _
			    "sldx":"application/vnd.openxmlformats-officedocument.presentationml.slide", _
			    "slt":"application/vnd.epson.salt", _
			    "sm":"application/vnd.stepmania.stepchart", _
			    "smf":"application/vnd.stardivision.math", _
			    "smi":"application/smil+xml", _
			    "smil":"application/smil+xml", _
			    "snd":"audio/basic", _
			    "snf":"application/x-font-snf", _
			    "spf":"application/vnd.yamaha.smaf-phrase", _
			    "spl":"application/x-futuresplash", _
			    "spot":"text/vnd.in3d.spot", _
			    "spp":"application/scvp-vp-response", _
			    "spq":"application/scvp-vp-request", _
			    "spx":"audio/ogg", _
			    "src":"application/x-wais-source", _
			    "sru":"application/sru+xml", _
			    "srx":"application/sparql-results+xml", _
			    "sse":"application/vnd.kodak-descriptor", _
			    "ssf":"application/vnd.epson.ssf", _
			    "ssml":"application/ssml+xml", _
			    "st":"application/vnd.sailingtracker.track", _
			    "stc":"application/vnd.sun.xml.calc.template", _
			    "std":"application/vnd.sun.xml.draw.template", _
			    "stf":"application/vnd.wt.stf", _
			    "sti":"application/vnd.sun.xml.impress.template", _
			    "stk":"application/hyperstudio", _
			    "stl":"application/vnd.ms-pki.stl", _
			    "str":"application/vnd.pg.format", _
			    "stw":"application/vnd.sun.xml.writer.template", _
			    "sub":"image/vnd.dvb.subtitle", _
			    "sus":"application/vnd.sus-calendar", _
			    "sv4cpio":"application/x-sv4cpio", _
			    "sv4crc":"application/x-sv4crc", _
			    "svc":"application/vnd.dvb.service", _
			    "svd":"application/vnd.svd", _
			    "svg":"image/svg+xml", _
			    "swf":"application/x-shockwave-flash", _
			    "swi":"application/vnd.aristanetworks.swi", _
			    "sxc":"application/vnd.sun.xml.calc", _
			    "sxd":"application/vnd.sun.xml.draw", _
			    "sxg":"application/vnd.sun.xml.writer.global", _
			    "sxi":"application/vnd.sun.xml.impress", _
			    "sxm":"application/vnd.sun.xml.math", _
			    "sxw":"application/vnd.sun.xml.writer", _
			    "t":"text/troff", _
			    "tao":"application/vnd.tao.intent-module-archive", _
			    "tar":"application/x-tar", _
			    "tcap":"application/vnd.3gpp2.tcap", _
			    "tcl":"application/x-tcl", _
			    "teacher":"application/vnd.smart.teacher", _
			    "tei":"application/tei+xml", _
			    "teicorpus":"application/tei+xml", _
			    "tex":"application/x-tex", _
			    "texi":"application/x-texinfo", _
			    "texinfo":"application/x-texinfo", _
			    "text":"text/plain", _
			    "tfi":"application/thraud+xml", _
			    "tfm":"application/x-tex-tfm", _
			    "thmx":"application/vnd.ms-officetheme", _
			    "tiff":"image/tiff", _
			    "tmo":"application/vnd.tmobile-livetv", _
			    "torrent":"application/x-bittorrent", _
			    "tpl":"application/vnd.groove-tool-template", _
			    "tpt":"application/vnd.trid.tpt", _
			    "tr":"text/troff", _
			    "tra":"application/vnd.trueapp", _
			    "trm":"application/x-msterminal", _
			    "ts":"video/mp2t", _
			    "tsd":"application/timestamped-data", _
			    "tsv":"text/tab-separated-values", _
			    "ttf":"application/x-font-ttf", _
			    "ttl":"text/turtle", _
			    "twd":"application/vnd.simtech-mindmapper", _
			    "txd":"application/vnd.genomatix.tuxedo", _
			    "txf":"application/vnd.mobius.txf", _
			    "txt":"text/plain", _
			    "ufd":"application/vnd.ufdl", _
			    "umj":"application/vnd.umajin", _
			    "unityweb":"application/vnd.unity", _
			    "uoml":"application/vnd.uoml+xml", _
			    "uri":"text/uri-list", _
			    "uris":"text/uri-list", _
			    "urls":"text/uri-list", _
			    "ustar":"application/x-ustar", _
			    "utz":"application/vnd.uiq.theme", _
			    "uu":"text/x-uuencode", _
			    "uvd":"application/vnd.dece.data", _
			    "uvf":"application/vnd.dece.data", _
			    "uvh":"video/vnd.dece.hd", _
			    "uvi":"image/vnd.dece.graphic", _
			    "uvm":"video/vnd.dece.mobile", _
			    "uvp":"video/vnd.dece.pd", _
			    "uvs":"video/vnd.dece.sd", _
			    "uvt":"application/vnd.dece.ttml+xml", _
			    "uvu":"video/vnd.uvvu.mp4", _
			    "uvv":"video/vnd.dece.video", _
			    "uvvd":"application/vnd.dece.data", _
			    "uvvf":"application/vnd.dece.data", _
			    "uvvt":"application/vnd.dece.ttml+xml", _
			    "uvvx":"application/vnd.dece.unspecified", _
			    "uvx":"application/vnd.dece.unspecified", _
			    "vcd":"application/x-cdlink", _
			    "vcf":"text/x-vcard", _
			    "vcg":"application/vnd.groove-vcard", _
			    "vcs":"text/x-vcalendar", _
			    "vcx":"application/vnd.vcx", _
			    "vis":"application/vnd.visionary", _
			    "viv":"video/vnd.vivo", _
			    "vrml":"model/vrml", _
			    "vsd":"application/vnd.visio", _
			    "vsf":"application/vnd.vsf", _
			    "vtu":"model/vnd.vtu", _
			    "vxml":"application/voicexml+xml", _
			    "wad":"application/x-doom", _
			    "wav":"audio/x-wav", _
			    "wax":"audio/x-ms-wax", _
			    "wbmp":"image/vnd.wap.wbmp", _
			    "wbs":"application/vnd.criticaltools.wbs+xml", _
			    "wbxml":"application/vnd.wap.wbxml", _
			    "wcm":"application/vnd.ms-works", _
			    "wdb":"application/vnd.ms-works", _
			    "weba":"audio/webm", _
			    "webm":"video/webm", _
			    "webp":"image/webp", _
			    "wg":"application/vnd.pmi.widget", _
			    "wgt":"application/widget", _
			    "wks":"application/vnd.ms-works", _
			    "wm":"video/x-ms-wm", _
			    "wma":"audio/x-ms-wma", _
			    "wmd":"application/x-ms-wmd", _
			    "wmf":"application/x-msmetafile", _
			    "wml":"text/vnd.wap.wml", _
			    "wmlc":"application/vnd.wap.wmlc", _
			    "wmls":"text/vnd.wap.wmlscript", _
			    "wmlsc":"application/vnd.wap.wmlscriptc", _
			    "wmv":"video/x-ms-wmv", _
			    "wmx":"video/x-ms-wmx", _
			    "wmz":"application/x-ms-wmz", _
			    "woff":"application/x-font-woff", _
			    "wpd":"application/vnd.wordperfect", _
			    "wpl":"application/vnd.ms-wpl", _
			    "wps":"application/vnd.ms-works", _
			    "wqd":"application/vnd.wqd", _
			    "wri":"application/x-mswrite", _
			    "wsdl":"application/wsdl+xml", _
			    "wspolicy":"application/wspolicy+xml", _
			    "wtb":"application/vnd.webturbo", _
			    "wvx":"video/x-ms-wvx", _
			    "x3d":"application/vnd.hzn-3d-crossword", _
			    "xap":"application/x-silverlight-app", _
			    "xar":"application/vnd.xara", _
			    "xbap":"application/x-ms-xbap", _
			    "xbd":"application/vnd.fujixerox.docuworks.binder", _
			    "xbm":"image/x-xbitmap", _
			    "xdf":"application/xcap-diff+xml", _
			    "xdm":"application/vnd.syncml.dm+xml", _
			    "xdp":"application/vnd.adobe.xdp+xml", _
			    "xdssc":"application/dssc+xml", _
			    "xdw":"application/vnd.fujixerox.docuworks", _
			    "xenc":"application/xenc+xml", _
			    "xfdf":"application/vnd.adobe.xfdf", _
			    "xfdl":"application/vnd.xfdl", _
			    "xht":"application/xhtml+xml", _
			    "xhtml":"application/xhtml+xml", _
			    "xif":"image/vnd.xiff", _
			    "xla":"application/vnd.ms-excel", _
			    "xlam":"application/vnd.ms-excel.addin.macroenabled.12", _
			    "xlc":"application/vnd.ms-excel", _
			    "xlm":"application/vnd.ms-excel", _
			    "xls":"application/vnd.ms-excel", _
			    "xlsb":"application/vnd.ms-excel.sheet.binary.macroenabled.12", _
			    "xlsm":"application/vnd.ms-excel.sheet.macroenabled.12", _
			    "xlsx":"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", _
			    "xlt":"application/vnd.ms-excel", _
			    "xltm":"application/vnd.ms-excel.template.macroenabled.12", _
			    "xltx":"application/vnd.openxmlformats-officedocument.spreadsheetml.template", _
			    "xlw":"application/vnd.ms-excel", _
			    "xml":"application/xml", _
			    "xo":"application/vnd.olpc-sugar", _
			    "xop":"application/xop+xml", _
			    "xpi":"application/x-xpinstall", _
			    "xpm":"image/x-xpixmap", _
			    "xpr":"application/vnd.is-xpr", _
			    "xps":"application/vnd.ms-xpsdocument", _
			    "xpw":"application/vnd.intercon.formnet", _
			    "xpx":"application/vnd.intercon.formnet", _
			    "xsl":"application/xml", _
			    "xslt":"application/xslt+xml", _
			    "xsm":"application/vnd.syncml+xml", _
			    "xspf":"application/xspf+xml", _
			    "xul":"application/vnd.mozilla.xul+xml", _
			    "xwd":"image/x-xwindowdump", _
			    "xyz":"chemical/x-xyz", _
			    "yang":"application/yang", _
			    "yin":"application/yin+xml", _
			    "zaz":"application/vnd.zzazz.deck+xml", _
			    "zip":"application/zip", _
			    "zir":"application/vnd.zul", _
			    "zmm":"application/vnd.handheld-entertainment+xml")
			  End If
			  return mMIMEType
			End Get
		#tag EndGetter
		Protected Shared MIMETypes As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		SubType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SuperType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Optional; a number between 0.0 and 1.0 representing the weight of the type (1=highest weight)
		#tag EndNote
		Weight As Single = 1.0
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Boundary"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SubType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SuperType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Weight"
			Group="Behavior"
			InitialValue="1.0"
			Type="Single"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
