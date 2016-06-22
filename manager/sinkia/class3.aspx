<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<TITLE>商城管理</TITLE>
<STYLE></STYLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</HEAD>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">参数设置</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 系统设置 &gt; 参数设置</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />参数设置</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
      <tr>
        <td width="100" height="40" align="left" ><input type="submit" name="Submit2" value="添加周龄" style="border:1px #CCCCCC solid; background-color:#FFFFFF; line-height:20px; font-family:'微软雅黑';" onclick="javascript:location.href='class1.aspx'" /></td>
        <td width="110" height="40" align="left" ><input type="submit" name="Submit2" value="添加月龄段" style="border:1px #CCCCCC solid; background-color:#FFFFFF; line-height:20px; font-family:'微软雅黑';" onclick="javascript:location.href='class2.aspx'" /></td>
        <td width="110" height="40" align="left" ><input type="submit" name="Submit2" value="添加关键字" style="border:1px #CCCCCC solid; background-color:#FFFFFF; line-height:20px; font-family:'微软雅黑';" onclick="javascript:location.href='class3.aspx'" disabled/></td>
        <td width="110" height="40" align="left" ><input type="submit" name="Submit2" value="添加类别" style="border:1px #CCCCCC solid; background-color:#FFFFFF; line-height:20px; font-family:'微软雅黑';" onclick="javascript:location.href='class4.aspx'" /></td>
          <td height="40" align="right" ><input type="submit" name="Submit2" value="修改参数" style="border:1px #CCCCCC solid; background-color:#FFFFFF; line-height:20px; font-family:'微软雅黑';" onclick="javascript:location.href='class11.aspx'" /></td>
      </tr>
    </table>
    <!--#include file="../../conn.aspx"-->
	
<%
	if request("action")="add" then
	
		if request("guanjian")="" then
			response.Write "<script language=javascript>alert('请填写关键字！');location.href='class3.aspx';</script>"
			response.end
		end if
	
		SQL="select* from guanjian"
		set rs=server.CreateObject("adodb.recordset")
		rs.Open SQL,conn,1,3
			rs.addnew
				rs("guanjian")=request("guanjian")
			rs.update
		rs.close
		set rs=nothing	
		
		response.Write "<script language=javascript>alert('添加成功！');location.href='class3.aspx';</script>"
		response.end
	
	end if	  
%>

      <form id="form1" name="form1" method="post" action="?">
        <table width="1000" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="500" height="30" align="right"><strong>添加关键字</strong></td>
            <td width="500" height="30" align="left">&nbsp;</td>
          </tr>
          <tr>
            <td width="500" height="30" align="right">关键字：</td>
            <td width="500" height="30" align="left">
				<input name="guanjian" type="text" id="guanjian" />
				<input name="action" type="hidden" id="action" value="add" />
			</td>
          </tr>
          <tr>
            <td width="500" height="30" align="right">&nbsp;</td>
            <td width="500" height="30" align="left"><input type="submit" name="Submit" value="提交" /></td>
          </tr>
        </table>
      </form>
    </td>
  </tr>
</table>

</BODY></HTML>
          