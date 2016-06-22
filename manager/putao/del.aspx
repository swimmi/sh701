<!--#include file="../../conn.aspx"-->
<%
if request("id")<>"" then 
   conn.Execute("delete  from tbl_pt where id="&request("id"))
   
   
   	response.Write "<script language=javascript>alert('成功删除！');location.href='gl.aspx';</script>"
	response.end
else
	response.Write "<script language=javascript>alert('删除不成功！');location.href='gl.aspx';</script>"
	response.end
   
end if


%>
