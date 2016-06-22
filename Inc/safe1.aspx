<%
'过滤SQL非法字符并格式化html代码
function Replace_Text(fString)
if isnull(fString) then
Replace_Text=""
exit function
else
fString=trim(fString)
fString=replace(fString,"'","''")

fString=replace(fString,"--","—")
Replace_Text=fString
end if	
end function

'会员发布的各种信息过滤
'Function Replace_Text(fString)
'If Not IsNull(fString) Then
'fString = trim(fString)
'fString = replace(fString, ";", "；")    '分号过滤
'fString = replace(fString, "--", "——") '--过滤
'fString = replace(fString, "%20", "")   '特殊字符过滤
'fString = replace(fString, "==", "")    '==过滤
'fString = replace(fString, ">", "&gt;")
'fString = replace(fString, "<", "&lt;")
'fString = Replace(fString, CHR(32), " ")		'&nbsp;
'fString = Replace(fString, CHR(9), " ")			'&nbsp;
'fString = Replace(fString, CHR(34), "&quot;")
'fString = Replace(fString, CHR(39), "&#39;")	'单引号过滤
'fString = Replace(fString, CHR(13), "")
'fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
'fString = Replace(fString, CHR(10), "<BR> ")
'Replace_Text = fString
'End If
'End Function

'过滤SQL非法字符
Function checkStr(Chkstr)
	dim Str:Str=Chkstr
	if isnull(Str) then
		checkStr = ""
		exit Function
	else
		Str=replace(Str,"'","")
		Str=replace(Str,";","")
		Str=replace(Str,"--","")
		checkStr=Str
	end if
End Function

'检测传递的参数是否为数字型
Function Chkrequest(Para)
Chkrequest=False
If Not (IsNull(Para) Or Trim(Para)="" Or Not IsNumeric(Para)) Then
   Chkrequest=True
End If
End Function

'检测传递的参数是否为日期型
Function Chkrequestdate(Para)
Chkrequestdate=False
If Not (IsNull(Para) Or Trim(Para)="" Or Not IsDate(Para)) Then
   Chkrequestdate=True
End If
End Function

'得到当前页面的地址 
Function GetUrl() 
On Error Resume Next 
Dim strTemp 
If LCase(Request.ServerVariables("HTTPS")) = "off" Then 
strTemp = "http://" 
Else 
strTemp = "https://" 
End If 
strTemp = strTemp & CheckStr(Request.ServerVariables("SERVER_NAME")) 
If Request.ServerVariables("SERVER_PORT") <> 80 Then strTemp = strTemp & ":" & CheckStr(Request.ServerVariables("SERVER_PORT")) 
strTemp = strTemp & CheckStr(Request.ServerVariables("URL")) 
If Trim(Request.QueryString) <> "" Then strTemp = strTemp & "?" & CheckStr(Trim(Request.QueryString)) 
GetUrl = strTemp  
End Function 

'Function CheckReferer()  '检查用户是否在浏览器里输入了本页的地址
'    Dim sReferer, Icheck
'    CheckReferer = True
'    sReferer = Request.ServerVariables("HTTP_REFERER")
'    ServerIP = Request.ServerVariables("LOCAL_ADDR")
'    Icheck = InStr(sReferer, "ServerIP")
'    If Icheck = 0 Then
'    CheckReferer = False
'    End If
'End Function

'日期格式化
Function FormatDate(DT,tp)
	dim Y,M,D
	Y=Year(DT)
	M=month(DT)
	D=Day(DT)
	if M<10 then M="0"&M
	if D<10 then D="0"&D
	select case tp
	case 1 FormatDate=Y&"年"&M&"月"&D&"日"
	case 2 FormatDate=Y&"-"&M&"-"&D
	end select
End Function

'不允许外部提交数据的选择
Function ChkPost()
    dim HTTP_REFERER,SERVER_NAME
	dim server_v1,server_v2
	chkpost=false
    SERVER_NAME=CheckStr(Request.ServerVariables("SERVER_NAME"))
	HTTP_REFERER=CheckStr(Request.ServerVariables("HTTP_REFERER"))
	server_v1=Cstr(HTTP_REFERER)
	server_v2=Cstr(SERVER_NAME)

	if mid(server_v1,8,len(server_v2))<>server_v2 then
		chkpost=false
	else
		chkpost=true
	end if
End Function

'构造上传图片文件名随机数

'分页
Function listPages(LinkFile) 
   if not (rs.eof and rs.bof) then
	gopage=currentpage
	totalpage=n
	blockPage=Int((gopage-1)/10)*10+1
'	if instr(linkfile,"?page=")>0 or instr(linkfile,"&page=")>0 then
'	pos=instr(linkfile,"page=")-2
'	linkfile=left(linkfile,pos)
'	end if
	
	If LCase(Request.ServerVariables("HTTPS")) = "off" Then 
    strTemp = "http://" 
    Else 
    strTemp = "https://" 
    End If 
    strTemp = strTemp & CheckStr(Request.ServerVariables("SERVER_NAME")) 
    If Request.ServerVariables("SERVER_PORT") <> 80 Then strTemp = strTemp & ":" & CheckStr(Request.ServerVariables("SERVER_PORT")) 
    strTemp = strTemp & CheckStr(Request.ServerVariables("URL"))
    lenstrTemp=len(strTemp)+1	
	if instr(left(linkfile,lenstrTemp),"?")>0 then 
	
	if blockPage = 1 Then
		Response.Write "<span >←前10页</span>&nbsp;"
	Else
		Response.Write("<span ></span><a href=" & LinkFile & "&page="&blockPage-10&"  class=a02>←前10页</a>&nbsp;")
	End If
   i=1
   Do Until i > 10 or blockPage > n
    If blockPage=int(gopage) Then
		Response.Write("<font color=#3168B8>[<b>"&blockPage&"</b>]</font>")
	Else
		Response.Write(" <a href=" & LinkFile & "&page="&blockPage&"  class=a02>["&blockPage&"]</a> ")
    End If
    blockPage=blockPage+1
    i = i + 1
    Loop
	if blockPage > totalpage Then
		Response.Write "&nbsp;<span >后10页→"
	Else
		Response.Write("&nbsp;<a href=" & LinkFile & "&page="&blockPage&"  class=a02>后10页→</a><span >")
	End If 
	
	else
	
	if blockPage = 1 Then
		Response.Write "<span >←前10页</span>&nbsp;"
	Else
		Response.Write("<span ></span><a href=" & LinkFile & "?page="&blockPage-10&"  class=a02>←前10页</a>&nbsp;")
	End If
   i=1
   Do Until i > 10 or blockPage > n
    If blockPage=int(gopage) Then
		Response.Write("<font color=#3168B8>[<b>"&blockPage&"</b>]</font>")
	Else
		Response.Write(" <a href=" & LinkFile & "?page="&blockPage&"  class=a02>["&blockPage&"]</a> ")
    End If
    blockPage=blockPage+1
    i = i + 1
    Loop
	if blockPage > totalpage Then
		Response.Write "&nbsp;<span >后10页→"
	Else
		Response.Write("&nbsp;<a href=" & LinkFile & "?page="&blockPage&"  class=a02>后10页→</a><span >")
	End If 
	
	End If
	
	Startinfo=((gopage-1)*msg_per_page)+1
	Endinfo=gopage*msg_per_page
	if Endinfo>totalrec then Endinfo=totalrec
		'Response.Write("&nbsp;&nbsp;共"&totalrec&"条信息&nbsp; 共"&n&"页")
end if
End Function

'分页2
Function listPages2(LinkFile) 
   if not (rs.eof and rs.bof) then
	gopage=currentpage
	totalpage=n
	blockPage=Int((gopage-1)/10)*10+1
	
	If LCase(Request.ServerVariables("HTTPS")) = "off" Then 
    strTemp = "http://" 
    Else 
    strTemp = "https://" 
    End If 
    strTemp = strTemp & CheckStr(Request.ServerVariables("SERVER_NAME")) 
    If Request.ServerVariables("SERVER_PORT") <> 80 Then strTemp = strTemp & ":" & CheckStr(Request.ServerVariables("SERVER_PORT")) 
    strTemp = strTemp & CheckStr(Request.ServerVariables("URL"))
    lenstrTemp=len(strTemp)+1	
	if instr(left(linkfile,lenstrTemp),"?")>0 then 
	
	if blockPage = 1 Then
		Response.Write "<span ></span>&nbsp;"
	Else
		Response.Write("<a href=" & LinkFile & "&page="&blockPage-10&"  class=a02></a>&nbsp;")
	End If
   i=1
   Do Until i > 10 or blockPage > n
    If blockPage=int(gopage) Then
		Response.Write("<font color=#3168B8><b>"&blockPage&"</b></font>")
	Else
		Response.Write(" <a href=" & LinkFile & "&page="&blockPage&"  class=a02>"&blockPage&"</a> ")
    End If
    blockPage=blockPage+1
    i = i + 1
    Loop
	if blockPage > totalpage Then
		Response.Write "&nbsp;<span >"
	Else
		Response.Write("&nbsp;<a href=" & LinkFile & "&page="&blockPage&"  class=a02></a><span >")
	End If 
	
	else
	
	if blockPage = 1 Then
		Response.Write "<span >←前10页</span>&nbsp;"
	Else
		Response.Write("<span ></span><a href=" & LinkFile & "?page="&blockPage-10&" class=a02>←前10页</a>&nbsp;")
	End If
   i=1
   Do Until i > 10 or blockPage > n
    If blockPage=int(gopage) Then
		Response.Write("<font color=#3168B8>[<b>"&blockPage&"</b>]</font>")
	Else
		Response.Write(" <a href=" & LinkFile & "?page="&blockPage&"  class=a02>["&blockPage&"]</a> ")
    End If
    blockPage=blockPage+1
    i = i + 1
    Loop
	if blockPage > totalpage Then
		Response.Write "&nbsp;<span >后10页→"
	Else
		Response.Write("&nbsp;<a href=" & LinkFile & "?page="&blockPage&"  class=a02>后10页→</a><span >")
	End If 
	End If
	
	Startinfo=((gopage-1)*msg_per_page)+1
	Endinfo=gopage*msg_per_page
	if Endinfo>totalrec then Endinfo=totalrec
		Response.Write("&nbsp;&nbsp;共"&totalrec&"条信息&nbsp; 共"&n&"页")
end if
End Function

'判断文件类型是否合格
Function CheckFileExt(FileExt)
	Dim ForumUpload,i
	ForumUpload="gif,jpg,bmp,jpeg,png"
	ForumUpload=Split(ForumUpload,",")
	CheckFileExt=False
	For i=0 to UBound(ForumUpload)
		If LCase(FileExt)=Lcase(Trim(ForumUpload(i))) Then
			CheckFileExt=True
			Exit Function
		End If
	Next
End Function
'格式后缀
Function FixName(UpFileExt)
	If IsEmpty(UpFileExt) Then Exit Function
	FixName = Lcase(UpFileExt)
	FixName = Replace(FixName,Chr(0),"")
	FixName = Replace(FixName,".","")
	FixName = Replace(FixName,"asp","")
	FixName = Replace(FixName,"asa","")
	FixName = Replace(FixName,"aspx","")
	FixName = Replace(FixName,"cer","")
	FixName = Replace(FixName,"cdx","")
	FixName = Replace(FixName,"htr","")
End Function
'文件Content-Type判断
Function CheckFileType(FileType)
	CheckFileType = False
	If Left(Cstr(Lcase(Trim(FileType))),6)="image/" Then CheckFileType = True
End Function
%>