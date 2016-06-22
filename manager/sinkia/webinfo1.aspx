<!--#include file="../../conn.aspx"-->
<!--#include file="inc/apartPage.aspx" -->
<!--#include file="Inc/UpLoadClass.aspx" -->
<!--#include file="Inc/Code2Info.en.aspx" -->


<%	
		Dim UpFile,SavePath,str
		SavePath = "UpLoadFile_iimg/"
		Set UpFile = New UpLoadClass
		UpFile.SavePath = SavePath
		UpFile.MaxSize  = 1500*1024
		UpFile.FileType = "jpg/gif/png/bmp"
		UpFile.Open()


		Set Rs = Server.CreateObject("ADODB.Recordset")
		Rs.Open ("select * from tbl_sinkia_webInfo"),Conn,1,2
		Rs("webName")       = Trim(UpFile.Form("webName"))
		Rs("webAddress")    = Trim(UpFile.Form("webAddress"))
		Rs("webKeyWords")   = Trim(UpFile.Form("webKeyWords"))
		Rs("title")   = Trim(UpFile.Form("title"))
		Rs("webEnd")        = Trim(UpFile.Form("webEnd"))
		Rs("webtishi")        = Trim(UpFile.Form("webtishi"))
		if UpFile.Form("imgs")&""<>"" then
			Rs("url")  = "UpLoadFile_iimg/"&UpFile.Form("imgs")
		end if
		Rs.Update
		Rs.Close
		Set Rs=Nothing
		
		response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='webinfo.aspx';</script>"
		response.end

	
%>