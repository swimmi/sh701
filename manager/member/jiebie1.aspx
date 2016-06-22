<!--#include file="../../conn.aspx"--> 
<%
 
if trim(request("id"))="" then
	response.Write "<script language=javascript>alert('非法操作，请重新登录！');history.go(-1);</script>"
	response.end
end if
 
SQL="select * from tbl_huiyuan where huiyuan_id='"&request("id")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,3

if rs.eof and rs.bof then
	response.Write "<script language=javascript>alert('没有此会员，请重新操作！');history.go(-1);</script>"
	response.end
end if

if request("select")-rs("huiyuan_jiebie")<=0 then
	response.Write "<script language=javascript>alert('新级别不可低于原级别！');history.go(-1);</script>"
	response.end
end if

jeibie1=rs("huiyuan_jiebie")
jeibie2=request("select")
rs("huiyuan_jiebie")=request("select")
rs.update
huiyuan_id=rs("huiyuan_id")
huiyuan_bianhao=rs("huiyuan_bianhao")
huiyuan_name=rs("huiyuan_name")
rs.close
set rs=nothing

SQLa="select * from tbl_jiebie where id='"&jeibie1&"'"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
jiebie_name1=rsa("jiebie")
money1=rsa("qianbao")
rsa.close
set rsa=nothing

SQLa="select * from tbl_jiebie where id='"&jeibie2&"'"
set rsa=server.CreateObject("adodb.recordset")
rsa.Open SQLa,conn,1,1
jiebie_name2=rsa("jiebie")
money2=rsa("qianbao")
rsa.close
set rsa=nothing

money3=money2-money1

if request("radiobutton")=1 then
	SQL="select * from tbl_ji"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,3
	rs.addnew
	rs("huiyuan_id")=huiyuan_id
	rs("addtime")=now()
	rs("qianbao")=money3
	rs.update
	rs.close
	set rs=nothing
end if

SQL="select * from tbl_sj"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,3
rs.addnew
rs("huiyuan_id")=huiyuan_id
rs("huiyuan_bianhao")=huiyuan_bianhao
rs("huiyuan_name")=huiyuan_name
rs("addtime")=now()
rs("jiebie1")=jiebie_name1
rs("jiebie2")=jiebie_name2
rs("czy")=session("hy_name")
if request("radiobutton")=1 then
	rs("qianbao")=money3
else
	rs("qianbao")=0
end if
rs.update
rs.close
set rs=nothing

response.Write "<script language=javascript>alert('操作成功！');location.href='al_read2.aspx';</script>"
response.end

%>
