<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%
id=request("id")
set rs_test=server.CreateObject("adodb.recordset")
sql_test="select * from tbl_huikuan where huikuan_id='"+id+"'"
rs_test.Open sql_test,conn,1,1
if rs_test.RecordCount>0 then
    sql_del="delete from tbl_huikuan where huikuan_id="&id
    conn.execute(sql_del)
	msg="��������¼�ѱ�ɾ��!"
else
    msg="������¼������,�޷�ɾ����"
end if
rs_test.close


response.Write "<script language=javascript>alert('�����ɹ���');location.href='huikuan.aspx';</script>"
response.end
%>
