<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> 

<HEAD>
<TITLE>��Ա����ϵͳ</TITLE>
<META content="MSHTML 5.00.3700.6699" name=GENERATOR>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%	 
if request.form("submit")="����" then
	id=request("huiyuan_id")
	rs_sql="update  tbl_huiyuan set huiyuan_zhuanmai_sq=1,zhuanmai_jb=1,huiyuan_zhuanmai=0 where  huiyuan_id='"&id&"'"
	conn.execute(rs_sql)


  Response.Write "<script language=javascript>alert('�����ɹ���');location.href='al_read.aspx';</script>"
  Response.End 

end if
   %>

<link href="../../css/css.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">�����������</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ������� &gt; �����������</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />�����������</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	
<form name="form1" method="post" action="zmd.aspx">
		  <table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="#d3d3d3" class="content">
            <tr bgcolor="#f7f7f7">
              <td width="50%" height="40" align="right" bgcolor="#FFFFFF">��¼�ʺţ�</td>
              <td width="50%" height="40" bgcolor="#FFFFFF"><%
set rs_test1=server.createobject("adodb.recordset")
rs_test1.open "select * from tbl_Huiyuan where  net_hege=1 and net_flag=0 and huiyuan_zhuanmai=0 order by huiyuan_qr_date",conn,1,1
%>
                  &nbsp;
                  <select name="huiyuan_id">
                    <%if rs_test1.recordcount>0 then
						while not rs_test1.eof
									%>
                    <option value="<%=rs_test1("huiyuan_id")%>"><%=rs_test1("huiyuan_mob")%>:<%=rs_test1("huiyuan_name")%></option>
                    <%rs_test1.movenext
wend
end if%>
              </select></td>
            </tr>
            <tr bgcolor="#f7f7f7" style="display:none">
              <td height="40" align="right" bgcolor="#FFFFFF">���񼶱�</td>
              <td height="40" bgcolor="#FFFFFF">&nbsp;
                <select name="select">
                <option value="1">����רԱ</option>
                <option value="2">��������</option>
                <option value="3">������</option>
                <option value="4">�����ܼ�</option>
              </select></td>
            </tr>
            <tr bgcolor="#f7f7f7">
              <td height="40" colspan="2" align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="����" /></td>
            </tr>
  </table>
          <br />
</form>
</td></tr></table>

</BODY>
</HTML>
