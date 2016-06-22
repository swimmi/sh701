 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE11 {color: #0790FF}
-->
</style>
</head>

<body>


 <!--#include file="../../conn.aspx"--> 
 <%
if request("submit")="设置" then
	set rs_test=server.CreateObject("adodb.recordset")
	rs_test.open "select * from tbl_open ",conn,1,3

	conn.execute("update tbl_open set open_flag="&request("open_flag")&",tishi='"&request("tishi")&"'")
	

	response.Write "<script language=javascript>alert('设置成功！');location.href='open.aspx';</script>"
	response.end
end if
%>

 
 
<%
SQL="select * from tbl_open"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
%>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">系统开关设置</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 系统设置 &gt; 系统开关设置</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />系统开关设置</td>
  </tr>
  <tr>
    <td  bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	
<form id="form1" name="form1" method="post" action="?" style="margin:0px;">
  <table width="99%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center"><table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bordercolordark="#FFFFFF" bgcolor="#d3d3d3" class="content" >
        <tr bgcolor="#e3e3e3">
          <td width="34%"  height="30" align="right" bgcolor="#FFFFFF">网站开关状态：</td>
          <td  height="30" align="left" bgcolor="#FFFFFF"><input type="radio" name="open_flag" value="0" <%if rs("open_flag")=0 then%>checked<%end if%> />
            开放
            <input type="radio" name="open_flag" value="1" <%if rs("open_flag")=1 then%>checked<%end if%> />
            关闭 </td>
        </tr>
        <tr bgcolor="#F0F8FF">
          <td  height="27" align="right" bgcolor="#FFFFFF">网站关闭时的提示语：</td>
          <td  height="27" align="left" bgcolor="#FFFFFF"><textarea name="tishi" cols="50" rows="8" id="tishi"><%=rs("tishi")%></textarea></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="35" align="center"><input type="submit" name="Submit" value="设置" /></td>
    </tr>
  </table>
</form>

</td></tr></table>
</body>
</html>
