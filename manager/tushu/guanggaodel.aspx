<!--#include file="../../conn.aspx"-->
<%	 

	conn.execute("delete guanggao where id='"&request("id")&"'")
	response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='guanggao.aspx';</script>"
	response.end
   %>
