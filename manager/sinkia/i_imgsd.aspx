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
%>

</HEAD>
<BODY bgColor=#FFFFFF 
leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<center>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2" align="left">首页动画</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" align="left" bgcolor="EEEEEE" class="titlea">首页 &gt; 商城信息 &gt; 首页动画</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" align="left" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />系统公告</td>
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
              <td><table width="96%" border="0" align="center" cellpadding="3" cellspacing="2"class="content" >
  <tr><td align="left" ><!--<a href="?action=add">添加</a>　　--><a href="?">列表</a></td>
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
	sql="select * from tbl_sinkia_iimgs where type=6 order by id "
	
	Rs.Open (sql),Conn,1,1
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
		
	 
%><br>
<table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#c1c1c1" >
  <tr bgcolor="#e1e1e1"  class="titlea1">
    <td width="531" height="35" align="center" >图片</td>
    <td align="center" >链接地址</td>
    <td width="127" align="center" >操作/管理</td>
  </tr>
<%
		while not Rs.eof 
%>
  <tr><td height="110" align="center" bgcolor="#FFFFFF" class="content" ><img src="<%=rs("imgs")%>" height="50"></td>
  	<td align="center" bgcolor="#FFFFFF" class="content" ><%=Rs("address")%></td>
  	<td  align="center" bgcolor="#FFFFFF" class="content"><a href="?action=mod&id=<%=Rs("id")%>">修改</a><!--　<a href="?id=<%=Rs("id")%>&action=del" onClick="if(confirm('你确定你要这样操作吗？删除将不能恢复！')){return true;}else{return false;}">删除</a>--></td>
  </tr>
<%
			Rs.MoveNext
		wend
		Rs.Close
		Set Rs = Nothing
		
%>
</table>
<%
	End IF
	
	end sub
	sub add()
%><br>
<table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999" class="content">
<form action="i_imgs_uploada.aspx"  enctype="multipart/form-data" name="form1" method="post">
  <tr>
    <td width="15%" height="25" bgcolor="#FFFFFF">链接地址：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
      <input name="address" type="text" size="30">
      *       </span></td>
  </tr>
  <tr>
    <td width="15%" height="25" bgcolor="#FFFFFF">图　　片：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
      <input name="imgs" type="file" id="imgs" />
      *       图片格式：gif/jpg， 图片大小&lt;150K，尺寸：1005*350</span></td>
  </tr>
  <tr>
    <td width="15%" height="25" bgcolor="#FFFFFF">图片简述：</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
      <textarea name="content" cols="50" rows="6" id="content"></textarea>
      * </span></td>
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

sql="select * from tbl_sinkia_iimgs where id="&request("id")

Rs.open sql,conn,1,1
	    Set FSO = Server.CreateObject("Scripting.FileSystemObject")
		 IF Rs("imgs")&""<>"" Then  FSO.DeleteFile(server.mappath(Rs("imgs")))
Set FSO = Nothing


	 sql="delete from tbl_sinkia_iimgs where id="&request("id")

	 conn.execute sql
	 

response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle class='content'><div align=center>删除成功　　<a href=?><font color='#FF0000'>返回列表</font></a></div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
 rs.close
set rs=nothing
 end sub
 
 sub mods()
  sql="select * from tbl_sinkia_iimgs where id="&request("id")

	rs.open sql,conn,1,1
	if not rs.eof then 
 %>
 <br><table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999" class="content">
   <form action="i_imgs_saveuploadd.aspx"  enctype="multipart/form-data" name="form1" method="post">
   <tr>
     <td height="25" align="center" bgcolor="#FFFFFF">链接地址：</td>
     <td height="25" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
       <input name="address" type="text" size="30"  value="<%=Rs("address")%>" />
       * </span></td>
   </tr>
 	 <tr bgcolor="#DCE2ED">
       <td width="15%" height="12" align="center" bgcolor="#FFFFFF">大图片：</td>
       <td width="85%" height="12" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
         <input name="imgs" type="file" id="imgs"/>
         图片格式：gif/jpg 图片大小&lt;150K，尺寸：1000*200</span></td>
     </tr>
  <input name="ids" type="hidden" value="<%=rs("id")%>">

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
response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle class='content' ><div align=center>修改成功　　</div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
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
