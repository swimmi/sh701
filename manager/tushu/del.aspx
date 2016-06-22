<!--#include file="../../conn.aspx"-->
<%	 

	conn.execute("delete tushu where id='"&request("id")&"'")
	response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='read.aspx';</script>"
	response.end
   %>
