
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../jiance.aspx"-->
<!--#include file="../../time/time.aspx"-->
<!--#include file="../../conn.aspx"-->
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 系统设置 &gt; 广告管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />广告管理</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px;">



 <table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="370" valign="top">

<%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if


if Request("search")<>"" then
	select case Request("type")
		case 1
			search_sql=" and title like '%"&Request("search")&"%'"
	end select 
end if

if Request("select")<>"" then
	search_sql=" and leibie='"&Request("select")&"'"
end if



SQL="select * from guanggao where 1=1 "&search_sql&" order by id desc"
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
       <table width="100%" border="0" cellpadding="0" cellspacing="0">
         <tr>
           <td>
               <table width="99%" height="40" border="0" align="center" cellspacing="0" class="content">
                 <tr valign="top">
                   <form id="form2" name="form2" method="post" action="?">
				   <td height="30" align="left" valign="middle">查询： 按
                     <select name="type" id="type">
                         <option value="1">广告名称</option>
                     </select>
                       <input name="search" type="text" id="search" size="20" />
                       <select name="select" id="select">
					  	 <option value="" selected="selected">所有位置</option>
                         <option value="1">登录界面</option>
                         <option value="2">注册界面</option>
                         <option value="3">激活码界面</option>
                         <option value="4">播放界面</option>
                       </select>
                       <input name="Submit2" type="submit" id="Submit" value="查询" />
					 </td>
					   
				      </form>
                   <td align="right" valign="middle"><input name="Submit2" type="submit" id="Submit" value="添加广告" onclick="javascript:location.href='guanggaoadd.aspx'" /></td>
                 </tr>
               </table>
           </td>
         </tr>
         <tr>
           <td><table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="999999">
               <tr bgcolor="#E3E3E3">
                 <td height="35" align="center">广告名称</td>
                 <td height="35" align="center">广告位置</td>
                 <td height="35" align="center">图片</td>
                 <td align="center">广告超链接</td>
                 <td height="35" align="center">操作方法</td>
               </tr>
<%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
               <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
                 <td align="center" class="content"><%=rs("title")%></td>
                 <td height="35" align="center" class="content">
					 <%
					 	select case rs("leibie")
							case 1
								response.write "登录界面"
							case 2
								response.write "注册界面"
							case 3
								response.write "激活码界面"
							case 4
								response.write "播放界面"
						end select
					 
					 %>
				 </td>
                 <td  height="35" align="center" class="content"><img src="<%=rs("img")%>" width="300" height="150"/></td>
                 <td align="center" class="content"><%=rs("url")%></td>
                 <td height="35" align="center" class="content">
				 <a href="guanggaoxiugai.aspx?id=<%=rs("id")%>">修改</a>&nbsp;
				 <a href="guanggaodel.aspx?id=<%=rs("id")%>"  onClick="javascript:if(!confirm('\n特别提示!删除后将无法进行恢复。'))  return  false; ">删除</a>&nbsp;</td>
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
             <td height="25" align="center">【 <%=listPages("?type="&request("type")&"&search="&request("search")&"&select="&request("select")&"")%>
                 <input name="page" type="text" size="5" />
                 <input name="type" type="hidden" id="type" value="<%=request("type")%>" size="5" />
                 <input name="search" type="hidden" id="search" value="<%=request("search")%>" size="5" />
                 <input name="select" type="hidden" id="select" value="<%=request("select")%>" size="5" />
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
