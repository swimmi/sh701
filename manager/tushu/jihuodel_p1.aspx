<!--#include file="../../conn.aspx"-->
<%	 

	conn.execute("delete jihuoma where id='"&request("id")&"'")
	response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='jihuodel_p.aspx?action=del&tushu="&request("tushu")&"&banci="&request("banci")&"&yingci="&request("yingci")&"';</script>"
	response.end
   %>
