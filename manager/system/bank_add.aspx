<!--#include file="../../conn.aspx"-->
<!--#include file="../jiance.aspx"--> <%


if request.form("accountbank")="" or  request.form("accountname")="" or request.form("accountno")=""  then
  Response.Write "<script language=javascript>alert('�����С����������ʺŲ���Ϊ�գ����������뿪���С����������ʺţ�');history.go(-1);</script>"
  Response.End 
end if
if request.form("accountname")<>"" and request.form("accountno")<>"" and  request.form("accountbank")<>"" then
   set rs=server.CreateObject("adodb.recordset")
	sql = "select * from tbl_bank where id='"&id&"'"
	 rs.open sql,conn,1,3
	 rs.addnew
	 rs("accountbank")=request.form("accountbank")
	 rs("accountname")=request.form("accountname")
	 rs("accountno")=request.form("accountno")
	 rs("accountadd")=request.form("accountadd")
	 rs.update
	 rs.close
	 set rs=nothing
end if

  Response.Write "<script language=javascript>alert('��˾�����ʺ���ӳɹ���');location.href='bank.aspx';</script>"
  Response.End 
%>
