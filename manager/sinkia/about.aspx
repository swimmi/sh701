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
.STYLE10 {
	color: #FF0000;
	font-size: 10pt;
	font-weight: bold;
}
-->
</style>




</HEAD>
<BODY>












<%
if request("submit")="�ύ" then
	conn.execute("update tbl_about set memo='"&request.Form("content")&"' where id="&request("id"))
		
	response.Write "<script language=javascript>alert('�����ɹ���');location.href='about.aspx?id="&request("id")&"';</script>"
	response.end
end if

if request("action")=1 then
	conn.execute("delete tbl_abouta where id='"&request("id")&"'")
		
	response.Write "<script language=javascript>alert('�����ɹ���');location.href='about.aspx?id=7';</script>"
	response.end
end if

if request("action")=2 then
	conn.execute("delete tbl_abouta where id='"&request("id")&"'")
		
	response.Write "<script language=javascript>alert('�����ɹ���');location.href='about.aspx?id=8';</script>"
	response.end
end if




%>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2" align="left">��������</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" align="left" bgcolor="EEEEEE" class="titlea">��ҳ &gt; �̳���Ϣ &gt; ��������</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" align="left" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />��������</td>
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
              <td height="400" valign="top">

              <table width="100%" border="0" align="center" cellpadding="3" cellspacing="2"class="content" >
  <tr>
    <td height="40" align="left" >
    <a href=?id=1>��������</a>&nbsp;
    <a href=?id=2>�������</a>&nbsp;
    <a href=?id=3>���ǵķ���</a>&nbsp;
    <a href=?id=4>�����Ŷ�</a>&nbsp;
    <a href=?id=5>���ǵ�����</a>&nbsp;
    <a href=?id=6>��ϵ����</a>&nbsp;
    <a href=?id=7>ѡ���Ŷ�</a>&nbsp;
    <a href=?id=8>��Ա����</a>&nbsp;
   
   </td>
  </tr>
</table>

<%if request("id")<>7 and request("id")<>8 and request("id")<>2 then%>
<%
	Set Rs= Server.CreateObject("ADODB.Recordset")
	Rs.Open ("select * from tbl_about where id="&request("id")),Conn,1,1
%>

<form action="?id=<%=request("id")%>" name="form1" method="post">
	<textarea name="content" style="width:99%;height:400px;visibility:hidden;"><%=rs("memo")%></textarea>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#999999">
	  <tr>
		<td height="25" colspan="2" align="center" bgcolor="#FFFFFF">
			<script charset="utf-8" src="../../../editor/kindeditor.js"></script>
			<script charset="utf-8" src="../../../editor/lang/zh_CN.js"></script>
			<script>    
			var editor;
			KindEditor.ready(function(K) {editor = K.create('textarea[name="content"]', {allowFileManager : true});});
			</script></td>
	  </tr>
	  <tr>
		<td height="25" colspan="2" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="�ύ"></td>
	  </tr>
	</table>
</form> 
<%
rs.close
set rs= nothing
%>
<%end if%>
<%if request("id")=7 then%>
<form action="aboutc1.aspx"  enctype="multipart/form-data" name="form1" method="post">
	<table width="99%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td height="50" align="center" valign="bottom" style="font-size:12px;">
		ѡ��ͼƬ
		<input name="imgs" type="file" id="imgs"/>
			 ͼƬ��ʽ��gif/jpg ͼƬ��С&lt;150K
			 ���ߴ磺150*180
		</td>
	  </tr>
	  <tr>
		<td height="30" align="center" style="font-size:12px;">
		  <input type="submit" name="Submit2" value="�ύ" />
		</td>
	  </tr>
	</table>
</form>






<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30" style="border-bottom:1px #CCCCCC solid"><font style="font-size:14px; font-weight:bold">ѡ���Ŷ���Ƭ</font></td>
    <td height="30" style="border-bottom:1px #CCCCCC solid"><font style="font-size:14px; font-weight:bold">����</font></td>
  </tr>
<%
	set Rs=server.createobject("adodb.recordset")	
	sql=("select * from tbl_abouta where type=7")
	Rs.Open sql,Conn,3,3
	if not rs.eof and not rs.bof then
	while not rs.eof
%>

  <tr>
    <td style="border-bottom:1px #CCCCCC dashed"><img src="<%=rs("img")%>" width="50" /></td>
    <td style="border-bottom:1px #CCCCCC dashed"><a href="about.aspx?action=1&id=<%=rs("id")%>" style="font-size:12px;">ɾ��</a></td>
  </tr>
<%
	rs.movenext
	wend
	end if
	rs.close
	set rs=nothing
%>
</table>
<%end if%>


<%if request("id")=2 then%>
<form action="aboute1.aspx"  enctype="multipart/form-data" name="form1" method="post">
	<table width="99%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
	    <td width="40%" align="right" valign="bottom" style="font-size:12px;">ѡ��ͼƬ&nbsp; </td>
		<td width="60%" height="50" align="left" valign="bottom" style="font-size:12px;"><input name="imgs" type="file" id="imgs"/>
			 ͼƬ��ʽ��gif/jpg ͼƬ��С&lt;150K
			 ���ߴ磺187*80		</td>
	  </tr>
	  <tr>
	    <td align="right" valign="bottom" style="font-size:12px;">��ַ&nbsp;</td>
	    <td height="50" align="left" valign="bottom" style="font-size:12px;"><input name="address" type="text" id="address" /></td>
	    </tr>
	  <tr>
	    <td height="30" colspan="2" align="center" style="font-size:12px;">
		  <input type="submit" name="Submit2" value="�ύ" />		</td>
		</tr>
	</table>
</form>






<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="58%">&nbsp;</td>
    <td width="30%">&nbsp;</td>
    <td width="12%">&nbsp;</td>
  </tr>
  <tr>
    <td style="border-bottom:1px #CCCCCC solid"><font style="font-size:14px; font-weight:bold">���������Ƭ</font></td>
    <td style="border-bottom:1px #CCCCCC solid"><font style="font-size:14px; font-weight:bold">��ַ</font></td>
    <td height="30" style="border-bottom:1px #CCCCCC solid"><font style="font-size:14px; font-weight:bold">����</font></td>
  </tr>
<%
	set Rs=server.createobject("adodb.recordset")	
	sql=("select * from tbl_abouta where type=2")
	Rs.Open sql,Conn,3,3
	if not rs.eof and not rs.bof then
	while not rs.eof
%>

  <tr>
    <td style="border-bottom:1px #CCCCCC dashed"><img src="<%=rs("img")%>" width="189" /></td>
    <td style="border-bottom:1px #CCCCCC dashed"><%=rs("address")%></td>
    <td style="border-bottom:1px #CCCCCC dashed"><a href="about.aspx?action=1&id=<%=rs("id")%>" style="font-size:12px;">ɾ��</a></td>
  </tr>
<%
	rs.movenext
	wend
	end if
	rs.close
	set rs=nothing
%>
</table>
<%end if%>








<%if request("id")=8 then%>
<form action="aboutd1.aspx"  enctype="multipart/form-data" name="form1" method="post">
	<table width="99%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
	    <td width="42%" height="30" align="right" valign="bottom" style="font-size:12px;">ѡ��ͼƬ��</td>
		<td width="58%" height="30" align="left" valign="bottom" style="font-size:12px;"><input name="imgs" type="file" id="imgs"/>
			 ͼƬ��ʽ��gif/jpg ͼƬ��С&lt;150K
			 ���ߴ磺166*239		</td>
	  </tr>
	  <tr>
	    <td height="30" align="right" valign="bottom" style="font-size:12px;">������������</td>
	    <td height="30" align="left" valign="bottom" style="font-size:12px;"><input name="title" type="text" id="title" /></td>
	    </tr>
	  <tr>
	    <td height="30" align="right" valign="bottom" style="font-size:12px;">�����ɽ��ܣ�</td>
	    <td height="30" align="left" valign="bottom" style="font-size:12px;"><input name="memo" type="text" id="memo" /></td>
	    </tr>
	  <tr>
	    <td align="center" style="font-size:12px;">&nbsp;</td>
		<td height="30" align="left" style="font-size:12px;">
		  <input type="submit" name="Submit2" value="�ύ" />		</td>
	  </tr>
	</table>
</form>






<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30" style="border-bottom:1px #CCCCCC solid"><font style="font-size:14px; font-weight:bold">ѡ���Ŷ���Ƭ</font></td>
    <td style="border-bottom:1px #CCCCCC solid"><font style="font-size:14px; font-weight:bold">����������</font></td>
    <td style="border-bottom:1px #CCCCCC solid"><font style="font-size:14px; font-weight:bold">�����ɽ���</font></td>
    <td height="30" style="border-bottom:1px #CCCCCC solid"><font style="font-size:14px; font-weight:bold">����</font></td>
  </tr>
<%
	set Rs=server.createobject("adodb.recordset")	
	sql=("select * from tbl_abouta where type=8")
	Rs.Open sql,Conn,3,3
	if not rs.eof and not rs.bof then
	while not rs.eof
%>

  <tr>
    <td class="content" style="border-bottom:1px #CCCCCC dashed"><img src="<%=rs("img")%>" width="50" /></td>
    <td class="content" style="border-bottom:1px #CCCCCC dashed"><%=rs("title")%></td>
    <td class="content" style="border-bottom:1px #CCCCCC dashed"><%=rs("memo")%></td>
    <td class="content" style="border-bottom:1px #CCCCCC dashed"><a href="about.aspx?action=1&id=<%=rs("id")%>" style="font-size:12px;">ɾ��</a></td>
  </tr>
<%
	rs.movenext
	wend
	end if
	rs.close
	set rs=nothing
%>
</table>
<%end if%>
















		</td>
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
  
</BODY></HTML>
