<!DOCTYPE html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0" />
  <title>用户激活</title>

  <link rel="stylesheet" type="text/css" href="css/reset.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <style>
    /* iphone 竖着|横着 */
    
    @media only screen and (min-device-width: 320px) and (max-device-width: 480px) and (orientation: portrait) {}
    
    @media only screen and (min-device-width: 320px) and (max-device-width: 480px) and (orientation: landscape) {}
    /* ipad */
    
    @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: portrait) {}
    
    @media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: landscape) {}
  </style>
</head>
<!--#include file="jiance.aspx"-->

<body class="jihuo">
  <div class="title">
    <div class="back" onClick="javasprit:history.go(-1);">&lt;&nbsp;返回</div>
    <div class="info">
      <h1>用户激活</h1>
    </div>
    <div class="exit" onClick="javasprit:location.href='out.aspx'">退出</div>
  </div>
  <p class="welcome">
  <span>注册用户&nbsp;<%=request.Cookies("yrzzj")("tel")%>，您好!</span><br/><br/>您已经是《育儿周周记》系列图书的用户<br> 请输入图书中的激活码激活图书中的视频
  </p>
  <form action="jihuoa.aspx" method="post">
    <div class="jihuo_ma">
      <input name="jhm" type="text" id="jhm" placeholder="请输入图书上的激活码">
    </div>
    <div class="sub">
      <input name="submit" type="submit" id="submit" value="确认激活">
    </div>
  </form>
</body>
</html>