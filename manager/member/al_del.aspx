 
 <!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"-->

<%id=request("id")
flag=0
set rs_test=server.CreateObject("adodb.recordset")
sql_test="select * from view_xiaofei where xiaofei_flag=0 and xiaofei_hui_id='"+id+"'"
rs_test.Open sql_test,conn,1,1
if rs_test.RecordCount<>0 then
    flag=1
  	response.Write "<script language=javascript>alert('不能删除！下面已有会员注册');location.href='al_read2.aspx';</script>"
	response.end
end if
rs_test.close
set rs_test=server.CreateObject("adodb.recordset")
sql_test="select * from tbl_huiyuan where right(huiyuan_shangshu,len(huiyuan_shangshu)-8) like '%"+id+"%'"
rs_test.Open sql_test,conn,1,1
'response.write rs_test.recordcount
'response.end
if rs_test.RecordCount<>0 then
    flag=1
   	response.Write "<script language=javascript>alert('不能删除！下面已有会员注册');location.href='al_read2.aspx';</script>"
	response.end
end if
 
if flag<>1 then
sql_del="delete from tbl_huiyuan where huiyuan_id='"&id&"'"
    conn.execute(sql_del)
sql_del="delete from tbl_shangshu where huiyuan_id='"&id&"'"
    conn.execute(sql_del)
sql_del="delete from tbl_shangshu2 where huiyuan_id='"&id&"'"
    conn.execute(sql_del)
sql_del="delete from tbl_shangshu3 where huiyuan_id='"&id&"'"
    conn.execute(sql_del)
sql_del="delete from tbl_xiaofei where xiaofei_hui_id='"&id&"'"
	conn.execute(sql_del)
sql_del="update tbl_huiyuan  set leftnumber='' where leftnumber='"&id&"'"
	conn.execute(sql_del)
sql_del="update tbl_huiyuan  set rightnumber='' where rightnumber='"&id&"'"
	conn.execute(sql_del)
end if

 %>
 
 <%
'response.write msg
'response.end 

response.redirect "al_read1.aspx?msg="&msg&"    "&msg1
%>

