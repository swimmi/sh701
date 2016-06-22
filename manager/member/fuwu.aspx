<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"-->
<%
huiyuan_id=request("huiyuan_id")
fuwu=request("fuwu")

set rs=server.CreateObject("adodb.recordset")
sql="select * from tbl_huiyuan where huiyuan_mob='"&fuwu&"' and huiyuan_zhuanmai=1"
rs.Open sql,conn,1,1
if rs.eof and rs.bof then
  	response.Write "<script language=javascript>alert('服务专员不存在!');history.go(-1);</script>"
	response.end
else
	'if rs("zm_jiebie")<>1 then
	'	response.Write "<script language=javascript>alert('请填写正确的服务专员!');history.go(-1);<'/script>"
	'	response.end
	'end if
	fuwu1=rs("huiyuan_id")
end if
rs.close
set rs=nothing

if huiyuan_id=fuwu1 then
  	response.Write "<script language=javascript>alert('服务专员不可填写本人!');history.go(-1);</script>"
	response.end
end if

conn.execute("update tbl_huiyuan set fuwu1='"&fuwu1&"',fuwu_mob='"&fuwu&"' where huiyuan_id='"&huiyuan_id&"'")
  	
response.Write "<script language=javascript>alert('操作成功!');location.href='al_read2.aspx';</script>"
response.end

%>

