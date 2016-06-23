
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../../conn.aspx"-->
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 视频管理 &gt; 二维码管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />二维码管理</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px;">



 <table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="280" align="center" valign="center">
	 
	 
<%
	set rs=server.createobject("adodb.recordset")   
    sql = "select *  from weixing where id='"&request("id")&"'"   
    rs.open sql,conn,1,3
	videoid=rs("videoid")
	videobianhao=rs("videobianhao")
	videotitle=rs("videotitle")
	tushuid=rs("tushuid")
	tushutitle=rs("tushutitle")
	xuliehao=rs("xuliehao")
	jihuoma=rs("jihuoma")
	url=rs("url")
	banci=rs("banci")
	yingci=rs("yingci")
	rs.close
	set rs=nothing
%> 
	 
	 
	 
<input id="text" type="text" value="http://192.168.1.134/video.aspx?bh=<%=videobianhao%>&jhm=<%=jihuoma%>" style="width:100%;display:none" />
<div id="qrcode" style="width:250px; height:250px;" ></div>
<script src='js/jquery-c152c51c4dda93382a3ae51e8a5ea45d.js'></script>
<script src='js/qrcode.min.js'></script>
<script src="js/stopExecutionOnTimeout-6c99970ade81e43be51fa877be0f7600.js"></script>
<script>
	var qrcode = new QRCode('qrcode');
	function makeCode() {
	var elText = document.getElementById('text');
	if (!elText.value) {
	alert('Input a text');
	elText.focus();
	return;
	}
	qrcode.makeCode(elText.value);
	}
	makeCode();
	$('#text').on('blur', function () {
	makeCode();
	}).on('keydown', function (e) {
	if (e.keyCode == 13) {
	makeCode();
	}
	});
</script>	 </td>
   </tr>
   <tr>
     <td align="center" valign="top"><%=videotitle%><br />【第<%=banci%>版次】【第<%=yingci%>印次】</td>
   </tr>
   <tr>
     <td height="40" align="center" valign="bottom"><input type="submit" name="Submit22" value="返回上一层" style="border:1px #CCCCCC solid; background-color:#FFFFFF; line-height:20px; font-family:'微软雅黑';" onclick="javascript:history.go(-1)"/></td>
   </tr>
 </table></td>
  </tr>
</table>
</body>
</html>
