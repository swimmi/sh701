<!--#include file="../../conn.aspx"-->
<%
	conn.execute("delete tbl_productc where id="&request("id")&"")

	response.Redirect "adde.aspx?id="&request("proid")

%>