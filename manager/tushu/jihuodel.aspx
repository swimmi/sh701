<!--#include file="../../conn.aspx"-->
<%	 

	conn.execute("delete jihuoma where id='"&request("id")&"'")
	response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='jihuo.aspx';</script>"
	response.end
   %>
