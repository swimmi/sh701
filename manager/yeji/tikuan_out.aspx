 <!--#include file="../../conn.aspx"--> 
 <%response.ContentType ="application/vnd.ms-excel"%>
<%Response.AddHeader "Content-Disposition", "attachment; filename=提现支付列表.xls"%>

<%
if request("ci_form")<>0 then
	search_sql=" and cha_ci='"&request("ci_form")-1&"'"
end if

if Request("search")<>"" then
	select case Request("type")
		case 1
			search_sql=" and huiyuan_bianhao='"&Request("search")&"' and tikuan_status=0"
		case 2
			search_sql=" and zhanghao='"&Request("search")&"' and tikuan_status=0 "
		case 3
			search_sql=" and xinming='"&Request("search")&"' and tikuan_status=0 "
	end select 
end if


if request("shijian1")<>"" then
	date1=request("shijian1")
else 
	date1="2012-1-1"
end if

if request("shijian2")<>"" then
	date2=request("shijian2")
else 
	date2="3010-1-1"
end if



SQL="select tikuan_id,huiyuan_bianhao,huiyuan_id,yinghang,zhanghao,xinming,phone,money_sj,money_sx,shijian,tikuan_status,money from tbl_tikuan where   1=1 and tikuan_status=1 and shijian between '"&date1&"' and '"&date2&"'"&search_sql&" order by tikuan_id "
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1




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
<table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" ccellpadding="0">
  <tr bgcolor="#e3e3e3">
    <td height="35" align="left" bgcolor="#FFFFFF">编号</td>
    <td height="35" align="left" bgcolor="#FFFFFF">&nbsp;开户银行</td>
    <td height="35" align="left" bgcolor="#FFFFFF">&nbsp;银行帐号</td>
    <td height="35" align="left" bgcolor="#FFFFFF">&nbsp;开户姓名</td>
    <td height="35" align="left" bgcolor="#FFFFFF">&nbsp;提现数额</td>
    <td height="35" align="left" bgcolor="#FFFFFF">&nbsp;提款时间</td>
  </tr>
  <%do while not rs.eof%>
  <tr>
    <td align="left">&nbsp;<%=rs("huiyuan_bianhao")%></td>
    <td align="left">&nbsp;<%=rs("yinghang")%></td>
    <td align="left">&nbsp;<%=rs("zhanghao")%></td>
    <td align="left">&nbsp;<%=rs("xinming")%></td>
    <td align="left">&nbsp;<%=rs("money_sj")%></td>
    <td align="left">&nbsp;<%=formatdatetime(rs("shijian"),2)%>&nbsp;<%=formatdatetime(rs("shijian"),3)%></td>
  </tr>
<%
	rs.movenext
	loop
%>
</table>
</BODY></HTML>
