<!--#include file="../../conn.aspx"-->
<!--#include file="inc/apartPage.aspx" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<TITLE>�̳ǹ���</TITLE>
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
    <td height="80" colspan="2" align="left">�ϴ�ͼƬ</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" align="left" bgcolor="EEEEEE" class="titlea">��ҳ &gt; �����̳� &gt; �ϴ�ͼƬ</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" align="left" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />�ϴ�ͼƬ</td>
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
  <tr><td align="left" ><!--<a href="?action=add">���</a>����--><a href="?">�б�</a></td>
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
    <td >��ʱû�����ݣ�</td>
  </tr>
</table>
<%
	Else
		
	 
%><br>
<table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#c1c1c1" >
  <tr bgcolor="#e1e1e1"  class="titlea1">
    <td width="531" height="35" align="center" >ͼƬ</td>
    <td width="127" align="center" >����/����</td>
  </tr>
<%
		while not Rs.eof 
%>
  <tr><td height="110" align="center" bgcolor="#FFFFFF" class="content" ><img src="<%=rs("imgs")%>" height="50"></td>
  	<td  align="center" bgcolor="#FFFFFF" class="content"><a href="?action=mod&id=<%=Rs("id")%>">�޸�</a><!--��<a href="?id=<%=Rs("id")%>&action=del" onClick="if(confirm('��ȷ����Ҫ����������ɾ�������ָܻ���')){return true;}else{return false;}">ɾ��</a>--></td>
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
<form action="i_imgs_upload.aspx"  enctype="multipart/form-data" name="form1" method="post"><tr style="display:none">
    <td width="15%" height="25" bgcolor="#FFFFFF">�� �� �⣺</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <span class="STYLE1">
      <input name="title_z" type="text" size="30">
      *       </span></td>
  </tr> 
  <tr>
    <td width="15%" height="25" bgcolor="#FFFFFF">�� �� �⣺</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <span class="STYLE1">
      <input name="title" type="text" size="20">
      *       </span></td>
  </tr>
  <tr>
    <td width="15%" height="25" bgcolor="#FFFFFF">���ӵ�ַ��</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
      <input name="address" type="text" size="30">
      *       </span></td>
  </tr>
  <tr>
    <td width="15%" height="25" bgcolor="#FFFFFF">ͼ����Ƭ��</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
      <input name="imgs" type="file" id="imgs" />
      *       ͼƬ��ʽ��gif/jpg�� ͼƬ��С&lt;150K���ߴ磺1005*350</span></td>
  </tr>
  <tr>
    <td width="15%" height="25" bgcolor="#FFFFFF">ͼƬ������</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
      <textarea name="content" cols="50" rows="6" id="content"></textarea>
      * </span></td>
  </tr>
 
  <tr>
    <td height="25" colspan="2" bgcolor="#FFFFFF">
      <input type="submit" name="Submit" value="�ύ" onClick="return checkuserinfo_2007();">
      <input type="reset" name="Submit2" value="����">    </td>
    </tr>
		</form> 
</table>
<%end sub
sub addsave()
response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle  class='content'><div align=center>��ӳɹ�����<a href=?action=add><font color='#FF0000'>�������</a>����<a href=?><font color='#FF0000'>�����б�</font></a></div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
end sub
sub del()

sql="select * from tbl_sinkia_iimgs where id="&request("id")

Rs.open sql,conn,1,1
	    Set FSO = Server.CreateObject("Scripting.FileSystemObject")
		 IF Rs("imgs")&""<>"" Then  FSO.DeleteFile(server.mappath(Rs("imgs")))
Set FSO = Nothing


	 sql="delete from tbl_sinkia_iimgs where id="&request("id")

	 conn.execute sql
	 

response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle class='content'><div align=center>ɾ���ɹ�����<a href=?><font color='#FF0000'>�����б�</font></a></div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
 rs.close
set rs=nothing
 end sub
 
 sub mods()
  sql="select * from tbl_sinkia_iimgs where id="&request("id")

	rs.open sql,conn,1,1
	if not rs.eof then 
 %>
 <br><table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999" class="content">
   <form action="i_imgs_saveuploada.aspx"  enctype="multipart/form-data" name="form1" method="post">
	<tr>
    <td width="15%" height="25" bgcolor="#FFFFFF">�� �� �⣺</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <span class="STYLE1">
      <input name="title_z" type="text" size="30" value="<%=Rs("title_z")%>">
      *       </span></td>
  </tr> 
  <tr style="display:none">
    <td width="15%" height="25" bgcolor="#FFFFFF">�� �� �⣺</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <span class="STYLE1">
      <input name="title" type="text" size="20" value="<%=Rs("title")%>">
      *       </span></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" bgcolor="#FFFFFF">���ӵ�ַ��</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <span class="STYLE1">
      <input name="address" type="text" size="30"  value="<%=Rs("address")%>">
      *       </span></td>
  </tr>
 	 <tr bgcolor="#DCE2ED">
       <td height="25" rowspan="2" align="center" bgcolor="#FFFFFF"><strong>ͼƬ��</strong></td>
       <td height="12" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
         <input name="imgs" type="file" id="imgs"/>
         ͼƬ��ʽ��gif/jpg ͼƬ��С&lt;150K<%if Rs("id")=5 then%>���ߴ磺270*270<%end if%><%if Rs("id")=6 then%>���ߴ磺445*130<%end if%><%if Rs("id")=7 then%>���ߴ磺445*130<%end if%><%if Rs("id")=9 then%>���ߴ磺588*58<%end if%></span></td>
     </tr>
     <tr bgcolor="#DCE2ED">
       <td height="12" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
         <%if rs("imgs")&""<>"" then%>
         <img src="<%=rs("imgs")%>" height="100">
         <%else
	   response.Write "����ͼƬ"%>
         <%end if%>
       </span></td>
     </tr>
  <tr style="display:none">
    <td width="15%" height="25" bgcolor="#FFFFFF">ͼƬ������</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
      <textarea name="content" cols="50" rows="6" id="content"><%=Rs("content")%></textarea>
      * </span></td>
  </tr>
  <tr>
    <td height="25" colspan="2" bgcolor="#FFFFFF">
		<script charset="utf-8" src="../../../editor/kindeditor.js"></script>
		<script charset="utf-8" src="../../../editor/lang/zh_CN.js"></script>
		<script>    
		var editor;
		KindEditor.ready(function(K) {editor = K.create('textarea[name="memo"]', {allowFileManager : true});});
		</script>
			<textarea name="memo" style="width:99%;height:200px;visibility:hidden;"><%=rs("memo")%></textarea>
	</td>
    </tr>
  <input name="ids" type="hidden" value="<%=rs("id")%>">

     <tr>
       <td height="25" colspan="2" bgcolor="#FFFFFF"> <input type="submit" name="Submit3" value="�ύ" onClick="return checkuserinfo_2008();">
           <input type="reset" name="Submit22" value="����">       </td>
     </tr>
   </form>
 </table>
 <%else
 response.Write "û�����ҵ�����Ϣ~��"
 end if
 rs.close
set rs=nothing
 end sub

sub modsave()
response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle class='content' ><div align=center>�޸ĳɹ�����</div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
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
