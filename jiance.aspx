<%
if request.Cookies("yrzzj")("tel")="" and request.Cookies("yrzzj")("id")="" then
response.Write "<script language=javascript>alert('您尚未登录!');location.href='login.aspx'</script>"
response.End()
end if
%>