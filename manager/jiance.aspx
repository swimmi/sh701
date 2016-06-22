<%if session("hy_id")="" or session("hy_bianhao")="" or session("hy_name")="" then%>
<script language="javascript"> alert("您登陆已经超时,请重新登录!");top.document.location.href='/gl.aspx';</script>	
<%
response.End()
end if
%>
