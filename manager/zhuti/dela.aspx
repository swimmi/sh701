<!--#include file="../../conn.aspx"-->
<%


conn.execute("delete zhuti where id='"&request("id")&"'")



response.Write "<script language=javascript>alert('�����ɹ���');location.href='zhuti.aspx?id="&request("id")&"';</script>"
response.end


%>