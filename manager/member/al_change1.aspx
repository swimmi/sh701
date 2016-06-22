 
 <!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%



huiyuan_id=request("huiyuan_id")
huiyuan_yinhang_zh=request("huiyuan_yinhang_zh")
huiyuan_yinhang_name=request("huiyuan_yinhang_name")
huiyuan_yinhang=request("huiyuan_yinhang")
bank_zhi=request("bank_zhi")

SQL="update tbl_huiyuan set huiyuan_yinhang_name='"&huiyuan_yinhang_name&"',huiyuan_yinhang_zh='"&huiyuan_yinhang_zh&"',huiyuan_yinhang='"&huiyuan_yinhang&"',bank_zhi='"&bank_zhi&"' where huiyuan_id='"&huiyuan_id&"'"


conn.execute(sql)

	response.Write "<script language=javascript>location.href='al_read2.aspx';</script>"
	response.end
%>
