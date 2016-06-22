<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0" />
<title>资讯详细</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
<!--#include file="conn.aspx"-->
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
<%
	 SQL="select * from news where id="&request("id")
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	
	title=rs("title")
	addtime=rs("addtime")
	memo=rs("memo")
	
	rs.close
	set rs=nothing
%>
<body class="news_info" >

<div class="title">
  <div class="back" onClick="javasprit:history.go(-1);">&lt;&nbsp;返回</div>
  <div class="info">
    <h1><%=title%></h1>
  </div>
  <div class="user" onClick="javasprit:location.href='out.aspx'"><%=request.Cookies("yrzzj")("tel")%> 您好!<br>
    退出</div>
</div>
<div class="memo">
<h1 style="font-size:1.5em"><%=title%></h1>
<div class="info">育儿周周记 &nbsp;&nbsp;<%=addtime%></div>
<div class="memo">
  <%
memo=replace(memo,"width","")
memo=replace(memo,"height","")
memo=replace(memo,"<img ","<img width='100%' ")
response.Write(memo)
%>
</div>
</div>
</body>
</html>