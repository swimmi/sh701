
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../jiance.aspx"-->
<!--#include file="../../time/time.aspx"-->
<!--#include file="../../conn.aspx"-->
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">生成激活码</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 系统设置 &gt; 生成激活码</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />生成激活码</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">



 <table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="370" valign="top">

<%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if
if request("shijian1")<>"" then
	session("date1")=request("shijian1")
else if request("cx")<>1 then
		session("date1")="2013-1-1"
	end if
end if

if request("shijian2")<>"" then
	session("date2")=request("shijian2")
else if request("cx")<>1 then
		session("date2")="3010-1-1"
	end if
end if


if Request("search")<>"" then
	select case Request("type")
		case 1
			search_sql=" and xuliehao='"&Request("search")&"'"
		case 2
			search_sql=" and title like '%"&Request("search")&"%'"
		case 3
			search_sql=" and isbn='"&Request("search")&"'"
		case 4
			search_sql=" and banci='"&Request("search")&"'"
		case 5
			search_sql=" and yingci='"&Request("search")&"'"
	end select 
end if



SQL="select * from view_jihuoma where addtime between '"&session("date1")&"' and '"&session("date2")&"' "&search_sql&" order by id desc"
if request("xulie1")<>"" and  request("xulie2")<>"" then
	SQL="select * from view_jihuoma where convert(int,xuliehao)>="&request("xulie1")&" and convert(int,xuliehao)<= "&request("xulie2")&" order by id desc"
end if
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
msg_per_page=10
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if
%>
       <!--#include file="../../inc/headpage.aspx"-->
       <!--#include file="../../inc/safe.aspx"-->
       <table width="100%" border="0" cellpadding="0" cellspacing="0">
         <tr>
           <td>
               <table width="99%" height="60" border="0" align="center" cellspacing="0" class="content">
                 
                 <tr valign="top">
                   <form id="form2" name="form2" method="post" action="?">
				   <td height="30" align="left" valign="middle">查询： 按
                     <select name="type" id="type">
                         <option value="1">图书序列号</option>
                         <option value="2">图书名称</option>
                         <option value="3">图书ISBN</option>
                         <option value="4">图书版次</option>
                         <option value="5">图书印次</option>
                     </select>
                       <input name="search" type="text" id="search" size="20" />
                       <input name="shijian1" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date1")%>" />
-
<input name="shijian2" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date2")%>" />
<input name="Submit2" type="submit" id="Submit" value="查询" />					 </td>
				      </form>
                   <td rowspan="2" align="right" valign="middle"><input name="Submit222" type="submit" id="Submit22" value="导出激活码" onclick="javascript:location.href='jihuo_dao.aspx?type=<%=request("type")%>&search=<%=request("search")%>&shijian1=<%=request("shijian1")%>&shijian2=<%=request("shijian2")%>'" />
                   <input name="Submit22" type="submit" id="Submit2" value="生成激活码" onclick="javascript:location.href='jihuoadd.aspx'" />
                   <input name="Submit2" type="submit" id="Submit" value="批量删除" onclick="javascript:location.href='jihuodel_p.aspx'" /></td>
                 </tr>
				 <tr valign="top">
                   <td height="30" align="left" valign="middle">
                     </td>
                   </tr>
               </table>
           </td>
         </tr>
         <tr>
           <td><table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="999999">
               <tr bgcolor="#E3E3E3">
                 <td height="35" align="center">图书序列号</td>
                 <td height="35" align="center">图书名称</td>
                 <td height="35" align="center">图书ISBN</td>
                 <td align="center">图书版次</td>
                 <td align="center">图书印次</td>
                 <td align="center">激活码</td>
                 <td align="center">生成日期</td>
                 <td align="center">状态</td>
                 <td height="35" align="center">操作方法</td>
               </tr>
<%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
               <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
                 <td align="center" class="content"><%=rs("xuliehao")%></td>
                 <td height="35" align="center" class="content"><%=rs("title")%></td>
                 <td  height="35" align="center" class="content"><%=rs("isbn")%></td>
                 <td align="center" class="content"><%=rs("banci")%></td>
                 <td align="center" class="content"><%=rs("yingci")%></td>
                 <td align="center" class="content"><%=rs("jihuoma")%></td>
                 <td align="center" class="content"><%=rs("addtime")%></td>
                 <td align="center" class="content"><%if rs("flag")=1 then%>已绑定<%else%>未绑定<%end if%></td>
                 <td height="35" align="center" class="content">
				 <a href="jihuodel.aspx?id=<%=rs("id")%>"  onClick="javascript:if(!confirm('\n特别提示!删除后将无法进行恢复。'))  return  false; ">删除</a>&nbsp;</td>
               </tr>
               <%
			  i=i+1
			  icolor=icolor+1
			  if icolor>1 then icolor=0
			  rowcount=rowcount-1
			  rs.movenext
			  loop
%>
           </table></td>
         </tr>
       </table>
       <%if  rs.recordcount>0 then%>
       <form id="form1" name="form1" method="post" action="?">
         <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
           <tr>
             <td height="5"></td>
           </tr>
           <tr>
             <td height="25" align="center">【 <%=listPages("?type="&request("type")&"&search="&request("search")&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"&xulie1="&request("xulie1")&"&xulie2="&request("xulie2")&"")%>
                 <input name="page" type="text" size="5" />
                 <input name="type" type="hidden" id="type" value="<%=request("type")%>" size="5" />
                 <input name="search" type="hidden" id="search" value="<%=request("search")%>" size="5" />
                 <input name="shijian1" type="hidden" id="shijian1" value="<%=request("shijian1")%>" size="5" />
                 <input name="shijian2" type="hidden" id="shijian2" value="<%=request("shijian2")%>" size="5" />
                 <input type="submit" name="Submit" value="转" style=" border:1px solid #999999; "/>
               】 </td>
           </tr>
         </table>
       </form>
     <%end if%></td>
   </tr>
 </table></td>
   </tr>
 </table>
</body>
</html>
