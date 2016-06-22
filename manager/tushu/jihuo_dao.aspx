<!--#include file="../../conn.aspx"--> 
<%response.ContentType ="application/vnd.ms-excel"%>
<%Response.AddHeader "Content-Disposition", "attachment; filename=导出激活码.xls"%>

<%
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


if Request("search")<>"" then
	select case Request("type")
		case 1
			search_sql=" and xuliehao='"&Request("search")&"'"
		case 2
			search_sql=" and title like '%"&Request("search")&"%'"
		case 3
			search_sql=" and isbn='"&Request("search")&"'"
		case 4
			search_sql=" and banci='"&Request("search")&"'"
		case 5
			search_sql=" and yingci='"&Request("search")&"'"
	end select 
end if



SQL="select * from view_jihuoma where addtime between '"&session("date1")&"' and '"&session("date2")&"' "&search_sql&" order by id desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
%>
<table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="999999">
  <tr bgcolor="#E3E3E3">
    <td height="35" align="center">图书名称</td>
    <td height="35" align="center">图书ISBN</td>
    <td align="center">图书版次</td>
    <td align="center">图书印次</td>
    <td align="center">图书序列号</td>
    <td align="center">激活码</td>
  </tr>
  <%do while not rs.eof%>
  <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
    <td height="35" align="center" class="content"><%=rs("title")%></td>
    <td  height="35" align="center" class="content"><%=rs("isbn")%></td>
    <td align="center" class="content"><%=rs("banci")%></td>
    <td align="center" class="content"><%=rs("yingci")%></td>
    <td align="center" class="content">&nbsp;<%=rs("xuliehao")%></td>
    <td align="center" class="content"><%=rs("jihuoma")%></td>
  </tr>
<%
	 rs.movenext
	 loop
%>
</table>
