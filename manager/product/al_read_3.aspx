 <!--#include file="../jiance.aspx"-->
      <!--#include file="../../time/time.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">注册单处理</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
 <!--#include file="../../conn.aspx"--> 
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


SQL="select * from view_xiaofei_hy1 where zhuce_flag=1 and xiaofei_date between '"&session("date1")&"' and '"&session("date2")&"' "&search_sql&" order by xiaofei_date "
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
      <table width="98%" height="40" border="0" align="left" cellspacing="0" class="content">
        <tr valign="top">
          <td height="30" valign="middle">查询： 按
            <select name="type" id="type">
                <option value="1">登录帐号</option>
                <option value="2">会员姓名</option>
              </select>
              <input name="search" type="text" id="search" size="20" />
            时间 ：
                    <input name="shijian1" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date1")%>" />
-
<input name="shijian2" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date2")%>" />
<input name="Submit2" type="submit" id="Submit" value="查询" />
          </td>
        </tr>
      </table>
        </form>
    </td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#999999">
      <tr bgcolor="#E3E3E3">
        <td height="35" align="center" bgcolor="#CCCCCC" class="title">编号</td>
        <td height="35" align="center" bgcolor="#CCCCCC" class="title">姓名</td>
        <td align="center" bgcolor="#CCCCCC" class="title">联系人</td>
        <td align="center" bgcolor="#CCCCCC" class="title">电话</td>
        <td align="center" bgcolor="#CCCCCC" class="title">地址</td>
        <td height="35" align="center" bgcolor="#CCCCCC" class="title">商品名称</td>
        <td height="35" align="center" bgcolor="#CCCCCC" class="title">购买数量</td>
        <td height="35" align="center" bgcolor="#CCCCCC" class="title">消费价格</td>
        <td height="35" align="center" bgcolor="#CCCCCC" class="title">订单状态</td>
        <td height="35" align="center" bgcolor="#CCCCCC" class="title">订单时间</td>
        <td height="35" align="center" bgcolor="#CCCCCC" class="title">处理时间</td>
        </tr>
      <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
        <td height="35" align="center" class="content"><%=rs("huiyuan_bianhao")%></td>
        <td height="35" align="center" class="content"><%=rs("huiyuan_name")%></td>
        <td align="center" class="content"><%=rs("name")%></td>
        <td align="center" class="content"><%=rs("phone")%></td>
        <td align="center" class="content"><%=rs("address")%></td>
        <td height="35" align="center" class="content"><%=rs("pro_name")%></td>
        <td height="35" align="center" class="content"><%=rs("xiaofei_pro_count")%></td>
        <td height="35" align="center" class="content"><%=rs("xiaofei_money")%>元</td>
        <td height="35" align="center" class="content"><%if rs("fahuo_flag")=0 then%>
          未发货
            <%end if%>
            <%if rs("fahuo_flag")=1 then%>
            <a href="fahuo2.aspx?id=<%=rs("xiaofei_id")%>">查看物流</a>
            <%end if%>
            <%if rs("fahuo_flag")=2 then%>
            已收到货
            <%end if%>
            <%if rs("fahuo_flag")=3 then%>
            <span style="color: #FF00FF">退货审核中</span>
            <%end if%>
            <%if rs("fahuo_flag")=4 then%>
            <span style="color: #999999">已退货</span>
          <%end if%></td>
        <td height="35" align="center" class="content"><%=formatdatetime(cstr(rs("xiaofei_date")),2)%></td>
        <td height="35" align="center" class="content">
          <%if isnull(rs("xiaofei_qr_date"))=false then
    response.write formatdatetime(cstr(rs("xiaofei_qr_date")),2)
end if%>        </td>
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
<%end if%>
</body>
</html>
