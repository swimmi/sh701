 
 <!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%



huiyuan_id=request("huiyuan_id")


SQL="update tbl_huiyuan set xufei_flag=0,huiyuan_xufei='"&now()&"' where huiyuan_id='"&huiyuan_id&"'"
conn.execute(sql)

	response.Write "<script language=javascript>alert('���ѳɹ���');location.href='al_read6.aspx';</script>"
	response.end
%>
