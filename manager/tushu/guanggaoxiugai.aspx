<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="../../conn.aspx"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">修改广告</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 系统设置 &gt; 广告管理 &gt; 修改广告</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />修改广告</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px; padding-top:10px;">
	
<%

	set rs=server.CreateObject("adodb.recordset") 
	sql="select * from guanggao where id='"&request("id")&"'"
	rs.Open sql,conn,1,3
    title=rs("title")
    url =rs("url")
    leibie= rs("leibie")
	rs.close
	set rs=nothing


%>
	
	
	
<form id="form1" name="form1" method="post" action="guanggaoxiugai1.aspx" enctype="multipart/form-data">
  <table width="100%" border="0" cellpadding="0" cellspacing="1">

    <tr>
      <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="107" height="30" align="right" class="content">广告名称：</td>
          <td width="1069"  align="left"><input name="title" type="text" id="title" size="50" value="<%=title%>"/><input name="id" type="hidden" id="id" size="50" value="<%=request("id")%>"/>
            <span class="hong">*</span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">广告展示位置：</td>
          <td  align="left"><select name="leibie">
            <option value="1" <%if leibie=1 then%>selected<%end if%>>登录界面</option>
            <option value="2" <%if leibie=2 then%>selected<%end if%>>注册界面</option>
            <option value="3" <%if leibie=3 then%>selected<%end if%>>激活码界面</option>
            <option value="4" <%if leibie=4 then%>selected<%end if%>>播放界面</option>
            </select>
            <span class="hong">*</span>            </td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">图片：</td>
          <td  align="left"><input name="img" type="file" id="img" />
            <span class="hong">*</span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">广告超链接：</td>
          <td  align="left"><input name="url" type="text" id="url" size="50"  value="<%=url%>"/></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">&nbsp;</td>
          <td height="40" align="left" valign="bottom"><input type="submit" name="Submit" value="确认修改" />
            <input type="button" name="Submit2" value="返回上一页" onclick='JavaScript:history.go(-1);' /></td>
        </tr>
      </table>
        </td>
    </tr>
  </table>
</form>

	
    </td>
  </tr>
</table>
</body>
</html>
