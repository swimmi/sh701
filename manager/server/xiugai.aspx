<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> 
<HEAD>
<TITLE>��Ա����ϵͳ</TITLE>
<META content="MSHTML 5.00.3700.6699" name=GENERATOR>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%	 
if request.form("submit")="�޸�" then
	if Request("mingcheng")="" then
		response.Write "<script language=javascript>alert('����д�����������ƣ�');history.go(-1);</script>"
		response.end
	end if
	id=request("anli_id")
	rs_sql="update  tbl_huiyuan set huiyuan_zm_diqu='"&request("diqu")&"',huiyuan_zm_mingcheng='"&request("mingcheng")&"',zhuanmai_jb="&request("zhuanmai_jb")&" where  huiyuan_id='"&id&"'"
	conn.execute(rs_sql)


  Response.Write "<script language=javascript>alert('�޸ĳɹ���');location.href='xiugai.aspx?anli_id="&id&"';</script>"
  Response.End 

end if
   %>

<link href="../../css/css.css" rel="stylesheet" type="text/css">
</HEAD>
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from tbl_Huiyuan where  huiyuan_id='"&request("anli_id")&"'",conn,1,1

%>

<BODY>
<form name="form1" method="post" action="xiugai.aspx"  >
		  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
            <tr>
              <td height="30" align="center" background="../images/contop_bg.jpg">���������޸�</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
            </tr>
  </table>
		  <table width="95%" border="0" align="center" cellpadding="1" cellspacing="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="#d3d3d3" class="content">
            <tr bgcolor="#f7f7f7">
              <td width="50%" height="30" align="right" bgcolor="#FFFFFF" >��¼�ʺţ�</td>
              <td width="50%" height="30" bgcolor="#FFFFFF">&nbsp;&nbsp;<%=rs("huiyuan_bianhao")%>              <input name="anli_id" type="hidden" value="<%=request("anli_id")%>" /></td>
            </tr>
            <tr bgcolor="#f7f7f7">
              <td height="30" align="right" bgcolor="#FFFFFF" >��Ա������</td>
              <td height="30" bgcolor="#FFFFFF">&nbsp;&nbsp;<%=rs("huiyuan_name")%> </td>
            </tr>
            <tr bgcolor="#f7f7f7">
              <td width="50%" height="30" align="right" bgcolor="#FFFFFF" >�����������ƣ�</td>
              <td width="50%" height="30" bgcolor="#FFFFFF">&nbsp;
              <input name="mingcheng" type="text" value="<%=rs("huiyuan_zm_mingcheng")%>" />              </td>
            </tr>
            <tr bgcolor="#f7f7f7">
              <td width="50%" height="30" align="right" bgcolor="#FFFFFF" >��ѡ�����ͣ�</td>
              <td width="50%" height="30" bgcolor="#FFFFFF">&nbsp;
               <select name="zhuanmai_jb">
                <option value="0">�����������</option>
                  <option value="1">�� �� ��</option>
                  <option value="2">�أ�����������</option>
                  <option value="3">�м�����</option>
              </select></td>
            </tr>
            <tr bgcolor="#f7f7f7">
              <td height="30" align="right" bgcolor="#FFFFFF" >����������</td>
              <td height="30" bgcolor="#FFFFFF">&nbsp;
              <input name="diqu" type="text" value="<%=rs("huiyuan_zm_diqu")%>" size="25" maxlength="50" />              </td>
            </tr>
  </table>
          <br />
          <table width="100%" height="30" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="30" align="center"> <strong>
                  <input type="submit" name="Submit" value="�޸�" />
              </strong></div></td>
            </tr>
          </table>
</form>
</BODY>
</HTML>
