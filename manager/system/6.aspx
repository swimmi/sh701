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
if Request("submit")="确认修改" then
	set rs_addnew=server.createobject("adodb.recordset")
    rs_addnew.open "select * from tbl_canshu",conn,1,3  
	rs_addnew("canshu_007")=trim(Request("canshu_007"))
	rs_addnew("canshu_008")=trim(Request("canshu_008"))
	rs_addnew("canshu_009")=trim(Request("canshu_009"))
	rs_addnew("canshu_010")=trim(Request("canshu_010"))
	rs_addnew("canshu_011")=trim(Request("canshu_011"))
	rs_addnew("canshu_012")=trim(Request("canshu_012"))
	rs_addnew("canshu_013")=trim(Request("canshu_013"))
	rs_addnew("canshu_014")=trim(Request("canshu_014"))
	rs_addnew("canshu_015")=trim(Request("canshu_015"))
	rs_addnew("canshu_016")=trim(Request("canshu_016"))
	
    rs_addnew.Update
	response.Write "<script language=javascript>alert('操作成功！');location.href='canshu.aspx';</script>"
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
	    <form id="form1" name="form1" method="post" action="?">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#D3D3D3" class="content">
    <tr bgcolor="#F7F7F7" >
      <td width="100%" height="30" align="center" bgcolor="#FFFFFF"><table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#D3D3D3">
          <tr bgcolor="#F7F7F7">
            <td height="30" colspan="2" align="left" bgcolor="#CCCCCC">&nbsp;&nbsp;&nbsp;&nbsp;<strong>服务中心参数设置</strong></td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td height="30" align="right" bgcolor="#FFFFFF">一级经销商：</td>
            <td height="30" align="left" bgcolor="#FFFFFF">&nbsp;进货总额
			  <input name="canshu_028" type="text" id="canshu_028" value="<%=rs("canshu_028")%>" size="10" />
            补贴
            <input name="canshu_029" type="text" id="canshu_029" value="<%=rs("canshu_029")%>" size="10" />
            %</td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td width="18%" height="30" align="right" bgcolor="#FFFFFF">二级经销商：</td>
            <td width="82%" height="30" align="left" bgcolor="#FFFFFF">&nbsp;进货总额
              <input name="canshu_030" type="text" id="canshu_030" value="<%=rs("canshu_030")%>" size="10" />
              补贴
              <input name="canshu_031" type="text" id="canshu_031" value="<%=rs("canshu_031")%>" size="10" />
              %</td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td height="30" align="right" bgcolor="#FFFFFF">三级经销商：</td>
            <td height="30" align="left" bgcolor="#FFFFFF">&nbsp;进货总额
            <input name="canshu_032" type="text" id="canshu_032" value="<%=rs("canshu_032")%>" size="10" />

            补贴
            <input name="canshu_033" type="text" id="canshu_033" value="<%=rs("canshu_033")%>" size="10" />
%</td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td height="50" colspan="2" align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="确认修改" style="height:30px; width:100px;"/></td>
          </tr>

		  
      </table>
	  
        <br /></td>
    </tr>
  </table>
</form>

<br />
<br />
</body>
</html>
