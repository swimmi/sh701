<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
if request.form("submit")="确认修改" then
	if Request("title")="" then
		response.Write "<script language=javascript>alert('请填写标题！');history.go(-1);</script>"
		response.end
	end if
	if Request("memo")="" then
		response.Write "<script language=javascript>alert('请填写新闻内容！');history.go(-1);</script>"
		response.end
	end if
	set rs=server.CreateObject("adodb.recordset") 
	sql="select * from news where id='"&request("id")&"'"
	rs.Open sql,conn,1,3
    rs("title") =Request("title")
    rs("memo") =request("memo") 
    rs("addtime")= request("addtime")
    rs.Update
	rs.close
	set rs=nothing

	response.Write "<script language=javascript>alert('操作成功！');location.href='al_read.aspx';</script>"
	response.end

end if

	set rsa=server.CreateObject("adodb.recordset") 
	sqla="select * from news where id='"&request("id")&"'"
	rsa.Open sqla,conn,1,1


%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 企业信息 &gt; 新闻管理 &gt; 修改</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />修改</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px;">
	
<form id="form1" name="form1" method="post" action="update.aspx">
  <table width="100%" border="0" cellpadding="0" cellspacing="1">
    <tr>
      <td align="center"><table height="40" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="107" height="40" align="right" class="content">新闻标题：</td>
          <td width="1113"  align="left"><input name="title" type="text" id="title" value="<%=rsa("title")%>" size="50" />
            <input name="id" type="hidden" id="id" value="<%=request("id")%>" size="50" /></td>
            
          <td width="107" height="30" align="right" class="content">发布时间：</td>
          <td width="192" align="left"><input name="addtime" type="text" id="addtime" style="color:#999999" value="<%=rsa("addtime")%>" readonly=""/></td>
        </tr>
        <tr>
          <td height="30" colspan="4" align="center" valign="top" class="content"><textarea name="memo" style="width:99%;height:350px;visibility:hidden;"><%=rsa("memo")%></textarea></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">&nbsp;</td>
          <td align="left"><input type="submit" name="Submit" value="确认修改" />
            <input type="button" name="Submit2" value="返回上一层"  onclick="javasprit:history.go(-1)" /></td>
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
