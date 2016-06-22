<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="format-detection" content="telephone=no"/></head>

<title>二维码验证</title>
<style type="text/css">
<!--
body{
	background-color:#FFFFFF;
	margin:0px;
	padding:0px;
}  
-->
</style>
</head>
<body>


<div style="position:fixed;top:0px;width:100%;; z-index:80"><img src="img1/3.jpg" width="100%"  /></div>
<div style="position:fixed;top:20px; width:100%; z-index:88" align="center"><img src="img1/5.png" width="30%"  /></div>

<div style="position:fixed;top:130px; width:100%; z-index:100" align="center">
<table width="160" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="160" height="40">
	
	<!--#include file="conn.aspx"--> 
<%

	if request("tel")="" then
		response.Write "<script language=javascript>alert('请输入手机号！');history.go(-1);</script>"
		response.end
	end if
	
	if request("yzma")<>session("phoneyzma") then
		response.Write "<script language=javascript>alert('请输入正确的验证码！');history.go(-1);</script>"
		response.end
	end if

	SQL="select * from huiyuan where tel='"&request("tel")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
		if rs.recordcount<>0 then
			response.Write "<script language=javascript>alert('对不起，手机号已注册！');history.go(-1);</script>"
			response.end
		end if
	rs.close
	set rs=nothing

	SQL="select * from huiyuan where yzm='"&request("yzm")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
		if rs.recordcount>=3 then
			response.Write "<script language=javascript>alert('对不起，此验证码已经注册满！');history.go(-1);</script>"
			response.end
		else
			conn.execute("insert huiyuan(tel,yzm,flag,addtime)values('"&request("tel")&"','"&request("yzm")&"',0,getdate())")
		end if
	rs.close
	set rs=nothing

	response.Write "<script language=javascript>alert('验证成功！');</script>"
	response.end

%>
	
	
	</td>
  </tr>
</table>

</div>

<div style="position:fixed;bottom:0px;width:100%"><img src="img1/4.jpg" width="100%"  /></div>

</body>
</html>

