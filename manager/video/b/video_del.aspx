<!--#include file="soft.aspx"--> 
<%

	conn.execute("delete wendang where id='"&request("id")&"'")

	response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='index.aspx?id="&request("video")&"';</script>"
	response.end
%>
