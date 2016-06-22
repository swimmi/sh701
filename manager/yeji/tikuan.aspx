 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
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
			search_sql=" and zhanghao='"&Request("search")&"'"
		case 3
			search_sql=" and xinming='"&Request("search")&"'"
	end select 
end if

if request("shijian1")<>"" then
	session("date1")=request("shijian1")
else
	session("date1")="2012-1-1"
end if

if request("shijian2")<>"" then
	session("date2")=request("shijian2")
else 
	session("date2")="3010-1-1"
end if



SQL="select * from tbl_tikuan where 1=1 "&search_sql&" and shijian between '"&session("date1")&"' and '"&session("date2")&"' order by tikuan_status asc,shijian desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

SQLa="select 'aa'=sum(money_sj) from tbl_tikuan where   1=1 "&search_sql&" and tikuan_status=0 "
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
if isnull(rsa("aa")) then
	zong=0
else
	zong=rsa("aa")
end if
rsa.close
set rsa=nothing

SQLa="select 'bb'=sum(money_sj) from tbl_tikuan where   1=1  "&search_sql&" and tikuan_status=1 "
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
if isnull(rsa("bb")) then
	zong1=0
else
	zong1=rsa("bb")
end if
rsa.close
set rsa=nothing

msg_per_page=8
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if
%>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">提款管理</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 财务信息 &gt; 提款管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />提款管理</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	

      <table width="99%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><form id="form1" name="form1" method="post" action="?" style="margin:0px;">
              <table width="0%" height="40" border="0" align="left" cellspacing="0" class="content">
                <tr valign="top">
                  <td height="30" valign="middle">查询： 按
                    <select name="type" id="type">
                        <option value="3">会员姓名</option>
                        <option value="1">登录帐号</option>
                      </select>
                      <input name="search" type="text" id="search" size="20" />
                    时间 ：
                    <input name="shijian1" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date1")%>" />
                    -
                    <input name="shijian2" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date2")%>" />
                    <input name="Submit2" type="submit" id="Submit" value="查询" />
                    <a href="tikuan_out.aspx?type=<%=request("type")%>&search=<%=request("search")%>&shijian1=<%=session("date1")%>&amp;shijian2=<%=session("date2")%>">导出列表</a> </td>
                </tr>
              </table>
          </form></td>
        </tr>
      </table>
      <!--#include file="../../inc/headpage.aspx"-->
      <!--#include file="../../inc/safe.aspx"-->
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="500" valign="top"><table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="c1c1c1" ccellpadding="0">
              <tr bgcolor="#e1e1e1" class="titlea1">
                <td height="30" align="center">登录帐号</td>
                <td height="30" align="center">开户银行</td>
                <td height="30" align="center">银行帐号</td>
                <td height="30" align="center">开户姓名</td>
                <td height="30" align="center">提现数额</td>
                <td height="30" align="center">手续费</td>
                <td height="30" align="center">提款时间</td>
                <td height="30" align="center">状态</td>
                <td height="30" align="center">操作方法</td>
              </tr>
              <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
              <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
                <td height="25" align="center" class="content"><%=rs("huiyuan_bianhao")%></td>
                <td height="25" align="center" class="content"><%=rs("yinghang")%></td>
                <td height="25" align="center" class="content"><%=rs("zhanghao")%></td>
                <td height="25" align="center" class="content"><%=rs("xinming")%></td>
                <td height="25" align="center" class="content"><%=rs("money_sj")%></td>
                <td height="25" align="center" class="content">-<%=rs("money_sx")%></td>
                <td height="25" align="center" class="content"><%=rs("shijian")%></td>
                <td height="25" align="center" class="content"><%if rs("tikuan_status")=0 then%>
                  未处理
                  <%end if%>
              <%if rs("tikuan_status")=1 then%>
              <font color="#007F88">已处理</font>
              <%end if%>
              <%if rs("tikuan_status")=2 then%>
              <font color="#007F88">无效</font>
              <%end if%>
              <%if rs("tikuan_status")=3 then%>
              <font color="#007F88">已退提</font>
              <%end if%>                </td>
                <td height="25" align="center" class="content"><%if rs("tikuan_status")<>1 and  rs("tikuan_status")<>3 and  rs("tikuan_status")<>2 then%>
                    <a href="zhifu.aspx?id=<%=rs("tikuan_id")%>&amp;money_b=<%=rs("money")%>&amp;huiyuan_id=<%=rs("huiyuan_id")%>" onClick="javascript:if(!confirm('\n特别提示!\n\n请慎重进行该操作！\n确认后将无法进行撤消。'))  return  false; ">支付</a>
                    <%end if%>
                    <%if rs("tikuan_status")=0 then%>
                    <a href="zhifu_no.aspx?id=<%=rs("tikuan_id")%>&amp;money_b=<%=rs("money")%>&amp;huiyuan_id=<%=rs("huiyuan_id")%>" onClick="javascript:if(!confirm('\n特别提示!\n\n请慎重进行该操作！\n确认后将无法进行撤消。'))  return  false; ">拒绝支付</a>
                    <%end if%>
                    <%if rs("tikuan_status")<>0 then%>
                    <a href="al_del_tk.aspx?id=<%=rs("tikuan_id")%>&amp;money_b=<%=rs("money")%>&amp;huiyuan_id=<%=rs("huiyuan_id")%>" onClick="javascript:if(!confirm('\n特别提示！\n\n请慎重进行该操作！\n删除后将无法进行恢复。'))  return  false; ">删除</a>
                    <%end if%>                </td>
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
              <form id="form11" name="form11" method="post" action="?">
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
                  <tr>
                    <td height="5"></td>
                  </tr>
                  <tr>
                    <td height="25" align="center">【 <%=listPages("?search_condition="&request("search_condition")&"&select="&request("select")&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"")%>
                        <input name="page" type="text" size="5" />
                        <input name="select" type="hidden" id="select" value="<%=request("select")%>" size="5" />
                        <input name="search_condition" type="hidden" id="search_condition" value="<%=request("search_condition")%>" size="5" />
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

</td></tr></table>
</body>
</html>
