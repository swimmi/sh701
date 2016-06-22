<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>


<!-- #include file="../../conn.aspx" -->
<!--#include file="../jiance.aspx"-->


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">管理员帐号管理</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 企业帐号 &gt; 管理员帐号管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />管理员帐号管理</td>
  </tr>
  <tr>
    <td  align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">


		<table width="99%" border="0" cellpadding="1" cellspacing="1" bgcolor="#999999">
		  <tr bgcolor="#e3e3e3" class="titlea1">
			<td height="40" align="center" >管理员代码</td>
			<td height="40" align="center" >管理员姓名</td>
			<td height="40" align="center" >管理员登陆密码</td>
			<td height="40" align="center" >操作</td>
		  </tr>
		<% 
		set Grp_oRs=server.CreateObject("adodb.recordset")
		sql = "select * from tbl_admin "
		Grp_oRs.open sql,conn,1,3
		do while ((not Grp_oRs.eof) and (i<100)) 
		i=i+1
		%>
		  <form action="manage_del.aspx" method="post">
			<input name="GroupID" type="hidden" id="GroupID" value="<%=Grp_oRs("id")%>" />
			<input name="huiyuan_id" type="hidden" id="huiyuan_id" value="<%=Grp_oRs("huiyuan_id")%>" />
		  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
			  <td height="35" align="center" class="content">
				<input name="yuangong_code" type="text" id="yuangong_code" value="<%=Grp_oRs("huiyuan_bianhao")%>" size="15" maxlength="6" readonly="" />
			  </td>
			  <td height="35" align="center" class="content">
				<input name="yuangong_name" type="text" id="yuangong_name" value="<%=Grp_oRs("huiyuan_name")%>" size="20" maxlength="10" readonly="" />
			  </td>
			  <td height="35" align="center" class="content">
				<input name="yuangong_pass" type="text" id="yuangong_pass" value="<%=Grp_oRs("huiyuan_pass")%>" size="15" maxlength="6" readonly="" />
			  </td>
			  <td height="35" align="center" class="content">
				<input type="submit" name="Submit3" value="删除" onClick="javascript:if(!confirm('\n特别提示！\n\n请慎重进行该操作！\n删除后将无法进行恢复。'))  return  false;" />
			  <a href="manage_add.aspx?id=<%=Grp_oRs("id")%>">详细</a> </td>
			</tr>
		  </form>
		  <% Grp_oRs.movenext:loop:Grp_oRs.close %>
		  <form action="add_gl.aspx" method="post">
			<tr bgcolor="#F7F7F7">
			  <td height="35" align="center" bgcolor="#FFFFFF"><input name="yuangong_code" type="text" id="yuangong_code" size="15" maxlength="20" /></td>
			  <td height="35" align="center" bgcolor="#FFFFFF"><input name="yuangong_name" type="text" id="yuangong_name" size="20" maxlength="20" /></td>
			  <td height="35" align="center" bgcolor="#FFFFFF"><input name="yuangong_pass" type="text" id="GroupCode" size="15" maxlength="20" /></td>
			  <td height="35" align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="添加" /></td>
			</tr>
		  </form>
		</table>
		
	</td>
   </tr>
</table>
</body>
</html>