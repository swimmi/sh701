 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
</head>

<body>
<!--#include file="../../conn.aspx"-->

  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td height="80" colspan="2">������֤</td>
    </tr>
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; �̻����� &gt; �̻��б� &gt; ������֤</td>
    </tr>
  </table>
  
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
    <tr class="biao">
      <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />������֤</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">

<%


if request("Submit")="ȷ��" then


	conn.execute("update tbl_huiyuan set rz1=3 where huiyuan_id='"&request("huiyuan_id")&"'")

	response.Redirect "al_read20.aspx"
end if


SQL="select * from tbl_huiyuan where huiyuan_id='"&request("huiyuan_id")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
zhanghu=rs("zhanghu")
yinghang=rs("yinghang")
zhihang=rs("zhihang")
xingming=rs("xingming")
rs.close
set rs=nothing

%>
</div>
      <form id="form1" name="form1" method="post" action="">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="44%" height="30" align="center">&nbsp;</td>
            <td width="56%" height="30" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="40" align="right" class="content">�������У�</td>
            <td height="40" align="left" class="content"><input type="text" name="yinghang" value="<%=yinghang%>" readonly style="color:#999999"/>
                <font color="#FF0000">*</font></td>
          </tr>
          <tr style="display:none">
            <td height="40" align="right" class="content">����֧�У�</td>
            <td height="40" align="left" class="content"><input type="text" name="zhihang" value="<%=zhihang%>" readonly style="color:#999999"/>
                <font color="#FF0000">*</font></td>
          </tr>
          <tr>
            <td height="40" align="right" class="content">����������</td>
            <td height="40" align="left" class="content"><input type="text" name="xingming" value="<%=xingming%>" readonly style="color:#999999"/>
                <font color="#FF0000">*</font></td>
          </tr>
          <tr>
            <td height="40" align="right" class="content">�����˺ţ�</td>
            <td height="40" align="left" class="content"><input type="text" name="zhanghu" value="<%=zhanghu%>" readonly style="color:#999999"/>
                <font color="#FF0000">*</font></td>
          </tr>
          <tr>
            <td height="40" align="right" class="content">&nbsp;</td>
            <td height="40" align="left" class="content"><input type="submit" name="Submit" value="ȷ��" /></td>
          </tr>
          <tr>
            <td height="60" colspan="2" align="center"><input type="submit" name="Submit22" value="ȷ������" onClick="return check();"  style=" background:url(user/9.jpg) no-repeat;border:none; width:100px; height:30px;cursor:pointer; color:#FFFFFF; font-size:15px; font-family:'΢���ź�';"/></td>
          </tr>
        </table>
        </form>
      </td>
    </tr></table>

</body>
</html>
