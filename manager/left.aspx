<link href="../Css/Top_Left.Css" rel="stylesheet" type="text/css" />
<style>
.lanmua{font-size:13px;}
body {
	background-image: url(images/bg.gif);
}
</style>

<script src="Inc/jquery-1.2.6.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function setDefault(){
		$("ul").each(function()
		{
			if($(this).css("display")=="block")	
				$(this).parents("li").addClass("on");
			});
		}
	function SwitchMenu(obj){
		var el = document.getElementById(obj);
		var ar = document.getElementById("masterdiv").getElementsByTagName("ul"); 
		if(el.style.display != "block"){ 
			for (var i=0; i<ar.length; i++){
				ar[i].style.display = "none"; 
			}
			el.style.display = "block";
			}
		else{
			el.style.display = "none";
		}
			//设置on样式
		$("li[name^='li_']").removeClass("on");
		$("li[name='li_"+obj+"']").addClass("on");
		}
</script>
<div style="height:10px;"></div>
<div class="cn_sidebar" >
	<div class="cn_menu"> 
		<ul id="masterdiv">
			<li name="li_sub1">
				<a href="#" onClick="SwitchMenu('sub1')">用户管理</a>
				<ul id="sub1" style="display:none">
					<li class="lanmua"><a href="member/al_read2.aspx" target='mainFrame'>用户列表</a></li>
				</ul>
			</li>
			<li name="li_sub2">
				<a href="#" onClick="SwitchMenu('sub2')">视频管理</a>
				<ul id="sub2" style="display:none">
					<li class="lanmua"><a href="video/b/index.aspx" target='mainFrame'>上传视频</a></li>
					<li class="lanmua"><a href="sinkia/product.aspx" target='mainFrame'>视频管理</a></li>
				</ul>
			</li>	
			<li name="li_sub3">
				<a href="#" onClick="SwitchMenu('sub3')">新闻资讯</a>
				<ul id="sub3" style="display:none">
					<li class="lanmua"><a href="news/news.aspx" target='mainFrame'>添加资讯</a></li>
					<li class="lanmua"><a href="news/al_read.aspx" target='mainFrame'>最新资讯</a></li>
				</ul>
			</li>	
			<li name="li_sub4">
				<a href="#" onClick="SwitchMenu('sub4')">系统设置</a>
				<ul id="sub4" style="display:none">
					<li class="lanmua"><a href="tushu/read.aspx" target='mainFrame'>图书印刷管理</a></li>
					<li class="lanmua"><a href="tushu/jihuo.aspx" target='mainFrame'>生成激活码</a></li>
					<li class="lanmua"><a href="sinkia/class11.aspx" target='mainFrame'>参数设置</a></li>
					<li class="lanmua"><a href="tushu/guanggao.aspx" target='mainFrame'>广告管理</a></li>
				</ul>
			</li>	
			<li name="li_sub5">
				<a href="#" onClick="SwitchMenu('sub5')">统计报表</a>
				<ul id="sub5" style="display:none">
					<li class="lanmua"><a href="tongji/index.aspx" target='mainFrame'>观看统计</a></li>
				</ul>
			</li>	
			<li name="li_sub8">
				<a href="#" onClick="SwitchMenu('sub8')">安全设置</a>
				<ul id="sub8" style="display:none">
					<li class="lanmua"><a href="system/manage.aspx" target='mainFrame'>添加管理员</a></li>
				</ul>
			</li>
		</ul>
	</div> 
</div>
