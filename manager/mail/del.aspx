<!--#include file="../../conn.aspx"--> 

<%
id=request("id")

sql_del="delete from tbl_liuyan where  id='"&id&"'"
    conn.execute(sql_del)

response.redirect "shou.aspx"
%>

