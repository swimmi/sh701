<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%
huiyuan_id=Request.form("huiyuan_id")
money=Request.form("money")

if request.form("money")=""  then
	response.Write "<script language=javascript>alert('Ҫ�޸ĵĽ���Ϊ�գ�����ȷ������');history.go(-1);</script>"
	response.end
end if
if not isnumeric(request.form("money"))  then
	response.Write "<script language=javascript>alert('Ҫ�޸ĵĽ����������ֱ�ʾ������ȷ������');history.go(-1);</script>"
	response.end
end if

if isnumeric(money)=false then
  money=0
end if

conn.execute("update tbl_huiyuan set qianbao=qianbao+"&money&" where huiyuan_id='"&huiyuan_id&"'")
  

SQL="select * from tbl_huiyuan where   huiyuan_id='"&huiyuan_id&"'"
set rs_read=server.CreateObject("adodb.recordset")
rs_read.Open SQL,conn,1,1
	money_b=round(rs_read("qianbao")-rs_read("fenhong_canshu1"),2)
rs_read.close
set rs_read=nothing

conn.execute("insert tbl_queren(huiyuan_id,huiyuan_zhuanmai,queren_money,queren_date,memo,queren_type,money_before,queren_man) values('"+huiyuan_id+"','A00000000',"+money+",getdate(),'����Ա��ֵ���ӱ��˻�',1,"&money_b&",'"&session("hy_bianhao")&"')")


response.Write "<script language=javascript>alert('�����ɹ���');location.href='qianbao.aspx';</script>"
response.end
%>
