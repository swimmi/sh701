<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> 
<%

for i=1 to request.Form("queren").count()
	id= request.Form("queren").item(i)
	sql_del="delete from tbl_liuyan where  id='"&id&"'"
		conn.execute(sql_del)
next

 
response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='shou.aspx';</script>"
response.end
%>

