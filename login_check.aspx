<!--#include file="conn.aspx"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
	if request("phone")=""  then
		response.Write "<script language=javascript>alert('请输入手机号！');history.go(-1);</script>"
		response.end
	end if
	
	SQL="select * from huiyuan where tel='"&request("phone")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if rs.recordcount=0 then
		response.Write "<script language=javascript>alert('当前手机号尚未注册！');location.href='register.aspx';</script>"
		response.end
	else
		if rs("flag")=1 then
			response.Write "<script language=javascript>alert('当前手机号已限制登录!请联系客服!');history.go(-1);</script>"
			response.End()
			else
				if request("login_checkbox")=1 then
					Response.Cookies("yrzzj").Expires= DateAdd("m",1,now())  '设置过期时间(1个月) 
				end if
				Response.Cookies("yrzzj")("id")=rs("id")
				Response.Cookies("yrzzj")("tel")=rs("tel")
				response.Write "<script language=javascript>location.href='jihuo.aspx';</script>"
		end if
	end if

%>
