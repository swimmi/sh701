<!--#include file="../../conn.aspx"-->  
<!--#include file="../jiance.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<%	
if Request("action")=1 then

	set rs_addnew=server.createobject("adodb.recordset")
    rs_addnew.open "select * from tbl_jiebie where id='"&request("id")&"'",conn,1,3  
	rs_addnew("jiebie")=trim(Request("jiebie"))
	rs_addnew("qianbao")=trim(Request("qianbao"))
    rs_addnew.Update
	rs_addnew.close
	set rs_addnew=nothing

	response.Write "<script language=javascript>alert('操作成功！');location.href='jeibie.aspx';</script>"
	response.end

end if

if Request("action")=3 then
	set rsa=server.createobject("adodb.recordset")
	sqla="select * from tbl_canshu"
	rsa.open sqla,conn,1,3
	rsa("canshu_068")=trim(Request("canshu_068"))
	rsa("canshu_069")=trim(Request("canshu_069"))
	rsa("canshu_070")=trim(Request("canshu_070"))
    rsa.Update
	rsa.close
	set rsa=nothing

	response.Write "<script language=javascript>alert('操作成功！');location.href='jeibie.aspx';</script>"
	response.end

end if




if Request("action")=2 then

	if request.form("min")=""  then
		response.Write "<script language=javascript>alert('请填写正确的PV值范围1！');history.go(-1);</script>"
		response.end
	end if
	if not isnumeric(request.form("min"))  then
		response.Write "<script language=javascript>alert('请填写正确的PV值范围2！');history.go(-1);</script>"
		response.end
	end if
	if request.form("max")=""  then
		response.Write "<script language=javascript>alert('请填写正确的PV值范围3！');history.go(-1);</script>"
		response.end
	end if
	if not isnumeric(request.form("max"))  then
		response.Write "<script language=javascript>alert('请填写正确的PV值范围4！');history.go(-1);</script>"
		response.end
	end if
	
	if request.form("canshu")=""  then
		response.Write "<script language=javascript>alert('请填写正确的积分比率！');history.go(-1);</script>"
		response.end
	end if
	if not isnumeric(request.form("canshu"))  then
		response.Write "<script language=javascript>alert('请填写正确的积分比率！');history.go(-1);</script>"
		response.end
	end if

	if Request("min")-Request("max")>=0 then
		response.Write "<script language=javascript>alert('请填写正确的PV值范围5！');location.href='jeibie.aspx';</script>"
		response.end
	end if
	
	set rs_addnew=server.createobject("adodb.recordset")
    rs_addnew.open "select * from tbl_jiebie where id='"&request("id")&"'",conn,1,3  
	rs_addnew.addnew
	rs_addnew("jiebie")=trim(Request("jiebie"))
	rs_addnew("min")=trim(Request("min"))
	rs_addnew("max")=trim(Request("max"))
	rs_addnew("canshu")=trim(Request("canshu"))
	rs_addnew("qianbao")=trim(Request("qianbao"))
	if request("checkbox")<>"" then
		rs_addnew("flag")=1
	else
		rs_addnew("flag")=0
	end if
    rs_addnew.Update
	rs_addnew.close
	set rs_addnew=nothing

	response.Write "<script language=javascript>alert('操作成功！');location.href='jeibie.aspx';</script>"
	response.end

end if


set rs=server.createobject("adodb.recordset")
sql2="select * from tbl_canshu where id=1"
rs.open sql2,conn,1,1 
if rs.RecordCount=0 then
Response.Write "非法操作！"
Response.end
end if
%>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">系统参数设置</td>
  </tr>

</table>
<br />
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#D3D3D3" class="content">
    <tr bgcolor="#F7F7F7" >
      <td width="100%" height="30" align="center" bgcolor="#FFFFFF"><table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#999999">
          <tr bgcolor="#F7F7F7">
            <td height="30" align="center" bgcolor="#CCCCCC" class="title">会员级别</td>
            <td align="center" bgcolor="#CCCCCC" class="title">注册金额</td>
            <td height="30" align="center" bgcolor="#CCCCCC" class="title">操作</td>
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
            <td align="center" bgcolor="#FFFFFF"><%if rsa("id")=1 then%><input name="qianbao" type="text" id="qianbao" value="<%=rsa("qianbao")%>" /><%end if%></td>
            <td align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="修改" /></td>
          </tr>
</form>
<%rsa.movenext
wend %>
<form id="form1" name="form1" method="post" action="?action=2">

          <tr bgcolor="#F7F7F7" style="display:none">
            <td height="30" align="center" bgcolor="#FFFFFF"><input name="jiebie" type="text" id="jiebie" size="20" /></td>
            <td align="center" bgcolor="#FFFFFF">&nbsp;</td>
            <td align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="添加" /></td>
          </tr>
</form>
<%rsa.close
set rsa=nothing %>
		  
      </table>
	  
      		  
</body>
</html>
