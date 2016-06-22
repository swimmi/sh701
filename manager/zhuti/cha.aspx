<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />

<body>
<!--#include file="../../conn.aspx"-->





<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2" align="left">主题详细</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" align="left" bgcolor="EEEEEE" class="titlea">首页 &gt; 主题管理 &gt; 主题详细</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" align="left" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />主题详细</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;"><%

SQL="select * from view_zhuti where id='"&request("id")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
	zhuti_id=rs("id")
	zhuti_nc=rs("huiyuan_name")
	zhuti_title=rs("title")
	zhuti_memo=rs("memo")
	zhuti_addtime=rs("addtime")
rs.close
set rs=nothing
%>



<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#E3E7EA"  style="margin-top:10px;">
  <tr bgcolor="FFFFFF">
    <td align="left" valign="top" style="padding-left:10px;padding-right:10px;padding-bottom:10px;">
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="40" valign="middle">
				<font style="line-height:25px; color:#055D9D; font-weight:bold; font-size:12px;"><%=zhuti_title%></font>　<font style="line-height:25px; color:#FF4E1A; font-size:12px;">创建者：<%=zhuti_nc%></font>　<font style="line-height:25px; color:#999999; font-size:12px;">[<%=zhuti_addtime%>]</font>				</td>
		</tr>
		<tr>
			<td valign="top" style="padding-bottom:5px;">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f1f1f1" style="border:1px #008EB6 solid">
				  <tr>
					<td align="left" style="padding:5px; color:#000000; font-size:12px; padding:10px;"><%=zhuti_memo%></td>
				  </tr>
			  </table>
			</td>
	    </tr>
		<tr>
		  <td valign="top" >
<%
	SQL="select * from view_zhutia where zhuti='"&request("id")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if not rs.eof and not rs.bof then
	i=1
	while not rs.eof
%>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:5px;" bgcolor="#f8f8f8" onMouseOver="this.style.backgroundColor='#f1f1f1'"  onMouseOut="this.style.backgroundColor=''" >
					  <tr>
						<td width="93%" style="padding:5px;">
							<div style="margin-left:0px; float:left; font-size:12px;">
								<font style="color:#EB9601; font-weight:bold; line-height:25px;">第<%=i%>楼</font>　
								<font style="color:#03AED9; font-weight:bold; line-height:25px;">留言者：<%=rs("huiyuan_name")%></font>　
								<font style="color:#999999; line-height:25px;">[<%=now()%>]</font>							</div>				
							<div style="margin-left:30px; width:73px; height:20px; background-image:url(../images/50.jpg); float:left; line-height:20px; color:#CE2C1D; font-size:13px;" align="center"><%=rs("geili")%></div>
							<div style="margin-left:30px; width:73px; height:20px; background-image:url(../images/51.jpg); float:left; line-height:20px; color:#728BAA; font-size:13px;" align="center"><%=rs("bugeili")%></div>						</td>
				      </tr>
					  <tr>
					    <td style="padding-left:5px;padding-bottom:5px; font-size:12px;"><%=rs("memo")%></td>
			          </tr>
					  <tr>
					    <td style="padding-left:5px;padding-bottom:5px;">
							<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:5px; margin-left:20px;">
							  <tr>
								<td style="padding:5px;">
<%
	SQLa="select * from view_zhutib where zhutia='"&rs("id")&"'"
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	if not rsa.eof and not rsa.bof then
	while not rsa.eof
%>

		<table width="90%" border="0" cellpadding="0" cellspacing="0" style="border:1px #CCCCCC solid; margin-top:5px;">
		  <tr>
			<td style="padding:5px; font-size:12px;">留言者：<%=rsa("huiyuan_name")%>[<%=rsa("addtime")%>]</td>
		  </tr>
		  <tr>
			<td colspan="2" style="padding:5px; font-size:12px;"><%=rsa("memo")%></td>
		    </tr>
		</table>



						
<%
	rsa.movenext
	wend
	end if
	rsa.close
	set rsa=nothing
%>								</td>
							  </tr>
							</table>						</td>
			          </tr>
					</table>
<%
	i=i+1
	rs.movenext
	wend
	end if
	rs.close
	set rs=nothing
%>					
							
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>



    </td>
    </tr>
</table>


</body>
</html>
