<!--#include file="../../conn.aspx"-->
<!--#include file="../jiance.aspx"--> <%
   conn.Execute("update tbl_pro set flag=1 where id='"&request("del")&"'")
   
		response.Write "<script language=javascript>alert('�����ɹ���');location.href='chanpin.aspx';</script>"
		response.end

%>
