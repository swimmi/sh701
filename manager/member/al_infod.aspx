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
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 资料管理 &gt; 修改资料</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />修改资料</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">

	<form id="form1" name="form1" method="post" action="al_changed.aspx">
	  <table width="99%" border="0" cellpadding="0" cellspacing="1">
		<tr>
		  <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="40" align="right" class="content">商户名：</td>
              <td width="377" height="40" align="left" class="content" style="padding-left:5px;"><input name="sh_name" type="text" id="sh_name" value="<%=rs("sh_name")%>" /></td>
              <td width="415" rowspan="7" align="left" class="content" style="padding-left:5px;"><img src="../../shop/<%=rs("url")%>" width="100" /></td>
              <td width="395" rowspan="7" align="left" class="content" style="padding-left:5px;"><img src="../../shop/<%=rs("sh_photo")%>" /></td>
            </tr>
            <tr>
              <td width="221" height="40" align="right" class="content">负责人：</td>
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
              <td width="221" height="40" align="right" class="content">所在地址：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><%=bida%><%=mmida%></td>
              </tr>
            <tr>
              <td width="221" height="40" align="right" class="content">电子邮箱：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><input name="yx" type="text" id="yx" value="<%=rs("yx")%>" /></td>
              </tr>
            <tr>
              <td width="221" height="40" align="right" class="content">手机号码：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><input name="huiyuan_mob" type="text" id="huiyuan_mob" value="<%=rs("huiyuan_mob")%>" /></td>
              </tr>
            <tr>
              <td height="40" align="right" bgcolor="#FFFFFF" class="content">经营范围：</td>
              <td height="40" align="left" bgcolor="#FFFFFF" class="content" style="padding-left:12px;"><input name="sh_jingying" class="textinput" id="sh_jingying"  style="width:200px;" value="<%=rs("sh_jingying")%>" /></td>
              </tr>
            <tr>
              <td height="40" align="right" bgcolor="#FFFFFF" class="content">注册地址：</td>
              <td height="40" align="left" bgcolor="#FFFFFF" class="content" style="padding-left:12px;"><input name="sh_zhuce" class="textinput" id="sh_zhuce"  style="width:200px;" value="<%=rs("sh_zhuce")%>" /></td>
              <td align="left" class="content" style="padding-left:5px;">&nbsp;</td>
              <td align="left" class="content" style="padding-left:5px;">&nbsp;</td>
            </tr>
            <tr>
              <td height="40" align="right" bgcolor="#FFFFFF" class="content">企业固定电话：</td>
              <td height="40" align="left" bgcolor="#FFFFFF" class="content" style="padding-left:12px;"><input name="sh_tel" class="textinput" id="sh_tel"  style="width:200px;" value="<%=rs("sh_tel")%>" /></td>
              <td align="left" class="content" style="padding-left:5px;">&nbsp;</td>
              <td align="left" class="content" style="padding-left:5px;">&nbsp;</td>
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
