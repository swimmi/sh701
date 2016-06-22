<!--#include file="conn.aspx"--> 

<%

	if request("tel")="" then
		response.Write "<script language=javascript>alert('请输入手机号！');history.go(-1);</script>"
		response.end
	end if
	if request("pass")="" then
		response.Write "<script language=javascript>alert('请输入登录密码！');history.go(-1);</script>"
		response.end
	end if

	SQL="select * from tbl_huiyuan where huiyuan_mob='"&request("tel")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
		if rs.recordcount=0 then
			response.Write "<script language=javascript>alert('请输入正确的手机号码！');history.go(-1);</script>"
			response.end
		else
			if rs("huiyuan_pass")<>request("pass") then
				response.Write "<script language=javascript>alert('请输入正确的登录密码！');history.go(-1);</script>"
				response.end
			end if
			
			if rs("huiyuan_jiebie")=2 then
				response.Write "<script language=javascript>alert('对不起，您没有权限进行登录！');history.go(-1);</script>"
				response.end
			end if
			response.Cookies("hy")("huiyuan_id")=rs("huiyuan_id")
			response.Cookies("hy")("huiyuan_jiebie")=1
		end if
	rs.close
	set rs=nothing
			
		

	response.Write "<script language=javascript>alert('登录成功！');location.href='user_index.aspx';</script>"
	response.end


%>