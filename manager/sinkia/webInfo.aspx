<!--#include file="../../conn.aspx"-->
<!--#include file="inc/apartPage.aspx" -->
<!--#include file="Inc/UpLoadClass.aspx" -->
<!--#include file="Inc/Code2Info.en.aspx" -->

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

</HEAD>
<BODY bgColor=#FFFFFF 
leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<center>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2" align="left">商城信息</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" align="left" bgcolor="EEEEEE" class="titlea">首页 &gt; 网上商城 &gt; 商城信息</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" align="left" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />商城信息</td>
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
	Set rs=Conn.Execute("select * from tbl_sinkia_webInfo")
%>
<form action="webinfo1.aspx" enctype="multipart/form-data" name="form1" method="post">
<tr>
        <table width="96%" border="0" align="center" cellpadding="3" cellspacing="2" class="tablem">
  <tr>
    <td><table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
      <tr>
        <td height="5" colspan="2" align="right"></td>
      </tr>
      <tr>
        <td width="160" height="30" align="right">站点名称：</td>
        <td height="30" align="left"><input name="webName" type="text" id="webName" value="<%=rs("webName")%>" size="50"><%if action = "SetWeb" then
				response.Write "　　<font color='#00FF00'>[√]修改成功</font>"
				end if%></td>
      </tr>
      <tr>
        <td height="30" align="right">上传LOGO：</td>
        <td height="30" align="left"><span class="STYLE1">
          <input name="imgs" type="file" id="imgs"/>
        (尺寸：105x105)</span></td>
      </tr>
      <tr style="display:none">
        <td width="160" height="30" align="right">本站域名：</td>
        <td height="30" align="left"><input name="webAddress" type="text" id="webAddress" value="<%=rs("webAddress")%>" size="50">
          <font class="shuom">[前面须加上：http://]<%if action = "SetWeb" then
				response.Write "　　<font color='#00FF00'>[√]修改成功</font>"
				end if%></font></td>
      </tr>
      
      <tr style="display:none">
        <td width="160" height="30" align="right">网站关键字：</td>
        <td height="30" align="left"><textarea name="webKeyWords" cols="68" rows="6" class="textarea" id="webKeyWords"><%=rs("webKeyWords")%></textarea><%if action = "SetWeb" then
				response.Write "　　<font color='#00FF00'>[√]修改成功</font>"
				end if%><br><font class="shuom">[设置网站的关键字等，方便搜索引擎的搜索。支持HTML，请保证HTML标签的完整]</font></td>
      </tr>
      <tr style="display:none">
        <td width="160" height="30" align="right">网站备案信息：</td>
        <td height="30" align="left"><textarea name="webEnd" cols="68" rows="6" class="textarea" id="webEnd"><%=rs("webEnd")%></textarea><%if action = "SetWeb" then
				response.Write "　　<font color='#00FF00'>[√]修改成功</font>"
				end if%>
          <br><font class="shuom">[网站尾部备案信息等，支持HTML，请保证HTML标签的完整]</font></td>
      </tr>      
	  <tr style="display:none">
        <td height="30" align="right">商城欢迎语：</td>
        <td height="30" align="left"><input name="webtishi" type="text" id="webtishi" value="<%=rs("webtishi")%>" size="50">
            <%if action = "SetWeb" then
				response.Write "　　<font color='#00FF00'>[√]修改成功</font>"
				end if%></td>
      </tr>

    </table>
  </tr>
</table>
        <table width="96%" border="0" align="center" cellpadding="3" cellspacing="2" class="tablem">
  <tr>
    <td align="left"  style="padding-left:200px;"><input name="Submit" type="submit" class="buttom" value="保存配置"></td>
  </tr>
</table>
</form>
  <%		rs.Close
		Set rs=Nothing
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
</center>
</BODY></HTML>
