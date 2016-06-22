<!--#include file="../../conn.aspx"-->
<%


conn.execute("update zhuti set flag='"&request("flag")&"' where id='"&request("id")&"'")




response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='zhuti.aspx';</script>"
response.end


%>