<!--#include file="../../conn.aspx"-->
<%

	conn.execute("delete video where id='"&request("id")&"'")

	response.Write "<script language=javascript>alert('删除成功！');location.href='product.aspx';</script>"
	response.end
	
%>
