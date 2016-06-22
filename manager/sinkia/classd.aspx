<!--#include file="../../conn.aspx"-->
<!--#include file="inc/apartPage.aspx" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<TITLE>商城管理</TITLE>
<STYLE></STYLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
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
</HEAD>
<%
	Dim action
	action = Trim(Request.QueryString("action"))
		Set Rs= Server.CreateObject("ADODB.Recordset")
%>
<script language="javascript">
function checkuserinfo_2007()
{
  if(document.form1.Name.value.length<1) {
	document.form1.Name.focus();
	return false;
  }
}</script>

<BODY>



<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">类别分类</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 网上商城 &gt; 类别分类</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />类别分类</td>
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
              <td><%
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
	
	Rs.Open ("select * from tbl_sinkia_class where pid=0"),Conn,1,1

	IF Rs.Eof And Rs.Bof Then
		Rs.Close
		Set Rs=Nothing
%><br>
<table width="96%" border="0" align="center" cellpadding="3" cellspacing="2" class="content" >
  <tr>
    <td >暂时没有内容！</td>
  </tr>
</table>
<%
	Else
		ic=50
		Rs.pagesize=ic
		pages=Rs.pagecount
		epage=getPage(Trim(Request.QueryString("page")),pages)
		Rs.absolutepage=epage
		
	 
%><br>
<table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#c1c1c1">
  <tr  class="titlea1" bgcolor="#e1e1e1">
    <td width="990" height="40" align="center">类别名</td>
    <td width="180" align="center">别名</td>
    <td width="180" align="center">排序</td>
    <td width="181" height="40" align="center">操作</td>
  </tr>
<%
		while not Rs.eof and ic>0
%>
<form id="form2" name="form2" method="post" action="classe.aspx?id=<%=Rs("id")%>">
  <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
  	<td height="40" align="left" class="content" style="padding-left:5px;"><%=Rs("pro_class")%></td>
    <td align="center" class="content" style="padding-left:5px;"><input name="title" type="text" value="<%=Rs("title")%>" /></td>
    <td align="center" class="content" style="padding-left:5px;"><input name="pm" type="text" value="<%=Rs("pm")%>" size="10" /></td>
    <td width="181"  align="center" class="content"><input type="submit" name="Submit4" value="修改" />&nbsp;
		<a href="classd.aspx?action=add&title=<%=rs("title")%>&id=<%=rs("id")%>">添加</a>
	</td>
  </tr>
</form>
<%
	set rsm = conn.execute("select * from tbl_sinkia_class where classid="&rs("id"))
	while not rsm.eof
%> 
<form id="form2" name="form2" method="post" action="classe1.aspx?id=<%=Rsm("id")%>">
  <tr bgcolor="#f8f8f8" onmouseover="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
  	<td height="22" align="left" class="content" style="padding-left:5px;">　　|--<%=rsm("pro_class")%></td>
    <td align="center" class="content" style="padding-left:5px;"><input name="title" type="text" value="<%=Rsm("title")%>" /></td>
    <td align="center" class="content" style="padding-left:5px;"><input name="pm" type="text" value="<%=Rsm("pm")%>" size="10" /></td>
    <td width="181"  align="center" class="content">
		<input type="submit" name="Submit42" value="修改" />	
		<a href="classe2.aspx?id=<%=Rsm("id")%>">取消</a>	
	</td>
  </tr>
</form>
             <%
			    rsm.movenext
			    wend
			    rsm.close
			    set rsm=nothing
	   		 %>
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
              <%call apartPage("?",8,epage,pages)%></td>
      </tr>
    </table></td>
  </tr>
</table>
<%
	End IF
	
	end sub
%><br>

<%Sub add()%>
<table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#c1c1c1" class="content">
<form action="classe3.aspx" name="form1" method="post">
  <tr>
    <td width="100%" height="40" align="center" bgcolor="#FFFFFF" class="content"><font style="font-size:16px; font-family:'微软雅黑';"><%=request("title")%></font></td>
	</tr>
  <tr>
    <td height="40" align="center" bgcolor="#FFFFFF" class="content"><select name="select">
<%
	set rsm = conn.execute("select * from tbl_sinkia_class where pid>0 and classid=0")
	while not rsm.eof
%> 
      <option value="<%=rsm("id")%>"><%=rsm("title")%></option>
<%
	rsm.movenext
	wend
	rsm.close
	set rsm=nothing
%>    </select>
      <input name="id" type="hidden" value="<%=request("id")%>" />    </td>
  </tr>
  <tr>
    <td height="40" align="center" bgcolor="#FFFFFF">
      <input type="submit" name="Submit" value="提交" onClick="return checkuserinfo_2007();"></td>
    </tr>
</form> 
</table>


<%end sub%>
<br></td>
            </tr>
</table>

            
            </td>
        </tr>
      </table>
      
    
  </table>
  
  </td>
        </tr>
      </table>
</BODY></HTML>
          