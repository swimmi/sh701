 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
-->
</style>
</head>
<body>


 <!--#include file="../../conn.aspx"--> 
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


SQL="select * from view_huiyuan  where huiyuan_bianhao<>'A00000000' "&search_sql&" order by huiyuan_add_time"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

SQLa="select 'dianzhi'=isnull(sum(qianbao-fenhong_canshu1),0) from tbl_huiyuan  where huiyuan_bianhao<>'A00000000' "&search_sql&" "
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
dianzhi=rsa("dianzhi")
rsa.close
set rsa=nothing

SQLa="select 'fenhong'=isnull(sum(qianbao-fenhong_canshu1),0) from tbl_huiyuan  where huiyuan_bianhao<>'A00000000' "&search_sql&" "
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
fenhong=rsa("fenhong")
rsa.close
set rsa=nothing


msg_per_page=20
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if
%>


<!--#include file="../../inc/headpage.aspx"-->
<!--#include file="../../inc/safe.aspx"-->


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">账户管理</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 财务信息 &gt; 账户管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />账户管理</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	
		<table width="99%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td><form id="form1" name="form1" method="post" action="?" style="margin:0px;">
		  <table width="98%" height="40" border="0" align="left" cellspacing="0" class="content">
			<tr valign="top">
			  <td height="30" valign="middle">查询： 按
					<select name="type" id="type">
					  <option value="1">登录帐号</option>
					  <option value="2">会员姓名</option>
					</select>
					<input name="search" type="text" id="search" size="20" />
					<input name="Submit2" type="submit" id="Submit" value="查询" />      </td>
			  <td align="right" valign="middle">账户总计：<%=dianzhi%>&nbsp;</td>
			</tr>
		  </table>
		</form></td>
		  </tr>
		</table>
		
		
		<table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bordercolordark="#FFFFFF" bgcolor="#c1c1c1" >
		  <tr bgcolor="#e1e1e1" class="titlea1">
			<td height="40" align="center" >手机号</td>
			<td height="40" align="center" >姓名</td>
			<td align="center" >类型</td>
			<td align="center" >账户余额</td>
			<td align="center" >账户修改</td>
	      </tr>
		  <%
					dim i
					i=1
					do while not rs.eof and rowcount > 0
		%>
		  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
			<td height="30" align="center" class="content"><%=rs("huiyuan_mob")%></td>
			<td height="30" align="center" class="content"><%=rs("huiyuan_name")%></td>
			<td align="center" class="content"><%if rs("huiyuan_jiebie")=1 then%>
			  <span class="hong">会员</span>
			  <%end if%><%if rs("huiyuan_jiebie")=2 then%>
			  <span class="STYLE1">拍卖商</span>
			  <%end if%></td>
			<td align="center" class="content"><%=round(rs("qianbao")-rs("fenhong_canshu1"),2)%></td>
			<td align="center" class="content" ><form method="post" action="qianbao_xg1.aspx?currentpage=<%=currentpage%>" style="margin:0px;">
                <input name="money" type="text" size="10" />
                <input name="huiyuan_id" type="hidden" value="<%=rs("huiyuan_id")%>" />
                <input type="submit" name="Submit3" value="修改" />
            </form></td>
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
			  <td height="25" align="center">【 <%=listPages("?kind="&request("kind")&"&type="&request("type")&"&search="&request("search")&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"")%>
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
	</td>
	</tr>
</table>

</body>
</html>
