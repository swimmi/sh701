<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="../../conn.aspx"-->

<script charset="utf-8" src="../../editor/kindeditor.js"></script>
<script charset="utf-8" src="../../editor/lang/zh_CN.js"></script>
<script>    
var editor;
KindEditor.ready(function(K) {editor = K.create('textarea[name="memo"]', {allowFileManager : true});});
</script>
<%	 
if request.form("submit")="确认修改" then
	set rs=server.CreateObject("adodb.recordset") 
	sql="select * from tbl_web_company where id='"&request("id")&"'"
	lyd_04_dim=request("memo")
	rs.Open sql,conn,1,3
	rs("memo") =request("memo")
	rs.Update
	rs.close
	set rs=nothing
	response.Write "<script language=javascript>alert('操作成功！');location.href='int.aspx?id="&request("id")&"';</script>"
	response.end
end if
   %>
<%
set rs=server.CreateObject("adodb.recordset") 
sql="select * from tbl_web_company where id='"&request("id")&"'"
rs.Open sql,conn,1,3

select case request("id")
	case 1
		title="品牌介绍"
	case 2
		title="联系我们"
	case 3
		title="版权申明"
end select
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">帮助中心</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 网上商城 &gt; 帮助中心 &gt; <%=title%></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849" class="biao">
  <tr>
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" /><%=title%></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
<form id="form1" name="form1" method="post" action="int.aspx">
	  <table width="100%" border="0" cellpadding="0" cellspacing="1">
	
		<tr>
		  <td align="center"><textarea name="memo" style="width:99%;height:350px;visibility:hidden;"><%=rs("memo")%></textarea>
		    <input name="id" type="hidden" id="id" value="<%=request("id")%>" />
<br />
		  <input type="submit" name="Submit" value="确认修改" /></td>
		</tr>
	  </table>
</form>

	
	</td>
  </tr>
</table>
</body>
</html>
