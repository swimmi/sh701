<!--#include file="../../conn.aspx"-->
<%


conn.execute("update zhuti set flag='"&request("flag")&"' where id='"&request("id")&"'")




response.Write "<script language=javascript>alert('�����ɹ���');location.href='zhuti.aspx';</script>"
response.end


%>