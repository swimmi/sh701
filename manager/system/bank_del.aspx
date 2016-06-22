<!--#include file="../../conn.aspx"-->
<!--#include file="../jiance.aspx"--> <%
id=request("id")
conn.execute("delete from tbl_bank where id='"&id&"'")

  Response.Write "<script language=javascript>alert('公司银行帐号删除成功！');location.href='bank.aspx';</script>"
  Response.End 
%>
