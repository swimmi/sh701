
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../jiance.aspx"-->
<!--#include file="../../conn.aspx"--> 
<body>

<%
if request("submit")="确认发货" then
	sql="select * from tbl_order where id='"&request("id")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,3
	rs("wlgs")=request("wlgs")
	rs("wlhao")=request("wlhao")
	rs("flag")=1
	rs("qrtime")=now()
	rs.update
	rs.close
	set rs=nothing
	
	response.Write "<script language=javascript>alert('操作成功！');location.href='al_read.aspx';</script>"
	response.end

end if





sql="select * from tbl_order where id='"&request("id")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">物流发货</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 兑换管理 &gt; 订单处理 &gt; 物流发货</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />物流发货</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">



 <form id="form1" name="form1" method="post" action="fahuo.aspx" style="margin:0">
   <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c1c1c1">
     <tr>
       <td height="35" align="right" bgcolor="#FFFFFF" class="content">登录帐号：&nbsp;</td>
       <td height="35" align="left" bgcolor="#FFFFFF" class="content">&nbsp;<%=rs("huiyuan_bianhao")%>
	     <input name="huiyuan_id" type="hidden" value="<%=rs("huiyuan_id")%>">
       <input name="id" type="hidden" value="<%=rs("id")%>"></td>
     </tr>
     <tr>
       <td height="35" align="right" bgcolor="#FFFFFF" class="content">商品名称：&nbsp;</td>
       <td height="35" align="left" bgcolor="#FFFFFF" class="content">&nbsp;<%=rs("title")%></td>
     </tr>
     <tr>
       <td width="50%" height="35" align="right" bgcolor="#FFFFFF" class="content">物流公司名称：&nbsp;</td>
       <td width="50%" height="35" align="left" bgcolor="#FFFFFF" class="content">&nbsp;
           <input name="wlgs" type="text" value="<%=rs("wlgs")%>" size="30" maxlength="50"></td>
     </tr>
     <tr>
       <td height="35" align="right" bgcolor="#FFFFFF" class="content">货运单号：&nbsp;</td>
       <td height="35" align="left" bgcolor="#FFFFFF" class="content">&nbsp;
       <input name="wlhao" type="text" size="30" maxlength="50" value="<%=rs("wlhao")%>"></td>
     </tr>
   </table>

 <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="35" align="center" valign="bottom"><input type="submit" name="Submit" value="确认发货" /></td>
   </tr>
 </table>
</form></td>
   </tr>
 </table>
</body>
</html>
