<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%
id=request("id")







conn.execute("update tbl_huiyuan set  huiyuan_zhuanmai=0 where huiyuan_id='"&id&"'")


	response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='al_read1.aspx';</script>"
	response.end
%>

