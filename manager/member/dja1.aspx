 
 <!--#include file="../../conn.aspx"--> 

<%id=request("id")
if request("flag")=0 then
	conn.execute("update tbl_huiyuan set huiyuan_suoding=1 where huiyuan_id='"&id&"'")
end if

if request("flag")=1 then
	conn.execute("update tbl_huiyuan set huiyuan_suoding=0 where huiyuan_id='"&id&"'")
end if

response.redirect "al_read5.aspx"
%>

