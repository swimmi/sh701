<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0" />
<title>手机注册</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<style>
body{ background-color:#ecf6ff}
.register{ background-image:url(img/register.jpg); background-repeat:no-repeat; background-position:center top;background-attachment: fixed; }
.welcome{ font-size:24px;color:#0f93de; text-align:center; padding-top:50px;}
.welcome1{ font-size:18px;color:#0f93de; text-align:center; padding-top:10px; font-weight:normal}
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
</head>
<body class="register">
<h1 class="welcome">欢迎新用户</h1>
<h2 class="welcome1">观看视频请先注册</h2>
<div style="width:80%; background-color:#FFFFFF; border-radius:3px; margin:50px auto 0 auto;  border:1px #CCCCCC solid">
	<div style=" height:35px; overflow:hidden; padding:8px 10px 8px 10px; border-bottom:1px #CCCCCC solid">
		<div style="float:left; width:15%"><img src="img/1.jpg" width="35"></div>
		<div style="float:left; width:60%"><input name="" type="text" style="  height:35px; line-height:35px; font-size:14px; border:0px; color:#999999; width:100%" onFocus="if(this.value==defaultValue) {this.value='';this.type='tel'}" onBlur="if(!value) {value=defaultValue; this.type='tel';}" value="请输入手机号码"></div>
		<div style="float:right;width:25%"><input type="button" style=" background-color:#0e92dd; width:100%; height:35px; border:0px;color:#FFFFFF" value="验证码">
		</div>
	</div>
	<div style=" height:35px; overflow:hidden;padding:8px 10px 8px 10px;border-bottom:1px #CCCCCC solid" >
		<div style="float:left; width:15%"><img src="img/2.jpg" width="35"></div>
		<div style="float:left; width:60%"><input name="" type="text" style="  height:35px; line-height:35px; font-size:14px; border:0px; color:#999999; width:100%" onFocus="if(this.value==defaultValue) {this.value='';this.type='tel'}" onBlur="if(!value) {value=defaultValue; this.type='tel';}" value="手机验证码"></div>
		<div style="float:right;width:25%"></div>
	</div>
	<div style=" height:35px; line-height:35px; overflow:hidden;padding:8px 10px 8px 10px; text-align:center" >
		<div style="float:left;width:10%"><input name="" type="radio" value=""></div>
		<div style="float:left;width:40%; color:#666; font-size:16px"><label for="">男宝宝</label></div>
		<div style="float:left;width:10%"><input name="" type="radio" value=""></div>
		<div style="float:left;width:40%; color:#666; font-size:16px"><label>女宝宝</label></div>
	</div>
</div>
<div style="width:80%; margin:30px auto">
<input name="" type="button" style="width:100%; border:0px; border-radius:3px; height:35px; line-height:35px; background-color:#0e92dd; color:#FFFFFF; font-size:18px" value="完&nbsp;成&nbsp;注&nbsp;册">
</div>
</body>
</html>
