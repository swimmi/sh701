<!--#include file="../../conn.aspx"-->
<!--#include file="inc/apartPage.aspx" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<TITLE>�̳ǹ���</TITLE>
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
    <td height="80" colspan="2">�̻���Ʒ</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ��Ʒ���� &gt; �̻���Ʒ</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />�̻���Ʒ</td>
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
  <tr><td width="64%" align="left" ><a href="?action=add">���</a>����<a href="?">�б�</a></td>
    <form name="form2" method="post" action="?"> <td width="11%" align="right" >������</td>
      <td ><select name="pid" id="pid">
        <option value="">������Ʒ</option>
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
          <option value="" selected>����״̬</option>
          <option value="0" >δ���</option>
          <option value="1" >�����</option>
          </select>
        <input type="submit" name="button" id="button" value="����">      </td>
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
    <td align="center" >��ʱû�����ݣ�</td>
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
    <td height="35" align="center">ͼƬ</td>
    <td height="35" align="center" >��Ʒ����</td>
    <td height="35" align="center">�г���</td>
    <td height="35" align="center">��Ա�۸�</td>
    <td align="center">���</td>
    <td align="center">���</td>
     <td height="35" align="center">����/����</td>
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
	<span class="tdc"><a href="?action=mod&amp;id=<%=Rs("pro_id")%>">�޸�</a>��
	<a href="?id=<%=Rs("pro_id")%>&amp;action=del" onClick="if(confirm('��ȷ����Ҫ����������ɾ�������ָܻ���')){return true;}else{return false;}">ɾ��</a>��
	<a href="add.aspx?id=<%=Rs("pro_id")%>">���ͼƬ</a>��
	<a href="adda.aspx?id=<%=Rs("pro_id")%>">��ӳɷ�</a>��
	<a href="addc.aspx?id=<%=Rs("pro_id")%>">���Ĺ���</a>��
	<a href="addd.aspx?id=<%=Rs("pro_id")%>">�˾���</a>
	
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
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��Ʒ���ƣ�</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_name" type="text" size="30">
      <span class="STYLE1"> * </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">�������</td>
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
        <option value="<%=rsm1("id")%>" >��|-<%=rsm1("pro_class")%></option>
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
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">�г��۸�</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money_s" type="text" size="10"> 
      Ԫ<span class="STYLE1"> * </span></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��Ա�۸�</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money" type="text" size="10">      <span class="STYLE1">* </span></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">�����۸�</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money_p" type="text" value="10" size="10"> 
      Ԫ<span class="STYLE1"> * </span> ��<font color="#FF0000">��˺󽫲����޸ģ������أ�</font>��      </td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��Ʒ�۸�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_money1" type="text" value="0" size="10">      <span class="STYLE1"> * </span></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">���֣�</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_price" type="text" value="0" size="10">
      <span class="STYLE1"> * </span></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">�����ۣ�</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_gonghuo" type="text" value="0" size="10">
      <span class="STYLE1"> * </span></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��Ʒ���</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_guige" type="text" size="20"></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��Ʒ��λ��</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_danwei" type="text" size="10"></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��Ʒ��ɫ��</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_yanse" type="text" id="pro_yanse" size="10"></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">���������</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_shulian" type="text" size="10"></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��Ʒ��������</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="first_shulian" type="text" value="0" size="10"></td>
  </tr>
  <tr class="tm">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE17 STYLE11">��Ʒ���ۣ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input type="radio" name="pingji" value="1" checked>
      ��
      <input type="radio" name="pingji" value="2">
      ���
      <input type="radio" name="pingji" value="3">
      ����
      <input type="radio" name="pingji" value="4">
      �����
      <input type="radio" name="pingji" value="5">
      ������</td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">�ɷ�ͼƬ��</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_cf" type="file" id="pro_cf" />
        <span class="STYLE1"> * </span> ͼƬ��ʽ��gif/jpg ͼƬ��С&lt;300K</td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">�ɷݽ��ܣ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_cfjs" type="text" id="pro_cfjs" style="width:70%" /></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��Ʒ���ܣ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_js" type="text" style="width:70%" /></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��ƷͼƬ��</span></td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><input name="pro_imgs" type="file" id="pro_imgs" />
      <span class="STYLE1"> * </span>       ͼƬ��ʽ��gif/jpg ͼƬ��С&lt;300K</td>
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
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">�����ߣ�</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_user_" type="text" size="15" value="<%=session("hy_bianhao")%>" disabled>
      <input name="pro_user" type="hidden" size="15" value="<%=session("hy_bianhao")%>"></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">������</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pm" type="text" id="pm" value="0" size="10" /></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">��Ʒ���</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input type="checkbox" name="pro_Hot" value="1"/>
      ��Ʒ�Ƽ�
      <input type="checkbox" name="pro_xinping" value="2"/>
      �Լ۱�֮�� </td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">Ԥ����Ʒ��</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_type" type="radio" value="0" checked="checked"/>
      ��
      <input name="pro_type" type="radio" value="1"/>
      ��</td>
  </tr>
  <tr>
    <td align="right" bgcolor="#FFFFFF">Ԥ�۵���ʱ�䣺</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="shijian1" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=replace(formatdatetime(now(),2),"/","-")%>" /></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">�󡡡��ˣ�</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><input name="pro_isok" type="radio" value="0" >
      ��
        <input name="pro_isok" type="radio" value="1" checked>
        ��</td>
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

sql="select * from tbl_product where pro_id="&request("id")


Rs.open sql,conn,1,1
	    'Set FSO = Server.CreateObject("Scripting.FileSystemObject")
		 'IF Rs("pro_imgs")&""<>"" Then  FSO.DeleteFile(server.mappath(Rs("pro_imgs")))
'Set FSO = Nothing


	 sql="delete from tbl_product where pro_id="&request("id")

	 conn.execute sql
	 

response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle  class='content'><div align=center>ɾ���ɹ�����<a href=?><font color='#FF0000'>�����б�</font></a></div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
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
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">��Ʒ���ƣ�</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_name" type="text" size="30" value="<%=Rs("pro_name")%>">
      <span class="STYLE1">      *       </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">�������</td>
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
        <option value="<%=rsm1("id")%>" <%if rs("pro_pida")=rsm1("id") then%>selected="selected"<%end if%>>��|-<%=rsm1("pro_class")%></option>
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
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">�г��۸�</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money_s" type="text" size="10"  value="<%=Rs("pro_money_s")%>"> 
      Ԫ<span class="STYLE1"> * </span></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">�۸�</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money" type="text" size="10"  value="<%=Rs("pro_money")%>">      <span class="STYLE1"> * </span></td>
  </tr> <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">�����۸�</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_money_p" type="text" size="10" value="<%=Rs("pro_money_p")%>" <%if rs("pro_isok")=1 then%>disabled<%end if%>> 
      Ԫ<span class="STYLE1"> * </span> ��<font color="#FF0000">��˺󽫲����޸ģ������أ�</font>��      </td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF">��Ʒ�۸�</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_money1" type="text" value="<%=Rs("pro_money1")%>" size="10">
      Ԫ<span class="STYLE1"> * </span></td>
  </tr>
  <%if rs("pro_isok")=1 then%><input name="ssss" type="hidden" value="aa">
  <%else%>
  <input name="ssss" type="hidden" value="bb">
  <%end if%>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">����</span>��</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_price" type="text" size="10"   value="<%=Rs("pro_price")%>">
      <span class="STYLE1"> * </span></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF">�����ۣ�</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_gonghuo" type="text" id="pro_gonghuo"   value="<%=Rs("pro_gonghuo")%>" size="10">
      <span class="STYLE1"> * </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">WE��</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="we" type="text" id="we"   value="<%=Rs("we")%>" size="10" /></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">DC��</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="dc" type="text" id="dc"   value="<%=Rs("dc")%>" size="10" /></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">JR��</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="jr" type="text" id="jr"   value="<%=Rs("jr")%>" size="10" /></td>
  </tr>
  <tr style="display:none">
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">��Ʒ���</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_guige" type="text" size="20"  value="<%=Rs("pro_guige")%>"></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF">��Ʒ��λ��</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_danwei" type="text" size="10" value="<%=Rs("pro_danwei")%>" /></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF">��Ʒ��ɫ��</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_yanse" type="text" id="pro_yanse" size="10"  value="<%=Rs("pro_yanse")%>"></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF">���������</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_shulian" type="text" size="10"   value="<%=Rs("pro_num")%>"></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF">��Ʒ��������</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="first_shulian" type="text" value="<%=rs("first_shulian")%>" size="10"></td>
  </tr>
  <tr class="tm">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE17">��Ʒ���ۣ�</span></td>
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
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">�ɷ�ͼƬ��</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_cf" type="file" id="pro_cf" />
        <span class="STYLE1"> * </span> ͼƬ��ʽ��gif/jpg ͼƬ��С&lt;300K</td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">�ɷݽ��ܣ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_cfjs" type="text" id="pro_cfjs" style="width:70%" value="<%=rs("pro_cfjs")%>" /></td>
  </tr>
  <tr style="display:none">
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��Ʒ���ܣ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_js" type="text" style="width:70%" value="<%=rs("pro_js")%>" /></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">���ͣ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="lx" type="text" size="10" value="<%=rs("lx")%>" />
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">Ʒ����Ӣ�ģ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="ppzyw" type="text" size="10"  value="<%=rs("ppzyw")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">����Ʒ�֣�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="ptpz" type="text" size="10"  value="<%=rs("ptpz")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��ݣ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="nf" type="text" size="10" value="<%=rs("nf")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">���أ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="cd" type="text" size="10"  value="<%=rs("cd")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">����</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="jb" type="text" size="10"  value="<%=rs("jb")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">�ƾ��ȣ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="jjd" type="text" size="10" value="<%=rs("jjd")%>" />
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">������</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="rl" type="text" size="10"  value="<%=rs("rl")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��ζ��</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="xw" type="text" size="10" value="<%=rs("xw")%>" />
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">ɫ��</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="sz" type="text" size="10"  value="<%=rs("sz")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">���壺</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="jt" type="text" size="10"  value="<%=rs("jt")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">�ڸз��ࣺ</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="kgfl" type="text" size="10"  value="<%=rs("kgfl")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">�����Ѿ�ʱ�䣺</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="jyxjsj" type="text" size="10"  value="<%=rs("jyxjsj")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">���Ʒ���¶ȣ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="zjpcwd" type="text" size="10" value="<%=rs("zjpcwd")%>" />
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">������ȣ�</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="dpcy" type="text" size="10"  value="<%=rs("dpcy")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
  <tr>
    <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��ľͰ����</span></td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="xmtcn" type="text" size="10"  value="<%=rs("xmtcn")%>"/>
        <span class="STYLE1">* </span></td>
  </tr>
	 <tr bgcolor="#DCE2ED">
       <td height="12" align="right" bgcolor="#FFFFFF"><span class="STYLE11">��Ʒ</span>ͼƬ��</td>
       <td height="12" align="left" bgcolor="#FFFFFF"><input name="pro_imgs" type="file" id="pro_imgs"/>
         ͼƬ��ʽ��gif/jpg ͼƬ��С&lt;150K</td>
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
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">�����ߣ�</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF">
      <input name="pro_user_" type="text" size="15" value="<%=rs("pro_user")%>" disabled></td>
  </tr>
     <tr style="display:none">
       <td height="25" align="right" bgcolor="#FFFFFF"><span class="STYLE11">������</span></td>
       <td height="25" align="left" bgcolor="#FFFFFF"><input name="pm" type="text" id="pm" value="<%=rs("pm")%>" size="10" /></td>
     </tr>
     <tr style="display:none">
       <td height="25" align="right" bgcolor="#FFFFFF">��Ʒ���</td>
       <td height="25" align="left" bgcolor="#FFFFFF"><input type="checkbox" name="pro_Hot" value="1" <%if rs("pro_hot")=1 then%>checked<%end if%>>
         ��Ʒ�Ƽ�
         <input type="checkbox" name="pro_xinping" value="2" <%if rs("pro_xinping")=1 then%>checked<%end if%>/>
         �Լ۱�֮�� </td>
     </tr>
  <tr style="display:none">
    <td align="right" bgcolor="#FFFFFF">Ԥ����Ʒ��</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="pro_type" type="radio" value="0" <%if rs("pro_type")=0 then%>checked<%end if%>>
      ��
      <input name="pro_type" type="radio" value="1" <%if rs("pro_type")=1 then%>checked<%end if%>>
      ��</td>
  </tr>
  <tr style="display:none">
    <td align="right" bgcolor="#FFFFFF">Ԥ�۵���ʱ�䣺</td>
    <td height="25" align="left" bgcolor="#FFFFFF"><input name="shijian1" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=rs("daoqi")%>" /></td>
  </tr>
  <tr>
    <td width="15%" height="25" align="right" bgcolor="#FFFFFF">�󡡡��ˣ�</td>
    <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><input name="pro_isok" type="radio" value="0"  <%if rs("pro_isok")=0 then%> checked<%end if%>>
      ��
        <input name="pro_isok" type="radio" value="1"  <%if rs("pro_isok")=1 then%> checked<%end if%>>
        ��</td>
  </tr>
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
response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle class='content'><div align=center>�޸ĳɹ�����</div></td></tr><meta http-equiv='refresh' content='2 url=?'></table>"
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
