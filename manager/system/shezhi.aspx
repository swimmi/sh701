 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE11 {color: #0790FF}
-->
</style>
</head>

<body>
 <!--#include file="../../conn.aspx"--> 
 <%
if request("submit")="设置" then
	canshu_zd=request.form("canshu_zd")
	canshu_hk=request.form("canshu_hk")
	canshu_tk=request.form("canshu_tk")
	canshu_ly=request.form("canshu_ly")
	canshu_wl1=request.form("canshu_wl1")
	canshu_wl2=request.form("canshu_wl2")
	canshu_wl3=request.form("canshu_wl3")
	duihuan=request.form("duihuan")
	
	set rs_test=server.CreateObject("adodb.recordset")
	rs_test.open "select * from tbl_canshu ",conn,1,3
	 
	 conn.execute("update tbl_canshu set canshu_wl1="&canshu_wl1&",canshu_wl2="&canshu_wl2&",canshu_wl3="&canshu_wl3&",canshu_zd="&canshu_zd&",canshu_hk="&canshu_hk&",canshu_tk="&canshu_tk&",canshu_ly="&canshu_ly&",duihuan="&duihuan&"")
	

	
	response.Write "<script language=javascript>alert('设置成功！');location.href='shezhi.aspx';</script>"
	response.end
end if
%>

 
 
<%
SQL="select * from tbl_canshu"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
%>



<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">系统安全设置</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 系统设置 &gt; 系统安全设置</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />系统安全设置</td>
  </tr>
  <tr>
    <td align="center"  bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	
	
<form id="form1" name="form1" method="post" action="?" style="margin:0px;">
  <table width="99%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#c1c1c1">
        <tr bgcolor="#e1e1e1" class="titlea1">
          <td width="25%" height="40" align="center">名称</td>
          <td width="25%" height="40" align="center">开关</td>
          <td width="25%" height="40" align="center">名称</td>
          <td width="25%" height="40" align="center">开关</td>
        </tr>
        <tr style="display:none">
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">&nbsp;</td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">&nbsp;</td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">兑换管理</font></td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content"><input type="radio" name="duihuan" value="0" <%if rs("duihuan")=0 then%>checked<%end if%> />
            开
            <input type="radio" name="duihuan" value="1" <%if rs("duihuan")=1 then%>checked<%end if%> />
            关</td>
        </tr>
        <tr>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">方案查询</font></td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content"><input type="radio" name="canshu_zd" value="0" <%if rs("canshu_zd")=0 then%>checked<%end if%> />
            开
            <input type="radio" name="canshu_zd" value="1" <%if rs("canshu_zd")=1 then%>checked<%end if%> />
            关</td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">汇款登记</font></td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content"><input type="radio" name="canshu_hk" value="0" <%if rs("canshu_hk")=0 then%>checked<%end if%> />
            开
            <input type="radio" name="canshu_hk" value="1" <%if rs("canshu_hk")=1 then%>checked<%end if%> />
            关</td>
        </tr>
        <tr>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">转账管理</font></td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content"><input type="radio" name="canshu_wl2" value="0" <%if rs("canshu_wl2")=0 then%>checked<%end if%> />
            开
            <input type="radio" name="canshu_wl2" value="1" <%if rs("canshu_wl2")=1 then%>checked<%end if%> />
            关</td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">提款登记</font></td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content"><input type="radio" name="canshu_tk" value="0" <%if rs("canshu_tk")=0 then%>checked<%end if%> />
            开
            <input type="radio" name="canshu_tk" value="1" <%if rs("canshu_tk")=1 then%>checked<%end if%> />
            关</td>
        </tr>
        <tr>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">查看留言</font></td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content"><input type="radio" name="canshu_ly" value="0" <%if rs("canshu_ly")=0 then%>checked<%end if%> />
            开
            <input type="radio" name="canshu_ly" value="1" <%if rs("canshu_ly")=1 then%>checked<%end if%> />
            关</td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">接点网络图</font></td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content"><input type="radio" name="canshu_wl1" value="0" <%if rs("canshu_wl1")=0 then%>checked<%end if%> />
            开
            <input type="radio" name="canshu_wl1" value="1" <%if rs("canshu_wl1")=1 then%>checked<%end if%> />
            关</td>
        </tr>
        <tr>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">推荐网络图</font></td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content"><input type="radio" name="canshu_wl3" value="0" <%if rs("canshu_wl3")=0 then%>checked<%end if%> />
            开
            <input type="radio" name="canshu_wl3" value="1" <%if rs("canshu_wl3")=1 then%>checked<%end if%> />
            关</td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">&nbsp;</td>
          <td  height="30" align="center" bgcolor="#FFFFFF" class="content">&nbsp;</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td height="35" align="center"><input type="submit" name="Submit" value="设置" /></td>
    </tr>
  </table>
</form>

</td></tr></table>
</body>
</html>
