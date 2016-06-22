 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td height="80" colspan="2">级别</td>
    </tr>
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 会员管理 &gt; 正式会员列表 &gt; 级别</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
    <tr class="biao">
      <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />级别</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	  
 <!--#include file="../../conn.aspx"--> 
 <%
SQL="select * from view_huiyuan where huiyuan_id='"&request("huiyuan_id")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
%>
 <form id="form1" name="form1" method="post" action="jiebie1.aspx" style="margin:0">
   <table width="99%" border="0" cellpadding="0" cellspacing="1" bgcolor="999999" class="content">
     <tr>
       <td width="50%" height="30" align="right" bgcolor="#FFFFFF">会员姓名：</td>
       <td width="50%" height="30" align="left" bgcolor="#FFFFFF">&nbsp;
	   <%=rs("huiyuan_name")%>
	   <input name="id" type="hidden" id="id" value="<%=request("huiyuan_id")%>" />
	   </td>
     </tr>
     <tr>
       <td height="30" align="right" bgcolor="#FFFFFF">登录帐号：</td>
       <td height="30" align="left" bgcolor="#FFFFFF">&nbsp;
	   <%=rs("huiyuan_bianhao")%></td>
     </tr>
     <tr>
       <td height="30" align="right" bgcolor="#FFFFFF">原会员级别：</td>
       <td height="30" align="left" bgcolor="#FFFFFF">&nbsp;
<%
SQLa="select * from tbl_jiebie where id='"&rs("huiyuan_jiebie")&"'"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
response.Write rsa("jiebie")
rsa.close
set rsa=nothing
%>		</td>
     </tr>
     <tr>
       <td height="30" align="right" bgcolor="#FFFFFF">新会员级别：</td>
       <td height="30" align="left" bgcolor="#FFFFFF">&nbsp;
         <select name="select" style="width:130px;">
<%
set rs=server.createobject("adodb.recordset")
rs.open "tbl_jiebie",conn,1,1
while not rs.eof
%>		  
              <option value="<%=rs("id")%>"><%=rs("jiebie")%></option>
<%rs.movenext
wend
rs.close
set rs=nothing
%>			 
          </select>		</td>
     </tr>
     <tr>
       <td height="30" align="right" bgcolor="#FFFFFF">业绩：</td>
       <td height="30" align="left" bgcolor="#FFFFFF">&nbsp;
	   是
	     <input name="radiobutton" type="radio" value="1" checked="checked" />	     
	     &nbsp;否
	     <input type="radio" name="radiobutton" value="2" />	     
		</td>
     </tr>
     <tr>
       <td height="40" colspan="2" align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="修改" /></td>
     </tr>
   </table>
</form></td>
    </tr>
  </table>
</body>
</html>
