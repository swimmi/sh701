<!--#include file="../../conn.aspx"-->
<%
	conn.execute("delete tbl_producta where id="&request("id")&"")

	response.Redirect "adda.aspx?id="&request("proid")

%>