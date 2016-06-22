 
 <!--#include file="../../conn.aspx"--> 

<%id=request("id")
if request("flag")=0 then
	conn.execute("update tbl_huiyuan set fh=1 where huiyuan_id='"&id&"'")
end if

if request("flag")=1 then
	conn.execute("update tbl_huiyuan set fh=0 where huiyuan_id='"&id&"'")
end if

response.redirect "al_read2.aspx"
%>

