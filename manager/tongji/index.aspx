<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>
    <%=request.Cookies("bj")("webname")%>
  </title>
  <link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../jiance.aspx"-->
<!--#include file="../../time/time.aspx"-->
<!--#include file="../../conn.aspx"-->

<body>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td height="80" colspan="2">统计报表</td>
    </tr>
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页&gt; 统计报表</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
    <tr class="biao">
      <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />观看统计</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="370" valign="top">
              <%
if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
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

if Request("search")<>"" then
	select case Request("type")
		case 1
			search_sql=" and huiyuan_tel like '%"&Request("search")&"%'"
		case 2
			search_sql=" and tushu_title like '%"&Request("search")&"%'"
		case 3
			search_sql=" and Video_title like '%"&Request("search")&"%'"
	end select 
end if

if Request("sj")<>"" then
	select case Request("sj")
		case 1
			search_sqla=" and CONVERT(varchar(100), addtime, 108) between '00:00' and '06:00'"
		case 2
			search_sqla=" and CONVERT(varchar(100), addtime, 108) between '06:01' and '11:59'"
		case 3
			search_sqla=" and CONVERT(varchar(100), addtime, 108) between '12:00' and '17:59'"
		case 4
			search_sqla=" and CONVERT(varchar(100), addtime, 108) between '18:00' and '23:59'"
	end select 
end if

SQL="select * from view_jilu where 1=1 and addtime between '"&session("date1")&"' and '"&session("date2")&"' "&search_sql&search_sqla&"  order by id desc"
'response.write(sql)

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
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td>
                      <table width="99%" height="40" border="0" align="center" cellspacing="0" class="content">
                        <tr valign="top">
                          <form id="form2" name="form2" method="post" action="?">
                            <td height="30" align="left" valign="middle">查询： 按
                              <select name="type" id="type">
                                <option value="1">手机号码</option>
                                <option value="2">图书名称</option>
                                <option value="3">视频名称</option>
                            </select>
                              <input name="search" type="text" id="search" size="20" />
                              <input name="shijian1" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date1")%>" />                              -
                              <input name="shijian2" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date2")%>" />
                              <select name="sj" id="sj">
                                <option value="0"  selected="selected">时间不限</option>
                                <option value="1" >00:00-6:00</option>
                                <option value="2">6:01-11:59</option>
                                <option value="3">12:00-17:59</option>
                                <option value="4">18:00-23:59</option>
                              </select>
                              <input name="Submit2" type="submit" id="Submit" value="查询" />
                            </td>

                          </form>
                          <td align="center" valign="middle"><label>
                     <input type="submit" name="Submit3" value="导出" />
                   </label></td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="999999">
                        <tr bgcolor="#E3E3E3">
                          <td height="35" align="center">手机号</td>
                          <td height="35" align="center">图书名称</td>
                          <td height="35" align="center">视频名称</td>
                          <td align="center">观看时间</td>
                        </tr>
                        <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
                          <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'" onmouseout="this.style.backgroundColor=''">
                            <td align="center" class="content">
                              <%=rs("huiyuan_tel")%>
                            </td>
                            <td height="35" align="center" class="content">
                              <%=rs("tushu_title")%>
                            </td>
                            <td height="35" align="center" class="content">
                              <%=rs("Video_title")%>
                            </td>
                            <td align="center" class="content">
                              <%=rs("addtime")%>
                            </td>
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
                    </td>
                  </tr>
                </table>
                <%if  rs.recordcount>0 then%>
                  <form id="form1" name="form1" method="post" action="?">
                    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
                      <tr>
                        <td height="5"></td>
                      </tr>
                      <tr>
                        <td height="25" align="center">【
                          <%=listPages("?type="&request("type")&"&search="&request("search")&"&select="&request("select")&"")%>
                            <input name="page" type="text" size="5" />
                            <input name="type" type="hidden" id="type" value="<%=request(" type ")%>" size="5" />
                            <input name="search" type="hidden" id="search" value="<%=request(" search ")%>" size="5" />
                            <input name="select" type="hidden" id="select" value="<%=request(" select ")%>" size="5" />
                            <input type="submit" name="Submit" value="转" style=" border:1px solid #999999; " /> 】 </td>
                      </tr>
                    </table>
                  </form>
                  <%end if%>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>

</html>