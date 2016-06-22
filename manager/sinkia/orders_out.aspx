<%response.ContentType ="application/vnd.ms-excel"%>
<%Response.AddHeader "Content-Disposition", "attachment; filename=订单明细表.xls"%>
<!--#include file="../../conn.aspx"--> 
<%
if request("shijian1")<>"" then
	session("date1")=request("shijian1")
else 
	session("date1")="2013-1-1"
end if

if request("shijian2")<>"" then
	session("date2")=request("shijian2")
else 
	session("date2")="3010-1-1"
end if

set rs=server.CreateObject("adodb.recordset")
sql="select * from view_orders where addtime between '"&session("date1")&"' and '"&session("date2")&"'"
if request("orders")&""<>"" then
	sql=sql+" and orders like '%"&request("orders")&"%'"
end if
if request("isok")&""<>"" then
	sql=sql+" and isok="&request("isok")
end if
if request("zhifu")<>"" then
		if request("zhifu")=1 then
			sql=sql+"and zhifu=1"
		end if
		if request("zhifu")=2 then
			sql=sql+"and zhifu=2"
		end if
end if
	
if request("select")<>"" then
		if request("select")=0 then
			sql=sql+"and isok=0"
		end if
		if request("select")=1 then
			sql=sql+"and isok=1"
		end if
end if

	sql=sql+" and isok<>2 and flag=0 and type<>1 and shouhuo<>1 order by addtime desc"	

response.Write sql
	
Rs.Open (sql),Conn,1,1

%>
<HTML>
<HEAD>
<TITLE>会员管理系统</TITLE>

<style type="text/css">
<!--
.STYLE1 {color: #000000}
-->
</style>
</HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<BODY 
leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" bordercolordark="#FFFFFF" >
  <tr> 
    <td height="30" align="center">订单号</td>
    <td align="center">手机号码</td>
    <td align="center">会员姓名</td>
    <td align="center">联系方式　</td>
    <td align="center">商品名称</td>
    <td align="center">商品数量</td>
    <td align="center">收货地址</td>
    <td align="center">邮政编码</td>
    <td align="center">订单时间</td>
    <td align="center">发货订单号</td>
    <td align="center">物流公司</td>
    <td align="center">物流号</td>
    <td align="center">发货时间</td>
  </tr>
<%
do while not rs.eof
  
Set Rs1= Server.CreateObject("ADODB.Recordset")
Rs1.open "select * from tbl_sinkia_action where orders ='"&rs("orders")&"' and isok=1",conn,1,1

do while not Rs1.eof

Set Rs12= Server.CreateObject("ADODB.Recordset")
Rs12.open "select * from tbl_product where pro_id = '"&rs("pro_id")&"'",conn,1,1

 %>
  <tr > 
    <td height="30" align="center" >&nbsp;<%=rs("orders")%></td>
    <td align="center" >
      <%Set Rs12= Server.CreateObject("ADODB.Recordset")
					Rs12.open "select * from tbl_huiyuan where huiyuan_id ='"&rs("username")&"'",conn,1,1
									response.Write rs12("huiyuan_mob")
									rs12.close
									set rs12=nothing
									%>    </td>
    <td align="center" ><%Set Rs12= Server.CreateObject("ADODB.Recordset")
					Rs12.open "select * from tbl_huiyuan where huiyuan_id ='"&rs("username")&"'",conn,1,1
									response.Write rs12("huiyuan_name")
									rs12.close
									set rs12=nothing
									%>
    </td>
    <td align="center" ><%=rs("tel")%>/<%=rs("phone")%></td>
    <td align="center" ><%=Rs1("pro_name")%></td>
    <td align="center" ><%=Rs1("pro_num")%></td>
    <td align="center" ><%
if rs("bid")<>"" then
	SQLa="select * from tbl_address1 where id="&rs("bid")&""
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	if not rsa.eof and not rsa.bof then
		response.write rsa("dizhi")
	end if
	rsa.close
	set rsa=nothing
end if
	
if rs("mid")<>"" then
	SQLa="select * from tbl_address2 where id="&rs("mid")&""
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	if not rsa.eof and not rsa.bof then
		response.write rsa("dizhi")
	end if
	rsa.close
	set rsa=nothing
end if

if rs("sid")<>"" then
	SQLa="select * from tbl_address3 where id="&rs("sid")&""
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	if not rsa.eof and not rsa.bof then
		response.write rsa("dizhi")
	end if
	rsa.close
	set rsa=nothing
end if

if rs("qid")<>"" then
	SQLa="select * from tbl_address4 where id="&rs("qid")&""
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	if not rsa.eof and not rsa.bof then
		response.write rsa("dizhi")
	end if
	rsa.close
	set rsa=nothing
end if
%><%=rs("address")%></td>
    <td align="center" ><%=rs("yb")%></td>
    <td align="center" ><%=rs("addtime")%></td>
    <td align="center" ><%=Rs("forder")%></td>
    <td align="center" ><%=Rs("fcompany")%></td>
    <td align="center" ><%=Rs("fnum")%></td>
    <td align="center" ><%=Rs("ftime")%></td>
  </tr>
 <%
    Rs1.MoveNext
	loop
	
Rs.MoveNext
loop

%>
</table>
</BODY></HTML>
