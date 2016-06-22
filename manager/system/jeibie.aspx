 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>

 <!--#include file="../../conn.aspx"--> 
<%	
if Request("action")=1 then

	set rs_addnew=server.createobject("adodb.recordset")
    rs_addnew.open "select * from tbl_jiebie where id='"&request("id")&"'",conn,1,3  
	rs_addnew("jiebie")=trim(Request("jiebie"))
	rs_addnew("qianbao")=trim(Request("qianbao"))
	rs_addnew("canshu")=trim(Request("canshu"))
    rs_addnew.Update
	rs_addnew.close
	set rs_addnew=nothing

	response.Write "<script language=javascript>alert('操作成功！');location.href='jeibie.aspx';</script>"
	response.end

end if


if Request("action")=2 then

	if request.form("qianbao")=""  then
		response.Write "<script language=javascript>alert('请填写正确的注册金额范围1！');history.go(-1);</script>"
		response.end
	end if
	if not isnumeric(request.form("qianbao"))  then
		response.Write "<script language=javascript>alert('请填写正确的注册金额范围2！');history.go(-1);</script>"
		response.end
	end if
	
	set rs_addnew=server.createobject("adodb.recordset")
    rs_addnew.open "select * from tbl_jiebie where id='"&request("id")&"'",conn,1,3  
	rs_addnew.addnew
	rs_addnew("jiebie")=trim(Request("jiebie"))
	rs_addnew("qianbao")=trim(Request("qianbao"))
	rs_addnew("canshu")=trim(Request("canshu"))
	rs_addnew("flag")=1
    rs_addnew.Update
	rs_addnew.close
	set rs_addnew=nothing

	response.Write "<script language=javascript>alert('操作成功！');location.href='jeibie.aspx';</script>"
	response.end

end if


%>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">级别管理</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 会员管理 &gt; 级别管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />级别管理</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;"><table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#999999">
      <tr bgcolor="#F7F7F7">
        <td height="30" align="center" bgcolor="#CCCCCC" class="titlea1">会员级别</td>
        <td align="center" bgcolor="#CCCCCC" class="titlea1">升级金额</td>
        <td align="center" bgcolor="#CCCCCC" class="titlea1">优惠</td>
        <td height="30" align="center" bgcolor="#CCCCCC" class="titlea1">操作</td>
      </tr>
      <%
set rsa=server.createobject("adodb.recordset")
sqla="select * from tbl_jiebie where flag=1"
rsa.open sqla,conn,1,3
while not rsa.eof
%>
      <form id="form1" name="form1" method="post" action="?action=1">
        <tr bgcolor="#F7F7F7">
          <td height="30" align="center" bgcolor="#FFFFFF"><input name="jiebie" type="text" id="jiebie" value="<%=rsa("jiebie")%>" size="20" />
              <input name="id" type="hidden" id="id" value="<%=rsa("id")%>" size="10" /></td>
          <td align="center" bgcolor="#FFFFFF"><input name="qianbao" type="text" id="qianbao" value="<%=rsa("qianbao")%>" /></td>
          <td align="center" bgcolor="#FFFFFF"><input name="canshu" type="text" id="canshu" value="<%=rsa("canshu")%>" /></td>
          <td align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="修改" /></td>
        </tr>
      </form>
      <%rsa.movenext
wend %>

      <form id="form1" name="form1" method="post" action="?action=2">
        <tr bgcolor="#F7F7F7" style="display:none">
          <td height="30" align="center" bgcolor="#FFFFFF"><input name="jiebie" type="text" id="jiebie" size="20" /></td>
          <td align="center" bgcolor="#FFFFFF"><input name="qianbao" type="text" id="qianbao" /></td>
          <td align="center" bgcolor="#FFFFFF"><input name="canshu" type="text" id="canshu" /></td>
          <td align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="添加" /></td>
        </tr>
      </form>
      <%rsa.close
set rsa=nothing %>
    </table></td>
</tr>
</table>
</body>
</html>
