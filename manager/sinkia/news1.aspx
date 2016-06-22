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
.STYLE10 {
	color: #FF0000;
	font-size: 10pt;
	font-weight: bold;
}
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
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
    <tr>
      <td height="30" align="center" background="../images/contop_bg.jpg">使用帮助</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr valign="top" > 
      <td valign="bottom">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="137">
        <tr>
          <td height="184" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" align="center" cellpadding="3" cellspacing="2"class="content" >
  <tr>
    <td align="left" ><a href="?action=add">添加</a>　<a href="?">列表</a></td>
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
	Rs.Open ("select * from tbl_sinkia_news_shop order by addtime desc"),Conn,1,1
	IF Rs.Eof And Rs.Bof Then
		Rs.Close
		Set Rs=Nothing
%><br>
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
		
	 
%><br>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#999999" class="content" >
  <tr>
    <td width="66%" height="40" align="center" bgcolor="#CCCCCC" >标题</td>
      <td width="18%" height="40"  align="center" bgcolor="#CCCCCC" >发布时间</td>
    <td width="16%" height="40" align="center" bgcolor="#CCCCCC" >操作</td>
  </tr>
<%
		Dim UserName
		while not Rs.eof and ic>0
%>
  <tr>
    <td height="35" align="left" bgcolor="#FFFFFF" class="tdc" style="padding-left:5px;"><%=Rs("title")%></td>
  <td height="35" align="left" bgcolor="#FFFFFF" class="tdc" style="padding-left:5px;"><%=Rs("addtime")%></td>
 
    <td height="35"  align="center" bgcolor="#FFFFFF" class="tdc"><a href="?action=mod&id=<%=Rs("id")%>">修改</a>　<a href="?id=<%=Rs("id")%>&action=del" onClick="if(confirm('你确定你要这样操作吗？删除将不能恢复！')){return true;}else{return false;}">删除</a></td>
  </tr>
  <%
			Rs.MoveNext
			ic=ic-1
		wend
		Rs.Close
		Set Rs = Nothing
%>
  <tr>
    <td colspan="4" align="center" bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
      <tr>
        <td align="right">
              <%call apartPage("?pid="&request("pid")&"&",8,epage,pages)%></td>
      </tr>
    </table></td>
  </tr>
</table>
<%
	End IF
	Conn.Close
	Set Conn = Nothing
	end sub
	sub add()
%><br>
<table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999" class="content">
<form action="?action=adds" name="form1" method="post">
  <tr>
    <td height="30" align="right" bgcolor="#FFFFFF">标　　题：</td>
    <td height="30" align="left" bgcolor="#FFFFFF">
      <input name="title" type="text" size="40">
      *       </td>
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
sql="delete  from tbl_sinkia_news_shop where id="&request("id")
conn.execute sql

response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle  class='content'><div align=center>删除成功　　<a href=?><font color='#FF0000'>返回列表</font></a></div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
 end sub
 sub adds()
Rs.Open ("select * from tbl_sinkia_news_shop"),Conn,3,3
		Rs.Addnew
		Rs("title")  =request.Form("title")
		Rs("content")  =request.Form("content")
		Rs("addtime")=now()
		Rs.Update
		Rs.Close
response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle  class='content'><div align=center>添加中请稍候......　　</div></td></tr><meta http-equiv='refresh' content='2 url=?action=addsave'></table>"
set rs=nothing
 end sub
 sub mods()
  sql="select * from tbl_sinkia_news_shop where id="&request("id")
	rs.open sql,conn,1,1
 %>
 <br><table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999">
   <form action="?action=modsaves" name="form1" method="post">
     <tr>
       <td height="30" align="right" bgcolor="#FFFFFF">标　　题：</td>
       <td height="30" align="left" bgcolor="#FFFFFF"><input name="title" type="text" size="40" value="<%=rs("title")%>">
         * </td>
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
Rs.Open ("select * from tbl_sinkia_news_shop where id="&request("ids")),Conn,3,3
		Rs("title")  =request.Form("title")
		Rs("content")=request.form("content")
		Rs.Update
		Rs.Close

response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle  class='content'><div align=center>修改中请稍候......　　</div></td></tr><meta http-equiv='refresh' content='2 url=?action=modsave'></table>"

set rs=nothing
end sub
sub modsave()
response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle  class='content'><div align=center>修改成功　　</div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"

end sub%></td>
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
