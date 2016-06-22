<!--#include file="../../conn.aspx"-->
<!--#include file="inc/apartPage.aspx" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<TITLE>商城管理</TITLE>
<STYLE></STYLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />

<!--#include file="../../time/time.aspx"-->

<script language="javascript">
function checkuserinfo_2007()
{
	if(document.form1.pro_name.value.length<1) {
	document.form1.pro_name.focus();
	return false;
  }
  if(document.form1.pro_money_s.value.length<1) {
	document.form1.pro_money_s.focus();
	return false;
  }
  if(document.form1.pro_money.value.length<1) {
	document.form1.pro_money.focus();
	return false;
  }
  if(document.form3.pro_money1.value.length<1) {
	document.form3.pro_money1.focus();
	return false;
  }
  if(document.form1.pro_price.value.length<1) {
	document.form1.pro_price.focus();
	return false;
  }
  if(document.form1.pro_imgs.value.length<1) {
	document.form1.pro_imgs.focus();
	return false;
  }
   
  
}
function checkuserinfo_2008()
{	if(document.form1.pro_name.value.length<1) {
	document.form1.pro_name.focus();
	return false;
  }
  if(document.form1.pro_money_s.value.length<1) {
	document.form1.pro_money_s.focus();
	return false;
  }
  if(document.form1.pro_money.value.length<1) {
	document.form1.pro_money.focus();
	return false;
  }
  if(document.form3.pro_money1.value.length<1) {
	document.form3.pro_money1.focus();
	return false;
  }
  if(document.form1.pro_price.value.length<1) {
	document.form1.pro_price.focus();
	return false;
  }
  
}</script><%
	Dim action
	action = Trim(Request.QueryString("action"))
		Set Rs= Server.CreateObject("ADODB.Recordset")
%>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</HEAD>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">商户商品</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 商品管理 &gt; 商户商品</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />商户商品</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">




<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr valign="top" > 
      <td valign="bottom">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="137">
        <tr>
          <td height="184" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center"><table width="99%" border="0" align="center" cellpadding="3" cellspacing="2"class="content" >
  <tr><td width="64%" align="left" ><a href="?action=add">添加</a>　　<a href="?">列表</a></td>
    <form name="form2" method="post" action="?"> <td width="11%" align="right" >搜索：</td>
      <td ><select name="pid" id="pid">
        <option value="">所有商品</option>
        <%
        set rsm = conn.execute("select * from tbl_sinkia_class where pid=0 order by id")
        while not rsm.eof
        %>
        <option value="<%=rsm("id")%>"><%=rsm("pro_class")%></option>
        <%
	   rsm.movenext
	   wend
	   rsm.close
	   set rsm=nothing
	  
	   %>
        </select> 
        <select name="pro_isok" id="pro_isok">
          <option value="" selected>所有状态</option>
          <option value="0" >未审核</option>
          <option value="1" >已审核</option>
          </select>
        <input type="submit" name="button" id="button" value="搜索">      </td>
      </form>
    </tr>
</table>
      <%
	Select Case action
		Case "add"
			Call add()
		Case "addsave"
			Call addsave()
		Case "del"
			Call del()
		Case "mod"
			Call mods()			
		Case "adds"
			Call adds()
		Case "modsaves"
			Call modsaves()
		Case "modsave"
			Call modsave()
		Case Else
			Call member()
	End Select
	Sub member()
	sql="select * from tbl_product where 1=1 and pro_type=0"
	if request("pid")&""<>"" then
		sql=sql+"and pro_pid="&request("pid")
	end if
		sql=sql+"and pro_isok=1"
	sql=sql+" and pro_user<>'A00000000' order by pro_date desc"
	
	
	Rs.Open (sql),Conn,1,1
	IF Rs.Eof And Rs.Bof Then
		Rs.Close
		Set Rs=Nothing
%><br>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="2"class="content" >
  <tr>
    <td align="center" >暂时没有内容！</td>
  </tr>
</table>
<%
	Else
		
		ic=8
		Rs.pagesize=ic
		pages=Rs.pagecount
		epage=getPage(Trim(Request.QueryString("page")),pages)
		Rs.absolutepage=epage
	 
%><br>
<table width="99%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c1c1c1">
  <tr bgcolor="#e1e1e1" class="titlea1" >
    <td height="35" align="center">图片</td>
    <td height="35" align="center" >商品名称</td>
    <td height="35" align="center">市场价</td>
    <td height="35" align="center">会员价格</td>
    <td align="center">类别</td>
    <td align="center">库存</td>
     <td height="35" align="center">操作/管理</td>
  </tr>
  <%
  while not Rs.eof and ic>0
  
	SQLa="select * from tbl_sinkia_classa where id="&Rs("pro_pida")&""
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	if rsa.recordcount>0 then
		classa=rsa("pro_class")
	end if
  	rsa.close
	set rsa=nothing
  
  %>
  <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
    <td height="90" align="center" class="content"><span class="tdc"><img src="<%=rs("pro_imgs")%>" width="100" height="80"></span></td>
    <td height="90" align="center" class="content"><span class="tdc"><%=Rs("pro_name")%></span></td>
    <td height="90" align="center" class="content"><span style="color:#999999"><s><%=Rs("pro_money_s")%></s></span></td>
    <td height="90" align="center" class="content"><span class="tdc"><%=Rs("pro_money")%>&nbsp;</span></td>
    <td align="center" class="content"><span class="tdc"><%=classa%></span></td>
    <td align="center" class="content"><span class="tdc"><%=Rs("pro_num")-Rs("pro_sum")%></span></td>
    <td height="90" align="center" class="content">
	<span class="tdc"><a href="?action=mod&amp;id=<%=Rs("pro_id")%>">修改</a>　
	<a href="?id=<%=Rs("pro_id")%>&amp;action=del" onClick="if(confirm('你确定你要这样操作吗？删除将不能恢复！')){return true;}else{return false;}">删除</a>　
	<a href="add.aspx?id=<%=Rs("pro_id")%>">添加图片</a>　
	<a href="adda.aspx?id=<%=Rs("pro_id")%>">添加成份</a>　
	<a href="addc.aspx?id=<%=Rs("pro_id")%>">安心购物</a>　
	<a href="addd.aspx?id=<%=Rs("pro_id")%>">菜酒配</a>
	
	</span></td>
  </tr>
  <%
			Rs.MoveNext
			ic=ic-1
		wend
		Rs.Close
		Set Rs = Nothing
		
%>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
			  <tr>
				<td height="30" align="right">
					  <%call apartPage("?pid="&request("pid")&"&pro_isok="&request("pro_isok")&"&",8,epage,pages)%></td>
			  </tr>
			</table>
<%
	End IF
	response.End()
	end sub
	sub add()
%><br>
<table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999" class="content">
<form action="product_upload.aspx"  enctype="multipart/form-data" name="form1" method="post"><tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">商品名称：</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_name" type="text" size="30">
      <span class="STYLE1"> * </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">所属类别：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><select name="pro_pida" id="pro_pida">
        <%
        set rsm = conn.execute("select * from tbl_sinkia_classa where pid=0")
        while not rsm.eof
        %>
        <option value="<%=rsm("id")%>" ><%=rsm("pro_class")%></option>
        <%
        set rsm1 = conn.execute("select * from tbl_sinkia_classa where pid="&rsm("id"))
        while not rsm1.eof
        %>
        <option value="<%=rsm1("id")%>" >　|-<%=rsm1("pro_class")%></option>
        <%rsm1.movenext
	   wend
	   rsm1.close
	   set rsm1=nothing
	   rsm.movenext
	   wend
	   rsm.close
	   set rsm=nothing
	  
	   %>
    </select></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">市场价格：</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money_s" type="text" size="10"> 
      元<span class="STYLE1"> * </span></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">会员价格：</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money" type="text" size="10">      <span class="STYLE1">* </span></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">批发价格：</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money_p" type="text" value="10" size="10"> 
      元<span class="STYLE1"> * </span> （<font color="#FF0000">审核后将不可修改，请慎重！</font>）      </td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">商品价格：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_money1" type="text" value="0" size="10">      <span class="STYLE1"> * </span></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">积分：</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_price" type="text" value="0" size="10">
      <span class="STYLE1"> * </span></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">供货价：</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_gonghuo" type="text" value="0" size="10">
      <span class="STYLE1"> * </span></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">商品规格：</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_guige" type="text" size="20"></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">商品单位：</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_danwei" type="text" size="10"></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">商品颜色：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_yanse" type="text" id="pro_yanse" size="10"></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">库存数量：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_shulian" type="text" size="10"></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">商品起买量：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="first_shulian" type="text" value="0" size="10"></td>
  </tr>
  <tr class="tm">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE17 STYLE11">商品评价：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input type="radio" name="pingji" value="1" checked>
      ☆
      <input type="radio" name="pingji" value="2">
      ☆☆
      <input type="radio" name="pingji" value="3">
      ☆☆☆
      <input type="radio" name="pingji" value="4">
      ☆☆☆☆
      <input type="radio" name="pingji" value="5">
      ☆☆☆☆☆</td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">成份图片：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_cf" type="file" id="pro_cf" />
        <span class="STYLE1"> * </span> 图片格式：gif/jpg 图片大小&lt;300K</td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">成份介绍：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_cfjs" type="text" id="pro_cfjs" style="width:70%" /></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">商品介绍：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_js" type="text" style="width:70%" /></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">商品图片：</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><input name="pro_imgs" type="file" id="pro_imgs" />
      <span class="STYLE1"> * </span>       图片格式：gif/jpg 图片大小&lt;300K</td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center" bgcolor="#FFFFFF">
      <script charset="utf-8" src="../../../editor/kindeditor.js"></script>
<script charset="utf-8" src="../../../editor/lang/zh_CN.js"></script>
<script>    
var editor;
KindEditor.ready(function(K) {editor = K.create('textarea[name="pro_content"]', {allowFileManager : true});});
</script>
<textarea name="pro_content" style="width:99%;height:200px;visibility:hidden;"></textarea></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">发布者：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_user_" type="text" size="15" value="<%=session("hy_bianhao")%>" disabled>
      <input name="pro_user" type="hidden" size="15" value="<%=session("hy_bianhao")%>"></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">排名：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pm" type="text" id="pm" value="0" size="10" /></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">商品类别：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input type="checkbox" name="pro_Hot" value="1"/>
      商品推荐
      <input type="checkbox" name="pro_xinping" value="2"/>
      性价比之王 </td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">预售商品：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_type" type="radio" value="0" checked="checked"/>
      否
      <input name="pro_type" type="radio" value="1"/>
      是</td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">预售到期时间：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="shijian1" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=replace(formatdatetime(now(),2),"/","-")%>" /></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">审　　核：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><input name="pro_isok" type="radio" value="0" >
      否
        <input name="pro_isok" type="radio" value="1" checked>
        是</td>
  </tr>
  <tr>
    <td height="25" colspan="2" bgcolor="#FFFFFF">
      <input type="submit" name="Submit" value="提交" onClick="return checkuserinfo_2007();">
      <input type="reset" name="Submit2" value="重置">    </td>
    </tr>
		</form> 
</table>
<%end sub
sub addsave()
response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle  class='content'><div align=center>添加成功　　<a href=?action=add><font color='#FF0000'>继续添加</a>　　<a href=?><font color='#FF0000'>返回列表</font></a></div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
end sub
sub del()

sql="select * from tbl_product where pro_id="&request("id")


Rs.open sql,conn,1,1
	    'Set FSO = Server.CreateObject("Scripting.FileSystemObject")
		 'IF Rs("pro_imgs")&""<>"" Then  FSO.DeleteFile(server.mappath(Rs("pro_imgs")))
'Set FSO = Nothing


	 sql="delete from tbl_product where pro_id="&request("id")

	 conn.execute sql
	 

response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle  class='content'><div align=center>删除成功　　<a href=?><font color='#FF0000'>返回列表</font></a></div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
 rs.close
set rs=nothing
 end sub
 
 sub mods()
  sql="select * from tbl_product where pro_id="&request("id")

	rs.open sql,conn,1,1
	if not rs.eof then 
 %>
 <br><table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999" class="content">
   <form action="product_saveupload.aspx"  enctype="multipart/form-data" name="form1" method="post">
	
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">商品名称：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_name" type="text" size="30" value="<%=Rs("pro_name")%>">
      <span class="STYLE1">      *       </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">所属类别：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><select name="pro_pida" id="pro_pida">
        <%
        set rsm = conn.execute("select * from tbl_sinkia_classa where pid=0")
        while not rsm.eof
        %>
        <option value="<%=rsm("id")%>" <%if rs("pro_pida")=rsm("id") then%>selected="selected"<%end if%>><%=rsm("pro_class")%></option>
        <%
        set rsm1 = conn.execute("select * from tbl_sinkia_classa where pid="&rsm("id"))
        while not rsm1.eof
        %>
        <option value="<%=rsm1("id")%>" <%if rs("pro_pida")=rsm1("id") then%>selected="selected"<%end if%>>　|-<%=rsm1("pro_class")%></option>
        <%rsm1.movenext
	   wend
	   rsm1.close
	   set rsm1=nothing
	   rsm.movenext
	   wend
	   rsm.close
	   set rsm=nothing
	  
	   %>
    </select></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">市场价格：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money_s" type="text" size="10"  value="<%=Rs("pro_money_s")%>"> 
      元<span class="STYLE1"> * </span></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">价格：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money" type="text" size="10"  value="<%=Rs("pro_money")%>">      <span class="STYLE1"> * </span></td>
  </tr> <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">批发价格：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money_p" type="text" size="10" value="<%=Rs("pro_money_p")%>" <%if rs("pro_isok")=1 then%>disabled<%end if%>> 
      元<span class="STYLE1"> * </span> （<font color="#FF0000">审核后将不可修改，请慎重！</font>）      </td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF">商品价格：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_money1" type="text" value="<%=Rs("pro_money1")%>" size="10">
      元<span class="STYLE1"> * </span></td>
  </tr>
  <%if rs("pro_isok")=1 then%><input name="ssss" type="hidden" value="aa">
  <%else%>
  <input name="ssss" type="hidden" value="bb">
  <%end if%>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">积分</span>：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_price" type="text" size="10"   value="<%=Rs("pro_price")%>">
      <span class="STYLE1"> * </span></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF">供货价：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_gonghuo" type="text" id="pro_gonghuo"   value="<%=Rs("pro_gonghuo")%>" size="10">
      <span class="STYLE1"> * </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">WE：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="we" type="text" id="we"   value="<%=Rs("we")%>" size="10" /></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">DC：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="dc" type="text" id="dc"   value="<%=Rs("dc")%>" size="10" /></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">JR：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="jr" type="text" id="jr"   value="<%=Rs("jr")%>" size="10" /></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">商品规格：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_guige" type="text" size="20"  value="<%=Rs("pro_guige")%>"></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF">商品单位：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_danwei" type="text" size="10" value="<%=Rs("pro_danwei")%>" /></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF">商品颜色：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_yanse" type="text" id="pro_yanse" size="10"  value="<%=Rs("pro_yanse")%>"></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">库存数量：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_shulian" type="text" size="10"   value="<%=Rs("pro_num")%>"></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF">商品起买量：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="first_shulian" type="text" value="<%=rs("first_shulian")%>" size="10"></td>
  </tr>
  <tr class="tm">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE17">商品评价：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF">
	  <input type="radio" name="pingji" value="1" checked>
		  <img src="../../shop/im/14.jpg" />
      <input type="radio" name="pingji" value="2">
		  <%for i=1 to 2%><img src="../../shop/im/14.jpg" style="margin-right:2px;" /><%next%>
      <input type="radio" name="pingji" value="3">
		  <%for i=1 to 3%><img src="../../shop/im/14.jpg" style="margin-right:2px;" /><%next%>
      <input type="radio" name="pingji" value="4">
		  <%for i=1 to 4%><img src="../../shop/im/14.jpg" style="margin-right:2px;" /><%next%>
      <input type="radio" name="pingji" value="5">
		  <%for i=1 to 5%><img src="../../shop/im/14.jpg" style="margin-right:2px;" /><%next%>	 </td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">成份图片：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_cf" type="file" id="pro_cf" />
        <span class="STYLE1"> * </span> 图片格式：gif/jpg 图片大小&lt;300K</td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">成份介绍：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_cfjs" type="text" id="pro_cfjs" style="width:70%" value="<%=rs("pro_cfjs")%>" /></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">商品介绍：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_js" type="text" style="width:70%" value="<%=rs("pro_js")%>" /></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">类型：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="lx" type="text" size="10" value="<%=rs("lx")%>" />
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">品牌中英文：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="ppzyw" type="text" size="10"  value="<%=rs("ppzyw")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">葡萄品种：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="ptpz" type="text" size="10"  value="<%=rs("ptpz")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">年份：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="nf" type="text" size="10" value="<%=rs("nf")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">产地：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="cd" type="text" size="10"  value="<%=rs("cd")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">级别：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="jb" type="text" size="10"  value="<%=rs("jb")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">酒精度：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="jjd" type="text" size="10" value="<%=rs("jjd")%>" />
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">容量：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="rl" type="text" size="10"  value="<%=rs("rl")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">香味：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="xw" type="text" size="10" value="<%=rs("xw")%>" />
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">色泽：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="sz" type="text" size="10"  value="<%=rs("sz")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">酒体：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="jt" type="text" size="10"  value="<%=rs("jt")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">口感分类：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="kgfl" type="text" size="10"  value="<%=rs("kgfl")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">建议醒酒时间：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="jyxjsj" type="text" size="10"  value="<%=rs("jyxjsj")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">最佳品尝温度：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="zjpcwd" type="text" size="10" value="<%=rs("zjpcwd")%>" />
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">搭配菜肴：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="dpcy" type="text" size="10"  value="<%=rs("dpcy")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">橡木桶陈酿：</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="xmtcn" type="text" size="10"  value="<%=rs("xmtcn")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
	 <tr bgcolor="#DCE2ED">
       <td height="12" align="right" bgcolor="#FFFFFF"><span class="STYLE11">商品</span>图片：</td>
       <td height="12" align="left" bgcolor="#FFFFFF"><input name="pro_imgs" type="file" id="pro_imgs"/>
         图片格式：gif/jpg 图片大小&lt;150K</td>
     </tr>
     <tr>
       <td height="25" colspan="2" align="center" bgcolor="#FFFFFF">
         <script charset="utf-8" src="../../../editor/kindeditor.js"></script>
<script charset="utf-8" src="../../../editor/lang/zh_CN.js"></script>
<script>    
var editor;
KindEditor.ready(function(K) {editor = K.create('textarea[name="pro_content"]', {allowFileManager : true});});
</script>
<textarea name="pro_content" style="width:99%;height:200px;visibility:hidden;"><%=rs("pro_content")%></textarea></td>
     </tr>
     <input name="ids" type="hidden" value="<%=rs("pro_id")%>">
     <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">发布者：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_user_" type="text" size="15" value="<%=rs("pro_user")%>" disabled></td>
  </tr>
     <tr style="display:none">
       <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">排名：</span></td>
       <td height="25" align="left" bgcolor="#FFFFFF"><input name="pm" type="text" id="pm" value="<%=rs("pm")%>" size="10" /></td>
     </tr>
     <tr style="display:none">
       <td height="25" align="right" bgcolor="#FFFFFF">商品类别：</td>
       <td height="25" align="left" bgcolor="#FFFFFF"><input type="checkbox" name="pro_Hot" value="1" <%if rs("pro_hot")=1 then%>checked<%end if%>>
         商品推荐
         <input type="checkbox" name="pro_xinping" value="2" <%if rs("pro_xinping")=1 then%>checked<%end if%>/>
         性价比之王 </td>
     </tr>
  <tr style="display:none">
    <td align="right" bgcolor="#FFFFFF">预售商品：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_type" type="radio" value="0" <%if rs("pro_type")=0 then%>checked<%end if%>>
      否
      <input name="pro_type" type="radio" value="1" <%if rs("pro_type")=1 then%>checked<%end if%>>
      是</td>
  </tr>
  <tr style="display:none">
    <td align="right" bgcolor="#FFFFFF">预售到期时间：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="shijian1" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=rs("daoqi")%>" /></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">审　　核：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><input name="pro_isok" type="radio" value="0"  <%if rs("pro_isok")=0 then%> checked<%end if%>>
      否
        <input name="pro_isok" type="radio" value="1"  <%if rs("pro_isok")=1 then%> checked<%end if%>>
        是</td>
  </tr>
     <tr>
       <td height="25" colspan="2" bgcolor="#FFFFFF"> <input type="submit" name="Submit3" value="提交" onClick="return checkuserinfo_2008();">
           <input type="reset" name="Submit22" value="重置">       </td>
     </tr>
   </form>
 </table>
 <%else
 response.Write "没有你找到的信息~！"
 end if
 rs.close
set rs=nothing
 end sub

sub modsave()
response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle class='content'><div align=center>修改成功　　</div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
end sub%></td>
              </tr>
</table>

            
          </td>
        </tr>
      </table>
      </td>
    </tr>
</table>


      </td>
    </tr>
</table>

</BODY>
</HTML>
