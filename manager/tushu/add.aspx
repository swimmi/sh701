<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="../../conn.aspx"-->
<%	 
if request.form("submit")="ȷ�����" then
if Request("bianhao")="" then
	response.Write "<script language=javascript>alert('����дͼ���ţ�');history.go(-1);</script>"
	response.end
end if
if Request("title")="" then
	response.Write "<script language=javascript>alert('����дͼ�����ƣ�');history.go(-1);</script>"
	response.end
end if
	set rs=server.CreateObject("adodb.recordset") 
	sql="select * from tushu"
	rs.Open sql,conn,1,3
    rs.AddNew
    rs("title") =Request("title")
    rs("bianhao") =request("bianhao")
    rs("isbn") =request("isbn")
    rs("addtime")= now()
    rs.Update
	rs.close
	set rs=nothing

	response.Write "<script language=javascript>alert('�ɹ�������');location.href='read.aspx';</script>"
	response.end

end if
   %>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">���ͼ��</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ϵͳ���� &gt; ͼ��ӡˢ���� &gt; ���ͼ��</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />���ͼ��</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px; padding-top:10px;">
	
<form id="form1" name="form1" method="post" action="add.aspx">
  <table width="100%" border="0" cellpadding="0" cellspacing="1">

    <tr>
      <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="107" height="30" align="right" class="content">ͼ���ţ�</td>
          <td width="1069"  align="left"><input name="bianhao" type="text" id="bianhao" size="50" />
            <span class="hong">            *</span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">ͼ�����ƣ�</td>
          <td  align="left"><input name="title" type="text" id="title" size="50" />
            <span class="hong">            *</span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">ͼ��ISBN��</td>
          <td  align="left"><input name="isbn" type="text" id="isbn" size="50" /></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">&nbsp;</td>
          <td height="40" align="left" valign="bottom"><input type="submit" name="Submit" value="ȷ�����" />
            <input type="button" name="Submit2" value="������һҳ" onclick="javasprit:history.go(-1);"/></td>
        </tr>
      </table>
        </td>
    </tr>
  </table>
</form>

	
    </td>
  </tr>
</table>
</body>
</html>
