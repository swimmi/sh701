<!--#include file="../../../conn.aspx"-->


<%
		
		if 	request("bianhao")="" then
			Response.Write "<script language=javascript>alert('ÇëÌîĞ´ÊÓÆµ±àºÅ£¡');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("title")="" then
			Response.Write "<script language=javascript>alert('ÇëÌîĞ´ÊÓÆµÃû³Æ£¡');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("tushu")="" then
			Response.Write "<script language=javascript>alert('ÇëÌîĞ´Í¼ÊéÃû³Æ£¡');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("memo")="" then
			Response.Write "<script language=javascript>alert('ÇëÌîĞ´ÊÓÆµ¼ò½é£¡');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("age")=0 then
			Response.Write "<script language=javascript>alert('ÇëÑ¡ÔñÖÜÁä£¡');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("yue")=0 then
			Response.Write "<script language=javascript>alert('ÇëÑ¡ÔñÔÂÁä¶Î£¡');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("guanjian")=0 then
			Response.Write "<script language=javascript>alert('ÇëÑ¡Ôñ¹Ø¼ü×Ö£¡');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("leibie")=0 then
			Response.Write "<script language=javascript>alert('ÇëÑ¡ÔñÀà±ğ£¡');history.go(-1);</script>"
			Response.End 
		end if
		
		
		set Rs=server.createobject("adodb.recordset")	
		Rs.Open ("select * from video where id='"&request("id")&"'"),Conn,3,3
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
		Rs.Update
		Rs.Close
		set rs=nothing
		
		
		Response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='xiugai.aspx?id="&request("id")&"';</script>"
		Response.End 

	%>
