<!--#include file="../../conn.aspx"-->
<%
	conn.execute("update tbl_jp set flag=2 where id="&request("id")&"")

	response.Write "<script language=javascript>alert('�����ɹ���');location.href='order.aspx';</script>"
	response.end

%>