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
<%	 

	set rsa=server.CreateObject("adodb.recordset") 
	sqla="select * from tbl_pt where id='"&request("id")&"'"
	rsa.Open sqla,conn,1,1


%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">修改</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 发烧友之家 &gt; 管理 &gt; 修改</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />系统公告</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px; padding-top:10px;">
	
<form id="form1" name="form1" method="post" action="update1.aspx" enctype="multipart/form-data">
  <table width="100%" border="0" cellpadding="0" cellspacing="1">

    <tr>
      <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="69" height="30" align="right" class="content">标题：</td>
          <td width="1113"  align="left"><input name="title" type="text" id="title" value="<%=rsa("title")%>" size="50" />
            <input name="id" type="hidden" id="id" value="<%=request("id")%>" size="50" /></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">广告图：</td>
          <td  align="left"><span style="font-size:12px;">
            <input name="imgs" type="file" id="imgs"/>
          </span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">介绍：</td>
          <td  align="left"><input name="js" type="text" id="js" value="<%=rsa("js")%>" size="50" /></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">类型：</td>
          <td  align="left"><select name="select">
              <option value="1" <%if rsa("type")=1 then%>selected<%end if%>>美食</option>
              <option value="2" <%if rsa("type")=2 then%>selected<%end if%>>养生</option>
              <option value="3" <%if rsa("type")=3 then%>selected<%end if%>>旅游</option>
              <option value="4" <%if rsa("type")=4 then%>selected<%end if%>>风土</option>
              <option value="5" <%if rsa("type")=5 then%>selected<%end if%>>酿造</option>
              <option value="6" <%if rsa("type")=6 then%>selected<%end if%>>品鉴</option>
              <option value="7" <%if rsa("type")=7 then%>selected<%end if%>>种植</option>
              <option value="8" <%if rsa("type")=8 then%>selected<%end if%>>产地</option>
              <option value="9" <%if rsa("type")=9 then%>selected<%end if%>>酒展</option>
              <option value="10" <%if rsa("type")=10 then%>selected<%end if%>>课程</option>
              <option value="11" <%if rsa("type")=11 then%>selected<%end if%>>新闻</option>
              <option value="12" <%if rsa("type")=12 then%>selected<%end if%>>活动</option>
             <!-- <option value="13" <%if rsa("type")=13 then%>selected<%end if%> style="display:none">杂谈</option>-->
            </select>
          </td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center" valign="top" class="content"><textarea name="memo" style="width:99%;height:350px;visibility:hidden;"><%=rsa("memo")%></textarea></td>
          </tr>
        <tr>
          <td height="30" align="right" class="content">&nbsp;</td>
          <td align="left"><input type="submit" name="Submit" value="确认修改" /></td>
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
