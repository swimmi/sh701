<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="../../conn.aspx"-->
<script charset="utf-8" src="../../editor/kindeditor.js"></script>
<script charset="utf-8" src="../../editor/lang/zh_CN.js"></script>
<script>    
var editor;
KindEditor.ready(function(K) {editor = K.create('textarea[name="memo"]', {allowFileManager : true});});
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">����</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ������֮�� &gt; ����</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />����</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px; padding-top:10px;">
	
<form action="add1.aspx"  enctype="multipart/form-data" name="form1" method="post">
  <table width="100%" border="0" cellpadding="0" cellspacing="1">

    <tr>
      <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="107" height="30" align="right" class="content">���⣺</td>
          <td width="1069"  align="left"><input name="title" type="text" id="title" size="50" /></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">���ͼ��</td>
          <td  align="left"><span style="font-size:12px;">
            <input name="imgs" type="file" id="imgs"/>
          </span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">���ܣ�</td>
          <td  align="left"><input name="js" type="text" id="js" size="50" /></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">���ͣ�</td>
          <td  align="left"><select name="select">
              <option value="1">��ʳ</option>
              <option value="2">����</option>
              <option value="3">����</option>
              <option value="4">����</option>
              <option value="5">����</option>
              <option value="6">Ʒ��</option>
              <option value="7">��ֲ</option>
              <option value="8">����</option>
              <option value="9">��չ</option>
              <option value="10">�γ�</option>
              <option value="11">����</option>
              <option value="12">�</option>
              <!--<option value="13" style="display:none">��̸</option>-->
            </select>          </td>
        </tr>
        <tr>
          <td height="30" colspan="2" align="center" valign="top" class="content"><textarea name="memo" style="width:99%;height:350px;visibility:hidden;"></textarea></td>
          </tr>
        <tr>
          <td height="30" align="right" class="content">����ʱ�䣺</td>
          <td align="left"><input name="addtime" type="text" id="addtime" style="color:#999999" value="<%=now()%>" readonly=""/></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">&nbsp;</td>
          <td height="40" align="left" valign="bottom"><input type="submit" name="Submit" value="ȷ�Ϸ���" /></td>
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