<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE15 {font-size: 12px}
-->
</style>
</head>
<!--#include file="../../conn.aspx"-->
<!--#include file="../jiance.aspx"-->
<!--#include file="../../time/time.aspx"--> 

<%	 
	if request("Submit")="�޸�" then
		conn.execute("update  huiyuan set tel='"&request("tel")&"',sex="&request("sex")&"  where id="&request("huiyuan_id"))
		response.Write("<script language='javascript'>alert('�޸ĳɹ�!');location.href='al_read2.aspx';</script>")
		response.End()
	end if
	
	
c_id=request("huiyuan_id")	


SQL="select * from huiyuan  where id='"&c_id&"'"
set rs=server.CreateObject("adodb.recordset")


rs.Open SQL,conn,1,1
if rs.RecordCount=0 then
  Response.Write "�Ƿ�����!"
  Response.End 
end if



%>
   
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">�޸�����</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ��Ա�б� &gt; �޸�����</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />�޸�����</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
 <form id="form1" name="form1" method="post" action="">
	  <table width="99%" border="0" cellpadding="0" cellspacing="1">
		<tr>
		  <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="586" height="40" align="right" class="content">�ֻ����룺</td>
              <td width="584" height="40" align="left" class="content" style="padding-left:5px;"><input name="tel" type="text" id="tel" value="<%=rs("tel")%>" />
                <input name="id" type="hidden" id="id" value="<%=request("huiyuan_id")%>" /></td>
              </tr>
            <tr>
              <td height="40" align="right" class="content">�Ա�</td>
              <td height="40" align="left" class="content" style="padding-left:5px;">
			  
			 
                <label>
                <input type="radio" name="sex" value="1"  <%if rs("sex")=1 then%> checked="checked"<%end if%> />
                </label>
                �б���
                  <label>
                  <input type="radio" name="sex" value="2"<%if rs("sex")=2 then%> checked="checked"<%end if%>  />
                  </label>
                  Ů����
                 </td>
            </tr>

          </table>
		    <br />
		   
		      <label>
		        <input name="Submit" type="submit" id="Submit" value="�޸�" />
	          </label>
	       <label>&nbsp;
		    <input type="button" name="Submit" value="������һ��" onclick="javascript:location.href='al_read2.aspx';" /> </label></td>
		</tr>
		<tr>
		  <td align="center">&nbsp;</td>
		  </tr>
	  </table>
	   </form>
	</td>
</tr>
</table>
</body>
</html>
