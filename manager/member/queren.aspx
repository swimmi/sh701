
 
 <!--#include file="../../conn.aspx"-->  
<!--#include file="../jiance.aspx"--> <%
id=request("id")

set rs=server.createobject("adodb.recordset")
rs.open "select * from tbl_huiyuan where huiyuan_id='"&id&"'",conn,1,1
if rs("net_hege")=1 then
		response.Write "<script language=javascript>alert('此会员已确认，请不要重复确认！');location.href='al_read.aspx';</script>"
		response.end
end if
huiyuan_shang_id=rs("huiyuan_shang_id")
huiyuan_jiebie=rs("huiyuan_jiebie")
rs.close
set rs=nothing

set rs=server.createobject("adodb.recordset")
rs.open "select 'aa'=sum(xiaofei_money) from tbl_xiaofei where xiaofei_hui_id='"&id&"' and zhuce_flag=1",conn,1,1
if isnull(rs("aa")) then
	xiaofei_moeny=0
else
	xiaofei_moeny=rs("aa")
end if
rs.close
set rs=nothing

 conn.execute("update tbl_huiyuan set tjrs=tjrs+1 where huiyuan_id='"&huiyuan_shang_id&"'")

 conn.execute("update tbl_huiyuan set net_hege=1,net_flag=0,huiyuan_qr_date=getdate() where huiyuan_id='"&id&"'")
 conn.execute("update tbl_xiaofei set xiaofei_qr_flag=1 ,xiaofei_qr_date=getdate() where xiaofei_hui_id='"&trim(id)&"'")
 conn.execute("update tbl_sinkia_orders set isok=0 where username='"&trim(id)&"'") 
 conn.execute("update tbl_sinkia_action set isok=1 where username='"&trim(id)&"'")
 conn.execute("exec sp_duipeng '"&trim(id)&"'")

response.redirect "al_read1.aspx"

%>

