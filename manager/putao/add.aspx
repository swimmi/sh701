<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="../../conn.aspx"-->
<script charset="utf-8" src="../../editor/kindeditor.js"></script>
<script charset="utf-8" src="../../editor/lang/zh_CN.js"></script>
<script>    
var editor;
KindEditor.ready(function(K) {editor = K.create('textarea[name="memo"]', {allowFileManager : true});});
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">添加</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 发烧友之家 &gt; 添加</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />添加</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px; padding-top:10px;">
	
<form action="add1.aspx"  enctype="multipart/form-data" name="form1" method="post">
  <table width="100%" border="0" cellpadding="0" cellspacing="1">

    <tr>
      <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="107" height="30" align="right" class="content">标题：</td>
          <td width="1069"  align="left"><input name="title" type="text" id="title" size="50" /></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">广告图：</td>
          <td  align="left"><span style="font-size:12px;">
            <input name="imgs" type="file" id="imgs"/>
          </span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">介绍：</td>
          <td  align="left"><input name="js" type="text" id="js" size="50" /></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">类型：</td>
          <td  align="left"><select name="select">
              <option value="1">美食</option>
              <option value="2">养生</option>
              <option value="3">旅游</option>
              <option value="4">风土</option>
              <option value="5">酿造</option>
              <option value="6">品鉴</option>
              <option value="7">种植</option>
              <option value="8">产地</option>
              <option value="9">酒展</option>
              <option value="10">课程</option>
              <option value="11">新闻</option>
              <option value="12">活动</option>
              <!--<option value="13" style="display:none">杂谈</option>-->
            </select>          </td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center" valign="top" class="content"><textarea name="memo" style="width:99%;height:350px;visibility:hidden;"></textarea></td>
          </tr>
        <tr>
          <td height="30" align="right" class="content">发布时间：</td>
          <td align="left"><input name="addtime" type="text" id="addtime" style="color:#999999" value="<%=now()%>" readonly=""/></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">&nbsp;</td>
          <td height="40" align="left" valign="bottom"><input type="submit" name="Submit" value="确认发布" /></td>
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
