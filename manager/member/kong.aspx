<!--#include file="../../conn.aspx"--> 

<%
id=request("id")

SQL="select 'aa'=isnull(sum(xiaofei_money),0) from tbl_xiaofei where xiaofei_hui_id='"&trim(id)&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
total=rs("aa")
rs.close
set rs=nothing

 conn.execute("update tbl_huiyuan set  net_hege=1,net_flag=1,huiyuan_qr_date=getdate(),huitian="&total&",huitian_flag=1 where huiyuan_id='"&id&"'")
 conn.execute("delete tbl_xiaofei where xiaofei_hui_id='"&trim(id)&"'")



response.redirect "al_read2.aspx"
%>

