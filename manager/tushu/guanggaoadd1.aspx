<!--#include file="../../conn.aspx"-->
<!--#include file="Inc/UpLoadClass.aspx" -->
<!--#include file="Inc/Code2Info.en.aspx" -->
<%




		Dim UpFile,SavePath,str
		SavePath = "upload/"
		Set UpFile = New UpLoadClass
		UpFile.SavePath = SavePath
		UpFile.MaxSize  = 1500*1024
		UpFile.FileType = "jpg/gif"
		UpFile.Open()
		set Rs=server.createobject("adodb.recordset")	
		
		Rs.Open ("select * from guanggao"),Conn,3,3
		rs.addnew
		Rs("title")=   UpFile.Form("title")
		Rs("url")=   UpFile.Form("url")
		Rs("leibie")=   UpFile.Form("leibie")
		if UpFile.Form("img")&""<>"" then
			Rs("img")  = "upload/"&UpFile.Form("img")
		end if
		Rs.Update
		Rs.Close
		set rs=nothing
			response.Write "<script language=javascript>alert('�����ɹ���');location.href='guanggao.aspx';</script>"
	response.end

	%>
	
