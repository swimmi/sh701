<!--#include file="../jiance.aspx"-->
<!--#include file="../../conn.aspx"--> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>

<%
if request("submit")="ȷ�Ϸ���" then
	sql="select * from tbl_xiaofei where xiaofei_id='"&request("xiaofei_id")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,3
	rs("kdname")=request("kdname")
	rs("wlno")=request("wlno")
	rs("mob")=request("mob")
	rs("fahuo_flag")=1
	rs("xiaofei_qr_flag")=1
	rs("xiaofei_qr_date")=now()
	rs.update
	rs.close
	set rs=nothing
	
	response.Write "<script language=javascript>alert('�����ɹ���');location.href='al_read_1.aspx';</script>"
	response.end

end if





sql="select * from view_xiaofei_hy1 where xiaofei_id='"&request("id")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">��������</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
 <form id="form1" name="form1" method="post" action="fahuo.aspx" style="margin:0">
   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999">
     <tr>
       <td height="35" align="right" bgcolor="#FFFFFF" class="content">��¼�ʺţ�&nbsp;</td>
       <td height="35" bgcolor="#FFFFFF" class="content">&nbsp;<%=rs("huiyuan_bianhao")%>
	     <input name="huiyuan_id" type="hidden" value="<%=rs("huiyuan_id")%>">
       <input name="xiaofei_id" type="hidden" value="<%=rs("xiaofei_id")%>"></td>
     </tr>
     <tr>
       <td height="35" align="right" bgcolor="#FFFFFF" class="content">��Ʒ���ƣ�&nbsp;</td>
       <td height="35" bgcolor="#FFFFFF" class="content">&nbsp;<%=rs("pro_name")%></td>
     </tr>
     <tr>
       <td height="35" align="right" bgcolor="#FFFFFF" class="content">�ѹ���Ʒ��&nbsp;</td>
       <td height="35" bgcolor="#FFFFFF" class="content">&nbsp;<%=rs("xiaofei_money")%>Ԫ</td>
     </tr>
     <tr>
       <td width="50%" height="35" align="right" bgcolor="#FFFFFF" class="content">������˾���ƣ�&nbsp;</td>
       <td width="50%" height="35" bgcolor="#FFFFFF" class="content">&nbsp;
           <input name="kdname" type="text" value="<%=rs("kdname")%>" size="30" maxlength="50"></td>
     </tr>
     <tr>
       <td height="35" align="right" bgcolor="#FFFFFF" class="content">���˵��ţ�&nbsp;</td>
       <td height="35" bgcolor="#FFFFFF" class="content">&nbsp;
       <input name="wlno" type="text" size="30" maxlength="50" value="<%=rs("wlno")%>"></td>
     </tr>
     <tr>
       <td height="35" align="right" bgcolor="#FFFFFF" class="content">��ϵ�绰��&nbsp;</td>
       <td height="35" bgcolor="#FFFFFF" class="content">&nbsp;
       <input name="mob" type="text" size="30" maxlength="50" value="<%=rs("mob")%>"></td>
     </tr>
   </table>

 <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="35" align="center" valign="bottom"><input type="submit" name="Submit" value="ȷ�Ϸ���" /></td>
   </tr>
 </table>
 <table width="200" height="30" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td>&nbsp;</td>
   </tr>
 </table>
  </form>
</body>
</html>
