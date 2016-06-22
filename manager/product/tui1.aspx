 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">退货原因</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
 <!--#include file="../../conn.aspx"--> 
 <%

SQL="select * from tbl_xiaofei  where  xiaofei_id='"&request("id")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
%>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="999999">
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
    <td width="14%" align="right" class="content">退货原因：</td>
    <td width="86%" height="35" align="left" class="content">&nbsp;<%=rs("memo")%></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="50" align="center"><span style="height:50px;">
      <input type="submit" name="Submit" value="返回" onclick="javascript:history.go(-1);" />
    </span></td>
  </tr>
</table>
</body>
</html>
