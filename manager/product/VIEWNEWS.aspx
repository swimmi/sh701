<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE11 {font-size: 12px}
-->
</style>
</head>
 <!--#include file="../jiance.aspx"-->
  <!--#include file="../../conn.aspx"--> 

<%

if request("submit")="�޸�" then

	if 	request("title")="" then
		response.Write "<script language=javascript>alert('����д��Ʒ���ƣ�');history.go(-1);</script>"
		response.end
	end if
	
	if 	request("qianbao")="" then
		response.Write "<script language=javascript>alert('����д�һ��۸�');history.go(-1);</script>"
		response.end
	end if

	conn.execute("update tbl_pro set title='"&request("title")&"',qianbao='"&request("qianbao")&"' where id="&request("id")&"")

	response.Write "<script language=javascript>alert('���ӳɹ���');location.href='chanpin.aspx';</script>"
	response.end

end if





SQL="select * from tbl_pro where id="&request("id")&""
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1


%>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2" align="left">��Ʒ����</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" align="left" bgcolor="EEEEEE" class="titlea">��ҳ &gt; �һ����� &gt; ��Ʒ���� &gt; �޸�</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" align="left" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />��Ʒ����</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">


 <form id="form1" name="form1" method="post" action="viewnews.aspx" style="margin:0px;">
   <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
     <tr bgcolor="FEF6E2">
       <td height="40" align="left" bgcolor="#FFFFFF">��Ʒ����:
         <input name="title" type="text" id="title" size="37" maxlength="100" value="<%=rs("title")%>"/>
         <span style="color: #FF0000">* </span></td>
     </tr>
     <tr bgcolor="FEF6E2">
       <td height="40" align="left" bgcolor="#FFFFFF">�һ��۸�:
         <input name="qianbao" type="text" id="qianbao" size="10" maxlength="100"  value="<%=rs("qianbao")%>"/>
         <input name="id" type="hidden" id="id" size="10" maxlength="100"  value="<%=request("id")%>"/>
         <span style="color: #FF0000">*</span></td>
     </tr>
     <tr>
       <td height="40" align="left" bgcolor="#FFFFFF"><input type="submit" value="�޸�" style="position: relative; height: 20" name="submit" /></td>
     </tr>
   </table>
 </form>
 </td>
     </tr>
   </table>
   
  <%
  rs.close
  set rs=nothing
  %>
</body>
</html>