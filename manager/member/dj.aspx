 
 <!--#include file="../../conn.aspx"--> 

<%id=request("id")
if request("flag")=0 then
	conn.execute("update huiyuan set flag=1 where id='"&id&"'")
end if

if request("flag")=1 then
	conn.execute("update huiyuan set flag=0 where id='"&id&"'")
end if

response.redirect "al_read2.aspx"
%>

