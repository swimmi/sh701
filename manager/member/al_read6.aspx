 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">待续费会员列表</td>
  </tr>
</table>
 <!--#include file="../../conn.aspx"--> 
 <script language="JavaScript" src="../../CSS/calendar.js"></script>

 <%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if

if Request("search")<>"" then
	select case Request("type")
		case 1
			search_sql=" and huiyuan_bianhao like '%"&Request("search")&"%'"
		case 2
			search_sql=" and huiyuan_name like '%"&Request("search")&"%' "
	end select 
end if

if request("shijian1")<>"" then
	session("date1")=request("shijian1")
else if request("cx")<>1 then
		session("date1")="2013-1-1"
	end if
end if

if request("shijian2")<>"" then
	session("date2")=request("shijian2")
else if request("cx")<>1 then
		session("date2")="3010-1-1"
	end if
end if



SQL="select * from view_huiyuan where   huiyuan_id<>'A00000000' and net_hege=1 and xufei_flag=1 and net_flag=0 "&search_sql&"   and huiyuan_add_time between '"&session("date1")&"' and '"&session("date2")&"' order by huiyuan_add_time desc"
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
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><form id="form1" name="form1" method="post" action="?" style="margin:0px;">
  <table width="98%" height="40" border="0" align="left" cellspacing="0" class="content">
    <tr valign="top">
      <td height="30" valign="middle">查询： 按
            <select name="type" id="type">
              <option value="1">登录帐号</option>
              <option value="2">会员姓名</option>
            </select>
            <input name="search" type="text" id="search" size="20" />
        时间 ：<font color="#000000">&nbsp; </font>
        <input name="shijian1" value="<%=session("date1")%>" size="12" maxlength="12" readonly="" />
        <input name="button" type="button" onClick="calendar(document.form1.shijian1)" value="日期..." />
        <input name="shijian2" value="<%=session("date2")%>" size="12" maxlength="12"  readonly="" />
        <input name="button" type="button" onClick="calendar(document.form1.shijian2)" value="日期..." />
        <input name="Submit2" type="submit" id="Submit" value="查询" />      </td>
    </tr>
  </table>
</form></td>
  </tr>
</table>


<table width="100%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="999999">
  <tr bgcolor="#E3E3E3">
    <td align="center" bgcolor="#CCCCCC" class="title" >登录帐号</td>
    <td height="30" align="center" bgcolor="#CCCCCC" class="title" >姓名</td>
    <td height="30" align="center" bgcolor="#CCCCCC" class="title">会员级别</td>
    <td height="30" align="center" bgcolor="#CCCCCC" class="title" >推荐人</td>
    <td height="30" align="center" bgcolor="#CCCCCC" class="title"  style="display:none">安置人</td>
    <td height="30" align="center" bgcolor="#CCCCCC" class="title" >注册时间</td>
    <td height="30" align="center" bgcolor="#CCCCCC" class="title" >确认时间</td>
    <td height="30" align="center" bgcolor="#CCCCCC" class="title" >续费时间</td>
    <td height="30" align="center" bgcolor="#CCCCCC" class="title" >操作</td>
  </tr>
  <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
    <td align="center" class="content"  ><%=rs("huiyuan_bianhao")%></td>
    <td  height="25" align="center" class="content"  ><%=rs("huiyuan_name")%></td>
    <td height="25" align="center" class="content"  ><%=rs("jiebie_name")%></td>
    <td height="25" align="center" class="content"><%=rs("tjr_bianhao")%></td>
    <td height="25" align="center" class="content" style="display:none"><%=rs("jdr_bianhao")%></td>
    <td height="25" align="center" class="content"><%=formatdatetime(cstr(rs("huiyuan_add_time")),1)%></td>
    <td height="25" align="center" class="content"><%if isnull(rs("huiyuan_qr_date"))=false then
    response.write formatdatetime(cstr(rs("huiyuan_qr_date")),1)
end if%>    </td>
    <td height="25" align="center" class="content"><%if isnull(rs("huiyuan_xufei"))=false then
    response.write formatdatetime(cstr(rs("huiyuan_xufei")),1)
end if%>    </td>
    <td height="25" align="center" class="content"><a href="xufei.aspx?huiyuan_id=<%=rs("huiyuan_id")%>">续费</a></td>
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
<%if rs.recordcount>0 then%>
<form id="form2" name="form2" method="post" action="?">
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
    <tr>
      <td height="5"></td>
    </tr>
    <tr>
      <td height="5" align="center"> 【 <%=listPages("?kind="&request("kind")&"&type="&request("type")&"&search="&request("search")&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"")%>
            <input name="page" type="text" size="5" />
            <input name="kink" type="hidden" id="kink" value="<%=request("kink")%>" size="5" />
            <input name="type" type="hidden" id="type" value="<%=request("type")%>" size="5" />
            <input name="search" type="hidden" id="search" value="<%=request("search")%>" size="5" />
            <input name="shijian1" type="hidden" id="shijian1" value="<%=request("shijian1")%>" size="5" />
            <input name="shijian2" type="hidden" id="shijian2" value="<%=request("shijian2")%>" size="5" />
            <input type="submit" name="Submit" value="转" style=" border:1px solid #999999; "/>
      】 </td>
    </tr>
  </table>
</form>
<%end if%>

</body>
</html>
