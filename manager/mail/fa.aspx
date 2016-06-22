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

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if


SQL="select * from view_liuyan where leibie=1 order by liuyan_date desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

msg_per_page=20
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if
%>
<!--#include file="../../inc/headpage.aspx"-->
<!--#include file="../../inc/safe.aspx"-->
<script language="javascript"> 
//代码说明(lulu163.com)：form1为表单名，memberId为复选框，selectbutton为全选按钮 
   function selectAll()  
   { 
for (var i=0;i<document.form2.queren.length;i++) { 
var temp=document.form2.queren[i]; 
temp.checked=!temp.checked; 
} 
   if (document.form2.selectButton.value=="全部选择") 
   { 
     document.form2.selectButton.value="取消全选"; 
   } 
   else 
   { 
     document.form2.selectButton.value="全部选择"; 
   } 
} 
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">站内信管理</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 消息留言 &gt; 站内信管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />站内信管理</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">

	<form id="form2" name="form2" method="post" action="del2.aspx" style="margin:0">
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="c1c1c1">
  <tr class="titlea1" bgcolor="#e1e1e1">
		<td width="120" height="40" align="center"><input type="checkbox" name="selectButton" value="全部选择" onClick="selectAll()" style="cursor:hand;" />
		  <input type="submit" name="Submit2" value="批量删除" /></td>
		<td height="40" align="center">标题</td>
		<td width="150" height="40" align="center">发送时间</td>
		<td width="120" height="40" align="center">操作</td>
	  </tr>
	  <%
				dim i
				i=1
				do while not rs.eof and rowcount > 0
	%>
	  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
		<td height="30" align="center" class="content"><input name="queren" type="checkbox" id="queren" value="<%=rs("id")%>"/></td>
		<td height="30" align="center" class="content"><%=rs("liuyan_title")%></td>
		<td height="30" align="center" class="content"><%=rs("liuyan_date")%></td>
		<td height="30" align="center" class="content"><a href="show.aspx?id=<%=rs("id")%>">查看</a>&nbsp;<a href="del1.aspx?id=<%=rs("id")%>">删除</a></td>
	  </tr>
	  <%
				  i=i+1
				  icolor=icolor+1
				  if icolor>1 then icolor=0
				  rowcount=rowcount-1
				  rs.movenext
				  loop
	%>
	</table>
	</form>
	<%if rs.recordcount>0 then%>
	<form id="form1" name="form1" method="post" action="?">
	  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
		<tr>
		  <td height="5"></td>
		</tr>
		<tr>
		  <td height="25" align="center"><span class="STYLE4">【 <%=listPages("?search_condition="&request("search_condition")&"&select="&request("select")&"")%>
				<input name="page" type="text" size="5" />
				<input name="select" type="hidden" id="select" value="<%=request("select")%>" size="5" />
				<input name="search_condition" type="hidden" id="search_condition" value="<%=request("search_condition")%>" size="5" />
				<input name="qishu_date1" type="hidden" id="qishu_date1" value="<%=request("qishu_date1")%>" size="5" />
				<input name="qishu_date2" type="hidden" id="qishu_date2" value="<%=request("qishu_date2")%>" size="5" />
				<input type="submit" name="Submit" value="转" style=" border:1px solid #999999; "/>
		  】 </td>
		</tr>
	  </table>
	</form>
	<%end if%>
	</td>
  </tr>
</table>

</body>
</html>
