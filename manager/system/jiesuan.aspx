 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE11 {color: #0790FF}
-->
</style>
</head>
<body>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">数据结算管理</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 系统设置 &gt; 数据结算管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />数据结算管理</td>
  </tr>
  <tr>
    <td  bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	

<table width="99%" border="0" align="center" 
      cellpadding="1" cellspacing="1" bgcolor="#999999" class="content">
  <tbody>
    <tr bgcolor="#F3FBFE">
      <td align="middle" valign="center" bgcolor="#FFFFFF"><table 
                  width="97" height="80" border="1" align="center" cellpadding="0" cellspacing="1" 
                  bordercolor="#ffffff" bgcolor="#dfe7ef" class="content">
        <tbody>
          <tr>
            <td width="91" align="middle" valign="top" bgcolor="#e9eef8"><p align="center"><a href="001.aspx" onclick="javascript:if(!confirm('\n特别提示！\n请慎重进行该操作！\n清空后将无法进行恢复。'))  return  false; "><img 
                        border="0" height="54" 
                        src="../images/jiesuan.gif" 
                        width="60" /><br />
              奖金结算</a></p></td>
          </tr>
        </tbody>
      </table></td>
      <td align="middle" valign="center" bgcolor="#FFFFFF"><table 
                  width="97" height="80" border="1" align="center" cellpadding="0" cellspacing="1" 
                  bordercolor="#ffffff" bgcolor="#dfe7ef" class="content">
        <tbody>
          <tr>
            <td width="91" align="middle" valign="top" bgcolor="#e9eef8"><p align="center"><a href="del.aspx" onClick="javascript:if(!confirm('\n特别提示！\n请慎重进行该操作！\n清空后将无法进行恢复。'))  return  false; "><img 
                        border="0" height="54" 
                        src="../images/jiesuan.gif" 
                        width="60" /><br />
                        清空数据</a></p></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<table width="300" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
  <%if request("err")<>"" then%>
  <tr>
    <td height="25">&nbsp;</td>
  </tr>
  <tr>
    <td height="25"> 操作结果：<%=request("err")%></td>
  </tr>
  <tr>
    <td height="25">□结算累计时间： <%=request("time")%>分钟</td>
  </tr>
  <%end if%>
  <tr>
    <td height="25">&nbsp;</td>
  </tr>
</table>
</td></tr></table>
</body>
</html>
