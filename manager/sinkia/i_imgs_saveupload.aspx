<!--#include file="../../conn.aspx"-->
<!--#include file="Inc/UpLoadClass.aspx" -->
<!--#include file="Inc/Code2Info.en.aspx" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top">
 
	   <table width="600" border="0" align="center" cellpadding="3" cellspacing="1" class="content">
        <tr>
<td >
<%




		Dim UpFile,SavePath,str
		SavePath = "UpLoadFile_iimg/"
		Set UpFile = New UpLoadClass
		UpFile.SavePath = SavePath
		UpFile.MaxSize  = 1500*1024
		UpFile.FileType = "jpg/gif"
		UpFile.Open()
		set Rs=server.createobject("adodb.recordset")	
		
		Select Case UpFile.Error
			Case 0 
			call suc()
			Case 1 
			call error1("error1")
			Case 2 
			call error1("error2")
			Case 3 
			call error1("error3")
			Case 4 
			call error1("error4")
		End Select
sub suc()
			
		Rs.Open ("select * from tbl_sinkia_iimgs where id="&UpFile.Form("ids")),Conn,3,3
							Rs("title_z")       =   UpFile.Form("title_z")	
							Rs("title")      =   UpFile.Form("title")	
							Rs("content")  =	 UpFile.Form("content") 
							Rs("address")   =	 UpFile.Form("address")
							if UpFile.Form("imgs")&""<>"" then
								Rs("imgs")  = "UpLoadFile_iimg/"&UpFile.Form("imgs")
							end if
							if UpFile.Form("imgs2")&""<>"" then
								Rs("title")  = "UpLoadFile_iimg/"&UpFile.Form("imgs2")
							end if
							Rs.Update
							Rs.Close
								Response.Redirect "i_imgs.aspx?action=modsave"
					set rs=nothing
		
end sub	
sub error1(str)	
Select Case str
			Case "error1" 
			Response.Write "文件大于150K<p>[<a href='javascript:history.back();'>返回</a>]</p>"
			Case "error2" 
			Response.Write "文件类型不匹配<p>[<a href='javascript:history.back();'>返回</a>]</p>"
			Case "error3" 
			Response.Write "文件大于150K并且文件类型不匹配<p>[<a href='javascript:history.back();'>返回</a>]</p>"
			Case "error4"
			Response.Write "异常，不存在上传<p>[<a href='javascript:history.back();'>返回</a>]</p>"
		End Select
end sub
	%>
	
	</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
<script language="javascript" type="text/javascript">
</script>