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
-->
</style>
</head>

<body>

<!--#include file="../../conn.aspx"-->
<!--#include file="../../time/time.aspx"-->

<%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if

if Request("search")<>"" then
	select case Request("type")
		case 1
			search_sql=" and huiyuan_bianhao='"&Request("search")&"'"
		case 2
			search_sql=" and huiyuan_name like '%"&Request("search")&"%' "
	end select 
end if
if request("kind")="" then
	kind=0
else
	kind=request("kind")
end if
select case kind
		    case 0
		         search_sql=search_sql&" and queren_type<>0 "
		    case 1
		         search_sql=search_sql&" and queren_type=1 "
		    case 2
		         search_sql=search_sql&" and queren_type=2 "
		    case 3
		         search_sql=search_sql&" and queren_type=3 "
		end select 

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



SQL="select * from view_queren where not ( huiyuan_id='A00000000') and 1=1 "&search_sql&"  and queren_date between '"&session("date1")&"' and '"&session("date2")&"' order by queren_date desc"
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

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">账户明细</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 财务信息 &gt; 账户明细</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />账户明细</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	
		  
      <table width="99%" border="0" cellpadding="0" cellspacing="0">
        <tr class="content">
          <td><form id="form1" name="form1" method="post" action="?">
              <table width="0%" height="40" border="0" align="left" cellspacing="0" >
                <tr valign="top">
                  <td height="30" valign="middle">查询： 按
                    <select name="kind" id="kind">
                        <option value="0">所有</option>
                        <option value="1">充值</option>
                        <option value="2">商城购物</option>
                        <option value="3">购物退还</option>
                    </select>
                      <select name="type" id="type">
                        <option value="1">登录帐号</option>
                        <option value="2">会员姓名</option>
                      </select>
                      <input name="search" type="text" id="search" size="20" />
                    时间 ：
                    <input name="shijian1" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date1")%>" />
                    -
                    <input name="shijian2" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date2")%>" />
                    <input name="Submit2" type="submit" id="Submit" value="查询" />
                  </td>
                </tr>
              </table>
          </form></td>
        </tr>
      </table>
      <table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bordercolordark="#FFFFFF" bgcolor="#999999" >
        <tr bgcolor="#e3e3e3" class="titlea1">
          <td height="40" align="center" bordercolorlight="#CCCCCC" >登录帐号</td>
          <td height="40" align="center" >姓名</td>
          <td height="40" align="center" >时间</td>
          <td height="40" align="center" >改变量</td>
          <td height="40" align="center" >改变后余额</td>
          <td height="40" align="center" >改变原因</td>
          <td height="40" align="center" >备注</td>
        </tr>
        <%
		  	dim i
			i=0
			do while not rs.eof and rowcount > 0
%>
        <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''" class="content">
          <td height="30" align="center" bordercolorlight="#CCCCCC" ><%=rs("huiyuan_bianhao")%></td>
          <td height="30" align="center" ><%=rs("huiyuan_name")%></td>
          <td height="30" align="center" ><%=rs("queren_date")%></td>
          <td height="30" align="center" ><%=rs("queren_money")%></td>
          <td height="30" align="center" ><%=rs("money_before")%></td>
          <td height="30" align="center" ><%select case rs("queren_type")
				case 1
				   response.write "充值"
				case 2
				   response.write "商城购物"
				case 3
				   response.write "购物退还"
				end select
		%>          </td>
          <td height="30" align="center" ><%=rs("memo")%></td>
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
      <form id="form2" name="form2" method="post" action="?">
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td height="25" align="center">【 <%=listPages("?kind="&request("kind")&"&type="&request("type")&"&search="&request("search")&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"")%>
                <input name="page" type="text" size="5" />
                <input name="kind" type="hidden" id="kind" value="<%=request("kind")%>" size="5" />
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
</table>


</body>
</html>
