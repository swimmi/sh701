<!--#include file="../../conn.aspx"-->
<!--#include file="../jiance.aspx"--> <%


if request.form("accountbank")="" or  request.form("accountname")="" or request.form("accountno")=""  then
  Response.Write "<script language=javascript>alert('开户行、开户名、帐号不能为空，请重新输入开户行、开户名和帐号！');history.go(-1);</script>"
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

  Response.Write "<script language=javascript>alert('公司银行帐号添加成功！');location.href='bank.aspx';</script>"
  Response.End 
%>
