<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%
id=request("id")

rs_sql="update  tbl_huiyuan set huiyuan_zhuanmai_sq=0,zhuanmai_jb=0 where  huiyuan_id='"&id&"'"
conn.execute(rs_sql)


response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='al_read.aspx';</script>"
response.end
%>

