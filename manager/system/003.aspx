<!--#include file="../../conn.aspx"--> 
<%

if request("checkbox")="checkbox" then
	checkbox=1
else
	checkbox=0
end if

if checkbox=1 then
	if request.form("textfield")=""  then
		response.Write "<script language=javascript>alert('Kֵ����Ϊ�գ�');history.go(-1);</script>"
		response.end
	end if
	if request.form("textfield")=0  then
		response.Write "<script language=javascript>alert('Kֵ����Ϊ0��');history.go(-1);</script>"
		response.end
	end if
	if not isnumeric(request.form("textfield"))  then
		response.Write "<script language=javascript>alert('Kֵ���������ֱ�ʾ������ȷ������');history.go(-1);</script>"
		response.end
	end if
	if request.form("textfield")>=1  then
		response.Write "<script language=javascript>alert('Kֵ�Գ������ޣ�����ȷ������');history.go(-1);</script>"
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

response.Redirect("jiesuan.aspx?err=�������&time="&time0)
%>
