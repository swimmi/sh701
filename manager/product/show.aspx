 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<!--#include file="../../conn.aspx"--> 
<%
SQL="select * from tbl_product  where pro_id="&request("id")&""
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

%>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg"><%=rs("pro_name")%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="999999" class="content">
  <tr>
    <td width="50%" height="245" align="right" bgcolor="#FFFFFF"><a href="../sinkia/<%=rs("pro_imgs")%>" target="_blank" ><img src="../sinkia/<%=rs("pro_imgs")%>" width="300" height="250" border="0" /></a></td>
    <td width="50%" valign="top" bgcolor="#FFFFFF"><table width="400" border="0" cellpadding="0" cellspacing="0" class="content">
      <tr>
        <td width="97" height="40" align="right">商品名称：</td>
        <td width="303" height="40"><%=rs("pro_name")%></td>
        </tr>
      <tr>
        <td height="40" align="right">市场价：</td>
        <td height="40"><%=rs("pro_money_s")%></td>
      </tr>
      <tr>
        <td height="40" align="right">商品价格：</td>
        <td height="40"><%=rs("pro_money")%></td>
        </tr>
      <tr>
        <td height="40" align="right">颜色：</td>
        <td height="40"><%=rs("pro_yanse")%></td>
        </tr>
      <tr>
        <td height="40" align="right">商品规格：</td>
        <td height="40"><%=rs("pro_guige")%></td>
        </tr>

    </table></td>
  </tr>
  <tr>
    <td colspan="2" align="right" bgcolor="#FFFFFF"><hr size="1" /></td>
  </tr>
  <tr>
    <td colspan="2" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="10" class="content">
      <tr>
        <td><span class="STYLE1">详细资料</span></td>
      </tr>
      <tr>
        <td><font style="line-height:20px; letter-spacing:1px;"><%=rs("pro_content")%></font></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top" bgcolor="#FFFFFF">[<a href="javascript:history.go(-1)">返回</a>]</td>
  </tr>
</table>
</body>
</html>
