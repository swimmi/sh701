 <!--#include file="../../conn.aspx"--> 
 <%response.ContentType ="application/vnd.ms-excel"%>
<%Response.AddHeader "Content-Disposition", "attachment; filename=积分明细表.xls"%>

<!--#include file="../jiance.aspx"-->
<%
if request("shijian1")<>"" then
	session("date1")=request("shijian1")
else 
	session("date1")="2013-1-1"
end if

if request("shijian2")<>"" then
	session("date2")=request("shijian2")
else 
	session("date2")="3010-1-1"
end if


if request("search_kind")<>0 then
	search_kind=request("search_kind")
else
	search_kind=0
end if


if request("search_condition2")<>"" then
	select case search_kind
		case 0
			search_sql=search_sql&" and huiyuan_name='"&request("search_condition2")&"'"
		case 1
			search_sql=search_sql&" and cha_hui_bianhao='"&request("search_condition2")&"'"
	end select			
end if


SQL="select cha_hui_id,cha_hui_bianhao,cha_name,cha_001,cha_002,cha_003,cha_004,cha_005,cha_006,cha_007,cha_008,cha_013,cha_date from tbl_cha  where 1=1  "&search_sql&" and cha_date between '"&session("date1")&"' and '"&session("date2")&"' order by cha_date desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

response.Write sql


%>
<HTML>
<HEAD>
<TITLE>会员管理系统</TITLE>

<style type="text/css">
<!--
.STYLE1 {color: #000000}
-->
</style>
</HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<BODY>
<table width="99%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="c1c1c1">
  <tr bgcolor="#e1e1e1" class="titlea1">
    <td height="40" align="center">登录帐号</td>
    <td height="40" align="center">姓名</td>
    <td height="40" align="center">拓展奖</td>
    <td height="40" align="center">管理奖</td>
    <td height="40" align="center">组织奖</td>
    <td height="40" align="center">领导奖</td>
    <td height="40" align="center">贡献奖</td>
    <td height="40" align="center">报单费</td>
    <td height="40" align="center">重复消费</td>
    <td height="40" align="center">扣税</td>
    <td height="40" align="center">总计</td>
    <td height="40" align="center">时间</td>
  </tr>
  <%
		  	dim i
			i=1
			do while not rs.eof
			
			
%>
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
    <td height="30" align="center" class="content"><%=rs("cha_hui_bianhao")%></td>
    <td height="30" align="center" class="content"><%=rs("cha_name")%></td>
    <td height="30" align="center" class="content"><%=round(rs("cha_001"),2)%></td>
    <td height="30" align="center" class="content"><%=round(rs("cha_002"),2)%></td>
    <td height="30" align="center" class="content"><%=round(rs("cha_003"),2)%></td>
    <td height="30" align="center" class="content"><%=round(rs("cha_004"),2)%></td>
    <td height="30" align="center" class="content"><%=round(rs("cha_005"),2)%></td>
    <td height="30" align="center" class="content"><%=round(rs("cha_006"),2)%></td>
    <td height="30" align="center" class="content"><%=round(rs("cha_008"),2)%></td>
    <td height="30" align="center" class="content"><%=round(rs("cha_007"),2)%></td>
    <td height="30" align="center" class="content"><%=round(rs("cha_013"),2)%></td>
    <td height="30" align="center" class="content"><%=rs("cha_date")%></td>
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
</BODY></HTML>
