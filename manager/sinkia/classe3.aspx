<!--#include file="../../conn.aspx"-->
<%

	conn.execute("update tbl_sinkia_class set classid='"&request("id")&"' where id="&request("select")&"")	

	response.write "<script>alert('�����ɹ�');location.href='classd.aspx';</Script>"
	Response.End 


%>
