
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
 <!--#include file="../../conn.aspx"-->
 <!--#include file="../../time/time.aspx"-->
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">预览</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 视频管理 &gt; 预览</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />预览</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">

<%
	SQL="select * from view_video where id='"&request("id")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
		url=rs("video")
	rs.close
	set rs=nothing
%>



 <table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="370" align="center" valign="top"><iframe src="../../video.aspx?id=<%=url%>" style="width:630px; height:360px;" frameborder="0" scrolling="no"></iframe></td>
   </tr>
   <tr>
     <td height="370" align="center" valign="top"><input type="submit" name="Submit2" value="返回上一层" style="border:1px #CCCCCC solid; background-color:#FFFFFF; line-height:20px; font-family:'微软雅黑';" onclick="javascript:history.go(-1);" /></td>
   </tr>
 </table></td>
   </tr>
 </table>
</body>
</html>
