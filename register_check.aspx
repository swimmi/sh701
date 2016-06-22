<!--#include file="conn.aspx"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
	if request("phone")=""  then
		response.Write "<script language=javascript>alert('请输入手机号！');history.go(-1);</script>"
		response.end
	end if
	
	SQL="select * from huiyuan where tel='"&request("phone")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,3
	if rs.recordcount=0 then
		rs.addnew
		rs("tel")=request("phone")
		rs("addtime")=now
		rs("sex")=request("sex")
		rs.movelast
		newid = rs("id")
		rs.update
	else
		response.Write "<script language=javascript>alert('当前手机号已注册！');location.href='login.aspx';</script>"
		response.end
	end if
	rs.close
	set rs=nothing
	Response.Cookies("yrzzj")("id")=newid
	Response.Cookies("yrzzj")("tel")=request("phone")
	response.Write "<script language=javascript>alert('注册成功！');location.href='jihuo.aspx';</script>"
	response.end
%>