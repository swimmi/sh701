 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>


<!--#include file="../../conn.aspx"-->
<!--#include file="../../time/time.aspx"-->
<%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
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


if request("search_kind")<>0 then
	search_kind=request("search_kind")
else
	search_kind=0
end if


if request("search_condition2")<>"" then
	select case search_kind
		case 0
			search_sql=search_sql&" and huiyuan_name='"&request("search_condition2")&"'"
		case 1
			search_sql=search_sql&" and cha_hui_bianhao='"&request("search_condition2")&"'"
	end select			
end if

SQLa="select 'total'=isnull(sum(cha_013),0) from tbl_cha  where 1=1 "&search_sql&"and cha_date between '"&session("date1")&"' and '"&session("date2")&"'"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
total=rsa("total")
rsa.close
set rsa=nothing

SQL="select cha_hui_id,cha_hui_bianhao,cha_name,cha_001,cha_002,cha_003,cha_004,cha_005,cha_006,cha_007,cha_008,cha_013,cha_date from tbl_cha  where 1=1  "&search_sql&" and cha_date between '"&session("date1")&"' and '"&session("date2")&"' order by cha_date desc"
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
    <td height="80" colspan="2">奖金明细</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 财务信息 &gt; 奖金明细</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />奖金明细</td>
  </tr>
  <tr>
    <td  bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
		  
	  
      <form id="form2" name="form2" method="post" action="?" style="margin:0px;">
        <table width="98%" height="40" border="0" align="center" cellspacing="0" class="content">
          <tr>
            <td height="40" align="left" valign="middle">查询：按
              <select name="search_kind">
                  <option value="1">登录帐号</option>
                  <option value="0">会员名称</option>
              </select>
                <input type="text" name="search_condition2" value="" />
                <input name="shijian1" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date1")%>" />
              -
              <input name="shijian2" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date2")%>" />
              <input type="submit" name="sub_search" value="查询" />
              <a href="jiangjin_out.aspx?search_kind=<%=request("search_kind")%>&search_condition2=<%=request("search_condition2")%>&shijian1=<%=session("date1")%>&shijian2=<%=session("date2")%>"><strong>积分明细导出</strong></a></b></b></td>
            <td align="left" valign="middle">总计：<%=total%></td>
          </tr>
        </table>
      </form>
      <table width="99%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="c1c1c1">
        <tr bgcolor="#e1e1e1" class="titlea1">
          <td height="40" align="center">登录帐号</td>
          <td height="40" align="center">姓名</td>
          <td height="40" align="center">拓展奖</td>
          <td height="40" align="center">管理奖</td>
          <td height="40" align="center">组织奖</td>
          <td height="40" align="center">领导奖</td>
          <td height="40" align="center">贡献奖</td>
          <td height="40" align="center">报单费</td>
          <td height="40" align="center">重复消费</td>
          <td height="40" align="center">扣税</td>
          <td height="40" align="center">总计</td>
          <td height="40" align="center">时间</td>
        </tr>
        <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
			
			
%>
        <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
          <td height="30" align="center" class="content"><%=rs("cha_hui_bianhao")%></td>
          <td height="30" align="center" class="content"><%=rs("cha_name")%></td>
          <td height="30" align="center" class="content"><%=round(rs("cha_001"),2)%></td>
          <td height="30" align="center" class="content"><%=round(rs("cha_002"),2)%></td>
          <td height="30" align="center" class="content"><%=round(rs("cha_003"),2)%></td>
          <td height="30" align="center" class="content"><%=round(rs("cha_004"),2)%></td>
          <td height="30" align="center" class="content"><%=round(rs("cha_005"),2)%></td>
          <td height="30" align="center" class="content"><%=round(rs("cha_006"),2)%></td>
          <td height="30" align="center" class="content"><%=round(rs("cha_008"),2)%></td>
          <td height="30" align="center" class="content"><%=round(rs("cha_007"),2)%></td>
          <td height="30" align="center" class="content"><%=round(rs("cha_013"),2)%></td>
          <td height="30" align="center" class="content"><%=rs("cha_date")%></td>
        </tr>
        <%
  
  cha_001=cha_001+rs("cha_001")
  cha_002=cha_002+rs("cha_002")
  cha_003=cha_003+rs("cha_003")
  cha_004=cha_004+rs("cha_004")
  cha_005=cha_005+rs("cha_005")
  cha_006=cha_006+rs("cha_006")
  cha_007=cha_007+rs("cha_007")
  cha_008=cha_008+rs("cha_008")
  cha_013=cha_013+rs("cha_013")
			  i=i+1
			  icolor=icolor+1
			  if icolor>1 then icolor=0
			  rowcount=rowcount-1
			  rs.movenext
			  loop
%>
        <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
          <td height="30" colspan="2" align="center" bgcolor="#e1e1e1" class="content"><strong>合计</strong></td>
          <td height="30" align="center" bgcolor="#e1e1e1" class="content"><strong><%=round(cha_001,2)%></strong></td>
          <td align="center" bgcolor="#e1e1e1" class="content"><strong><%=round(cha_002,2)%></strong></td>
          <td align="center" bgcolor="#e1e1e1" class="content"><strong><%=round(cha_003,2)%></strong></td>
          <td align="center" bgcolor="#e1e1e1" class="content"><strong><%=round(cha_004,2)%></strong></td>
          <td align="center" bgcolor="#e1e1e1" class="content"><strong><%=round(cha_005,2)%></strong></td>
          <td align="center" bgcolor="#e1e1e1" class="content"><strong><%=round(cha_006,2)%></strong></td>
          <td align="center" bgcolor="#e1e1e1" class="content"><strong><%=round(cha_008,2)%></strong></td>
          <td align="center" bgcolor="#e1e1e1" class="content"><strong><%=round(cha_007,2)%></strong></td>
          <td align="center" bgcolor="#e1e1e1" class="content"><strong><%=round(cha_013,2)%></strong></td>
          <td height="30" align="center" bgcolor="#e1e1e1" class="content">&nbsp;</td>
        </tr>
      </table>
      <%if rs.recordcount>0 then%>
      <form id="form1" name="form1" method="post" action="?">
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
          <tr>
            <td height="5"></td>
          </tr>
          <tr>
            <td height="25" align="center">【 <%=listPages("?search_condition2="&request("search_condition2")&"&search_kind="&search_kind&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"")%>
                <input name="page" type="text" size="5" />
                <input name="search_kind2" type="hidden" id="search_kind" value="<%=search_kind%>" size="5" />
                <input name="search_condition2" type="hidden" id="search_condition2" value="<%=request("search_condition2")%>" size="5"/>
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

</td></tr></table>
</body>
</html>
