<!--#include file="../../conn.aspx"-->
<%

	conn.execute("update tbl_sinkia_class set title='"&request("title")&"',pm='"&request("pm")&"' where id="&request("id")&"")	

	response.write "<script>alert('²Ù×÷³É¹¦');location.href='classd.aspx';</Script>"
	Response.End 


%>
