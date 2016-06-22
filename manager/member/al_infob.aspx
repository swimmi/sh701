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
    <td height="80" colspan="2">查看资料</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 拍卖商列表 &gt; 查看资料</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />查看资料</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">

	  <table width="99%" border="0" cellpadding="0" cellspacing="1">
		<tr>
		  <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="586" height="40" align="right" class="content">登陆名：</td>
              <td width="584" height="40" align="left" class="content" style="padding-left:5px;"><%=rs("huiyuan_bianhao")%></td>
              </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">真实姓名：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><%=rs("huiyuan_name")%></td>
              </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">所在地址：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><%=bida%><%=mmida%></td>
              </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">会员性别：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><%if rs("huiyuan_sex")=1 then%>男<%end if%><%if rs("huiyuan_sex")=2 then%>女<%end if%></td>
              </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">会员生日：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><%=rs("shijian1")%></td>
              </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">电子邮箱：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><%=rs("yx")%></td>
              </tr>
            <tr>
              <td width="586" height="40" align="right" class="content">手机号码：</td>
              <td height="40" align="left" class="content" style="padding-left:5px;"><%=rs("huiyuan_mob")%></td>
              </tr>

          </table>
		    <br />
		  <input type="submit" name="Submit" value="返回上一层" onclick="javascript:history.go(-1)" /></td>
		</tr>
		<tr>
		  <td align="center">&nbsp;</td>
		  </tr>
	  </table>
	</td>
</tr>
</table>
</body>
</html>
