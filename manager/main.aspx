<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>
    <%=request.Cookies("bj")("webname")%>
  </title>
  <link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
    <!-- .STYLE12 {
      color: #FF0000
    }
    
    .STYLE13 {
      color: #666666
    }
    
    -->
  </style>
</head>

<body>
  <!--#include file="../conn.aspx"-->
  <!--#include file="jiance.aspx"-->
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td height="80" colspan="2">首页</td>
    </tr>
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td><img src="images/8.jpg" width="3" height="27" /></td>
      <td width="100%" rowspan="2" background="images/10.jpg"><br />
        <br />
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="50%" height="183" valign="top">
              <table width="95%" border="0" cellpadding="0" cellspacing="0">
                <tr class="content">
                  <td width="150" height="26" align="right">
                    <font style="color:#2883AC;">尊敬的管理员：</font>
                  </td>
                  <td align="left">
                    <%=session("hy_name")%>，您好!</td>
                </tr>
                <tr>
                  <td width="150" height="26" align="right" class="content">
                    <font style="color:#2883AC;">会员注册总数：</font>
                  </td>
                  <td align="left" class="content">
                    <font color="#FF0000" style="font-weight:bold">
                      <%
SQL="select 'aa'=isnull(count(*),0) from huiyuan"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
	response.Write rs("aa")
rs.close
set rs=nothing			  
%>
                    </font>个 </td>
                </tr>
                <tr>
                  <td width="150" height="26" align="right" class="content">
                    <font style="color:#2883AC;">今日注册会员数：</font>
                  </td>
                  <td align="left" class="content">
                    <font color="#FF0000" style="font-weight:bold">
                      <%
SQL="select 'aa'=isnull(count(*),0) from huiyuan where datediff(day,addtime,getdate())=0"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
	response.Write rs("aa")
rs.close
set rs=nothing			  
			  %>
                    </font>个 </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
      <td><img src="images/9.jpg" width="3" height="27" /></td>
    </tr>
    <tr>
      <td height="200" background="images/12.jpg"></td>
      <td background="images/13.jpg"></td>
    </tr>
    <tr>
      <td colspan="3" background="images/11.jpg"><img src="images/11.jpg" width="19" height="4" /></td>
    </tr>
  </table>
  <br />
</body>

</html>