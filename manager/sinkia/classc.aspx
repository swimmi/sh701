<!--#include file="../../conn.aspx"-->
<%

	if request("flag1")=0 then
		conn.execute("update tbl_sinkia_class set flag1=1 where id="&request("id")&"")	
	end if
	
	if request("flag1")=1 then
		conn.execute("update tbl_sinkia_class set flag1=0 where id="&request("id")&"")	
	end if

	response.write "<script>alert('²Ù×÷³É¹¦');location.href='class.aspx';</Script>"
	Response.End 


%>
