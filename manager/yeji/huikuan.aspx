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
.STYLE12 {color: #0991FF}
.STYLE13 {font-size: 12px}
-->
</style>
</head>

<body>
 <!--#include file="../../conn.aspx"--> 
 <%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('�������');history.go(-1);</script>"
	response.end
end if


SQL="select * from tbl_huikuan where   huiyuan_id<>'A00000000'  "&search_sql&" order by huikuan_id desc  "

set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

msg_per_page=8
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('�������');history.go(-1);</script>"
	response.end
end if
%>


<!--#include file="../../inc/headpage.aspx"-->
<!--#include file="../../inc/safe.aspx"-->


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">������</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ������Ϣ &gt; ������</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />������</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	
		<table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#c1c1c1">
		  <tr bgcolor="#E3E3E3" class="titlea1">
			<td height="40" align="center">��¼�ʺ�</td>
			<td height="40" align="center">�������</td>
			<td height="40" align="center">���������</td>
			<td height="40" align="center">�����</td>
			<td height="40" align="center">�����ˮ��</td>
			<td height="40" align="center">���ʱ��</td>
			<td height="40" align="center">��ϵ�绰</td>
			<td height="40" align="center">��ע</td>
			<td height="40" align="center">״̬</td>
			<td height="40" align="center">��������</td>
		  </tr>
		<%
					dim i
					i=1
					do while not rs.eof and rowcount > 0
		%>
		  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
			<td height="30" align="center" class="content"><%=rs("huiyuan_bianhao")%></td>
			<td height="30" align="center" class="content"><%=rs("Accountbank")%></td>
			<td height="30" align="center" class="content"><%=rs("RemitName")%></td>
			<td height="30" align="center" class="content"><%=rs("money")%></td>
			<td height="30" align="center" class="content"><%=rs("SequNo")%></td>
			<td height="30" align="center" class="content"><%=rs("shijian")%></td>
			<td height="30" align="center" class="content"><%=rs("phone")%></td>
			<td height="30" align="center" class="content"><%=rs("memo")%></td>
			<td height="30" align="center" class="content">
			<%select case rs("huikuan_status")
							case 0
							   response.write "������"
							case 1
							   response.write "�Ѵ���"
							end select%>    </td>
			<td height="30" align="center" class="content">
			  <%if rs("huikuan_status")=1 then%>
			  �Ѵ���
			  <%else%>
			  <a href="queren.aspx?id=<%=rs("huikuan_id")%>&amp;hui_id=<%=rs("huiyuan_id")%>&amp;money=<%=rs("money_sj")%>&amp;money_b=<%=money_b%>&amp;man=<%=session("hy_id")%>" onClick="javascript:if(!confirm('\n�ر���ʾ!\n\n�����ؽ��иò�����\nȷ�Ϻ��޷�ȡ����'))  return  false; ">ȷ��</a>
			  <%end if%>
			  <%if rs("huikuan_status")<>1 then%>
			  <a href="del_hk.aspx?id=<%=rs("huikuan_id")%>" onClick="javascript:if(!confirm('\n�ر���ʾ��\n\n�����ؽ��иò�����\nɾ�����޷����лָ���'))  return  false; ">ɾ��</a>
			<%end if%>    </td>
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
</td></tr></table>
</body>
</html>
