<!--#include file="../../conn.aspx"-->
<%

	conn.execute("delete weixing where tushuid='"&request("tushu")&"' and banci='"&request("banci")&"' and yingci='"&request("yingci")&"'")
		
	
	response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='wei.aspx?id="&request("id")&"&tushu="&request("tushu")&"&banci="&request("banci")&"&yingci="&request("yingci")&"';</script>"
	response.end


%>
