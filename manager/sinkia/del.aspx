<!--#include file="../../conn.aspx"-->
<%

	conn.execute("delete video where id='"&request("id")&"'")

	response.Write "<script language=javascript>alert('ɾ���ɹ���');location.href='product.aspx';</script>"
	response.end
	
%>
