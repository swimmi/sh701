 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>

 <!--#include file="../../conn.aspx"--> 
<%
	SQL="select * from view_liuyan where id='"&request("id")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,3
	rs("kan_flag")=1
	rs.update

%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">邮件明细</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 消息留言 &gt;发件箱 &gt;邮件明细</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />邮件明细</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">



		<table width="99%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c1c1c1">
		  <tr>
			<td height="250" align="center" valign="top" bgcolor="#e1e1e1" class="content"><br />
			  <strong><%=rs("liuyan_title")%></strong><hr size="1" style="width:98%" />			  
			  &nbsp;咨询时间：<%=rs("liuyan_date")%><br /><br />
			<table width="95%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td align="left"><%=rs("liuyan_memo")%></td>
			  </tr>
			</table></td>
		  </tr>
	  </table>
		<table width="99%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td height="40" align="center"><input type="submit" name="Submit" value="返回" onClick="javascript:history.go(-1);"/></td>
		  </tr>
		</table>
		
	</td>
		  </tr>
		</table>
</body>
</html>
