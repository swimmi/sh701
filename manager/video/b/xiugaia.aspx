<!--#include file="../../../conn.aspx"-->


<%
		
		if 	request("bianhao")="" then
			Response.Write "<script language=javascript>alert('����д��Ƶ��ţ�');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("title")="" then
			Response.Write "<script language=javascript>alert('����д��Ƶ���ƣ�');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("tushu")="" then
			Response.Write "<script language=javascript>alert('����дͼ�����ƣ�');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("memo")="" then
			Response.Write "<script language=javascript>alert('����д��Ƶ��飡');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("age")=0 then
			Response.Write "<script language=javascript>alert('��ѡ�����䣡');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("yue")=0 then
			Response.Write "<script language=javascript>alert('��ѡ������Σ�');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("guanjian")=0 then
			Response.Write "<script language=javascript>alert('��ѡ��ؼ��֣�');history.go(-1);</script>"
			Response.End 
		end if
		
		if 	request("leibie")=0 then
			Response.Write "<script language=javascript>alert('��ѡ�����');history.go(-1);</script>"
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
		
		
		Response.Write "<script language=javascript>alert('�����ɹ���');location.href='xiugai.aspx?id="&request("id")&"';</script>"
		Response.End 

	%>
