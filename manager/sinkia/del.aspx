<!--#include file="../../conn.aspx"-->
<%

	conn.execute("delete video where id='"&request("id")&"'")

	response.Write "<script language=javascript>alert('É¾³ý³É¹¦£¡');location.href='product.aspx';</script>"
	response.end
	
%>
