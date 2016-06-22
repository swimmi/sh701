<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0" />
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
<body>
<!--#include file="conn.aspx"-->
<!--#include file="jiance.aspx"-->
<%
'有无权限播放
	SQL="select * from huiyuan_jihuoma where jihuoma='"&request("jihuoma")&"' and huiyuan_id="&request.Cookies("yrzzj")("id")

	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if rs.recordcount=0 then
		response.Write "<script language=javascript>location.href='jihuo.aspx';</script>"
		response.end
	end if
	rs.close 
	set rs=nothing
	

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
		tushutitle=rs("tushutitle")
	end if
	rs.close
	set rs=nothing
'添加播放时间
conn.execute("insert into jilu values("&request.Cookies("yrzzj")("tel")&",'"&tushutitle&"','"&title&"','"&now()&"') ")
'播放数量
conn.execute("update video set num="&num+1&" where bianhao='"&request("videobianhao")&"'")
%>
<title><%=title%></title>
<div class="title">
  <div class="back" onClick="javasprit:history.go(-1);">&lt;&nbsp;返回</div>
  <div class="info">
    <h1><%=title%></h1>
  </div>
  <div class="user" onClick="javasprit:location.href='out.aspx'"><%=request.Cookies("yrzzj")("tel")%> 您好!<br>
    退出</div>
</div>
<%if flag=1 then%>
<div style="margin-top:35px;"><video width="100%"  controls="controls" preload="auto" >
  <source src="/manager/<%=video%>" type="video/mp4" />
  你是什么手机啊!!!该换啦!! </video></div>

<%else%><div style="margin-top:35px;">
<%response.Write(video)%>
 </div>
<%end if%>
<div class="bofang"><span class="bofang-wz"><%=num%>次播放</span><span class="bofang_tp"><img src="img/3.png" style="width:20px;"></span></div>
<style>
#menu{ width:100%; overflow:hidden; }
#menu #nav {display:block;width:100%;padding:0;margin:0;list-style:none;}
#menu #nav li {float:left;width:50%;}
#menu #nav li a {display:block;line-height:27px;text-decoration:none;padding:0 0 0 5px; text-align:center; color:#333;height:35px; line-height:35px; text-align:center; border-bottom:3px #dbdbdb solid; color:#dbdbdb;}
#menu_con{ border-top:none}
.tag{ padding:10px; overflow:hidden;}
#menu #nav li a.selected{  border-bottom:3px #28b1ff solid; color:#28b1ff;}

</style>
<div id="menu">
  <!--tag标题-->
  <ul id="nav" >
    <li><a href="#" class="selected">简介</a></li>
    <li><a href="#" class="">资讯</a></li>
  </ul>
  <!--二级菜单-->
  <div id="menu_con">
    <div class="tag" style="display:block">
      <h1 style="color:#666"><%=title%></h1>
      <h5 style="color:#999"><%=memo%></h5>
    </div>
    <div class="tag" style="display:none">
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
	  <ul><li  class="more" id="more" onClick="toggle();" >更多资讯&nbsp;&nbsp;&nbsp;<img src="img/4.png"></li></ul>
    </div>
  </div>
  
  
</div>
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
        <div class="slide"><A href="<%=rs("url")%>"  target="_blank"><img src="/manager/tushu/<%=rs("img")%>" alt="<%=rs("title")%>" /></A></div>
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
		directionNav : false,
		animationLoop : true,
		slideshow : true,
		 slideshowSpeed: 4000,  
		useCSS : false
	});
});
</script>
<script>
var tabs=function(){
    function tag(name,elem){
        return (elem||document).getElementsByTagName(name);
    }
    //获得相应ID的元素
    function id(name){
        return document.getElementById(name);
    }
    function first(elem){
        elem=elem.firstChild;
        return elem&&elem.nodeType==1? elem:next(elem);
    }
    function next(elem){
        do{
            elem=elem.nextSibling;  
        }while(
            elem&&elem.nodeType!=1  
        )
        return elem;
    }
    return {
        set:function(elemId,tabId){
            var elem=tag("li",id(elemId));
            var tabs=tag("div",id(tabId));
            var listNum=elem.length;
            var tabNum=tabs.length;
            for(var i=0;i<listNum;i++){
                    elem[i].onclick=(function(i){
                        return function(){
                            for(var j=0;j<tabNum;j++){
                                if(i==j){
                                    tabs[j].style.display="block";
                                    //alert(elem[j].firstChild);
                                    elem[j].firstChild.className="selected";
                                }
                                else{
                                    tabs[j].style.display="none";
                                    elem[j].firstChild.className="";
                                }
                            }
                        }
                    })(i)
            }
        }
    }
}();
tabs.set("nav","menu_con");//执行
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