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
			search_sql=" and huiyuan_nc='"&Request("search")&"'"
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



SQL="select * from view_jpok where flag=1 and addtime between '"&session("date1")&"' and '"&session("date2")&"' order by addtime desc"
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
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td height="80" colspan="2">退货管理</td>
    </tr>
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 商品管理 &gt; 退货管理</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
    <tr class="biao">
      <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />退货管理</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
        
        <table width="99%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><form id="form1" name="form1" method="post" action="?" style="margin:0px;">
              <table height="40" border="0" align="left" cellspacing="0" class="content">
                <tr valign="top">
                  <td height="30" align="left" valign="middle">
                    时间 ：
                    <input name="shijian1" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date1")%>" />
                    -
                    <input name="shijian2" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date2")%>" />
                    <input name="Submit2" type="submit" id="Submit" value="查询" /></td>
                </tr>
              </table>
            </form></td>
          </tr>
        </table>
        <table width="99%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="c1c1c1">
        <tr bgcolor="#e1e1e1" class="titlea1">
          <td height="40" align="center" >商品</td>
          <td align="center" >手机号</td>
          <td height="40" align="center" >竞拍价格</td>
          <td align="center" >拍卖商</td>
          <td height="40" align="center" >竞拍时间</td>
          <td height="40" align="center" >操作</td>
        </tr>
          <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
          <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
            <td  height="30" align="center" class="content"  ><%=rs("promc")%></td>
            <td align="center" class="content"  ><%=rs("huiyuan_mob")%></td>
            <td height="30" align="center" class="content"><%=rs("money_jp")%></td>
            <td align="center" class="content"><%=rs("pai_qunzhu")%></td>
            <td height="30" align="center" class="content"><%=rs("addtime")%></td>
          <td height="30" align="center" class="content"><a href="ordera1.aspx?id=<%=rs("id")%>">确认发送</a></td>
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
              <td height="5" align="center"> 【 <%=listPages("?kind="&request("kind")&"&type="&request("type")&"&search="&request("search")&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"")%>
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
