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
<div style="position:fixed;top:20px; width:100%; z-index:88" align="center"><img src="img1/5.png" width="30%"  /></div>

<div style="position:fixed;top:130px; width:100%; z-index:100" align="center">
<form id="form1" name="form1" method="post" action="">
<table width="160" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="160" height="40"><span style="border-right:1px #FFFFFF dashed;">
      <input name="tel" type="text" id="tel" style="width:270px; height:25px; border:1px #7C952F solid; font-size:16px; font-family:'微软雅黑'; color:#999999; line-height:25px;" value="请输入手机号码" onfocus="if(this.value==defaultValue) {this.value='';this.type='text'}" onblur="if(!value) {value=defaultValue; this.type='text';}"/>
    </span></td>
  </tr>
  <tr>
    <td width="160" height="40"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="left"><input name="yzma" type="text" id="yzma" style="width:150px; height:25px; border:1px #7C952F solid; font-size:16px; font-family:'微软雅黑'; color:#999999; line-height:25px;"  value="验证码" onfocus="if(this.value==defaultValue) {this.value='';this.type='text'}" onblur="if(!value) {value=defaultValue; this.type='text';}"/>        </td>
        <td width="38%" align="right"><input name="button" type="button" class="ui-btn ui-btn-normal ml19" id="regCodeBtn" style="margin-left:-1px; width:100px; height:30px; background-image:url(img/2.png); font-size:12px; border:0px; color:#FFFFFF" onclick="change()" value="发送验证码" />
            <iframe name="iframe" id="iframe" style="width:0px; height:0px; border:0px; "></iframe>
          <input name="yzm" type="hidden" id="yzm" value="<%=request("yzm")%>"/></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="40"><input id="btnLogin" value="确认验证" type="submit" name="btnLogin" style="width:275px; height:36px; background-image:url(img/3.png); border:0px; font-size:18px; color:#FFFFFF" /></td>
  </tr>
</table>
</form>
</div>

<div style="position:fixed;bottom:0px;width:100%"><img src="img1/4.jpg" width="100%"  /></div>

</body>
</html>
