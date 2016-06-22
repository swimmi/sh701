<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%
id=request("id")
set rs_test=server.CreateObject("adodb.recordset")
sql_test="select * from tbl_huikuan where huikuan_id='"+id+"'"
rs_test.Open sql_test,conn,1,1
if rs_test.RecordCount>0 then
    sql_del="delete from tbl_huikuan where huikuan_id="&id
    conn.execute(sql_del)
	msg="该条汇款记录已被删除!"
else
    msg="该条记录不存在,无法删除！"
end if
rs_test.close


response.Write "<script language=javascript>alert('操作成功！');location.href='huikuan.aspx';</script>"
response.end
%>
