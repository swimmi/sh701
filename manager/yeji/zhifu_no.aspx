<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%
id=request("id")
money_b=request("money_b")
huiyuan_id=request("huiyuan_id")
 	

conn.execute("update tbl_tikuan set tikuan_status=2 ,tikuan_qr_date=getdate() where tikuan_id='"&id&"'")
conn.execute("update tbl_huiyuan set huiyuan_fa=huiyuan_fa+"&money_b&" where huiyuan_id='"&huiyuan_id&"'")
 
set rs_read=server.CreateObject("adodb.recordset")
sql="select * from tbl_huiyuan where huiyuan_id='"&huiyuan_id&"'"
rs_read.open sql,conn,1,1
if rs_read.RecordCount>0 then
	money_b1=rs_read("huiyuan_fa")
end if
set rs1=nothing



conn.execute("insert tbl_queren (huiyuan_id,huiyuan_zhuanmai,queren_money,queren_date,memo,queren_type,money_before,queren_man) values('"&huiyuan_id&"','A00000000',"&money_b&",getdate(),'提现返还',6,"&money_b1&",'A00000000')")
	
	
	
set rs_read=server.CreateObject("adodb.recordset")
sql="select * from tbl_huiyuan where huiyuan_id='"&session("hy_id1")&"'"
rs_read.open sql,conn,1,1
if rs_read.RecordCount>0 then
	money_b2=rs_read("jiangjin_zong")-rs_read("jiangjin_yong")
end if
set rs1=nothing


response.Write "<script language=javascript>alert('操作成功！');location.href='tikuan.aspx';</script>"
response.end
%>

