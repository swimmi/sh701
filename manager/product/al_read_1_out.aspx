 <!--#include file="../../conn.aspx"--> 
 <%response.ContentType ="application/vnd.ms-excel"%>
<%Response.AddHeader "Content-Disposition", "attachment; filename=������ѯ.xls"%>

 <%
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
else
	session("date1")="2013-1-1"
end if

if request("shijian2")<>"" then
	session("date2")=request("shijian2")
else
	session("date2")="3010-1-1"
end if

SQL="select * from tbl_order where flag<>0 and addtime between '"&session("date1")&"' and '"&session("date2")&"' "&search_sql&" order by addtime desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
%>
<HTML>
<HEAD>
<TITLE>��Ա����ϵͳ</TITLE>

<style type="text/css">
<!--
.STYLE1 {color: #000000}
-->
</style>
</HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<BODY>
<table width="100%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="c1c1c1">
  <tr bgcolor="#e1e1e1">
    <td height="35" align="center">���</td>
    <td height="35" align="center">����</td>
    <td height="35" align="center">��Ʒ����</td>
    <td height="35" align="center">�һ�����</td>
    <td height="35" align="center">�һ�ʱ��</td>
    <td height="35" align="center">����ʱ��</td>
    <td height="35" align="center">����״̬</td>
    <td align="center">�ջ���</td>
    <td align="center">�ջ��ʱ�</td>
    <td height="35" align="center">�ջ���ַ</td>
    <td height="35" align="center">��ϵ�绰</td>
  </tr>
<%do while not rs.eof%>
 <tr bgcolor="F7F7F7">
   <td  height="35" align="center"><%=rs("huiyuan_bianhao")%></td>
   <td height="35" align="center"><%=rs("huiyuan_name")%></td>
   <td  height="35" align="center"><%=rs("title")%></td>
   <td height="35" align="center"><%=rs("num")%></td>
   <td height="35" align="center"><%=rs("addtime")%></td>
   <td align="center"><%=rs("qrtime")%></td>
   <td align="center">
   		<%if rs("flag")=0 then%>δ����<%end if%>
        <%if rs("flag")=1 then%>�ѷ���<%end if%>
        <%if rs("flag")=2 then%>���յ���<%end if%>   </td>
    <td align="center"><%=rs("xinming")%></td>
    <td align="center"><%=rs("youbian")%></td>
    <td height="35" align="center"><%=rs("dizhi")%></td>
    <td height="35" align="center"><%=rs("dianhua")%></td>
  </tr>
  <%
rs.movenext
loop
%>
</table>
</BODY></HTML>
