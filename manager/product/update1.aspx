<!--#include file="../../conn.aspx"-->
<!--#include file="Inc/UpLoadClass.aspx" -->
<!--#include file="Inc/Code2Info.en.aspx" -->

<%
function getpychar(char)
tmp=65536+asc(char)
if(tmp>=45217 and tmp<=45252) then 
getpychar= "A"
elseif(tmp>=45253 and tmp<=45760) then
getpychar= "B"
elseif(tmp>=47761 and tmp<=46317) then
getpychar= "C"
elseif(tmp>=46318 and tmp<=46825) then
getpychar= "D"
elseif(tmp>=46826 and tmp<=47009) then 
getpychar= "E"
elseif(tmp>=47010 and tmp<=47296) then 
getpychar= "F"
elseif(tmp>=47297 and tmp<=47613) then 
getpychar= "G"
elseif(tmp>=47614 and tmp<=48118) then
getpychar= "H"
elseif(tmp>=48119 and tmp<=49061) then
getpychar= "J"
elseif(tmp>=49062 and tmp<=49323) then 
getpychar= "K"
elseif(tmp>=49324 and tmp<=49895) then 
getpychar= "L"
elseif(tmp>=49896 and tmp<=50370) then 
getpychar= "M"
elseif(tmp>=50371 and tmp<=50613) then 
getpychar= "N"
elseif(tmp>=50614 and tmp<=50621) then 
getpychar= "O"
elseif(tmp>=50622 and tmp<=50905) then
getpychar= "P"
elseif(tmp>=50906 and tmp<=51386) then 
getpychar= "Q"
elseif(tmp>=51387 and tmp<=51445) then 
getpychar= "R"
elseif(tmp>=51446 and tmp<=52217) then 
getpychar= "S"
elseif(tmp>=52218 and tmp<=52697) then 
getpychar= "T"
elseif(tmp>=52698 and tmp<=52979) then 
getpychar= "W"
elseif(tmp>=52980 and tmp<=53640) then 
getpychar= "X"
elseif(tmp>=53689 and tmp<=54480) then 
getpychar= "Y"
elseif(tmp>=54481 and tmp<=62289) then
getpychar= "Z"
else '如果不是中文，则不处理
	getpychar=char
end if
end function

function getpy(str)
for i=1 to len(str)
getpy=getpy&getpychar(mid(str,i,1))
next
end function


		Dim UpFile,SavePath,str
		SavePath = "UpLoadFile_Pimg/"
		Set UpFile = New UpLoadClass
		UpFile.SavePath = SavePath
		UpFile.MaxSize  = 300*1024
		UpFile.FileType = "jpg/gif"
		UpFile.Open()
		set Rs=server.createobject("adodb.recordset")	
		
		Select Case UpFile.Error
			Case 0 
			call suc()
			Case 1 
			call error1("error1")
			Case 2 
			call error1("error2")
			Case 3 
			call error1("error3")
			Case 4 
			call error1("error4")
		End Select
		
sub suc()

if 	UpFile.Form("proname")="" then
	response.Write "<script language=javascript>alert('请填写商品名称！');history.go(-1);</script>"
	response.end
end if

if 	UpFile.Form("promoney")="" then
	response.Write "<script language=javascript>alert('请填写商品价格！');history.go(-1);</script>"
	response.end
end if


    set rs_addnew=server.CreateObject("adodb.recordset") 
    sql_addnew="select * from tbl_duihuan where id="&UpFile.Form("proid")&""
    rs_addnew.Open sql_addnew,conn,1,3
    rs_addnew("proname")=UpFile.Form("proname")
	rs_addnew("promemo")=UpFile.Form("promemo")
	rs_addnew("promoney")=UpFile.Form("promoney")
	rs_addnew("addtime")=now()
	if UpFile.Form("proimgs")&""<>"" then
		rs_addnew("proimgs")= "UpLoadFile_Pimg/"&UpFile.Form("proimgs")
	end if
    rs_addnew.Update
	rs_addnew.close
    set rs_addnew=nothing
	
	response.Write "<script language=javascript>alert('操作成功！');location.href='chanpin.aspx';</script>"
	response.end
	
end sub	


sub error1(str)	
Select Case str
			Case "error1" 
				response.Write "<script language=javascript>alert('文件大于300K！');history.go(-1);</script>"
				response.end
			Case "error2"
				response.Write "<script language=javascript>alert('文件类型不匹配！');history.go(-1);</script>"
				response.end
			Case "error3" 
				response.Write "<script language=javascript>alert('文件大于300K并且文件类型不匹配！');history.go(-1);</script>"
				response.end
			Case "error4"
				response.Write "<script language=javascript>alert('异常，不存在上传！');history.go(-1);</script>"
				response.end
		End Select
end sub
	%>
	
