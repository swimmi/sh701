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
		SavePath = "load/"
		Set UpFile = New UpLoadClass
		UpFile.SavePath = SavePath
		UpFile.MaxSize  = 1500*1024
		UpFile.FileType = "jpg/gif/png"
		UpFile.Open()
		
		
		
		set Rs=server.createobject("adodb.recordset")	
		Rs.Open ("select * from tbl_pt"),Conn,3,3
		rs.addnew
		
			if UpFile.Form("imgs")&""<>"" then
				Rs("imgs")  = "load/"&UpFile.Form("imgs")
			end if
			
			Rs("title")  = UpFile.Form("title")
			Rs("js")  = UpFile.Form("js")
			Rs("memo")  = UpFile.Form("memo")
			rs("type")=UpFile.Form("select")
				
		Rs.Update
		Rs.Close
		Response.Redirect "add.aspx"
		set rs=nothing
		

%>
	
	</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
