<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="format-detection" content="telephone=no"/>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

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
  <script language="JavaScript">  
		 i=100
		 function change()  
		 {  
			 var regCodeBtn=document.getElementById("regCodeBtn"); 
			 if(i==0)  
			 {
				 i=100
			 }
			 i--; 
			 if(i!=0)  
			 { 
			 regCodeBtn.value=i+"秒重新获取" ;
			 }
			 else
			 {
			 	regCodeBtn.value="发送验证码" ;
			 }
				
			 if(i==0)  
			 { 
				 regCodeBtn.disabled=false;
			 }  
			 else  
			 {
				 setTimeout("change()",1000) ;
				 regCodeBtn.disabled=true;
			 } 
			 if(i==99)
			 {
			    var   user   = document.getElementById("tel");   
				var   iframe   = document.getElementById("iframe");   
				iframe.src="aa.aspx?tel="+user.value;
				}
		 } 
</script>    


<div style="position:fixed;top:0px;width:100%;; z-index:80"><img src="img1/3.jpg" width="100%"  /></div>
<div style="position:fixed;top:10px; width:100%; z-index:88" align="center"><img src="img1/5.png" width="60%"  /></div>

<div style="position:fixed;top:130px; width:100%; z-index:100" align="center">

<form id="form1" name="form1" method="post" action="check.aspx">

<div style="width:100%" align="center">
	<div style="width:250px; border:1px #7C952F solid; background-color:#FFFFFF; height:33px;" align="left">

      <input name="tel" type="text" id="tel" style="width:200px; height:25px; border:0px; font-size:16px; font-family:'微软雅黑'; color:#999999;" value="&nbsp;请输入手机号码" onfocus="if(this.value==defaultValue) {this.value='';this.type='text'}" onblur="if(!value) {value=defaultValue; this.type='text';}"/>
	</div>
</div>


<div style="width:100%; margin-top:10px;" align="center">
	<div style="width:250px;">
		<div style="float:left; width:150px;" align="left">
		<input name="yzma" type="text" id="yzma" style="width:140px; height:25px; border:1px #7C952F solid; font-size:16px; font-family:'微软雅黑'; color:#999999; line-height:25px;"  value="&nbsp;验证码" onfocus="if(this.value==defaultValue) {this.value='';this.type='text'}" onblur="if(!value) {value=defaultValue; this.type='text';}"/>
		</div>
		<div style="float:left; width:100px;" align="right">
		<input name="button" type="button" class="ui-btn ui-btn-normal ml19" id="regCodeBtn" style="margin-left:-1px; width:90px; height:30px; background-image:url(img/2.png); font-size:12px; border:0px; color:#FFFFFF" onclick="change()" value="发送验证码" />
		</div>
	</div>
	<div style="clear:both"></div>
</div>


<div style="width:100%; margin-top:10px;" align="center">
	<div style="width:250px; font-size:15px; color:#52A714;">
		<div style="float:left;"><input type="radio" name="radiobutton" value="1" style="border:#52A714 1px solid; width:15px; height:15px;" /></div>
		<div style="float:left; line-height:22px;">&nbsp;男宝宝</div>
		<div style="float:left; margin-left:20px;"><input type="radio" name="radiobutton" value="2"  style="border:#52A714 1px solid; width:15px; height:15px;" /></div>
		<div style="float:left; line-height:22px;">&nbsp;女宝宝</div>
	</div>
	<div style="clear:both"></div>
</div>




		  
	<iframe name="iframe" id="iframe" style="width:0px; height:0px; border:0px; "></iframe>
	<input name="yzm" type="hidden" id="yzm" value="<%=request("yzm")%>"/>
	
<div style="width:100%; margin-top:5px;" align="center">
		  <input id="btnLogin" value="确认验证" type="submit" name="btnLogin" style="width:250px; height:36px; background:url(img/3.png) center; border:0px; font-size:18px; color:#FFFFFF" />
</div>
</form>
</div>

<div style="position:fixed;bottom:0px;width:100%"><img src="img1/4.jpg" width="100%"  /></div>

</body>
</html>
