<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0" />
<title>用户激活</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<style>
body{ background-color:#ecf6ff}
.jihuo{ background-image:url(img/jihuo.jpg); background-repeat:no-repeat; background-position:center top;background-attachment: fixed; }
.welcome{ font-size:14px;color:#0f93de; text-align:center; letter-spacing:2px; line-height:20px; margin-top:30px;}

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

<body class="jihuo">
	<h1 class="welcome">您已经是《育儿周周记》系列图书的用户<br>请输入图书中的激活码激活图书中的视频</h1>
	<div style="width:80%; margin:185px  auto 0 auto"><input name="" type="text" style="width:100%; height:35px; font-size:16px; color:#999999; padding-left:8px; line-height:35px; border:1px #CCCCCC solid;" onFocus="if(this.value==defaultValue) {this.value=''}" onBlur="if(!value) {value=defaultValue;}" value="请输入图书上的激活码"></div>
	<div style="width:80%; margin:20px auto 20px auto; text-align:center" o><input type="button" style="width:50%; border:0px; height:35px; line-height:35px; border-radius:3px; color:#fff; background-color:#0e92dd" value="确认激活">
	</div>
</body>
</html>
