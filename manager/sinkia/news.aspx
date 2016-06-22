<!--#include file="../../conn.aspx"-->
<!--#include file="inc/apartPage.aspx" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<TITLE>商城管理</TITLE>
<STYLE></STYLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</HEAD>

<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>

<%
	Dim action
	action = Trim(Request.QueryString("action"))
		Set Rs= Server.CreateObject("ADODB.Recordset")
%><script language="javascript">
function checkuserinfo_2007()
{
  if(document.form1.title.value.length<1) {
	document.form1.title.focus();
	return false;
  }
 
}</script>
</HEAD>
<BODY bgColor=#FFFFFF 
leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<center>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2" align="left">商城公告</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" align="left" bgcolor="EEEEEE" class="titlea">首页 &gt; 网上商城 &gt; 商城公告</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" align="left" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />商城公告</td>
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
              <td height="500" valign="top"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="2"class="content" >
  <tr>
    <td width="4%" height="30" align="left" ><a href="?action=add">添加</a></td>
    <td width="96%" height="30" align="left" ><a href="?">列表</a></td>
   <form name="form2" method="post" action="?"> </form>
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
	if request("pid")&""<>"" then
	Rs.Open ("select * from tbl_sinkia_news where pid="&request("pid")&" order by addtime desc"),Conn,1,1
	else
	Rs.Open ("select * from tbl_sinkia_news order by addtime desc"),Conn,1,1
	end if
	IF Rs.Eof And Rs.Bof Then
		Rs.Close
		Set Rs=Nothing
%>
<table width="96%" border="0" align="center" cellpadding="3" cellspacing="2"class="content" >
  <tr>
    <td >暂时没有内容！</td>
  </tr>
</table>
<%
	Else
		ic=20
		Rs.pagesize=ic
		pages=Rs.pagecount
		epage=getPage(Trim(Request.QueryString("page")),pages)
		Rs.absolutepage=epage
		
	 
%>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c1c1c1">
  <tr bgcolor="#e1e1e1" class="titlea1">
    <td height="40" align="center">标题</td>
    <td height="40" align="center">发布时间</td>
    <td height="40" align="center">点击数</td>
    <td height="40" align="center">操作</td>
  </tr>
<%
		Dim UserName
		while not Rs.eof and ic>0
%>
  <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''" class="content">
    <td height="35" align="center"><%=Rs("title")%></td>
    <td height="35" align="center"><%=Rs("addtime")%></td>
    <td height="35" align="center"><%=Rs("bits")%></td>
    <td height="35" align="center"><a href="?action=mod&amp;id=<%=Rs("id")%>">修改</a>　<a href="?id=<%=Rs("id")%>&amp;action=del" onClick="if(confirm('你确定你要这样操作吗？删除将不能恢复！')){return true;}else{return false;}">删除</a></td>
  </tr>
   <%
			Rs.MoveNext
			ic=ic-1
		wend
		Rs.Close
		Set Rs = Nothing
%>
</table>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
  <tr>
    <td height="30" align="right"><%call apartPage("?pid="&request("pid")&"&",8,epage,pages)%></td>
  </tr>
</table>
<%
	End IF
	Conn.Close
	Set Conn = Nothing
	end sub
	sub add()
%><br>
<table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999" class="content">
<form action="?action=adds" name="form1" method="post">
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">标　　题：</td>
    <td height="25" align="left" bgcolor="#FFFFFF">
      <input name="title" type="text" size="40">
      <span class="STYLE1">      *       </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">是否重要：</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><label>
      <input type="radio" name="radiobutton" value="1">
    是</label></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="left" bgcolor="#FFFFFF"><script charset="utf-8" src="../../../editor/kindeditor.js"></script>
<script charset="utf-8" src="../../../editor/lang/zh_CN.js"></script>
<script>    
var editor;
KindEditor.ready(function(K) {editor = K.create('textarea[name="content"]', {allowFileManager : true});});
</script>
<textarea name="content" style="width:95%;height:200px;visibility:hidden;"></textarea></td>
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

response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle class='content'><div align=center>添加成功　　<a href=?action=add><font color='#FF0000'>继续添加</a>　　<a href=?><font color='#FF0000'>返回列表</font></a></div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
end sub
sub del()
sql="delete  from tbl_sinkia_news where id="&request("id")
conn.execute sql

response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle class='content'><div align=center>删除成功　　<a href=?><font color='#FF0000'>返回列表</font></a></div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
 end sub
 sub adds()
Rs.Open ("select * from tbl_sinkia_news"),Conn,3,3
		Rs.Addnew
		Rs("title")  =request.Form("title")
		Rs("content")  =request.Form("content")
		'Rs("pid")  =request.Form("pid")
		Rs("addtime")=now()
		Rs("bits")  =0
		if request.Form("radiobutton")=1 then
		rs("type")=1
		end if
		Rs.Update
		Rs.Close
		
response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle class='content'><div align=center>添加中请稍候......　　</div></td></tr><meta http-equiv='refresh' content='2 url=?action=addsave'></table>"
set rs=nothing
 end sub
 sub mods()
  sql="select * from tbl_sinkia_news where id="&request("id")
	rs.open sql,conn,1,1
 %>
 <br><table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999" class="content">
   <form action="?action=modsaves" name="form1" method="post">
     <tr>
       <td height="25" align="right" bgcolor="#FFFFFF">标　　题：</td>
       <td height="25" align="left" bgcolor="#FFFFFF"><input name="title" type="text" size="40" value="<%=rs("title")%>">
         <span class="STYLE1">         * </span></td>
     </tr>
      <tr>
        <td height="25" align="right" bgcolor="#FFFFFF">是否重要：</td>
        <td height="25" align="left" bgcolor="#FFFFFF">
          <input type="radio" name="radiobutton" value="1" <%if rs("type")=1 then%> checked="checked"<%end if%>>
          是
		  <input type="radio" name="radiobutton" value="0" <%if rs("type")=0 then%> checked="checked"<%end if%>>
          否</td>
      </tr>
  <tr>
    <td height="25" colspan="2" align="left" bgcolor="#FFFFFF"><script charset="utf-8" src="../../../editor/kindeditor.js"></script>
<script charset="utf-8" src="../../../editor/lang/zh_CN.js"></script>
<script>    
var editor;
KindEditor.ready(function(K) {editor = K.create('textarea[name="content"]', {allowFileManager : true});});
</script>
<textarea name="content" style="width:95%;height:200px;visibility:hidden;"><%=rs("content")%></textarea></td>
  </tr>
    
     <input name="ids" type="hidden" value="<%=rs("id")%>">
     <tr>
       <td height="25" colspan="2" bgcolor="#FFFFFF"> <input type="submit" name="Submit3" value="提交" onClick="return checkuserinfo_2007();">
           <input type="reset" name="Submit22" value="重置">       </td>
     </tr>
   </form>
 </table>
 <%rs.close
set rs=nothing
 end sub
sub modsaves()
Rs.Open ("select * from tbl_sinkia_news where id="&request("ids")),Conn,3,3
		Rs("title")  =request.Form("title")
		Rs("content")=request.form("content")
		'Rs("pid")=request.form("pid")
		rs("type")=request("radiobutton")
		Rs.Update
		Rs.Close

response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle class='content'><div align=center>修改中请稍候......　　</div></td></tr><meta http-equiv='refresh' content='2 url=?action=modsave'></table>"

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
  
</center>
</BODY></HTML>
