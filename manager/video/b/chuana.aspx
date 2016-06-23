<!--#include file="../../../conn.aspx"-->


<%
		if 	request("video")="" then
			Response.Write "<script language=javascript>alert('请上传视频资源！');history.go(-1);</script>"
			Response.End 
		end if
		
		
		set Rs=server.createobject("adodb.recordset")	
		Rs.Open ("select * from video where id='"&request("videoid")&"'"),Conn,3,3
			rs("video")="video/video/"&request("video")
			rs("flag")=1
		Rs.Update
		Rs.Close
		set rs=nothing
		
		Response.Cookies("biaoji")=""
		Response.Write "<script language=javascript>alert('操作成功！');location.href='index.aspx';</script>"
		Response.End 

	%>
