 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE11 {color: #0790FF}
-->
</style>
</head>

<body>

 <!--#include file="../../conn.aspx"--> 

<%
if request("Submit2")="���" then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tbl_address1"
	rs.open sql,conn,1,3
	rs.addnew
	rs("dizhi")=request("dizhi")
	rs.update
	rs.close
	set rs=nothing
	 
	Response.Write "<script language=javascript>alert('�����ɹ���');location.href='address.aspx';</script>"
	Response.End 
end if

if request("Submit")="�޸�" then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tbl_address1 where id="&request("id")&""
	rs.open sql,conn,1,3
	rs("dizhi")=request("dizhi2")
	rs.update
	rs.close
	set rs=nothing
	 
	Response.Write "<script language=javascript>alert('�����ɹ���');location.href='address.aspx';</script>"
	Response.End 
end if

if request("action")="del" then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tbl_address2 where address="&request("id")&""
	rs.open sql,conn,1,3
	'if not rs.eof and not rs.bof then
	'	Response.Write "<script language=javascript>alert('����ʧ�ܣ�����ɾ���У�');location.href='address.aspx';<script>"
	'	Response.End 
	'end if
	rs.close
	set rs=nothing

	conn.execute("delete from tbl_address1 where id='"&request("id")&"'")
	
	Response.Write "<script language=javascript>alert('�����ɹ���');location.href='address.aspx';</script>"
	Response.End 

end if
%>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">��ӵ���</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ϵͳ���� &gt; ��ӵ���</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />��ӵ���</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;"><%
SQL="select * from tbl_address1"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
%>
<table width="99%" border="0" cellpadding="1" cellspacing="1" bgcolor="#c1c1c1">
  <tr bgcolor="#e1e1e1" class="titlea1">
    <td height="40" align="center">ʡ��</td>
    <td height="40" align="center">����</td>
  </tr>
<%do while not rs.eof%>
<form action="address.aspx" method="post">
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
      <td height="30" align="center" class="content"><%=rs("dizhi")%>
      <input name="id" type="hidden" id="id" value="<%=rs("id")%>" /></td>
    <td height="30" align="center" class="content"><a href="address.aspx?id=<%=rs("id")%>&amp;action=del" onClick="javascript:if(!confirm('\n�ر���ʾ��\n\n�����ؽ��иò�����\nɾ�����޷����лָ���'))  return  false;"></a>
	 <a href="addressb.aspx?dizhi=<%=rs("dizhi")%>">��ӵ���</a> </td>
  </tr>
</form>
  <%rs.movenext
		  loop%>
</table>

	</td>
	</tr>
</table>

</body>
</html>
