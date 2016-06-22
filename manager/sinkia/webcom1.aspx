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
%>

<%
	Select Case action
		Case "edit"
			Call edit()
		Case Else
			Call member()
	End Select
%>
</HEAD>
<BODY>
<%sub member%>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2" align="left">帮助中心</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" align="left" bgcolor="EEEEEE" class="titlea">首页 &gt; 网上商城 &gt; 帮助中心</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" align="left" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />帮助中心</td>
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
    <td height="40" align="left" ><%
	
	Rs.Open ("select * from tbl_sinkia_xx where id<33 "),Conn,1,1
	while not Rs.eof
	%>
    <a href=?newid=<%=Rs("id")%>><%=rs("title")%></a>&nbsp;
    <%
	Rs.movenext
	   wend
	   Rs.close
	%></td>
  </tr>
</table>
<%
 Rs.Open ("select * from tbl_web_company where id="&request("newid")),Conn,1,1
%>

 <form action="?action=edit&newid=<%=request("newid")%>" name="form1" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#999999">
  <tr>
    <td height="25" colspan="2" align="center" bgcolor="#FFFFFF">
	  <script charset="utf-8" src="../../../editor/kindeditor.js"></script>
<script charset="utf-8" src="../../../editor/lang/zh_CN.js"></script>
<script>    
var editor;
KindEditor.ready(function(K) {editor = K.create('textarea[name="content"]', {allowFileManager : true});});
</script>
<textarea name="content" style="width:99%;height:400px;visibility:hidden;"><%=rs("memo")%></textarea></td>
  </tr>
  <tr>
    <td height="25" colspan="2" bgcolor="#FFFFFF">
      <input type="submit" name="Submit" value="提交" onClick="return checkuserinfo_2007();">
      <input type="reset" name="Submit2" value="重置">    </td>
    </tr>
		
</table>
</form> 
                <%
rs.close
set rs= nothing

end sub

sub edit()

conn.execute("update tbl_web_company set memo='"&request.Form("content")&"' where id="&request("newid"))



response.write "<br><table width='96%' border='0' align='center' cellpadding='3' cellspacing='1' bgcolor='#C6C3C6'><tr bgcolor='#ffffff'><td height=120 valign=middle class='content'><div align=center>修改成功　　</div></td></tr><meta http-equiv='refresh' content='2 url=?newid="&request("newid")&"'></table>"
end sub

%></td>
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
