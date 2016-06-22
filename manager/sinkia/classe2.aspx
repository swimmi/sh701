<!--#include file="../../conn.aspx"-->
<%

	conn.execute("update tbl_sinkia_class set classid=0 where id="&request("id")&"")	

	response.write "<script>alert('²Ù×÷³É¹¦');location.href='classd.aspx';</Script>"
	Response.End 


%>
