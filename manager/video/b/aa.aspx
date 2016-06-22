<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<!--#include file="soft.aspx"-->
<div style="font-size:12px;" align="center">
<%
SQL="select * from wendang where id='"&request("id")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

	response.Write rs("title")
	
rs.close
set rs=nothing
%>
</div>