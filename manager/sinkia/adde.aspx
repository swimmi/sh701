<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<body>
<!--#include file="../../conn.aspx"-->

<%
	Set Rs= Server.CreateObject("ADODB.Recordset")
	sql="select * from tbl_product where pro_id="&request("id")&""
	rs.Open SQL,conn,1,1
	proname=rs("pro_name")
	rs.close
	set rs=nothing
%>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">添加成份－<%=proname%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999" class="content">
  <form action="adde1.aspx" method="post"  name="form1" id="form1">
    <tr>
      <td width="15%" height="25" align="right" bgcolor="#FFFFFF">商品名称：</td>
      <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><%=proname%>
      <input name="proid" type="hidden" id="proid" value="<%=request("id")%>" /></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#FFFFFF">属　　性：</td>
      <td height="25" align="left" bgcolor="#FFFFFF"><input name="title" type="text" size="30" />
          <span class="STYLE1">*</span></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#FFFFFF">分　　值：</td>
      <td height="25" align="left" bgcolor="#FFFFFF"><input name="fz" type="text" id="fz" size="30" />
          <span class="STYLE1">*</span></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#FFFFFF">介　　绍：</td>
      <td height="25" align="left" bgcolor="#FFFFFF"><input name="memo" type="text" size="30" />
      <span class="STYLE1">*</span></td>
    </tr>
    <tr>
      <td height="25" colspan="2" bgcolor="#FFFFFF"> <input type="submit" name="Submit" value="提交" onclick="return checkuserinfo_2007();" />
          <input type="reset" name="Submit2" value="重置" />      </td>
    </tr>
  </form>
</table>
<br />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
  <tr>
  	<td height="25" align="center" bgcolor="#FFFFFF">

    <%
	Set Rs= Server.CreateObject("ADODB.Recordset")
	sql="select * from tbl_productc where pro_id="&request("id")&""
	rs.Open SQL,conn,1,1
	dim i
	i=1
	
	if not rs.eof and not rs.bof then
	while not rs.eof
%>
	
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="border-bottom:1px  #CCCCCC dashed">
                <tr>
                  <td width="1%" align="left" valign="middle"><%=rs("title")%></td>
                  <td width="47%" height="30" align="left" valign="middle">&nbsp;&nbsp;<%=rs("fz")%></td>
                  <td width="45%" height="30" align="left" valign="middle">&nbsp;&nbsp;<%=rs("memo")%></td>
                  <td width="7%" height="30" align="center" valign="middle"><a href="adde_del.aspx?id=<%=rs("id")%>&amp;proid=<%=request("id")%>">删除</a></td>
                </tr>
			</table>
  <%
i=i+1
	rs.movenext
	wend	
	end if
	rs.close
	set rs=nothing
%>
	</td>
  </tr>
</table>
</body>
</html>
