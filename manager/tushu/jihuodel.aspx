<!--#include file="../../conn.aspx"-->
<%	 

	conn.execute("delete jihuoma where id='"&request("id")&"'")
	response.Write "<script language=javascript>alert('操作成功！');location.href='jihuo.aspx';</script>"
	response.end
   %>
