<!--#include file="../../conn.aspx"-->  
<!--#include file="../jiance.aspx"--> 
<%
id=request("id")

conn.execute("update tbl_tui set flag="&request("a")&" where id='"&trim(id)&"'")' 


response.redirect "tui.aspx"

%>

