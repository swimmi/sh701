<!--#include file="../../../conn.aspx"-->


<%
		if 	request("video")="" then
			Response.Write "<script language=javascript>alert('���ϴ���Ƶ��Դ��');history.go(-1);</script>"
			Response.End 
		end if
		
		
		set Rs=server.createobject("adodb.recordset")	
		Rs.Open ("select * from video where id='"&request("videoid")&"'"),Conn,3,3
			rs("video")=request("video")
			rs("flag")=2
		Rs.Update
		Rs.Close
		set rs=nothing
		
		Response.Cookies("biaoji")=""
		
		Response.Write "<script language=javascript>alert('�����ɹ���');location.href='xiugai.aspx?id="&request("videoid")&"';</script>"
		Response.End 

	%>
