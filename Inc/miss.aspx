<%
	If session("login_flag")<>1 Then
		Response.Write("<script>window.top.location='../../../../gl.aspx';</script>")
	End If


%>