<%@LANGUAGE="VBSCRIPT" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>育儿周周记后台管理系统</title>
  </head>
  <style type="text/css">
    <!-- body {
      margin-left: 0px;
      margin-top: 0px;
      margin-right: 0px;
      margin-bottom: 0px;
    }
    
    .STYLE3 {
      font-family: "微软雅黑";
      color: #FFFFFF;
      font-size: 14px;
    }
    
    a:link {
      text-decoration: none;
    }
    
    a:visited {
      text-decoration: none;
    }
    
    a:hover {
      text-decoration: none;
    }
    
    a:active {
      text-decoration: none;
    }
    
    .code-image {
      cursor: pointer;
    }
    
    .box1 {
      width: 248px;
      height: 32px;
      line-height: 28px;
      background: url(image/in_bg1.gif) no-repeat;
      padding-left: 38px;
      padding: 2px 15px 0 38px;
      margin-top: 3px;
      margin-bottom: 10px;
      color: #9D7922;
      font-size: 15px;
      font-weight: bold;
      border: 0px;
      outline: none;
    }
    
    .box2 {
      width: 248px;
      height: 32px;
      line-height: 28px;
      background: url(image/in_bg2.gif) no-repeat;
      padding-left: 38px;
      padding: 2px 15px 0 38px;
      margin-top: 3px;
      margin-bottom: 10px;
      color: #9D7922;
      font-size: 15px;
      font-weight: bold;
      border: 0px;
      outline: none;
    }
    
    .box3 {
      width: 145px;
      height: 32px;
      line-height: 28px;
      background: url(image/in_bg3.gif) no-repeat;
      padding-left: 38px;
      padding: 2px 0 0 38px;
      margin-top: 3px;
      margin-right: 40px;
      margin-bottom: 10px;
      color: #9D7922;
      font-size: 15px;
      font-weight: bold;
      border: 0px;
      outline: none;
    }
    
    .submit {
      border: none;
      width: 74px;
      height: 33px;
      background: url(image/butt.jpg) no-repeat;
      cursor: pointer;
    }
    
    html {
      background: url(image/4.jpg) no-repeat center center fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
    }
    
    --> .STYLE4 {
      font-size: 12px
    }
  </style>

  <body>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:100px;">
      <tr>
        <td height="80" align="center">
          <font style="font-weight:bold; font-size:30px; color:#FFFFFF">育儿周周记后台管理系统</font>
        </td>
      </tr>
      <tr>
        <td align="center">
          <FORM method="post" name="form1" action="manager/login_check.aspx">

            <table width="400" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
              <tr>
                <td width="40" align="left">&nbsp;</td>
                <td height="80" align="left">
                  <font style="font-size:20px; font-family:'宋体'; color:#000000">管理员登录</font>
                </td>
              </tr>
              <tr>
                <td width="40" align="left">&nbsp;</td>
                <td height="20" align="left">
                  <font style="font-size:14px; font-family:'宋体'; color:#000000">用户名</font>
                </td>
              </tr>
              <tr>
                <td width="40" align="left">&nbsp;</td>
                <td align="left"><input type="text" name="huiyuan_name" id="huiyuan_name" class="box1" /></td>
              </tr>
              <tr>
                <td width="40" align="left">&nbsp;</td>
                <td height="20" align="left">
                  <font style="font-size:14px; font-family:'宋体'; color:#000000">密码</font>
                </td>
              </tr>
              <tr>
                <td width="40" align="left">&nbsp;</td>
                <td align="left"><input name="huiyuan_pass" type="password" id="huiyuan_pass" class="box2" /></td>
              </tr>
              <tr>
                <td width="40" align="left">&nbsp;</td>
                <td height="20" align="left">
                  <font style="font-size:14px; font-family:'宋体'; color:#000000">验证码</font>
                </td>
              </tr>
              <tr>
                <td width="40" align="left">&nbsp;</td>
                <td align="left">
                  <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td><input name="validate_code" type="text" maxlength="4" class="box3" /> </td>
                      <td><img class="code-image" src="getcode.aspx" height="15" border="0" title="点击刷新验证码" onclick="this.src=this.src+'?'"
                        /></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td width="40" align="left">&nbsp;</td>
                <td height="80" align="right"><input id="btnLogin" class="submit" value="" type="submit" name="btnLogin" /> &nbsp;&nbsp;&nbsp;
                </td>
              </tr>
              <tr>
                <td height="1" colspan="2" align="left" bgcolor="E5E5E5"></td>
              </tr>
            </table>
          </form>
        </td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
      </tr>
    </table>
  </body>

  </html>