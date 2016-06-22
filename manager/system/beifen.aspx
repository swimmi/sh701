<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE11 {color: #0790FF}
-->
</style>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">数据备份</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table align="center" bgcolor="#d3d3d3" border="0" 
      cellpadding="1" cellspacing="1" width="95%">
      <tbody>
        <tr>
          <td align="middle" bgcolor="#F3FBFE" valign="center"><table align="center" bgcolor="#dfe7ef" border="1" 
                  bordercolor="#ffffff" cellpadding="0" cellspacing="1" height="80" 
                  width="97">
            <tbody>
              <tr>
                <td width="91" align="middle" valign="middle" bgcolor="#e9eef8"><p align="center"><a href="002.aspx" onClick="javascript:if(!confirm('\n特别提示！\n请慎重进行该操作！'))  return  false; "><img 
                        border="0" height="54" 
                        src="../images/jiesuan.gif" 
                        width="60" /></a></p></td>
              </tr>
            </tbody>
          </table></td>
        </tr>
      </tbody>
    </table>
                    <%if request("err")<>"" then%>
        <div align="center">
            <table width="225" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
              <tr>
                <td width="225" height="25"><div align="left">
                  操作结果：<%=request("err")%>
                </div></td>
              </tr>
              
              <tr>
                <td height="25"><div align="left">备份时间： <%=now%></div></td>
              </tr>
              <tr>
                <td height="25"><div align="left"><a href="datebase.rar">下载备份文件</a> </div></td>
              </tr>
              
          </table>
          <br />
      </div>
	                    <%end if%>

    </td>
  </tr>
</table>
</body>
</html>
