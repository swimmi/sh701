<!--#include file="../../conn.aspx"--> 
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from tbl_canshu where [id]=1",conn,1,1
	
if rs("a")=1 then
	response.Write "<script language=javascript>alert('������Aֵ');location.href='canshu.aspx';</script>"
	response.end
end if

if rs("b")=0 then
	response.Write "<script language=javascript>alert('������Bֵ');location.href='canshu.aspx';</script>"
	response.end
end if
rs.close
set rs=nothing
conn.execute("exec sp_zhixing_ri")
response.Redirect ("cha.aspx")
%>
