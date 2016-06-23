<!--#include file="../../conn.aspx"-->
<%

	conn.execute("delete weixing where tushuid='"&request("tushu")&"' and banci='"&request("banci")&"' and yingci='"&request("yingci")&"'")
		
	
	response.Write "<script language=javascript>alert('操作成功！');location.href='wei.aspx?id="&request("id")&"&tushu="&request("tushu")&"&banci="&request("banci")&"&yingci="&request("yingci")&"';</script>"
	response.end


%>
