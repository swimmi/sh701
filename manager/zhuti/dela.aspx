<!--#include file="../../conn.aspx"-->
<%


conn.execute("delete zhuti where id='"&request("id")&"'")



response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='zhuti.aspx?id="&request("id")&"';</script>"
response.end


%>