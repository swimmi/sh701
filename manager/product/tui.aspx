<!--#include file="../../conn.aspx"-->
<!--#include file="../jiance.aspx"-->
<%
id=request("id")

SQL="select * from tbl_xiaofei  where xiaofei_id='"&id&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
if rs.recordcount=0 then
  Response.Write "<script language=javascript>alert('没有该订单记录，不能进行操作！');history.go(-1);</script>"
  Response.End 
end if
rs.close
set rs=nothing

SQL="select * from tbl_xiaofei  where xiaofei_id='"&id&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,3
rs("fahuo_flag")=4
rs("xiaofei_qr_date")=now()
rs("xiaofei_qr_flag")=1
xiaofei_hui_id=rs("xiaofei_hui_id")
xiaofei_money=rs("xiaofei_money")
rs.update
rs.close
set rs=nothing


SQL="select * from tbl_huiyuan  where huiyuan_id='"&xiaofei_hui_id&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,3
rs("fenhong_canshu1")=rs("fenhong_canshu1")-xiaofei_money
rs.update
qianbao=rs("qianbao")-rs("fenhong_canshu1")
rs.close
set rs=nothing

conn.execute ("insert tbl_queren(huiyuan_id,huiyuan_zhuanmai,queren_money,queren_date,memo,queren_type,money_before,queren_man) values('"&xiaofei_hui_id&"','A00000000',"&xiaofei_money&",getdate(),'订单退货',4,"&qianbao&",'A00000000')")


response.Write "<script language=javascript>alert('操作成功！');location.href='al_read.aspx';</script>"
response.end

%>
