 <!--#include file="../../conn/conn.aspx"-->
 <!--#include file="../../function/fun_db.inc"--> 
<%
if Request("currentpage")<>"" then
   currentpage=request("currentpage")
else
   currentpage=1
end if
SQL="select * from tbl_login where login_flag=1 order by login_date desc"
'response.write sql
'response.end 
set rs_read=server.CreateObject("adodb.recordset")

rs_read.Open SQL,conn,1,1
pagesize=15
recordcount=rs_read.RecordCount

if recordcount mod pagesize=0 then
   pageno=recordcount/pagesize
else
   pageno=int(recordcount/pagesize)+1
end if

start_row=(currentpage-1)*15
end_row=start_row+14
'Response.Write start_row
if end_row>rs_read.recordcount then
end_row=rs_read.recordcount
end if

if pageno=0 then
  msg_no="暂无信息！"
end if
%>
<HTML>
<HEAD>
<TITLE>会员管理系统</TITLE>
<STYLE></STYLE>
<SCRIPT 
language=JavaScript>
function winOpen(url){
	location.href=url
}
</SCRIPT>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<!--One step to installing this script--> <!--1) Copy everything below, and paste in HEAD section of page--> 
<style>

<!--

//-->

</style>
<link rel="stylesheet" href="../../CSS/ZT0.CSS" type="text/css">
<style type="text/css">
<!--
.STYLE11 {color: #0790FF}
-->
</style>
</HEAD>
<BODY 
leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="13" height="36" background="../huiyuan/image/l1.jpg">&nbsp;</td>
        <td height="36" background="../../huiyuan/image/hb.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><div align="center" class="STYLE11"><span class="STYLE10 STYLE11">管理员登录日志</span></div></td>
            </tr>
        </table></td>
        <td width="13" align="left" valign="top" background="../huiyuan/image/rl.jpg">&nbsp;</td>
      </tr>
      <tr>
        <td height="169" valign="bottom" background="../huiyuan/image/tttt.gif">&nbsp;</td>
        <td><center>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
              <tr>
                <td valign="top"><br />
                    <table border="0" cellpadding="1" cellspacing="1" bgcolor="#d3d3d3" width="95%" align="center">
                      <tr bgcolor="#e3e3e3">
                        <td width="5%" height="30" bgcolor="#DCF0F7"><div align="center" class="STYLE1 STYLE11">序号</div></td>
                        <td width="9%" height="30" bgcolor="#DCF0F7"><div align="center" class="STYLE1 STYLE11">姓名</div></td>
                        <td width="9%" height="30" bgcolor="#DCF0F7"><div align="center" class="STYLE1 STYLE11">登录帐号</div></td>
                        <td width="11%" height="30" bgcolor="#DCF0F7"><div align="center" class="STYLE1 STYLE11">登录IP地址</div></td>
                        <td width="10%" height="30" bgcolor="#DCF0F7"><div align="center" class="STYLE1 STYLE11">登录时间</div></td>
                      </tr>
                      <% if  not rs_read.BOF and not  rs_read.eof then 'Response.Write end_row
                           rs_read.move start_row  
                          for i=start_row to end_row
                         
                          %>
                      <% if  not rs_read.BOF and not  rs_read.eof then 
                       
                         %>
                      <tr bgcolor="<%if i mod 2=0 then%>FFFFFF<%else%>F7F7F7<%end if%>">
                        <td width="5%"  height="25" bgcolor="#F3FBFE"><%=i+1%></div></td>
                        <td  height="25" bgcolor="#F3FBFE"><%=rs_read("huiyuan_name")%></div></td>
                        <td  height="25" bgcolor="#F3FBFE"><%=rs_read("huiyuan_bianhao")%></div></td>
                        <td height="25" bgcolor="#F3FBFE"><%=rs_read("huiyuan_ip")%></div></td>
                        <td height="25" bordercolor="#000000" bordercolordark="#FFFFFF" bgcolor="#F3FBFE"><%=rs_read("login_date")%></div></td>
                      </tr>
                      <%rs_read.movenext %>
                      <%else exit for%>
                      <%end if%>
                      <%next%>
                      <%end if%>
                    </table>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="30" align="center"><%  
      if currentpage=1 and pageno=1 or pageno=0 then%>
                            <font color="#999999">首页 &nbsp;&nbsp; 上一页&nbsp;&nbsp;下一页&nbsp;&nbsp; 
                              尾页</font>
                            <%else if pageno=cint(currentpage) then%>
                            <a href="login_info1.aspx?currentpage=<%=1%>&amp;search_condition=<%=search_condition%>&amp;search_date1=<%=search_date1%>&amp;search_date2=<%=search_date2%>">首页</a>&nbsp;&nbsp; <a href="login_info1.aspx?currentpage=<%=currentpage-1%>&amp;search_condition=<%=search_condition%>&amp;search_date1=<%=search_date1%>&amp;search_date2=<%=search_date2%>">上一页</a>&nbsp;&nbsp; <font color="#999999"> 下一页 &nbsp;&nbsp;尾页</font>
                            <%else if pageno<>1 and currentpage=1 then%>
                            <font color="#999999">首页 &nbsp;&nbsp; 上一页 </font><a href="login_info1.aspx?currentpage=<%=currentpage+1%>&amp;search_condition=<%=search_condition%>&amp;search_date1=<%=search_date1%>&amp;search_date2=<%=search_date2%>">下一页</a>&nbsp;&nbsp; <a href="login_info1.aspx?currentpage=<%=pageno%>&amp;search_condition=<%=search_condition%>&amp;search_date1=<%=search_date1%>&amp;search_date2=<%=search_date2%>">尾页</a>
                            <%else%>
                            <a href="login_info1.aspx?currentpage=<%=1%>&amp;search_condition=<%=search_condition%>&amp;search_date1=<%=search_date1%>&amp;search_date2=<%=search_date2%>">首页</a>&nbsp;&nbsp; <a href="login_info1.aspx?currentpage=<%=currentpage-1%>&amp;search_condition=<%=search_condition%>&amp;search_date1=<%=search_date1%>&amp;search_date2=<%=search_date2%>">上一页</a>&nbsp;&nbsp; <a href="login_info1.aspx?currentpage=<%=currentpage+1%>&amp;search_condition=<%=search_condition%>&amp;search_date1=<%=search_date1%>&amp;search_date2=<%=search_date2%>">下一页</a>&nbsp;&nbsp; <a href="login_info1.aspx?currentpage=<%=pageno%>&amp;search_condition=<%=search_condition%>&amp;search_date1=<%=search_date1%>&amp;search_date2=<%=search_date2%>">尾页</a>
                            <%end if%>
                            <%end if%>
                            <%end if%>
                            <font color="#000000">共</font><font color="#007F88"><%=rs_read.RecordCount%><font color="#000000">条记录</font> <font color="#000000">共</font></font><font color="#007F88"><%=pageno%><font color="#000000">页</font> <font color="#000000">当前为第</font><%=currentpage%><font color="#000000">页</font></font></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                  </table></td>
              </tr>
            </table>
          <p align="center"><a href="kuaican/al_add.aspx" ></a></p>
        </center></td>
        <td background="../huiyuan/image/llll.jpg">&nbsp;</td>
      </tr>
      <tr>
        <td height="17" align="left" background="image/tttt.gif"><div align="left"><img src="../huiyuan/image/llh.jpg" width="13" height="16" /></div></td>
        <td height="17" valign="middle" background="../huiyuan/image/dfgh.jpg">&nbsp;</td>
        <td background="image/llll.jpg"><img src="../huiyuan/image/dddd.jpg" width="13" height="16" /></td>
      </tr>
    </table></td>
  </tr>
</table>

</BODY></HTML>
