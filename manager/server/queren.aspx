<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"-->
<%
huiyuan_id=request("huiyuan_id")


conn.execute("update tbl_huiyuan set  huiyuan_zhuanmai=1 where huiyuan_id='"&huiyuan_id&"'")

	response.Write "<script language=javascript>alert('�����ɹ���');location.href='al_read.aspx';</script>"
	response.end
%>

