<!--#include file="../../conn.aspx"-->  
<!--#include file="../jiance.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE16 {color: #0000FF; font-weight: bold; }
-->
</style>
</head>

<body>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">查看预算奖金</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 奖金结算 &gt; 查看预算奖金</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />查看预算奖金</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">

<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D3D3D3" class="content">
	<tr bgcolor="#F7F7F7" style="padding-left:30px;">
	  <td height="200" align="center" bgcolor="#FFFFFF" style="padding-top:20px; padding-bottom:20px;"><table width="99%" border="0" cellpadding="0" cellspacing="1" bgcolor="c1c1c1">
        <tr bgcolor="#e1e1e1" class="titlea1">
          <td height="40" align="center" >结算奖金</td>
          <td height="40" align="center" >新增业绩</td>
          <td height="40" align="center" >拨出比率</td>
        </tr>
        <tr  class="content">
          <td height="40" align="center" bgcolor="#FFFFFF">
<%
set rs=server.createobject("adodb.recordset")
rs.open "select 'aa'=sum(xiaofei_money) from tbl_xiaofei_rec where flag_cha=0",conn,1,1
if isnull(rs("aa")) then
	aa=rs("aa")
	response.Write 0
else
	aa=rs("aa")
	response.Write rs("aa")
end if
rs.close
set rs=nothing
%>
          </td>
          <td height="40" align="center" bgcolor="#FFFFFF">
<%
set rs=server.createobject("adodb.recordset")
rs.open "select 'bb'=isnull(sum(xiaofei_money),0) from tbl_xiaofei where cha=0 and zhuce_flag=1 and xiaofei_qr_flag=1",conn,1,1
	bb=rs("bb")
rs.close
set rs=nothing

set rs=server.createobject("adodb.recordset")
rs.open "select 'cc'=isnull(sum(qianbao),0) from tbl_ji where flag1=0",conn,1,1
	cc=rs("cc")
rs.close
set rs=nothing

response.Write bb+cc

bb=bb+cc

if aa>0 and bb>0 then
	cc=aa/bb
end if
if aa=0 or bb=0 then
	cc=0
end if
%>
</td>
          <td height="40" align="center" bgcolor="#FFFFFF"><%=round(cc*100,2)%>%</td>
        </tr>
      </table>
	  <br />
	    <table width="99%" border="0" cellpadding="0" cellspacing="1" bgcolor="c1c1c1">
          <tr class="content">
            <td height="40" align="center" bgcolor="#FFFFFF" style="padding-top:20px; padding-bottom:20px;">

<%
set rs=server.createobject("adodb.recordset")
rs.open "select a,b from tbl_canshu",conn,1,1
	a=rs("a")
	b=rs("b")
rs.close
set rs=nothing
%>

<%if a>0 and a-cc>0 then%>您好，奖金已算出，<span class="STYLE16">拨比低于A值</span>，是否需要启动K值？
<%end if%>
<%if b>0 and b-cc<0 then%>
您好，奖金已算出，<span class="STYLE16">拨比高于B值</span>，是否需要启动K值？
<%end if%>
<%if b-cc>0 and a-cc<0 then%>
您好，奖金已算出，<span class="STYLE16">拨比在范围以内</span>，可直接进行结算？
<%end if%>
<br /><br />




			<form id="form1" name="form1" method="post" action="003.aspx" style="margin:0px;">
			  K值：
			  <input name="textfield" type="text" />
			  是否启用
			  <input type="checkbox" name="checkbox" value="checkbox" />
			  <Br />
			  <Br />
			  <input type="submit" name="Submit" value="正式结算" />
			</form>
			</td>
          </tr>
        </table>
		
		</td>
  </tr>
</table>
</body>
</html>
