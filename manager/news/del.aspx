<!--#include file="../../conn.aspx"-->
<%
if request("id")<>"" then 
   conn.Execute("delete  from news where id="&request("id"))
   
   
   	response.Write "<script language=javascript>alert('�ɹ�ɾ����');location.href='al_read.aspx';</script>"
	response.end
else
	response.Write "<script language=javascript>alert('ɾ�����ɹ���');location.href='al_read.aspx';</script>"
	response.end
   
end if


%>
