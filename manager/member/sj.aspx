 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td height="80" colspan="2">������¼</td>
    </tr>
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ��Ա���� &gt; ������¼</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
    <tr class="biao">
      <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />������¼</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
 <!--#include file="../../conn.aspx"--> 
 <%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('�������');history.go(-1);</script>"
	response.end
end if


SQL="select * from tbl_sj  order by addtime desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

msg_per_page=10
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('�������');history.go(-1);</script>"
	response.end
end if
%>


<!--#include file="../../inc/headpage.aspx"-->
<!--#include file="../../inc/safe.aspx"-->
<table width="99%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="c1c1c1">
    <tr bgcolor="#e1e1e1" class="titlea1">
    <td height="35" align="center" >���</td>
    <td height="35" align="center" >����</td>
    <td height="35" align="center" >ԭ����</td>
    <td height="35" align="center" >�¼���</td>
    <td align="center" >�����</td>
    <td height="35" align="center" >ʱ��</td>
    <td height="35" align="center" >����Ա</td>
  </tr>
  <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
    <td  height="35" align="center" class="content"  ><%=rs("huiyuan_bianhao")%></td>
    <td  height="35" align="center" class="content"  ><%=rs("huiyuan_name")%></td>
    <td align="center" class="content"><%=rs("jiebie1")%></td>
    <td  height="35" align="center" class="content"><%=rs("jiebie2")%></td>
    <td align="center" class="content"><%=rs("qianbao")%></td>
    <td align="center" class="content"><%=rs("addtime")%></td>
    <td  height="35" align="center" class="content"><%=rs("czy")%></td>
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
<%if rs.recordcount>0 then%>
<form id="form1" name="form1" method="post" action="?">
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
    <tr>
      <td height="5"></td>
    </tr>
    <tr>
      <td height="25" align="center"><span class="STYLE4">�� <%=listPages("?search_condition="&request("search_condition")&"&select="&request("select")&"")%>
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
<%end if%>   </td>
    </tr>
  </table>
</body>
</html>
