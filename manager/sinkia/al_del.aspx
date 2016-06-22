
 <!--#include file="../../conn/conn.aspx"--> 
<!--#include file="../../function/fun_db.inc"--> 

<%id=request("id")


 sql_del="delete from tbl_liuyan where id='"+id+"'"
 conn.execute(sql_del)
 %>
 
 <%
 
 Response.Redirect "pingjia.aspx"

%>
