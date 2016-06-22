<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0" />
<title>手机注册</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
</head>
<style>
/* 判断iphone4-iphone4s *//* 竖屏*/
body{ background-color:#ecf6ff}
.login{ background-image:url(img/Login.jpg); background-repeat:no-repeat; background-position:center top;background-attachment: fixed; }
.login_tel{ margin-top:145px; margin-bottom:10px; text-align:center}
.input_tel{width:80%; padding-left:5px; color:#999999; border:1px #CCCCCC solid; border-radius:3px; line-height:30px;}
.login_sub{ width:80%; margin:0 auto; overflow:hidden}
.login_sub .left{float:left}
.login_sub .right{ float:right; margin-top:9px; margin-right:10px;}
#login_button{ background-image:url(img/login_320.jpg); width:96px;  height:33px; border:0; margin-right:30px;}
#login_checkbox{ vertical-align:middle;}
.login_checkbox_label{ color:#666}
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
<div  class="login_tel" >
  <input type="text" onFocus="if(this.value==defaultValue) {this.value='';this.type='tel'}" onBlur="if(!value) {value=defaultValue; this.type='tel';}" value="请输入手机号码" class="input_tel">
</div>
<div class="login_sub">
  <div class="left">
    <input name="login_button" type="submit" id="login_button" value="">
  </div>
  <div class="right">
    <input name="login_checkbox" type="checkbox" value="" id="login_checkbox">
    <label class="login_checkbox_label"  for="login_checkbox">一个月内记住登录</label>
  </div>
</div>
</body>
</html>