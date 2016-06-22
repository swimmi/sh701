 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">会员查询</td>
  </tr>
</table>
 <!--#include file="../../conn.aspx"--> 
 <%

SQL="select * from tbl_canshu"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
canshu_068=rs("canshu_068")
rs.close
set rs=nothing

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if

if Request("type")<>"" then
	select case Request("type")
		case 1
			search_sql=" and huiyuan_jiebie=1"
		case 2
			search_sql=" and huiyuan_jiebie=2"	
	end select 
end if



if Request("search")<>"" and Request("select2")<>"" then
	select case  request("select2")
		case 1
			search_sql=search_sql&" and huiyuan_bianhao='"&Request("search")&"'"
		case 2
			search_sql=search_sql&" and huiyuan_name='"&Request("search")&"'"
		case 3
			search_sql=search_sql&" and tjr_mob='"&Request("search")&"'"
		case 4
			search_sql=search_sql&" and tjrs='"&Request("search")&"'"
	end select
end if

SQL="select * from view_huiyuan where  huiyuan_id<>'A00000000' "&search_sql&" order by huiyuan_add_time desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1


SQLa="select 'total'=isnull(count(*),0) from view_huiyuan where  huiyuan_id<>'A00000000' "&search_sql&" "
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
total=rsa("total")
rsa.close
set rsa=nothing


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
			    <option value="0">请选择级别</option>
<%
SQLa="select * from tbl_jiebie where flag=1 "
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
while not rsa.eof
%>
                  <option value="<%=rsa("id")%>"><%=rsa("jiebie")%></option>
<%
rsa.movenext
wend
rsa.close
set rsa=nothing
%>				  
              </select>
            <select name="select2" id="select2">
              <option value="1">手机号码</option>
              <option value="2">会员姓名</option>
              <option value="4">推荐人数</option>
              <option value="3">推荐人</option>
            </select>
                <input name="search" type="text" id="search" size="20" />
                <input name="Submit2" type="submit" id="Submit" value="查询" />          </td>
          <td valign="middle">查询总人数：<%=total%></td>
        </tr>
      </table>
    </form></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="999999">
  <tr bgcolor="#E3E3E3">
    <td align="center" bgcolor="#CCCCCC" class="title" >登录帐号</td>
    <td height="30" align="center" bgcolor="#CCCCCC" class="title">姓名</td>
    <td height="30" align="center" bgcolor="#CCCCCC" class="title">会员级别</td>
    <td align="center" bgcolor="#CCCCCC" class="title" >推荐人</td>
    <td align="center" bgcolor="#CCCCCC" class="title">服务专员</td>
    <td align="center" bgcolor="#CCCCCC" class="title">服务主任</td>
    <td align="center" bgcolor="#CCCCCC" class="title">服务经理</td>
    <td align="center" bgcolor="#CCCCCC" class="title">服务总监</td>
    <td align="center" bgcolor="#CCCCCC" class="title">个人总消费</td>
    <td align="center" bgcolor="#CCCCCC" class="title">个人总PV</td>
    <td align="center" bgcolor="#CCCCCC" class="title">推荐人数</td>
    <td align="center" bgcolor="#CCCCCC" class="title">推荐总业绩</td>
    <td align="center" bgcolor="#CCCCCC" class="title">推荐总PV</td>
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
    <td align="center" class="content"><%=rs("tjr_name")%>(<%=rs("tjr_mob")%>)</td>
    <td align="center" class="content"  ><%
SQLa="select * from tbl_huiyuan where huiyuan_id='"&rs("fuwu1")&"' "
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
if not rsa.eof and not rsa.bof then
	jb=rsa("zm_jiebie")
	fuwu2=rsa("fuwu2")
	response.write rsa("huiyuan_mob")
end if
rsa.close
set rsa=nothing
%></td>
    <td align="center" class="content"  ><%
SQLa="select * from tbl_huiyuan where huiyuan_id='"&fuwu2&"' "
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
if jb=1 then
	if not rsa.eof and not rsa.bof then
		jb=rsa("zm_jiebie")
		fuwu2=rsa("fuwu2")
		response.write rsa("huiyuan_mob")
	end if
end if
rsa.close
set rsa=nothing
%>			</td>
    <td align="center" class="content"  ><%
SQLa="select * from tbl_huiyuan where huiyuan_id='"&fuwu2&"' "
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
if jb=2 then
	if not rsa.eof and not rsa.bof then
		jb=rsa("zm_jiebie")
		fuwu2=rsa("fuwu2")
		response.write rsa("huiyuan_mob")
	end if
end if
rsa.close
set rsa=nothing
%></td>
    <td align="center" class="content"  ><%
SQLa="select * from tbl_huiyuan where huiyuan_id='"&fuwu2&"' "
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
if jb=3 then
	if not rsa.eof and not rsa.bof then
		jb=rsa("zm_jiebie")
		fuwu2=rsa("fuwu2")
		response.write rsa("huiyuan_mob")
	end if
end if
rsa.close
set rsa=nothing
%></td>
    <td align="center" bordercolor="#FFFFFF" class="content"><%=rs("geren_money")%></td>
    <td align="center" bordercolor="#FFFFFF" class="content"><%=rs("geren_money_pv")%></td>
    <td align="center" bordercolor="#FFFFFF" class="content"><%=rs("tjrs")%></td>
    <td align="center" bordercolor="#FFFFFF" class="content"><%=rs("yeji_money")%></td>
    <td align="center" bordercolor="#FFFFFF" class="content"><%=rs("yeji_money_pv")%></td>
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
<form id="form1" name="form1" method="post" action="?">
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
    <tr>
      <td height="5"></td>
    </tr>
    <tr>
      <td height="25" align="center"><span class="STYLE4">【 <%=listPages("?type="&request("type")&"&select="&request("select")&"&select2="&request("select2")&"")%>
            <input name="page" type="text" size="5" />
            <input name="type" type="hidden" id="type" value="<%=request("type")%>" size="5" />
            <input name="select" type="hidden" id="select" value="<%=request("select")%>" size="5" />
            <input name="select2" type="hidden" id="select2" value="<%=request("select2")%>" size="5" />
            <input type="submit" name="Submit" value="转" style=" border:1px solid #999999; "/>
      】 </td>
    </tr>
  </table>
</form>
<%end if%>
</body>
</html>
