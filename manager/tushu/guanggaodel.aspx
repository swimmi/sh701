<!--#include file="../../conn.aspx"-->
<%	 

	conn.execute("delete guanggao where id='"&request("id")&"'")
	response.Write "<script language=javascript>alert('�����ɹ���');location.href='guanggao.aspx';</script>"
	response.end
   %>
