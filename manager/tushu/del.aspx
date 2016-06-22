<!--#include file="../../conn.aspx"-->
<%
	conn.execute("delete tushu where id='"&request("id")&"'")
	response.Write "<script language=javascript>alert('操作成功！');location.href='read.aspx';</script>"
	response.end
%>