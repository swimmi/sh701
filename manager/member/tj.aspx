<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
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
    <td height="30" align="center" background="../images/contop_bg.jpg">业绩统计</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
 <!--#include file="../../conn.aspx"--> 
 <%
	set rs=server.CreateObject("adodb.recordset")
	rs.open "select * from tbl_open",conn,1,1
	if rs("open_flag")=1 then
		response.Write rs("tishi")
		response.end 
	end if
	rs.close
	set rs=nothing
	
	SQL="select cha_ci=isnull(max(jiesuan_ci),-1) from tbl_huiyuan where huiyuan_id<>'A00000000'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if rs("cha_ci")=0 then
		cha_ci=-1
	else
		cha_ci=rs("cha_ci")
	end if
	rs.close
	set rs=nothing
	cha_ci=1
	huiyuan_id=request("id")
	
%>
<%
SQL="select * from view_huiyuan where   huiyuan_id<>'A00000000' and huiyuan_shang_id='"&huiyuan_id&"' and net_hege=1 "&search_sql&" order by huiyuan_add_time desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
%>

<table width="100%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="999999">
  <tr bgcolor="#E3E3E3">
    <td height="35" align="center" bgcolor="#CCCCCC" class="title">本期业绩统计：
<%
	SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&huiyuan_id&"' and net_hege=1 and huiyuan_xuhao>0 and jiesuan_ci=0"
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	response.Write rsa("aa")
	rsa.close
	set rsa=nothing
%>
	</td>
    <td height="35" align="center" bgcolor="#CCCCCC" class="title">上期业绩统计：
<%
	SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&huiyuan_id&"' and net_hege=1 and huiyuan_xuhao>0 and jiesuan_ci="&cha_ci&""
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	response.Write rsa("aa")
	rsa.close
	set rsa=nothing
%>	
	</td>
  </tr>
</table>
<br />
<%do while not rs.eof%>
  
<table width="100%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="999999">
  <tr bgcolor="#E3E3E3">
    <td height="35" colspan="12" align="center" bgcolor="#e1e1e1" class="title">登录帐号：<span class="content"><%=rs("huiyuan_bianhao")%>&nbsp;&nbsp;会员姓名：<%=rs("huiyuan_name")%></span></td>
  </tr>
  <tr bgcolor="#E3E3E3">
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">&nbsp;</td>
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">业绩统计</td>
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">正式会员</td>
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">九品代理</td>
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">八品代理</td>
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">七品代理</td>
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">六品代理</td>
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">五品代理</td>
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">四品代理</td>
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">三品代理</td>
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">二品代理</td>
    <td height="35" align="center" bgcolor="#e5e5e5" class="title">一品代理</td>
  </tr>
<%
SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and jiesuan_ci=0"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
total=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=1 and jiesuan_ci=0"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a1=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=2 and jiesuan_ci=0"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a2=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=3 and jiesuan_ci=0"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a3=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=4 and jiesuan_ci=0"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a4=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=5 and jiesuan_ci=0"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a5=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=6 and jiesuan_ci=0"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a6=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=7 and jiesuan_ci=0"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a7=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=8 and jiesuan_ci=0"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a8=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=9 and jiesuan_ci=0"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a9=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=10 and jiesuan_ci=0"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a10=rsa("aa")
rsa.close
set rsa=nothing
%>
  <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
    <td height="35" align="center" bgcolor="#E5E5E5" class="content"><strong>本期业绩</strong></td>
    <td height="35" align="center" class="content"><%=total%></td>
    <td height="35" align="center" class="content"><%=a1%></td>
    <td height="35" align="center" class="content"><%=a2%></td>
    <td height="35" align="center" class="content"><%=a3%></td>
    <td height="35" align="center" class="content"><%=a4%></td>
    <td height="35" align="center" class="content"><%=a5%></td>
    <td height="35" align="center" class="content"><%=a6%></td>
    <td height="35" align="center" class="content"><%=a7%></td>
    <td height="35" align="center" class="content"><%=a8%></td>
    <td height="35" align="center" class="content"><%=a9%></td>
    <td height="35" align="center" class="content"><%=a10%></td>
  </tr>
<%
SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and jiesuan_ci="&cha_ci&""
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
total=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=1 and jiesuan_ci="&cha_ci&""
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a1=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=2 and jiesuan_ci="&cha_ci&""
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a2=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=3 and jiesuan_ci="&cha_ci&""
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a3=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=4 and jiesuan_ci="&cha_ci&""
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a4=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=5 and jiesuan_ci="&cha_ci&""
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a5=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=6 and jiesuan_ci="&cha_ci&""
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a6=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=7 and jiesuan_ci="&cha_ci&""
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a7=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=8 and jiesuan_ci="&cha_ci&""
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a8=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=9 and jiesuan_ci="&cha_ci&""
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a9=rsa("aa")
rsa.close
set rsa=nothing

SQLa="select 'aa'=isnull(sum(xiaofei_money),0) from view_shangshu2 where huiyuan_shang_id='"&rs("huiyuan_id")&"' and net_hege=1 and huiyuan_xuhao>0 and huiyuan_jiebie=10 and jiesuan_ci="&cha_ci&""
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
a10=rsa("aa")
rsa.close
set rsa=nothing
%>
  <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
    <td height="35" align="center" bgcolor="#E5E5E5" class="content"><strong>上期业绩</strong></td>
    <td height="35" align="center" class="content"><%=total%></td>
    <td height="35" align="center" class="content"><%=a1%></td>
    <td height="35" align="center" class="content"><%=a2%></td>
    <td height="35" align="center" class="content"><%=a3%></td>
    <td height="35" align="center" class="content"><%=a4%></td>
    <td height="35" align="center" class="content"><%=a5%></td>
    <td height="35" align="center" class="content"><%=a6%></td>
    <td height="35" align="center" class="content"><%=a7%></td>
    <td height="35" align="center" class="content"><%=a8%></td>
    <td height="35" align="center" class="content"><%=a9%></td>
    <td height="35" align="center" class="content"><%=a10%></td>
  </tr>
</table>
<br />
<%
rs.movenext
loop
%>
</body>
</html>
