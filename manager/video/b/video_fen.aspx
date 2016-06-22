<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<link href="../../css/css.css" rel="stylesheet" type="text/css" />
<!--#include file="soft.aspx"-->

<body>
<table width="99%" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:10px;">
  <tr>
    <td background="img/../3.png"><img src="../../img/1.png" width="5" height="42" /></td>
    <td width="100%" valign="bottom" background="../../img/3.png"><table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-left:5px;">
      <tr>
        <td height="34" width="91" align="center" background="../img/9.png"><font style="color:#036DB7; font-size:14px; font-weight:bold;">分配课件</font></td>
        <td width="622">&nbsp;&nbsp;</td>
        <td width="446" align="right" style="padding-right:20px;"></td>
      </tr>
    </table></td>
    <td align="right" background="../img/3.png"><img src="../../img/2.png" width="5" height="42" /></td>
  </tr>
  <tr>
    <td background="../../img/8.png"></td>
    <td bgcolor="#F9F9FB">&nbsp;</td>
    <td background="../../img/7.png"></td>
  </tr>
  <tr>
    <td background="../../img/8.png"></td>
    <td width="100%" height="390" valign="top" bgcolor="#F9F9FB">
<%
	SQL="select * from wendang where id='"&request("video")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
%>	  
	<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="40" align="left" style="line-height:25px;" >
				课件名称：<%=rs("title")%><br />
				上传时间：<%=replace(rs("addtime"),"/","-")%>
		  </td>
		</tr>
	</table>
<%
	video=rs("video")
	rs.close
	set rs=nothing
%>	
<%
	SQL="select * from view_video where id='"&video&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
		xiangmu=rs("xiangmu")
	rs.close
	set rs=nothing
%>	  
	
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="40" align="left">
<form id="form1" name="form1" method="post" action="" style="margin:0px;">
	<select name="select">
		<option value="1">报名编号</option>
		<option value="2">学员姓名</option>
	</select>
	<input name="search" type="text" id="search" style="width:150px; border:1px #CCCCCC solid; height:18px;"/>
	<select name="sex">
		<option value="0">所有性别</option>
		<option value="1">男</option>
		<option value="2">女</option>
	</select>
	<select name="gongsi">
		<option value="0">所有单位</option>
			<%
			set rs=server.CreateObject("adodb.recordset")
			sql="select * from company"
			rs.open sql,conn,1,1
			if not rs.eof and not rs.bof then
			while not rs.eof
			%>
				<option value="<%=rs("id")%>"><%=rs("title")%></option>
			<%
			rs.movenext
			wend
			end if
			rs.close
			set rs=nothing
			%>
	</select>
	<select name="zhiwu">
		<option value="0">所有职务</option>
			<%	
			set rs=server.CreateObject("adodb.recordset")
			sql="select * from zhiwu"
			rs.open sql,conn,1,1
			if not rs.eof and not rs.bof then
			while not rs.eof
			%>
				<option value="<%=rs("id")%>"><%=rs("title")%></option>
			<%
			rs.movenext
			wend
			end if
			rs.close
			set rs=nothing
			%>
	</select>
	<input name="Submit23" type="submit" id="Submit" value="查询" style="width:60px; border:1px #CCCCCC solid; height:22px; background-color:#F6F6F6"/>
</form>		  
		</td>
	</tr>
</table>
	
<form id="form2" name="form2" method="post" action="video_fena.aspx?id=<%=request("video")%>&video=<%=video%>" style="margin:0">
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#E3E7EA">
      <tr>
        <td height="40" align="center" bgcolor="#F6F7FB" class="titleb">
			<input type="submit" name="Submit2" value="确认分配" style="border:1px #CCCCCC solid; height:22px; background-color:#F6F6F6"/>		</td>
        <td height="40" align="center" bgcolor="#F6F7FB" class="titleb">报名编号</td>
        <td align="center" bgcolor="#F6F7FB" class="titleb">报名期数</td>
        <td height="40" align="center" bgcolor="#F6F7FB" class="titleb">学员姓名</td>
        <td height="40" align="center" bgcolor="#F6F7FB" class="titleb">性别</td>
        <td height="40" align="center" bgcolor="#F6F7FB" class="titleb">年龄</td>
        <td height="40" align="center" bgcolor="#F6F7FB" class="titleb">电话号码</td>
        <td height="40" align="center" bgcolor="#F6F7FB" class="titleb">所在单位</td>
        <td height="40" align="center" bgcolor="#F6F7FB" class="titleb">职务</td>
        <td height="40" align="center" bgcolor="#F6F7FB" class="titleb">操作</td>
      </tr>
<%

if Request("search")<>"" then
	select case Request("select")
		case 1
			search=" and baominghao='"&Request("search")&"'"
		case 2
			search=" and nc like '%"&Request("search")&"%'"
	end select 
end if

if Request("sex")<>"" then
	if Request("sex")<>0 then
			search=" and sex='"&Request("sex")&"'"
	end if
end if

if Request("gongsi")<>"" then
	if Request("gongsi")<>0 then
			search=" and gongsi_id='"&Request("gongsi")&"'"
	end if
end if

if Request("zhiwu")<>"" then
	if Request("zhiwu")<>0 then
			search=" and zhiwu='"&Request("zhiwu")&"'"
	end if
end if

if Request("argee")<>"" then
	if Request("argee")=1 then
			search=" and argee=1"
	end if
	if Request("argee")=2 then
			search=" and argee=2"
	end if
	if Request("argee")=3 then
			search=" and argee=3"
	end if
end if


SQL="select * from view_baoming where xiangmu='"&xiangmu&"' and lei=1 and argee=1 "&search&" order by pijuan desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

i=1
do while not rs.eof

SQLa="select title from zhiwu where id='"&rs("zhiwu")&"'"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
	if not rsa.eof and not rsa.bof then
		zhiwu_title=rsa("title")
	end if
rsa.close
set rsa=nothing

totala=0
SQLa="select * from wendangshow where huiyuan_id='"&rs("huiyuan_id")&"' and wengdang='"&request("video")&"'"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
	totala=rsa.recordcount
rsa.close
set rsa=nothing

%>
      <tr bgcolor="FFFFFF"  class="titlea">
        <td height="40" align="center" bgcolor="#FFFFFF" >
			<input name="queren" type="checkbox" id="queren" value="<%=rs("huiyuan_id")%>"  <%if totala<>0 then%>checked<%end if%>/>		</td>
        <td height="40" align="center" bgcolor="#FFFFFF" ><%=rs("baominghao")%></td>
        <td align="center" bgcolor="#FFFFFF" ><%=rs("qishu")%></td>
        <td height="40" align="center" bgcolor="#FFFFFF" ><%=rs("nc")%></td>
        <td height="40" align="center" bgcolor="#FFFFFF"><%if rs("sex")=1 then%>男<%else%>女<%end if%></td>
        <td height="40" align="center" bgcolor="#FFFFFF"><%=rs("age")%></td>
        <td height="40" align="center" bgcolor="#FFFFFF"><%=rs("phone")%></td>
        <td height="40" align="center" bgcolor="#FFFFFF"><%=rs("companytitle")%></td>
        <td height="40" align="center" bgcolor="#FFFFFF" ><%=zhiwu_title%></td>
        <td align="center" bgcolor="#FFFFFF" >
			<%if totala=0 then%><a href="video_fenb.aspx?video=<%=request("video")%>&huiyuan_id=<%=rs("huiyuan_id")%>">确认分配</a><%end if%>	
			<%if totala>0 then%><a href="video_fenc.aspx?video=<%=request("video")%>&huiyuan_id=<%=rs("huiyuan_id")%>" style="color:#0000FF">取消分配</a><%end if%>		</td>
      </tr>
<%
i=i+1
rs.movenext
loop
rs.close
set rs=nothing
%>
    </table>
</form>	
	
	
	
	
	
	
	
	
	
</td>
    <td background="../../img/7.png"></td>
  </tr>
  <tr>
    <td><img src="../../img/4.png" width="5" height="20" /></td>
    <td width="100%" background="../../img/6.png">&nbsp;</td>
    <td><img src="../../img/5.png" width="5" height="20" /></td>
  </tr>
</table>
</body>
</html>
