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
    <td height="80" colspan="2">帮助中心</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 商城信息 &gt; 帮助中心</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />帮助中心</td>
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
              <td><table width="96%" border="0" align="center" cellpadding="3" cellspacing="2" class="content">
  <tr>
    <td width="5%" align="center" ><a href="?action=add">添加</a></td>
    <td width="95%" align="left" ><a href="?">所有列表</a></td>
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
	
	Rs.Open ("select * from tbl_sinkia_xx where lei=0"),Conn,1,1

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
		ic=5
		Rs.pagesize=ic
		pages=Rs.pagecount
		epage=getPage(Trim(Request.QueryString("page")),pages)
		Rs.absolutepage=epage
		
	 
%><br>
<table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#c1c1c1">
  <tr  class="titlea1" bgcolor="#e1e1e1">
    <td width="1075" height="40" align="center">类别名</td>
    <td width="300" height="40" align="center">操作</td>
  </tr>
<%
		while not Rs.eof and ic>0
%>
  <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
  	<td height="40" align="left" class="content" style="padding-left:5px;"><%=Rs("title")%></td>
    <td width="300"  align="center" class="content">
		<a href="?action=mod&id=<%=Rs("id")%>">修改</a> <a href="?id=<%=Rs("id")%>&action=del" onClick="if(confirm('你确定你要这样操作吗？删除将不能恢复！请慎重！')){return true;}else{return false;}">删除</a>	</td>
  </tr>
 <%
				  set rsm = conn.execute("select * from tbl_sinkia_xx where lei="&rs("id"))
				  while not rsm.eof
       		 %> 
  <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
  	<td height="22" align="left" class="content" style="padding-left:5px;">　　|--<%=rsm("title")%></td>
    <td width="300"  align="center" class="content"><a href="webcomc.aspx?id=<%=rsm("id")%>">修改内容</a> <a href="?action=mod&id=<%=rsm("id")%>">修改</a> <a href="?id=<%=rsm("id")%>&action=del" onClick="if(confirm('你确定你要这样操作吗？删除将不能恢复！并且删除此类别下的商品~！请慎重~！')){return true;}else{return false;}">删除</a></td>
  </tr>
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
    <td colspan="2" align="center" bgcolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
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
	sub add()
%><br>
<table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#c1c1c1" class="content">
<form action="?action=adds" name="form1" method="post">
  <tr>
    <td width="50%" height="40" align="right" bgcolor="#FFFFFF" class="content">选择分类：</td>
    <td width="50%" height="40" align="left" bgcolor="#FFFFFF"><select name="pid" id="pid">
        <option value="0">默认一级</option>
        <%
        set rsm = conn.execute("select * from tbl_sinkia_xx where lei=0")
        while not rsm.eof
        %>
        <option value="<%=rsm("id")%>"><%=rsm("title")%></option>
        <%
	   rsm.movenext
	   wend
	   rsm.close
	   set rsm=nothing
	  
	   %>
	   </select>
	   </td></tr>
  <tr>
    <td height="40" align="right" bgcolor="#FFFFFF" class="content">类 别 名：</td>
	<td height="40" align="left" bgcolor="#FFFFFF" class="content">
      <input name="Name" type="text" size="40">*</td>
  </tr>
  <tr style="display:none">
    <td height="40" align="right" bgcolor="#FFFFFF">重 要</td>
	<td height="40" align="left" bgcolor="#FFFFFF">
      <input name="radio" type="radio"size="40"  value="1">显示
	  <input name="radio" type="radio"size="40"  value="0">不显示
	  
	</td>
  </tr>
  <tr>
    <td height="40" colspan="2" bgcolor="#FFFFFF">
      <input type="submit" name="Submit" value="提交" onClick="return checkuserinfo_2007();">
      <input type="reset" name="Submit2" value="重置">    </td>
    </tr>
		</form> 
</table>
<%end sub
sub addsave()
response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle ><div align=center>添加成功　　<a href=?action=add><font color='#FF0000'>继续添加</a>　　<a href=?><font color='#FF0000'>返回列表</font></a></div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
end sub
sub del()

SQL="select * from tbl_sinkia_xx where lei="&request("id")&""
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

if not rs.eof and not rs.bof then
  	response.Write "<script language=javascript>alert('请先删除下属分类!');history.go(-1);</script>"
	response.end
end if
rs.close
set rs=nothing




sql="delete from tbl_sinkia_xx where id="&request("id")
conn.execute sql


response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle ><div align=center>删除成功　　<a href=?><font color='#FF0000'>返回列表</font></a></div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"

 end sub
 sub adds()
 			Set Rsc = Conn.Execute("select * from tbl_sinkia_xx where title='"&request.Form("Name")&"'")
				
			IF not Rsc.Eof Then
						Response.Write("<script>alert('类别已经存在');javascript:history.go(-1);</script>")
			Else
					Rs.Open ("select * from tbl_sinkia_xx"),Conn,3,3
							Rs.Addnew
							Rs("title")  = request.Form("Name")
							Rs("lei")        = request.Form("pid")							
							Rs.Update
							Rs.Close

						Response.Write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle ><div align=center>添加中请稍候......　　</table>"
						Response.Write "<meta http-equiv='refresh' content='2 url=?action=addsave'"
					set rs=nothing
			end if
			Rsc.Close
			set Rsc=nothing
 end sub
 sub mods()
  sql="select * from tbl_sinkia_xx where  id="&request("id")
	rs.open sql,conn,1,1
 %>
 <br><table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#c1c1c1" class="content">
   <form action="?action=modsaves" name="form1" method="post">
	  <tr>
       <td width="50%" height="40" align="right" bgcolor="#FFFFFF">类别名：</td>
       <td width="50%" height="40" align="left" bgcolor="#FFFFFF"><input name="Name" type="text" size="40" value="<%=Rs("title")%>">
         * </td>
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


			Set Rsc = Conn.Execute("select * from tbl_sinkia_xx where title='"&request.Form("Name")&"' and id <> "&request("ids"))
				
			IF not Rsc.Eof Then
						Response.Write("<script>alert('类别已经存在');javascript:history.go(-1);</script>")
			Else
					Rs.Open ("select * from tbl_sinkia_xx where id="&request("ids")),Conn,3,3
						Rs("title")  =request.Form("Name")	
						Rs.Update
						Rs.Close
					set rs=nothing

					Response.Write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle ><div align=center>修改中请稍候......　　</table>"
					Response.Write "<meta http-equiv='refresh' content='2 url=?action=modsave'>"
				
			end if
			Rsc.Close
			set Rsc=nothing
			
			

end sub

sub modsave()
response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle ><div align=center>修改成功　　</div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
end sub%></td>
              </tr>
</table>

            
            </td>
        </tr>
      </table>
      
    
  </table>
  
  </td>
        </tr>
      </table>
  <script  type="text/javascript">
<!--
function check_value(theForm){
	if(theForm.webName.value.length<1){
		theForm.webName.focus();
		return false;
	}else if(theForm.webAddress.value.length<1){
		theForm.webAddress.focus();
		return false;
	}else if(theForm.webKeyWords.value.length<1){
		theForm.webKeyWords.focus();
		return false;
	}else if(theForm.webEnd.value.length<1){
		theForm.webEnd.focus();
		return false;
	}else{
		return true;
	}
}
-->
</script>

</BODY></HTML>
          