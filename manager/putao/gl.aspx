<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="../../conn.aspx"-->

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">管理</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 发烧友之家 &gt; 管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />管理</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px; padding-top:10px;">
	
<%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if


SQL="select * from tbl_pt order by id desc" 
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

msg_per_page=20
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if
%>


<!--#include file="../../inc/headpage.aspx"-->
<!--#include file="../../inc/safe.aspx"--> 



<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="c1c1c1">
  <tr class="titlea1" bgcolor="#e1e1e1">
    <td height="40" align="center">新闻标题</td>
    <td width="200" align="center">分类</td>
    <td width="200" height="40" align="center">发布时间</td>
    <td width="100" height="40" align="center">操作</td>
  </tr>
<%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''" class="content">
    <td height="35" align="center"><%=rs("title")%></td>
    <td align="center"><%
			select case rs("type")
					case 1
						response.write "美食"
					case 2
						response.write "养生"
					case 3
						response.write "旅游"
					case 4
						response.write "风土"
					case 5
						response.write "酿造"
					case 6
						response.write "品鉴"
					case 7
						response.write "种植"
					case 8
						response.write "产地"
					case 9
						response.write "酒展"
					case 10
						response.write "课程"
					case 11
						response.write "新闻"
					case 12
						response.write "活动"
					case 13
						response.write "杂谈"
			end select
		
		%>
    </td>
    <td height="35" align="center"><%=rs("addtime")%></td>
    <td height="35" align="center">
			<a href="del.aspx?id=<%=rs("id")%>"   onclick="javascript:if(!confirm('\n特别提示！？\n\n删除后将无法进行恢复。'))  return  false; ">删除</a> 
			<a href="update.aspx?id=<%=rs("id")%>">修改</a>	</td>
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
      <td height="25" align="center">【 <%=listPages("?search_condition="&request("search_condition")&"&select="&request("select")&"")%>
            <input name="page" type="text" size="5" />
            <input name="select" type="hidden" id="select" value="<%=request("select")%>" size="5" />
            <input name="search_condition" type="hidden" id="search_condition" value="<%=request("search_condition")%>" size="5" />
            <input name="qishu_date1" type="hidden" id="qishu_date1" value="<%=request("qishu_date1")%>" size="5" />
            <input name="qishu_date2" type="hidden" id="qishu_date2" value="<%=request("qishu_date2")%>" size="5" />
            <input type="submit" name="Submit" value="转" style=" border:1px solid #999999; "/>
      】 </td>
    </tr>
  </table>
</form>
<%end if%>

    </td>
  </tr>
</table>
</body>
</html>
