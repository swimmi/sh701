<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />

<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<body>
<!--#include file="../../conn.aspx"-->

<%
	Set Rs= Server.CreateObject("ADODB.Recordset")
	sql="select * from tbl_product where pro_id="&request("id")&""
	rs.Open SQL,conn,1,1
	proname=rs("pro_name")
	urlpm=rs("urlpm")
	rs.close
	set rs=nothing
%>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">添加图片－<%=proname%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999" class="content">
  <form action="addb1.aspx" method="post"  enctype="multipart/form-data" name="form1" id="form1">
    <tr>
      <td width="15%" height="25" align="right" bgcolor="#FFFFFF">商品名称：</td>
      <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><%=proname%>
      <input name="proid" type="hidden" id="proid" value="<%=request("id")%>" /></td>
    </tr>
    <tr>
      <td width="15%" height="25" align="right" bgcolor="#FFFFFF">图　　片：</td>
      <td width="85%" height="25" align="left" bgcolor="#FFFFFF"><span class="STYLE1">
        <input name="imgs" type="file" id="imgs" />
        *       图片格式：gif/jpg 图片大小&lt;150K</span></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#FFFFFF">排　　名：</td>
      <td height="25" align="left" bgcolor="#FFFFFF"><input name="pm" type="text" id="pm" value="<%=urlpm%>" /></td>
    </tr>
    <tr>
      <td height="25" colspan="2" bgcolor="#FFFFFF"> <input type="submit" name="Submit" value="提交" onclick="return checkuserinfo_2007();" />
          <input type="reset" name="Submit2" value="重置" />      </td>
    </tr>
  </form>
</table>
<br />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
  <tr>
    <%
	Set Rs= Server.CreateObject("ADODB.Recordset")
	sql="select * from tbl_product where pro_id="&request("id")&""
	rs.Open SQL,conn,1,1
	dim i
	i=1
	
	if not rs.eof and not rs.bof then
	while not rs.eof
%>
    <td height="25" align="center" bgcolor="#FFFFFF"><br />
        <table border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
          <tr>
            <td bgcolor="#FFFFFF"><table border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="125" valign="middle"><img src="<%=rs("url")%>" width="100" height="120" /><br />
				  <br /><%=rs("urlpm")%>
				  
				  </td>
                </tr>
            </table></td>
          </tr>
      </table></td>
    <%if i mod 6 = 0 then%>
  </tr>
  <%end if%>
  <%
i=i+1
	rs.movenext
	wend	
	end if
	rs.close
	set rs=nothing
%>
</table>
</body>
</html>
