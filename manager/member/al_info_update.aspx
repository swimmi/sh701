<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE15 {font-size: 12px}
-->
</style>
</head>
<!--#include file="../../conn.aspx"-->
<!--#include file="../jiance.aspx"-->
<!--#include file="../../time/time.aspx"--> 
<%	 
	
c_id=request("huiyuan_id")	


SQL="select * from view_huiyuan  where huiyuan_id='"&c_id&"'"
set rs=server.CreateObject("adodb.recordset")


rs.Open SQL,conn,1,1
if rs.RecordCount=0 then
  Response.Write "非法操作!"
  Response.End 
end if




SQLa="select * from tbl_address1  where id='"&rs("bid")&"'"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
if not rsa.eof and not rsa.bof then
bida=rsa("dizhi")
end if
rsa.close
set rsa=nothing
SQLa="select * from tbl_address2  where id='"&rs("mmid")&"'"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
if not rsa.eof and not rsa.bof then
mmida=rsa("dizhi")
end if
rsa.close
set rsa=nothing




   %>
   
   
   
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">修改资料</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 拍卖商列表 &gt; 修改资料</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />修改资料</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">

	<form id="form1" name="form1" method="post" action="al_change.aspx">
	  <table width="99%" border="0" cellpadding="0" cellspacing="1">
		<tr>
		  <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="586" height="40" align="right" class="content">登陆名：</td>
              <td width="584" height="40" align="left" class="content" style="padding-left:5px;"><%=rs("huiyuan_bianhao")%></td>
              </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">真实姓名：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><input name="huiyuan_name" type="text" id="huiyuan_name" value="<%=rs("huiyuan_name")%>" /></td>
              </tr>
            <tr>
              <td height="40" align="right" class="content">登录密码：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><span class="content" style="padding-left:5px;">
                <input name="pass" type="text" id="pass" value="<%=rs("huiyuan_pass")%>" />
                <span class="content" style="padding-left:5px;">
                <input name="huiyuan_id" type="hidden" id="huiyuan_id" value="<%=rs("huiyuan_id")%>" />
                </span></span></td>
            </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">所在地址：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><%=bida%><%=mmida%></td>
              </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">会员性别：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><input name="radiobutton" type="radio" value="1" <%if rs("huiyuan_sex")=1 then%>checked<%end if%> />
                男
                <input type="radio" name="radiobutton" value="2" <%if rs("huiyuan_sex")=2 then%>checked<%end if%>/>
                女 </td>
              </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">会员生日：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><input name="shijian1" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=rs("shijian1")%>" /></td>
              </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">电子邮箱：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><input name="yx" type="text" id="yx" value="<%=rs("yx")%>" /></td>
              </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">手机号码：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><input name="huiyuan_mob" type="text" id="huiyuan_mob" value="<%=rs("huiyuan_mob")%>" /></td>
              </tr>

          </table>
		    <br />
		  <input type="submit" name="Submit" value="确认修改" /></td>
		</tr>
		<tr>
		  <td align="center">&nbsp;</td>
		  </tr>
	  </table>
	</form>
	</td>
</tr>
</table>
</body>
</html>
