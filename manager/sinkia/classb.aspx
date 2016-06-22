<!--#include file="../../conn.aspx"-->
<!--#include file="Inc/UpLoadClass.aspx" -->
<!--#include file="Inc/Code2Info.en.aspx" -->
<%


	Dim UpFile,SavePath,str
	SavePath = "class/"
	Set UpFile = New UpLoadClass
	UpFile.SavePath = SavePath
	UpFile.MaxSize  = 300000*1024
	UpFile.FileType = "jpg/gif/bmp/png"
	UpFile.Open()


	set rs=server.createobject("adodb.recordset")
	sql="select * from tbl_sinkia_class where id='"&UpFile.Form("id")&"'"
	rs.open sql,conn,1,3
			if UpFile.Form("imgs1")<>"" then
				Rs("url")  = "class/"&UpFile.Form("imgs1")
			end if
			if UpFile.Form("imgs12")<>"" then
				Rs("imgs")  = "class/"&UpFile.Form("imgs12")
			end if
			if UpFile.Form("imgs13")<>"" then
				Rs("imgs1")  = "class/"&UpFile.Form("imgs13")
			end if
	rs.update
	rs.close
	set rs=nothing
	
	response.write "<script>alert('²Ù×÷³É¹¦');location.href='class.aspx';</Script>"
	Response.End 


%>
