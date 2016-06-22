<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%
id=request("id")
money_b=request("money_b")
SQL="select * from tbl_tikuan where   tikuan_id='"&id&"'"
set rs_read=server.CreateObject("adodb.recordset")

rs_read.Open SQL,conn,1,1
money=rs_read("money")
money1=0-money
money_b=money_b-money
huiyuan_id=rs_read("huiyuan_id")

conn.execute("update tbl_tikuan set tikuan_status=1 ,tikuan_qr_date=getdate() where tikuan_id='"&id&"'")
 
set rs_a=server.CreateObject("adodb.recordset")
sql="select * from tbl_huiyuan where huiyuan_id='"&huiyuan_id&"'"
rs_a.open sql,conn,1,1
if rs_a.RecordCount>0 then
	money1=rs_a("qianbao")-rs_a("fenhong_canshu1")
end if

response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='tikuan.aspx';</script>"
response.end
%>

