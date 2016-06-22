<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE15 {font-size: 12px}
-->
</style>
</head>
<!--#include file="../../conn.aspx"-->
<!--#include file="../jiance.aspx"-->

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">上传图片</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 网上商城 &gt; 类别管理 &gt; 上传图片</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />上传图片</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">

<form id="form2" name="form2" method="post" action="classb.aspx"  enctype="multipart/form-data">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="content">
                        <tr>
                          <td height="60" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="60" align="center">上传图片：
                            <input name="imgs1" type="file" id="imgs1" size="30" />
                            <input name="id" type="hidden" id="id" value="<%=request("id")%>" /></td>
                          </tr>
                        <tr>
                          <td height="60" align="center">网站上传图片：
                            <input name="imgs12" type="file" id="imgs12" size="30" /></td>
                        </tr>
                        <tr>
                          <td height="60" align="center">网站上传图片(一)：
                            <input name="imgs13" type="file" id="imgs13" size="30" /></td>
                        </tr>
                        <tr>
                          <td height="60" align="center"><input type="submit" name="Submit" value="确认上传" /></td>
                          </tr>
                      </table>
</form>	
	
	
	</td>
</tr>
</table>
</body>
</html>
