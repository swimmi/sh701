<!--#include file="../../conn.aspx"-->
<%	 

	conn.execute("delete tushu where id='"&request("id")&"'")
	response.Write "<script language=javascript>alert('�����ɹ���');location.href='read.aspx';</script>"
	response.end
   %>
