<!--#include file="../../conn.aspx"-->
<%
if request("id")<>"" then 
   conn.Execute("delete  from tbl_pt where id="&request("id"))
   
   
   	response.Write "<script language=javascript>alert('�ɹ�ɾ����');location.href='gl.aspx';</script>"
	response.end
else
	response.Write "<script language=javascript>alert('ɾ�����ɹ���');location.href='gl.aspx';</script>"
	response.end
   
end if


%>
