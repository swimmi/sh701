

<!-- #include file="../../conn.aspx" -->
<!--#include file="../jiance.aspx"--> <% id=request.form("GroupID")

if request.form("huiyuan_id")="A00000000" then
  Response.Write "<script language=javascript>alert('�ù���Ա����ɾ����');history.go(-1);</script>"
  Response.End 
else

conn.execute("delete from tbl_admin where id='"&id&"'")
end if
response.Redirect("manage.aspx")%>

