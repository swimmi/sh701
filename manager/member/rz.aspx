 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
</head>

<body>
<!--#include file="../../conn.aspx"-->

  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td height="80" colspan="2">��ȫ��֤</td>
    </tr>
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; �̻����� &gt; �̻��б� &gt; ��ȫ��֤</td>
    </tr>
  </table>
  
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
    <tr class="biao">
      <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />��ȫ��֤</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">

<%


if request("Submit")="ȷ��" then

	if request("radiobutton")="" then
		response.Write "<script language=javascript>alert('��ѡ����֤�Ƿ�ɹ���');history.go(-1);</script>"
		response.end
	end if
	if request("radiobutton")=3 and request("textfield")="" then
		response.Write "<script language=javascript>alert('����д��֤ʧ�ܵ�ԭ��');history.go(-1);</script>"
		response.end
	end if

	conn.execute("update tbl_huiyuan set rz='"&request("radiobutton")&"',rz_memo='"&request("textfield")&"' where huiyuan_id='"&request("huiyuan_id")&"'")
		
		response.Write "<script language=javascript>alert('�����ɹ���');history.go(-1);</script>"
		response.end


end if


SQL="select * from tbl_huiyuan where huiyuan_id='"&request("huiyuan_id")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
rz=rs("rz")
rz_memo=rs("rz_memo")
rs.close
set rs=nothing

%>	 
	    <form id="form1" name="form1" method="post" action="?">
		 <div style="font-size:14px; font-family:'΢���ź�'; margin-bottom:10px;">
			  ��֤�ɹ� <input type="radio" name="radiobutton" value="2" <%if rz=2 then%>checked<%end if%> />&nbsp;&nbsp;
			  ��֤ʧ�� <input type="radio" name="radiobutton" value="3" <%if rz=3 then%>checked<%end if%> /><br />
		 </div>
		 <div style="font-size:14px; font-family:'΢���ź�'; margin-bottom:10px;">
			  ʧ��ԭ��(��֤�ɹ�)��
			    <input type="text" name="textfield" style="width:200px;" value="<%=rz_memo%>" />
			  <input type="hidden" name="huiyuan_id" style="width:200px;" value="<%=request("huiyuan_id")%>" /><br />
		 </div>
		 <div style="font-size:14px; font-family:'΢���ź�'; margin-bottom:10px;">
			  <input type="submit" name="Submit" value="ȷ��" />
		 </div>
	    </form>
	  </div>
	  
	  
<%
SQL="select * from tbl_rz where huiyuan_id='"&request("huiyuan_id")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
if not rs.eof and not rs.bof then
while not rs.eof
%>
<a href="../../shop/<%=rs("img")%>" target="_blank"><img src="../../shop/<%=rs("img")%>" width="100" height="200" border="0" /></a>
<%
rs.movenext
wend
end if
rs.close
set rs=nothing
%></td></tr></table>

</body>
</html>
