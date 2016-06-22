<!--#include file="../../conn.aspx"--> 
<%

if request("checkbox")="checkbox" then
	checkbox=1
else
	checkbox=0
end if

if checkbox=1 then
	if request.form("textfield")=""  then
		response.Write "<script language=javascript>alert('K值不能为空！');history.go(-1);</script>"
		response.end
	end if
	if request.form("textfield")=0  then
		response.Write "<script language=javascript>alert('K值不能为0！');history.go(-1);</script>"
		response.end
	end if
	if not isnumeric(request.form("textfield"))  then
		response.Write "<script language=javascript>alert('K值必须用数字表示，请正确操作！');history.go(-1);</script>"
		response.end
	end if
	if request.form("textfield")>=1  then
		response.Write "<script language=javascript>alert('K值以超过上限，请正确操作！');history.go(-1);</script>"
		response.end
	end if
end if



if checkbox=0 then
	conn.execute("update tbl_canshu set k_flag="&checkbox&"")
end if
if checkbox=1 then
	conn.execute("update tbl_canshu set k="&request("textfield")&",k_flag="&checkbox&"")
end if
conn.execute("exec sp_zhixing_ri1")
	
conn.execute("update tbl_ji set flag1=1 where flag1=0")

response.Redirect("jiesuan.aspx?err=结算完成&time="&time0)
%>
