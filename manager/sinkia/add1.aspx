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
		SavePath = "img/"
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
			
if UpFile.Form("imgs")="" then
	response.Write "<script language=javascript>alert('请选择图片！');history.go(-1);</script>"
	response.end
end if
			
			
			
		Rs.Open ("select * from tbl_photo"),Conn,3,3
			rs.addnew
							Rs("pro_id")      =   UpFile.Form("proid")	
							if UpFile.Form("imgs")&""<>"" then
								Rs("url")  = "img/"&UpFile.Form("imgs")
							end if
							Rs.Update
							Rs.Close
								Response.Redirect "add.aspx?id="&UpFile.Form("proid")	
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