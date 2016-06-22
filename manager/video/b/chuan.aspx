<!--#include file="../../../conn.aspx"-->


<%
		
		if 	request("bianhao")="" then
			Response.Write "<script language=javascript>alert('请填写视频编号！');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("title")="" then
			Response.Write "<script language=javascript>alert('请填写视频名称！');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("shichang")="" then
			Response.Write "<script language=javascript>alert('请填写视频时长！');history.go(-1);</script>"
			Response.End 
		end if
		if 	request("tushu")="" then
			Response.Write "<script language=javascript>alert('请选择图书！');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("tushu")=0 then
			Response.Write "<script language=javascript>alert('请选择图书！');history.go(-1);</script>"
			Response.End 
		end if
		
		set Rs=server.createobject("adodb.recordset")	
		Rs.Open ("select * from video where bianhao='"&request("bianhao")&"'" ),Conn,1,1
		if rs.recordcount >0 then
		Response.Write "<script language=javascript>alert('视频编号已存在！');history.go(-1);</script>"
		response.end
		end if
		rs.close
		set rs=nothing
		
		
		
		
		set Rs=server.createobject("adodb.recordset")	
		Rs.Open ("select * from video"),Conn,3,3
		rs.addnew
		rs("video")="video/video/"&request("video")
		rs("bianhao")=request("bianhao")
		rs("title")=request("title")
		rs("age")=request("age")
		rs("yue")=request("yue")
		rs("guanjian")=request("guanjian")
		rs("leibie")=request("leibie")
		rs("shichang")=request("shichang")
		rs("tushu")=request("tushu")
		rs("memo")=request("memo")
		rs("biaoji")=request.Cookies("biaoji")
		rs("addtime")=now()
		Rs.Update
		Rs.Close
		set rs=nothing
		
		
		Response.Write "<script language=javascript>alert('下一步，请上传视频资源！');location.href='indexa.aspx';</script>"
		Response.End 

	%>
