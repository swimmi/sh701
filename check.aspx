<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="format-detection" content="telephone=no"/></head>

<title>二维码验证</title>
<style type="text/css">
<!--
body{
	background-color:#FFFFFF;
	margin:0px;
	padding:0px;
}  
-->
</style>
</head>
<body>


<div style="position:fixed;top:0px;width:100%;; z-index:80"><img src="img1/3.jpg" width="100%"  /></div>
<div style="position:fixed;top:20px; width:100%; z-index:88" align="center"><img src="img1/5.png" width="30%"  /></div>

<div style="position:fixed;top:130px; width:100%; z-index:100" align="center">
<%
	response.Write "<script language=javascript>alert('验证成功！');</script>"
%>
</div>

<div style="position:fixed;bottom:0px;width:100%"><img src="img1/4.jpg" width="100%"  /></div>

</body>
</html>

