<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0" />
<title>激活成功</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
/* iphone 竖着|横着 */
@media only screen and (min-device-width : 320px) and (max-device-width : 480px) and (orientation : portrait){
}
@media only screen and (min-device-width : 320px) and (max-device-width : 480px) and (orientation : landscape){
}
/* ipad */
@media only screen and (min-device-width : 768px) and (max-device-width : 1024px) and (orientation : portrait){
}
@media only screen and (min-device-width : 768px) and (max-device-width : 1024px) and (orientation : landscape){
}
</style>
<body class="jihuoa">
<!--#include file="conn.aspx"-->
<!--#include file="jiance.aspx"-->
<%
'查询激活码信息
if request("jhm")="" then
		response.Write "<script language=javascript>alert('请填写激活码！');history.go(-1);</script>"
		response.end
end if
	SQL="select * from view_jihuoma where jihuoma='"&request("jhm")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if rs.recordcount=0 then
		response.Write "<script language=javascript>alert('激活码无效！');history.go(-1);</script>"
		response.end
	else
		if rs("flag")=0 then
			response.Write "<script language=javascript>alert('激活码无效！');history.go(-1);</script>"
			response.end
			
			
		end if
	end if
	'激活码记录查询(不同手机号激活三次)
	SQL="select * from huiyuan_jihuoma where jihuoma='"&request("jhm")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if rs.recordcount>=3 then
		response.Write "<script language=javascript>alert('此激活码激活次数超过上限！');history.go(-1);</script>"
		response.end
	end if
	rs.close
	set rs=nothing
	
	'添加激活码记录
	SQL="select * from huiyuan_jihuoma where jihuoma='"&request("jhm")&"' and huiyuan_id="&request.Cookies("yrzzj")("id")
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,3
	if rs.recordcount=0 then
		rs.addnew
		rs("jihuoma")=request("jhm")
		rs("huiyuan_id")=request.Cookies("yrzzj")("id")
		rs("addtime")=now
		rs.update
	end if
	rs.close
	set rs=nothing
	'记录
	SQL="select * from weixing where jihuoma='"&request("jhm")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if not rs.eof and not rs.bof then
	tushutitle=rs("tushutitle")
	videobianhao=rs("videobianhao")
	jihuoma=rs("jihuoma")
	end if
	rs.close
	set rs=nothing
%>
<div class="title">
  <div class="back" onClick="javasprit:history.go(-1);">&lt;&nbsp;返回</div>
  <div class="info">
    <h1>用户激活</h1>
  </div>
  <div class="user" onClick="javasprit:location.href='out.aspx'">退出</div>
</div>
<h1 class="welcome">您已经注册手机号:<%=request.Cookies("yrzzj")("tel")%><br>并激活了图书《<%=tushutitle%>》</h1>
<div class="sub">
	<div class="sub_more"><input name="" type="button"  value="激活更多图书" onClick="javasprit:location.href='jihuo.aspx'" /></div>
	<div class="sub_video"><input name="" type="button" value="立刻观看" onClick="javasprit:location.href='video.aspx?videobianhao=<%=videobianhao%>&amp;jihuoma=<%=jihuoma%>'" /></div>
</div>

</body>
</html>
