<!--#include file="../../conn.aspx"-->
<%	 

	conn.execute("delete jihuoma where id='"&request("id")&"'")
	response.Write "<script language=javascript>alert('�����ɹ���');location.href='jihuo.aspx';</script>"
	response.end
   %>
