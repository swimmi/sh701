 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
<style type="text/css">
<!--
.STYLE11 {color: #0790FF}
-->
</style>
</head>
<body>
<script language="JavaScript" src="../../CSS/calendar.js"></script>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">账户管理</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
 <!--#include file="../../conn.aspx"--> 
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


SQL="select * from tbl_huiyuan  where not (  huiyuan_id='A00000002' or  huiyuan_id='A00000000')  and huiyuan_zhuanmai=1 and net_hege=1  and huiyuan_bianhao<>'A00000000' "&search_sql&" order by huiyuan_qr_date,huiyuan_add_time"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1



msg_per_page=8
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
            <input name="Submit2" type="submit" id="Submit" value="查询" />      </td>
    </tr>
  </table>
</form></td>
  </tr>
</table>


<table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" bordercolordark="#FFFFFF" bgcolor="#999999" >
  <tr bgcolor="#e3e3e3">
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >序号</td>
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >编号</td>
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >姓名</td>
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >提款金额</td>
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >余额</td>
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >报单币修改</td>
  </tr>
  <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
    <td height="35" align="center" class="content"><%=i+2%></td>
    <td height="35" align="center" class="content"><%=rs("huiyuan_bianhao")%></td>
    <td height="35" align="center" class="content"><%=rs("huiyuan_name")%></td>
    <td height="35" align="center" class="content"><%sql1="select 'aa'=sum(money) from tbl_tikuan  where huiyuan_id='"&rs("huiyuan_id")&"' and tikuan_status=1"
								  'response.write sql1
								 	set rs1=server.CreateObject("adodb.recordset")
													rs1.Open sql1,conn,1,1
													if isnull(rs1("aa")) then
													response.write "0"
													else
													response.write rs1("aa")
													end if
													rs1.close
													set rs1=nothing
													%>
    </td>
    <td height="35" align="center" class="content"><%=round(rs("huiyuan_yu")-rs("jiangjin"),2)%></td>
    <form method="post" action="fw_xiugai.aspx?currentpage=<%=currentpage%>">
      <td height="35" align="center" class="content" ><input name="money" type="text" size="10" />
          <input name="huiyuan_id" type="hidden" value="<%=rs("huiyuan_id")%>" />
          <input type="submit" name="Submit3" value="修改" />
      </td>
    </form>
    <form method="post" action="cf_xg_001.aspx?currentpage=<%=currentpage%>">
    </form>
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
      <td height="25" align="center">【 <%=listPages("?kind="&request("kind")&"&type="&request("type")&"&search="&request("search")&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"")%>
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
