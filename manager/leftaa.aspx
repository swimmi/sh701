<link href="../Css/Top_Left.Css" rel="stylesheet" type="text/css" />
<style>
.lanmua{font-size:13px;}
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
<div style="height:50px;"></div>
<div class="cn_sidebar" >
	<div class="cn_menu"> 
		<ul id="masterdiv">
			<li name="li_sub5">
				<a href="#" onClick="SwitchMenu('sub5')">商城信息</a>
				<ul id="sub5" style="display:none">
					<li class="lanmua" style="display:none"><a href="news/news.aspx" target='mainFrame'>发布新闻</a></li>
					<li class="lanmua" style="display:none"><a href="news/al_read.aspx" target='mainFrame'>新闻管理</a></li>
					<li class="lanmua"><a href="sinkia/webcom.aspx?newid=1" target='mainFrame'>帮助中心</a></li>
					<li class="lanmua"><a href="sinkia/i_imgs.aspx" target='mainFrame'>首页动画</a></li>
					<li class="lanmua"><a href="sinkia/i_imgsa.aspx" target='mainFrame'>广告位</a></li>
					<li class="lanmua"><a href="sinkia/i_imgsc.aspx" target='mainFrame'>预售广告</a></li>
					<li class="lanmua"><a href="sinkia/i_imgsd.aspx" target='mainFrame'>赠品广告</a></li>
					<li class="lanmua"><a href="sinkia/about.aspx?id=1" target='mainFrame'>关于我们</a></li>
					<li class="lanmua"><a href="sinkia/abouta.aspx" target='mainFrame'>关于我们图片</a></li>
					<li class="lanmua"><a href="sinkia/work.aspx" target='mainFrame'>人才招聘</a></li>
					<li class="lanmua"><a href="sinkia/worka.aspx" target='mainFrame'>人才招聘图片</a></li>
				</ul>
			</li>
			<li name="li_sub12">
				<a href="#" onClick="SwitchMenu('sub12')">发烧友之家</a>
				<ul id="sub12" style="display:none">
					<li class="lanmua"><a href="putao/abouta.aspx" target='mainFrame'>图片</a></li>
					<li class="lanmua"><a href="putao/add.aspx" target='mainFrame'>添加</a></li>
					<li class="lanmua"><a href="putao/gl.aspx" target='mainFrame'>管理</a></li>
				</ul>
			</li>
			<li name="li_sub11">
				<a href="#" onClick="SwitchMenu('sub11')">主题管理</a>
				<ul id="sub11" style="display:none">
					<li class="lanmua"><a href="zhuti/zhuti.aspx" target='mainFrame'>主题列表</a></li>
				</ul>
			</li>
			<li name="li_sub3">
				<a href="#" onClick="SwitchMenu('sub3')">商品管理</a>
				<ul id="sub3" style="display:none">
					<li class="lanmua"><a href="sinkia/class1.aspx" target='mainFrame'>类别管理</a></li>
					<li class="lanmua"><a href="sinkia/pp.aspx" target='mainFrame'>品牌管理</a></li>
					<li class="lanmua"><a href="sinkia/product.aspx" target='mainFrame'>商品管理</a></li>
					<li class="lanmua"><a href="sinkia/producta.aspx" target='mainFrame'>预售商品</a></li>
					<li class="lanmua"><a href="sinkia/productb.aspx" target='mainFrame'>申核管理</a></li>
					<li class="lanmua"><a href="sinkia/productc.aspx" target='mainFrame'>商户商品</a></li>
					<li class="lanmua"><a href="sinkia/pm.aspx" target='mainFrame'>商品排名</a></li>
					
				</ul>
			</li>
			<li name="li_sub2">
				<a href="#" onClick="SwitchMenu('sub2')">会员管理</a>
				<ul id="sub2" style="display:none">
					<li class="lanmua"><a href="member/zhuce.aspx" target='mainFrame'>注册协议</a></li>
					<li class="lanmua"><a href="member/al_read2.aspx" target='mainFrame'>正式会员列表</a></li>
					<li class="lanmua"><a href="member/al_read5.aspx" target='mainFrame'>查封会员列表</a></li>	
				</ul>
			</li>
			<li name="li_sub9">
				<a href="#" onClick="SwitchMenu('sub9')">商户管理</a>
				<ul id="sub9" style="display:none">
					<li class="lanmua"><a href="member/ruzhu.aspx" target='mainFrame'>入驻协议</a></li>
					<li class="lanmua"><a href="member/al_read21.aspx" target='mainFrame'>商户认证</a></li>
					<li class="lanmua"><a href="member/al_read22.aspx" target='mainFrame'>认证失败</a></li>
					<li class="lanmua"><a href="member/al_read20.aspx" target='mainFrame'>商户列表</a></li>
					<li class="lanmua"><a href="member/al_read50.aspx" target='mainFrame'>查封商户</a></li>	
					<li class="lanmua"><a href="sinkia/xuanchuang.aspx" target='mainFrame'>宣传图片</a></li>
				</ul>
			</li>
			<li name="li_sub4">
				<a href="#" onClick="SwitchMenu('sub4')">订单管理</a>
				<ul id="sub4" style="display:none">
					<li class="lanmua"><a href="sinkia/order.aspx" target='mainFrame'>订单管理</a></li>
					<li class="lanmua"><a href="sinkia/order1.aspx" target='mainFrame'>退货管理</a></li>
					<li class="lanmua"><a href="sinkia/order2.aspx" target='mainFrame'>订单列表</a></li>
				</ul>
			</li>

			<li name="li_sub6">
				<a href="#" onClick="SwitchMenu('sub6')">财务信息</a>
				<ul id="sub6" style="display:none">
					<li class="lanmua"><a href="yeji/qianbao.aspx" target='mainFrame'>账户管理</a></li>
				<%if right(left(Session("UserRole"),28),1)=100 then%>
					<li class="lanmua"><a href="yeji/huikuan.aspx" target='mainFrame'>汇款管理</a></li>
				<%end if%>
					<li class="lanmua"><a href="yeji/rec.aspx" target='mainFrame'>账户明细</a></li>
				</ul>
			</li>
			<li name="li_sub7">
				<a href="#" onClick="SwitchMenu('sub7')">消息留言</a>
				<ul id="sub7" style="display:none">
					<li class="lanmua"><a href="mail/send.aspx" target='mainFrame'>发送站内信</a></li>
					<li class="lanmua"><a href="mail/fa.aspx" target='mainFrame'>站内信管理</a></li>
					<li class="lanmua"><a href="mail/shou.aspx" target='mainFrame'>咨询及投诉</a></li>
				</ul>
			</li>
			<li name="li_sub8">
				<a href="#" onClick="SwitchMenu('sub8')">系统设置</a>
				<ul id="sub8" style="display:none">
					<li class="lanmua"><a href="system/manage.aspx" target='mainFrame'>管理员帐号管理</a></li>
					<li class="lanmua"><a href="system/address.aspx" target='mainFrame'>地区管理</a></li>
				</ul>
			</li>
			<li name="li_sub10">
				<a href="#" onClick="SwitchMenu('sub10')">辅助功能</a>
				<ul id="sub10" style="display:none">
					<li class="lanmua"><a href="system/login_hy.aspx" target='mainFrame'>会员登录日志</a></li>
					<li class="lanmua"><a href="system/login_gl.aspx" target='mainFrame'>管理员登录日志</a></li>
				</ul>
			</li>
		</ul>
	</div> 
</div>
