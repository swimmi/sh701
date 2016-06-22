<!--#include file="../../conn.aspx"-->
<!--#include file="Inc/UpLoadClass.aspx" -->
<!--#include file="Inc/Code2Info.en.aspx" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="../../css/css.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top">
	   <table width="680" border="0" align="center" cellpadding="3" cellspacing="1" class="content">
        <tr>
<td >
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
		UpFile.FileType = "jpg/gif/bmp/png"
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


if UpFile.Form("pro_money_s")="" or UpFile.Form("pro_money")="" or UpFile.Form("pro_money1")="" or UpFile.Form("pro_price")="" then
		  response.Write "<script language=javascript>alert('请认真填写带*号的栏目！');history.go(-1);</script>"
		  response.end
end if



if UpFile.Form("pro_imgs_height")="" or UpFile.Form("pro_imgs_width")="" then
		  response.Write "<script language=javascript>alert('请上传图片！');history.go(-1);</script>"
		  response.end
end if



					Rs.Open ("select * from tbl_product"),Conn,3,3
							Rs.Addnew
							Rs("pro_pid")       =   UpFile.Form("pro_pid")	
							Rs("pro_name")      =   UpFile.Form("pro_name")	
							Rs("pro_imgs")      =   "UpLoadFile_Pimg/"&UpFile.Form("pro_imgs")
							rs("pro_ying")=left(getpy(upfile.form("pro_name")),1)
							Rs("pro_h_height")  =	 UpFile.Form("pro_imgs_height") 
							Rs("pro_h_width")   =	 UpFile.Form("pro_imgs_width")
							Rs("pro_price")     =    UpFile.Form("pro_price")	
							Rs("pro_money")     =    UpFile.Form("pro_money")	
							Rs("pro_money1")     =    UpFile.Form("pro_money1")
							Rs("pro_date")      =   now()
							Rs("pro_money_s")   =   UpFile.Form("pro_money_s")	
							Rs("pro_money_p")   =   UpFile.Form("pro_money_p")	
							Rs("pro_user")      =   UpFile.Form("pro_user")	
							Rs("pro_content")   =   UpFile.Form("pro_content")	
							Rs("pro_yanse")   =   UpFile.Form("pro_yanse")	
							Rs("pro_gonghuo")      =   UpFile.Form("pro_gonghuo")	
							Rs("pro_js")      =   UpFile.Form("pro_js")	
							Rs("pro_Hot")       =   UpFile.Form("pro_Hot")	
							Rs("pro_isok")       =   UpFile.Form("pro_isok")	
							'Rs("pro_Special")       =   UpFile.Form("pro_Special")
							Rs("pro_type")       =   UpFile.Form("pro_type")
							if UpFile.Form("pro_guige")&""<>"" then	
							Rs("pro_guige")       =   UpFile.Form("pro_guige")	
							end if
							if UpFile.Form("pro_danwei")&""<>"" then
							Rs("pro_danwei")       =   UpFile.Form("pro_danwei")	
							end if
							if UpFile.Form("pro_shulian")&""<>"" then
								Rs("pro_num")       =   999999999
							else 
								Rs("pro_num")       =   999999999
							end if
							if UpFile.Form("first_shulian")&""<>"" then
								Rs("first_shulian")       =   UpFile.Form("first_shulian")	
							else 
								Rs("first_shulian")       =   1
							end if
							rs("pro_sum")=0
							rs("jf")=1
							Rs("pro_ping")       =   UpFile.Form("pingji")
							Rs("hg_money")       =   UpFile.Form("hg_money")
							Rs("hg_jf")       =   UpFile.Form("hg_jf")
							Rs.Update
							Rs.Close

								Response.Redirect "product_j.aspx?action=addsave"
					set rs=nothing
			
		
	
end sub	


sub error1(str)	
Select Case str
			Case "error1" 
			Response.Write "文件大于300K<p>[<a href='javascript:history.back();'>返回</a>]</p>"
			Case "error2" 
			Response.Write "文件类型不匹配<p>[<a href='javascript:history.back();'>返回</a>]</p>"
			Case "error3" 
			Response.Write "文件大于300K并且文件类型不匹配<p>[<a href='javascript:history.back();'>返回</a>]</p>"
			Case "error4"
			Response.Write "异常，不存在上传<p>[<a href='javascript:history.back();'>返回</a>]</p>"
		End Select
end sub
	%>
	
	</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>