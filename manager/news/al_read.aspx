<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="../../time/time.aspx"-->
<!--#include file="../../conn.aspx"-->

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">������Ѷ</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ������Ѷ &gt; ������Ѷ</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />������Ѷ</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px; padding-top:10px;">
	
<%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('�������');history.go(-1);</script>"
	response.end
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

if Request("search")<>"" then
			search_sql=" and title like '%"&Request("search")&"%'"
end if
SQL="select * from news where addtime between '"&session("date1")&"' and '"&session("date2")&"' "&search_sql&"  order by id desc" 

set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

msg_per_page=20
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('�������');history.go(-1);</script>"
	response.end
end if
%>


<!--#include file="../../inc/headpage.aspx"-->
<!--#include file="../../inc/safe.aspx"--> 
               <table width="99%" height="60" border="0" align="center" cellspacing="0" class="content">
                 
                 <tr valign="top">
                   <form id="form2" name="form2" method="post" action="?">
				   <td height="30" align="left" valign="middle">��ѯ�� �����ű���
                     
                       <input name="search" type="text" id="search" size="20" />
                       <input name="shijian1" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date1")%>" />
-
<input name="shijian2" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date2")%>" />
<input name="Submit2" type="submit" id="Submit" value="��ѯ" />					 </td>
			       </form>
                 </tr>
				
               </table>

<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="c1c1c1">
  <tr class="titlea1" bgcolor="#e1e1e1">
    <td height="40" align="center">���ű���</td>
    <td width="200" height="40" align="center">����ʱ��</td>
    <td width="100" height="40" align="center">����</td>
  </tr>
<%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''" class="content">
    <td height="35" align="center"><%=rs("title")%></td>
    <td height="35" align="center"><%=rs("addtime")%></td>
    <td height="35" align="center">
			<a href="del.aspx?id=<%=rs("id")%>"   onclick="javascript:if(!confirm('\n�ر���ʾ����\n\nɾ�����޷����лָ���'))  return  false; ">ɾ��</a> 
			<a href="update.aspx?id=<%=rs("id")%>">�޸�</a>	</td>
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
<%if  rs.recordcount>0 then%>
<form id="form1" name="form1" method="post" action="?">
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
    <tr>
      <td height="5"></td>
    </tr>
    <tr>
      <td height="25" align="center">�� <%=listPages("?search_condition="&request("search_condition")&"&select="&request("select")&"")%>
            <input name="page" type="text" size="5" />
            <input name="select" type="hidden" id="select" value="<%=request("select")%>" size="5" />
            <input name="search_condition" type="hidden" id="search_condition" value="<%=request("search_condition")%>" size="5" />
            <input name="qishu_date1" type="hidden" id="qishu_date1" value="<%=request("qishu_date1")%>" size="5" />
            <input name="qishu_date2" type="hidden" id="qishu_date2" value="<%=request("qishu_date2")%>" size="5" />
            <input type="submit" name="Submit" value="ת" style=" border:1px solid #999999; "/>
      �� </td>
    </tr>
  </table>
</form>
<%end if%>

    </td>
  </tr>
</table>
</body>
</html>
