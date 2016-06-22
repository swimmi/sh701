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
<!--#include file="../../conn.aspx"-->
<!--#include file="../jiance.aspx"--> 
<script charset="utf-8" src="../../editor/kindeditor.js"></script>
<script charset="utf-8" src="../../editor/lang/zh_CN.js"></script>
<script>    
var editor;
KindEditor.ready(function(K) {editor = K.create('textarea[name="memo"]', {allowFileManager : true});});
</script>
<%	 
if request.form("submit")="确认发送" then
	if Request("liuyan_title")="" then
		response.Write "<script language=javascript>alert('请填写留言标题！');history.go(-1);</script>"
		response.end
	end if
	if Request("liuyan_memo")="" then
		response.Write "<script language=javascript>alert('请填写留言内容！');history.go(-1);</script>"
		response.end
	end if


set rs_addnew=server.CreateObject("adodb.recordset") 
sql_addnew="select * from tbl_liuyan"
rs_addnew.Open sql_addnew,conn,1,3
	rs_addnew.AddNew
    rs_addnew("liuyan_title") =Request.Form("liuyan_title")
	rs_addnew("liuyan_bianhao") ="A00000000"
 	rs_addnew("liuyan_to") ="A00000000"
  	rs_addnew("liuyan_memo") =Request.Form("liuyan_memo")
	rs_addnew("liuyan_date") =now()
	rs_addnew("leibie") =1
    rs_addnew.Update
	rs_addnew.close
	set rs_addnew=nothing

	response.Write "<script language=javascript>alert('成功发布！');location.href='send.aspx';</script>"
	response.end

end if
   %>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">发送站内信</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 消息留言 &gt; 发送站内信</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />发送站内信</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">


	<form id="form1" name="form1" method="post" action="send.aspx" style="margin:0px;">
	  <table width="100%" border="0" cellpadding="0" cellspacing="1">
		<tr>
		  <td align="center"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
			<tr>
			  <td width="11%" height="30" align="right">留言标题：</td>
			  <td width="89%" height="30" align="left"><input name="liuyan_title" type="text" id="liuyan_title" size="50" maxlength="50" /></td>
			</tr>
			<tr>
			  <td align="right" valign="top">留言内容：</td>
			  <td align="left" valign="top">
				<textarea name="liuyan_memo" cols="80" rows="10" id="liuyan_memo" ></textarea></td>
			</tr>
			<tr>
			  <td align="right" valign="top">&nbsp;</td>
			  <td align="left"><input type="submit" name="Submit" value="确认发送" /></td>
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
