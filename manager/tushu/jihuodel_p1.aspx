<!--#include file="../../conn.aspx"-->
<%	 

	conn.execute("delete jihuoma where id='"&request("id")&"'")
	response.Write "<script language=javascript>alert('�����ɹ���');location.href='jihuodel_p.aspx?action=del&tushu="&request("tushu")&"&banci="&request("banci")&"&yingci="&request("yingci")&"';</script>"
	response.end
   %>
