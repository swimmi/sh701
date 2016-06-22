<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"-->
<%

'conn.execute("exec sp_backup")


response.redirect "beifen.aspx?err=备份成功!"
%>
