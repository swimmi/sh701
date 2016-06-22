<!DOCTYPE html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0" />
  <title>手机注册</title>
  <link rel="stylesheet" type="text/css" href="css/reset.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <style>
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
  <div class="title">
    <div class="back" onClick="javasprit:history.go(-1);">&lt;&nbsp;返回</div>
    <div class="info">
      <h1>手机注册</h1>
    </div>
    <div class="user">&nbsp;</div>
  </div>
  <h1 class="welcome">欢迎新用户</h1>
  <h2 class="welcome1">观看视频请先注册</h2>
  <form action="register_check.aspx" method="post">
    <ul class="register_div">
      <li class="phonenumber">
        <div class="pic"><img src="img/1.jpg"></div>
        <div class="inputnumber">
          <input name="phone" type="tel" id="phone" placeholder="请输入手机号码"  required="required" >
        </div>
        <div class="sendyzm">
          <input type="button"  value="验证码" onClick="JavaScript:alert('未开通!');">
        </div>
      </li>
      <li class="yzm">
        <div class="pic"><img src="img/2.jpg"></div>
        <div class="inputyzm"> <input name="yzm" type="tel" id="yzm" placeholder="验证码"  ></div>
        <div></div>
      </li>
      <li class="sex">
        <div class="sex_input">
          <input name="sex" type="radio" value="1" checked="checked" />
        </div>
        <div class="sex_title">
          <label for="sex">男宝宝</label>
        </div>
        <div class="sex_input">
          <input name="sex" type="radio" value="2">
        </div>
        <div class="sex_title">
          <label>女宝宝</label>
        </div>
      </li>
    </ul>
    <div class="sub">
      <input name="submit" type="submit" id="submit"  value="完&nbsp;成&nbsp;注&nbsp;册">
    </div>
  </form>
</body>
</html>