 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
<style type="text/css">
<!--
.STYLE1 {color: #666666}
.STYLE2 {color: #FF0000}
.STYLE3 {color: #0000FF}
-->
</style>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">�˵�����</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
 <!--#include file="../../conn.aspx"--> 
 <script language="JavaScript" src="../../CSS/calendar.js"></script>

 <%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('�������');history.go(-1);</script>"
	response.end
end if

if Request("search")<>"" then
	select case Request("type")
		case 1
			search_sql=" and huiyuan_bianhao like '%"&Request("search")&"%'"
		case 2
			search_sql=" and huiyuan_name like '%"&Request("search")&"%' "
	end select 
end if


SQL="select * from tbl_tui order by addtime desc"
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
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><form id="form1" name="form1" method="post" action="?" style="margin:0px;">
  <table width="98%" height="40" border="0" align="left" cellspacing="0" class="content">
    <tr valign="top">
      <td height="30" valign="middle">��ѯ�� ��
            <select name="type" id="type">
              <option value="1">��¼�ʺ�</option>
              <option value="2">��Ա����</option>
            </select>
            <input name="search" type="text" id="search" size="20" /></td>
    </tr>
  </table>
</form></td>
  </tr>
</table>


<table width="100%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="999999">
  <tr bgcolor="#E3E3E3">
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >���</td>
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >����</td>
    <td align="center" bgcolor="#CCCCCC" class="title" >����ʱ��</td>
    <td align="center" bgcolor="#CCCCCC" class="title" >״̬</td>
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >����</td>
  </tr>
  <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
    <td  height="35" align="center" class="content"  ><%=rs("huiyuan_bianhao")%></td>
    <td  height="35" align="center" class="content"  ><%=rs("huiyuan_name")%></td>
    <td align="center" class="content"><%if isnull(rs("addtime"))=false then
    response.write formatdatetime(cstr(rs("addtime")),1)
end if%>    </td>
    <td align="center" class="content"><%if rs("flag")=0 then%>
      <span class="STYLE1">δ���</span>
<%end if%><%if rs("flag")=1 then%>
<span class="STYLE2">�����</span>
<%end if%><%if rs("flag")=2 then%>
<span class="STYLE3">δͨ��</span>
<%end if%></td>
    <td height="35" align="center" class="content">
      <%if rs("flag")<>1 then%><a href="tui1.aspx?id=<%=rs("id")%>&a=1">ȷ���˵�</a> &nbsp;<%end if%> <%if rs("flag")<>2 then%><a href="tui1.aspx?id=<%=rs("id")%>&a=2">ȡ���˵�</a><%end if%></td>
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
<form id="form2" name="form2" method="post" action="?">
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
    <tr>
      <td height="5"></td>
    </tr>
    <tr>
      <td height="5" align="center"> �� <%=listPages("?kind="&request("kind")&"&type="&request("type")&"&search="&request("search")&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"")%>
            <input name="page" type="text" size="5" />
            <input name="kink" type="hidden" id="kink" value="<%=request("kink")%>" size="5" />
            <input name="type" type="hidden" id="type" value="<%=request("type")%>" size="5" />
            <input name="search" type="hidden" id="search" value="<%=request("search")%>" size="5" />
            <input name="shijian1" type="hidden" id="shijian1" value="<%=request("shijian1")%>" size="5" />
            <input name="shijian2" type="hidden" id="shijian2" value="<%=request("shijian2")%>" size="5" />
            <input type="submit" name="Submit" value="ת" style=" border:1px solid #999999; "/>
      �� </td>
    </tr>
  </table>
</form>
<%end if%>

</body>
</html>
