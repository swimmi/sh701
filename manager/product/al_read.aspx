
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
 <!--#include file="../jiance.aspx"-->
      <!--#include file="../../time/time.aspx"-->
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">订单处理</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 兑换管理 &gt; 订单处理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />订单处理</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">



 <table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="370" valign="top"><!--#include file="../../conn.aspx"-->
       <%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
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


SQL="select * from tbl_order where flag=0  and addtime between '"&session("date1")&"' and '"&session("date2")&"' "&search_sql&" order by addtime desc"
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
           <td><form id="form2" name="form2" method="post" action="?">
               <table width="99%" height="40" border="0" align="center" cellspacing="0" class="content">
                 <tr valign="top">
                   <td height="30" align="left" valign="middle">查询： 按
                     <select name="type" id="type">
                         <option value="1">登录帐号</option>
                         <option value="2">会员姓名</option>
                       </select>
                       <input name="search" type="text" id="search" size="20" />
                     时间 ：
                     <input name="shijian1" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date1")%>" />
                     -
                     <input name="shijian2" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date2")%>" />
                     <input name="Submit2" type="submit" id="Submit" value="查询" /></td>
                 </tr>
               </table>
           </form></td>
         </tr>
         <tr>
           <td><table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="999999">
               <tr bgcolor="#E3E3E3">
                 <td height="35" align="center">编号</td>
                 <td height="35" align="center">姓名</td>
                 <td height="35" align="center">商品名称</td>
                 <td height="35" align="center">兑换数量</td>
                 <td height="35" align="center">兑换时间</td>
                 <td align="center">发货时间</td>
                 <td align="center">收货人</td>
                 <td align="center">电话</td>
                 <td align="center">邮编</td>
                 <td align="center">地址</td>
                 <td height="35" align="center">订单状态</td>
                 <td height="35" align="center">操作方法</td>
               </tr>
<%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
               <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
                 <td  height="35" align="center" class="content"><%=rs("huiyuan_bianhao")%></td>
                 <td height="35" align="center" class="content"><%=rs("huiyuan_name")%></td>
                 <td  height="35" align="center" class="content"><%=rs("title")%></td>
                 <td height="35" align="center" class="content"><%=rs("num")%></td>
                 <td height="35" align="center" class="content"><%=rs("addtime")%></td>
                 <td align="center" class="content"><%=rs("qrtime")%></td>
                 <td align="center" class="content"><%=rs("xinming")%></td>
                 <td align="center" class="content"><%=rs("dianhua")%></td>
                 <td align="center" class="content"><%=rs("youbian")%></td>
                 <td align="center" class="content"><%=rs("dizhi")%></td>
                 <td align="center" class="content"><%if rs("flag")=0 then%>未发货<%end if%>
													  <%if rs("flag")=1 then%> <a href="fahuo2.aspx?id=<%=rs("id")%>">查看物流</a><%end if%>
													  <%if rs("flag")=2 then%>已收到货<%end if%>			  	 </td>
                 <td height="35" align="center" class="content"><a href="fahuo.aspx?id=<%=rs("id")%>">物流发货</a></td>
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
     <%end if%></td>
   </tr>
 </table></td>
   </tr>
 </table>
</body>
</html>
