 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">公排网络图</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
 <!--#include file="../../conn.aspx"--> 
 <script language="JavaScript" src="../../CSS/calendar.js"></script>

 <%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if


SQL="select * from tbl_huiyuanb where pm>0 order by pm"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1



msg_per_page=8
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if
%>


<!--#include file="../../inc/headpage.aspx"-->
<!--#include file="../../inc/safe.aspx"-->
<table width="100%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="999999">
  <tr bgcolor="#E3E3E3">
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >编号</td>
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >姓名</td>
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >开通时间</td>
    <td height="35" align="center" bgcolor="#CCCCCC" class="title" >排序</td>
  </tr>
  <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
    <td  height="35" align="center" class="content"  ><%=rs("huiyuan_bianhao")%></td>
    <td  height="35" align="center" class="content"  ><%=rs("huiyuan_name")%></td>
    <td height="35" align="center" class="content"><%=formatdatetime(cstr(rs("addtime")),1)%></td>
    <td height="35" align="center" class="content"><%=rs("pm")%></td>
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
      <td height="5" align="center"> 【 <%=listPages("?kind="&request("kind")&"&type="&request("type")&"&search="&request("search")&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"")%>
            <input name="page" type="text" size="5" />
            <input name="kink" type="hidden" id="kink" value="<%=request("kink")%>" size="5" />
            <input name="type" type="hidden" id="type" value="<%=request("type")%>" size="5" />
            <input name="search" type="hidden" id="search" value="<%=request("search")%>" size="5" />
            <input name="shijian1" type="hidden" id="shijian1" value="<%=request("shijian1")%>" size="5" />
            <input name="shijian2" type="hidden" id="shijian2" value="<%=request("shijian2")%>" size="5" />
            <input type="submit" name="Submit" value="转" style=" border:1px solid #999999; "/>
      】 </td>
    </tr>
  </table>
</form>
<%end if%>

</body>
</html>
