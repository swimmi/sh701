<!--#include file="../../conn.aspx"--> 
<%response.ContentType ="application/vnd.ms-excel"%>
<%Response.AddHeader "Content-Disposition", "attachment; filename=导出二维码列表.xls"%>
<%
	SQL="select * from weixing where tushuid='"&request("tushu")&"' and banci='"&request("banci")&"'and yingci='"&request("yingci")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
%>		

<table width="100%" border="0" align="center">
               <tr>
                 <td height="30" align="center">视频编号</td>
                 <td height="30" align="center">视频名称</td>
                 <td height="30" align="center">图书名称</td>
                 <td height="30" align="center">图书序列号</td>
                 <td align="center">激活码</td>
                 <td align="center">二维码视频链接</td>
               </tr>
<%do while not rs.eof%>
               <tr>
                 <td align="center" class="content"><%=rs("videobianhao")%></td>
                 <td align="center" class="content"><%=rs("videotitle")%></td>
                 <td align="center" class="content"><%=rs("tushutitle")%></td>
                 <td align="center" class="content"><%=rs("xuliehao")%></td>
                 <td align="center" class="content"><%=rs("jihuoma")%></td>
                 <td align="center" class="content">http://192.168.1.88:8701/video.aspx?videobianhao=<%=rs("videobianhao")%>&amp;jihuoma=<%=rs("jihuoma")%></td>
               </tr>
<%
	rs.movenext
	loop
	rs.close
	set rs=nothing
%>
           </table>
