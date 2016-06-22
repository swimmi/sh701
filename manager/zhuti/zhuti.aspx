<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>

<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<!--#include file="../../conn.aspx"-->
<!--#include file="../../time/time.aspx"-->



<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2" align="left">主题列表</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" align="left" bgcolor="EEEEEE" class="titlea">首页 &gt; 主题管理 &gt; 主题列表</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" align="left" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />主题列表</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">






<table width="99%" border="0" cellpadding="0" cellspacing="0" align="center" style="margin-top:10px;">
	
	<tr>
	  <td height="16" align="left" style="padding-bottom:15px; padding-top:10px; padding-left:30px;">
<form id="form1" name="form1" method="post" action="" style="margin:0px;">
	
	<input name="shijian1" type="text" onFocus="HS_setDate(this)" value="<%=session("date1")%>" style="width:80px; border:1px #CCCCCC solid; height:18px; line-height:18px;"/>
	-
	<input name="shijian2" type="text" onFocus="HS_setDate(this)" value="<%=session("date2")%>" style="width:80px; border:1px #CCCCCC solid; height:18px; line-height:18px;"/>
	<input name="Submit2" type="submit" id="Submit" value="查询"  style="width:60px; border:1px #CCCCCC solid; height:22px; background-color:#F6F6F6"/>
</form>
	  </td>
	</tr>
</table>


<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#E3E7EA"  style="margin-top:10px;">
	<tr class="titlea1">
		<td height="40" align="center" bgcolor="#F6F7FB">主题名</td>
		<td align="center" bgcolor="#F6F7FB">创建者编号</td>
		<td align="center" bgcolor="#F6F7FB">创建者名称</td>
		<td height="40" align="center" bgcolor="#F6F7FB">跟帖数</td>
		<td width="200" height="40" align="center" bgcolor="#F6F7FB">创建时间</td>
		<td width="100" height="40" align="center" bgcolor="#F6F7FB">操作</td>
	</tr>
<%

if request("shijian1")<>"" then
	session("date1")=request("shijian1")
else 
	session("date1")="2015-1-1"
end if

if request("shijian2")<>"" then
	session("date2")=request("shijian2")
else 
	session("date2")="3010-1-1"
end if


if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if


SQL="select * from view_zhuti where 1=1 "&search&" and addtime between '"&session("date1")&"' and '"&session("date2")&"' order by addtime desc"
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
<%do while not rs.eof and rowcount > 0%>		
	<tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F8F8FA'"  onMouseOut="this.style.backgroundColor=''" class="content">
	  <td height="40" align="center" ><%=rs("title")%></td>
	  <td align="center" ><%=rs("huiyuan_bianhao")%></td>
	  <td align="center" ><%=rs("huiyuan_name")%></td>
	  <td height="40" align="center" >
<%
	SQLa="select 'total'=isnull(count(*),0) from zhutia where zhuti='"&rs("id")&"'"
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
		response.Write rsa("total")
	rsa.close
	set rsa=nothing
%>	  </td>
	  <td height="40" align="center" ><%=rs("addtime")%></td>
	  <td width="100" height="40" align="center" >
	  		<a href="cha.aspx?id=<%=rs("id")%>" style="color:#FE531D">详情</a>
	  		<a href="dela.aspx?id=<%=rs("id")%>" style="color:#D807FE">删除</a>
			
		<%if rs("flag")=0 then%>
			<a href="fengbi.aspx?id=<%=rs("id")%>&flag=1" style="color:#045FA5" onClick="javascript:if(!confirm('\n特别提示！？\n\n请慎重进行该操作！\n封闭后将无法显示。'))  return  false; ">封闭</a>	   
		<%else%>
			<a href="fengbi.aspx?id=<%=rs("id")%>&flag=0" style="color:#045FA5" onClick="javascript:if(!confirm('\n特别提示！？\n\n请慎重进行该操作！\n启用后将显示。'))  return  false; ">启用</a>	   
		<%end if%>	  </td>
  </tr>
<%
i=i+1
icolor=icolor+1
if icolor>1 then icolor=0
rowcount=rowcount-1
rs.movenext
loop
%>
<%if rs.recordcount>0 then%>
<form id="form1" name="form1" method="post" action="?" style="margin:0px;">
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:20px;">
		<tr>
			<td height="25" align="center">【 <%=listPages("?select="&request("select")&"&shijian2="&request("shijian2")&"&shijian1="&request("shijian1")&"")%>
			<input name="page" type="text" size="5" />
			<input name="search" type="hidden" id="search" value="<%=request("search")%>" size="5" />
			<input name="select" type="hidden" id="select" value="<%=request("select")%>" size="5" />
			<input name="shijian1" type="hidden" id="shijian1" value="<%=request("shijian1")%>" size="5" />
			<input name="shijian2" type="hidden" id="shijian2" value="<%=request("shijian2")%>" size="5" />
			<input type="submit" name="Submit" value="转" style=" border:1px solid #999999; "/>
			】			</td>
		</tr>
	</table>
</form>
<%end if%>
</table>
















    </td>
    </tr>
</table>






</body>
</html>
