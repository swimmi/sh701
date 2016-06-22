<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> 
<%

id=request("id")


SQL="select * from tbl_huikuan  where huikuan_id="&id&""
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
qianbao=rs("money")
huiyuan_id=rs("huiyuan_id")
huiyuan_bianhao=rs("huiyuan_bianhao")
rs.close
set rs=nothing

SQL="select * from tbl_huiyuan  where huiyuan_id='"&huiyuan_id&"'"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
qianbao_b=rs("chongfu_zong")-rs("chongfu_kechu")
huiyuan_mob=rs("huiyuan_bianhao")
rs.close
set rs=nothing



 conn.execute("update tbl_huikuan set huikuan_status=1 ,huikuan_qr_date=getdate() where huikuan_id='"&id&"'")
 conn.execute("update tbl_huiyuan set chongfu_zong=chongfu_zong+"&qianbao&",queren_man='"&session("hy_bianhao")&"' where huiyuan_id='"&huiyuan_id&"'")
  
  
    conn.execute("insert tbl_queren(huiyuan_id,huiyuan_zhuanmai,queren_money,queren_date,memo,queren_type,money_before,queren_man) values('"+huiyuan_id+"','A00000000',"+qianbao+",getdate(),'会员汇款充值电子币账户',1,"&qianbao_b+qianbao&",'"&huiyuan_bianhao&"')")

SQL="select * from tbl_liuyan"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,3
rs.addnew
    rs("liuyan_title") ="会员汇款充值确认"
	rs("liuyan_bianhao") ="A00000000"
 	rs("liuyan_to") =huiyuan_mob
  	rs("liuyan_memo") ="会员汇款充值已确认成功，请注意查询"
	rs("liuyan_date") =now()
    rs.Update
rs.close
set rs=nothing





response.Write "<script language=javascript>alert('操作成功！');location.href='huikuan.aspx';</script>"
response.end
%>

