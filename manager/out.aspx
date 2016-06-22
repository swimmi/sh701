<%
	session("hy_id")=""
	session("hy_bianhao")=""
	session("hy_name")=""
	
		response.Write "<script language=javascript>alert('成功退出！');top.document.location.href='/gl.aspx';</script>"
		response.end

	

%>