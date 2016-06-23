 <!--#include file="../../conn.aspx"--> 
<%response.ContentType ="application/vnd.ms-excel"%>
<%Response.AddHeader "Content-Disposition", "attachment; filename=用户列表.xls"%>

<%


if Request("search")<>"" then
	select case Request("type")
		case 1
			search_sql=" and tel='"&Request("search")&"'"
	end select 
end if

if Request("select")<>"" then
	if Request("select")=1 then
			search_sql=search_sql&" and sex=1"
	end if
	if Request("select")=2 then
			search_sql=search_sql&" and sex=2"
	end if
end if

if Request("select1")<>"" then
	if Request("select1")=1 then
			search_sql=search_sql&" and flag=0"
	end if
	if Request("select1")=2 then
			search_sql=search_sql&" and flag=1"
	end if
end if

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



SQL="select * from huiyuan where 1=1 "&search_sql&"   and addtime between '"&session("date1")&"' and '"&session("date2")&"' order by addtime desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

%>

<table width="99%" border="0" align="center" cellpadding="0"  cellspacing="0">
        <tr>
          <td align="center" >手机号</td>
          <td align="center" >性别</td>
          <td height="40" align="center" >注册时间</td>
          <td height="40" align="center" >使用状态</td>
        </tr>
<%do while not rs.eof%>
          <tr>
            <td align="center" class="content"  ><%=rs("tel")%></td>
            <td align="center" class="content"><%if rs("sex")=1 then%>男宝宝<%end if%><%if rs("sex")=2 then%>女宝宝<%end if%></td>
            <td height="30" align="center" class="content"><%=rs("addtime")%></td>
            <td height="30" align="center" class="content"><%if rs("flag")=0 then%>
            <a href="dj.aspx?flag=0&amp;id=<%=rs("id")%>">正常</a>
            <%else%>
            <a href="dj.aspx?flag=1&amp;id=<%=rs("id")%>"><font color="#FF0000">失效</font></a>
          <%end if%></td>
        </tr>
<%
	rs.movenext
	loop
%>
          </table>
