<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
<title>育儿周周记管理平台</title>
<style type="text/css">

 /*处理屏幕抖动*/
 body {background-attachment:fixed;background-image:url(about:blank);}
 /*处理ie6兼容*/

 #a { position:fixed;top:0; }
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	
}
</style>
</head>
<body>
 <table width="100%"  height="42" border="0" cellpadding="0" cellspacing="0" style="position:fixed; top:0px;">
  <tr>
    <td bgcolor="#0897D1" width="200px;" align="center"><font style="font-family:'幼圆'; font-size:25px; font-weight:bold; color:#FFFFFF">后台管理系统</font></td>
    <td align="left" bgcolor="#0897D1" ><!--#include file="top.aspx"--></td>
    <td bgcolor="#0897D1">
	
</td>
  </tr>
</table>
 <table width="100%" border="0" cellpadding="0" cellspacing="0">

   <tr>
     <td valign="top" background="images/bg.gif" style="padding-top:10px;"><!--#include file="left.aspx"--></td>
     <td width="100%" height="10000" valign="top" style="padding-top:50px; padding-left:10px;">
		 <iframe height="100%" width="99%" scrolling="Auto" id="win" onload="Javascript:SetWinHeight(this)" frameborder="0" src="main.aspx" name="mainFrame" > </iframe>
	 </td>
   </tr>
 </table>
<table width="100%"  height="42" border="0" cellpadding="0" cellspacing="0" style="position:fixed; bottom:0px;">
 <tr>
    <td align="left" bgcolor="#0897D1" ><!--#include file="bottom.aspx"--></td>
  </tr>
</table>

</body>
</html>