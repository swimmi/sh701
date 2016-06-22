<!--#include file="../../conn.aspx"-->
<%
	conn.execute("delete tbl_photo where id="&request("id")&"")

	response.Redirect "add.aspx?id="&request("proid")

%>