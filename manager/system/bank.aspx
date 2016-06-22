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
SQL="select * from tbl_bank"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
%>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">银行帐号管理</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 企业帐号 &gt; 银行帐号管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />银行帐号管理</td>
  </tr>
  <tr>
    <td  align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	
	
<table width="99%" border="0" cellpadding="1" cellspacing="1" bgcolor="#c1c1c1">
  <tr bgcolor="#e1e1e1" class="titlea1">
    <td height="40" align="center">开户行</td>
    <td height="40" align="center">开户名</td>
    <td height="40" align="center">帐号</td>
    <td height="40" align="center">地址</font></td>
    <td height="40" align="center">操作</td>
  </tr>
<%do while not rs.eof%>
  <form action="bank_xg.aspx?id=<%=rs("id")%>" method="post">
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
      <td height="30" align="center">
        <input name="accountbank" type="text" id="accountbank" value="<%=rs("accountbank")%>" size="30" maxlength="50" />
      </td>
      <td height="30" align="center">
        <input name="accountname" type="text" id="accountname" value="<%=rs("accountname")%>" size="30" maxlength="50" />
      </td>
      <td height="30" align="center">
        <input name="accountno" type="text" id="accountno" value="<%=rs("accountno")%>" size="25" maxlength="50" />
      </td>
      <td height="30" align="center"><input name="accountadd" type="text" id="accountadd" value="<%=rs("accountadd")%>" size="35" maxlength="50" /></td>
      <td height="30" align="center">
        <input type="submit" name="Submit" value="修改" />
        <input type="button" name="Submit3" value="删除" onClick="javascript:if(!confirm('\n特别提示！\n\n请慎重进行该操作！\n删除后将无法进行恢复。'))  return  false;window.location.href('bank_del.aspx?id=<%=rs("id")%>');" />
      </td>
    </tr>
  </form>
  <%rs.movenext
		  loop%>
  <form action="bank_add.aspx" method="post">
    <tr bgcolor="#f7f7f7">
      <td height="30" align="center" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><input name="accountbank" type="text" id="accountbank" size="30" maxlength="50" /></td>
      <td height="30" align="center" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><input name="accountname" type="text" id="accountname"  size="30" maxlength="50" /></td>
      <td height="30" align="center" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><input name="accountno" type="text" id="accountno" size="25" maxlength="50" /></td>
      <td height="30" align="center" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><input name="accountadd" type="text" id="accountadd" size="35" maxlength="50" /></td>
      <td height="30" align="center" bgcolor="#FFFFFF">
        <input type="submit" name="Submit2" value="添加" />
      </td>
    </tr>
  </form>
</table>

</td></tr></table>
</body>
</html>
