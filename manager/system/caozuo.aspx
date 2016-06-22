 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="300" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
      <tr>
        <td height="30" align="center" background="../images/contop_bg.jpg">系统操作日志</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
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

SQL="select * from tbl_jl where 1=1 "&search_sql&" and addtime between '"&session("date1")&"' and '"&session("date2")&"' order by addtime desc"
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
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><form id="form2" name="form2" method="post" action="">
            <table height="40" border="0" align="left" cellspacing="0" class="content">
              <tr valign="top">
                <td height="30" align="left" valign="middle">查询： 按
                  <select name="type" id="type">
                      <option value="1">编号</option>
                      <option value="2">姓名</option>
                    </select>
                    <input name="search" type="text" id="search" size="20" />
                  时间 ：
                  <input name="shijian1" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date1")%>" />
                  -
                  <input name="shijian2" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date2")%>" />
                  <input name="Submit2" type="submit" id="Submit" value="查询" /></td>
              </tr>
            </table>
                    </form>
          </td>
        </tr>
      </table>
      <table width="100%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="999999">
        <tr bgcolor="#e3e3e3">
          <td height="30" align="center" bgcolor="#CCCCCC" class="title">编号</td>
          <td height="30" align="center" bgcolor="#CCCCCC" class="title">姓名</td>
          <td height="30" align="center" bgcolor="#CCCCCC" class="title">操作描述</td>
          <td height="30" align="center" bgcolor="#CCCCCC" class="title">操作时间</td>
        </tr>
        <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
        <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
          <td height="25" align="center" class="content"><%=rs("huiyuan_bianhao")%></td>
          <td height="25" align="center" class="content"><%=rs("huiyuan_name")%></td>
          <td height="25" align="center" class="content"><%=rs("memo")%></td>
          <td height="25" align="center" class="content"><%=rs("addtime")%></td>
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
      <form id="form1" name="form1" method="post" action="?">
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td height="25" align="center"><span class="STYLE4">【 <%=listPages("?kind="&request("kind")&"&type="&request("type")&"&search="&request("search")&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"")%>
                <input name="page" type="text" size="5" />
                <input name="kink" type="hidden" id="kink" value="<%=request("kink")%>" size="5" />
                <input name="type2" type="hidden" id="type" value="<%=request("type")%>" size="5" />
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
