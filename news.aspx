<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0" />
<title>新闻咨询</title>
<link rel="stylesheet" href="css/banner.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
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
</head>
<body>
<!--#include file="conn.aspx"-->
<!--#include file="jiance.aspx"-->
<%
'检测
	SQL="select * from view_video where bianhao='"&request("videobianhao")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if not rs.eof and not rs.bof then
		if rs("isok")=0 then
			response.Write "<script language=javascript>alert('该视频已失效');history.go(-1);</script>"
			response.end
		end if
		flag=rs("flag")
		title=rs("title")
		memo=rs("memo")
		num=rs("num")
		video=rs("video")
	end if
	rs.close
	set rs=nothing
%>
<title><%=title%></title>
<div class="title">
  <div class="back" onClick="javasprit:history.go(-1);">&lt;&nbsp;返回</div>
  <div class="info">
    <h1><%=title%></h1>
  </div>
  <div class="user" onClick="javasprit:location.href='out.aspx'"><%=request.Cookies("yrzzj")("tel")%> 您好!<br>退出</div>
</div>
<%if flag=1 then%>
	<video width="100%"  controls="controls" preload="auto">
	  <source src="/manager/<%=video%>" type="video/mp4" />
	  你是什么手机啊!!!该换啦!!
	</video>
<%else
	response.Write("网络视频")
end if%>
<div class="bofang"><span class="bofang-wz"><%=num%>次播放</span><span class="bofang_tp"><img src="img/3.png" style="width:20px;"></span></div>
<ul class="tab">
  <li onClick="javasprit:location.href='video.aspx?videobianhao=<%=request("videobianhao")%>&jihuoma=<%=request("jihuoma")%>'">简介</li>
  <li class="on">资讯</li>
</ul>
<div style="width:95%; margin:0 auto">
  <ul style=" width:100%; color:#999999">
  <%
  SQL="select * from news order by id desc"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	i=1
	while not rs.eof and not rs.bof 
  %>

    <li <%if i<6 then%> class="news_S"<%else%>class="news_N"<%end if%>><span class="news_title"><font>■</font>&nbsp;&nbsp;<a href="news_info.aspx?id=<%=rs("id")%>" title="<%=rs("title")%>" ><%=rs("title")%></a></span><span class="news_time"><%=rs("addtime")%></span></li>
<%
i=i+1
rs.movenext
wend 
rs.close
set rs=nothing
%>
  </ul>
</div>
<div  class="more" id="more" onClick="toggle();">更多资讯&nbsp;&nbsp;&nbsp;<img src="img/4.png"></div>

<div class="block_home_slider">
  <div id="home_slider" class="flexslider">
    <ul class="slides">
	<%
	 SQL="select * from guanggao where leibie=4"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	while not rs.eof and not rs.bof
	%>
      <li>
        <div class="slide"><A href="<%=rs("url")%>"><img src="/manager/tushu/<%=rs("img")%>" alt="<%=rs("title")%>" /></A></div>
      </li>
    <%
	rs.movenext
	wend 
	rs.close
	set rs=nothing
	%>
    </ul>
  </div>
</div>

<script type="text/javascript">
								$(function () {
									$('#home_slider').flexslider({
										animation : 'slide',
										controlNav : true,
										directionNav : true,
										animationLoop : true,
										slideshow : false,
										useCSS : false
									});
									
								});
							</script>
<script language="JavaScript" type="text/JavaScript">
function toggle(){
	var num=1
	var inputs=document.getElementsByClassName("news_N");
    for(var i=0;i<inputs.length;i++){
		if(inputs[i].className="news_N"){
			if(num<6){
			inputs[i].className="news_S";
			num=num+1
			}
		}
	}
}
</script>
</body>
</html>