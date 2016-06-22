<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> 
<%
id=request("huiyuan_id")

conn.execute("update tbl_huiyuan set  zm_jiebie="&request("select2")&" where huiyuan_id='"&id&"'")


	response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='al_read1.aspx';</script>"
	response.end
%>

