<!DOCTYPE html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0" />
<title>手机登录</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="css/banner.css" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
</head>

<style>
/* 判断iphone4-iphone4s *//* 竖屏*/
/* iphone 竖着|横着 */
@media only screen and (min-device-width : 320px) and (max-device-width : 480px) and (orientation : portrait){
}
@media only screen and (min-device-width : 320px) and (max-device-width : 480px) and (orientation : landscape){
}
/* ipad */
@media only screen and (min-device-width : 768px) and (max-device-width : 1024px) and (orientation : portrait){
}
@media only screen and (min-device-width : 768px) and (max-device-width : 1024px) and (orientation : landscape){
}
</style>
<body class="login">
<!--#include file="conn.aspx"-->
<div class="title">
  <div class="back" >&nbsp;</div>
  <div class="info">
    <h1>手机登录</h1>
  </div>
  <div class="user">&nbsp;</div>
</div>
<form action="login_check.aspx" method="post">
  <div  class="tel" >
    <input name="phone" type="tel" id="phone" value="" placeholder="请输入手机号码"  required="required"  >
  </div>
  <div class="login_sub">
    <div class="left">
      <input name="submit" type="submit" id="submit" value="登&nbsp;&nbsp;&nbsp;录">
    </div>
    <div class="right">
      <input name="login_checkbox" type="checkbox" value="1" id="login_checkbox">
      <label  for="login_checkbox">一个月内记住登录</label>
    </div>
  </div>
</form>
<div class="block_home_slider">
  <div id="home_slider" class="flexslider">
    <ul class="slides">
	<%
	 SQL="select * from guanggao where leibie=1"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	while not rs.eof and not rs.bof
	%>
      <li>
        <div class="slide"><A href="<%=rs("url")%>"  target="_blank"><img src="/manager/tushu/<%=rs("img")%>" alt="<%=rs("title")%>" /></A></div>
      </li>
    <%
	rs.movenext
	wend 
	rs.close
	set rs=nothing
	%>
    </ul>
  </div>
</div>
<script type="text/javascript">
$(function () {
	$('#home_slider').flexslider({
		animation : 'slide',
		controlNav : true,
		directionNav : false,
		animationLoop : true,
		slideshow : true,
		 slideshowSpeed: 4000,  
		useCSS : false
	});
});
</script>
</body>
</html>