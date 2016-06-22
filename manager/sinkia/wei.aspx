
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../jiance.aspx"-->
<!--#include file="../../time/time.aspx"-->
<!--#include file="../../conn.aspx"-->
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">二维码管理</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 视频管理 &gt; 二维码管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />二维码管理</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">



 <table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="370" align="left" valign="top">
	 
	 
		<form id="form1" name="form1" method="post" action="weib.aspx">
			<table width="99%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="80" align="right" style="font-size:12px;">生成二维码：</td>
					<td align="left" width="200">
					
<%
    banci = request("banci")  
    yingci = request("yingci") 
	
    set rs=server.createobject("adodb.recordset")   
    sql = "select banci  from jihuoma where tushu='"&request("tushu")&"' group by banci"   
    rs.open sql,conn,1,3
    strOption3 = "<option value='' selected>请选择版次</option>"
	do while not rs.eof
		if cstr(rs("banci")) = cstr(banci) then
			strOption3 = strOption3 & "<option value='" & rs("banci") & "' selected>第" & rs("banci") & "版</option>"
		else
			strOption3 = strOption3 & "<option value='" & rs("banci") & "'>第" & rs("banci") & "版</option>"
		end if 
	rs.movenext    
	loop 
	rs.close
	
	if banci <> "" then
		sql = "select yingci from jihuoma where tushu='"&request("tushu")&"' and banci='"&banci&"' group by yingci"   
		rs.open sql,conn,1,3
		strOption4 = "<option value='' selected>请选择印次</option>"
		do while not rs.eof
			if cstr(rs("yingci")) = cstr(yingci) then
				strOption4 = strOption4 & "<option value='" & rs("yingci") & "' selected>第 "&rs("yingci")& " 次</option>"
			else
				strOption4 = strOption4 & "<option value='" & rs("yingci") & "'>第 " &  rs("yingci")  & " 次</option>"
			end if
		rs.movenext    
		loop   
		rs.close
	end if
	 
%>					
					
					
					
<select onchange="changec(this.value)" name="banci" style="border:1px #CCCCCC solid; color:#000000; "><%=strOption3%></select>
<select onchange="changed(this.value)" name="yingci" style="border:1px #CCCCCC solid; color:#000000;"><%=strOption4%></select>

<script language="javascript"><!--
     function changec(banci){
           location.assign("wei.aspx?tushu=<%=request("tushu")%>&id=<%=request("id")%>&banci=" + banci);   
     }
     
     function changed(yingci){
           location.assign("wei.aspx?tushu=<%=request("tushu")%>&id=<%=request("id")%>&banci=<%=banci%>&yingci=" + yingci);   
     }
-->
</script>
				<input name="id" type="hidden" id="id" style="width:100px; height:20px;" value="<%=request("id")%>" />
				<input name="tushu" type="hidden" id="tushu" style="width:100px; height:20px;" value="<%=request("tushu")%>" />
				</td>
				<td align="left" width="90"><input type="submit" name="Submit2" value="生成二维码" style="border:1px #CCCCCC solid; background-color:#FFFFFF; line-height:15px; font-family:'微软雅黑';" onClick="if(confirm('你确定生成二维码吗?')){return true;}else{return false;}"/></td>
				
			
<%
	SQL="select * from weixing where tushuid='"&request("tushu")&"' and banci='"&request("banci")&"' and yingci='"&request("yingci")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
%>		
        <td align="right"><input type="submit" name="Submit22" value="批量导出二维码" style="border:1px #CCCCCC solid; background-color:#FFFFFF; line-height:20px; font-family:'微软雅黑';" onClick="javascript:location.href='weidao.aspx?tushu=<%=request("tushu")%>&banci=<%=request("banci")%>&yingci=<%=request("yingci")%>&id=<%=request("id")%>'"/>
        <input type="submit" name="Submit23" value="全部删除" style="border:1px #CCCCCC solid; background-color:#FFCC00; line-height:20px; font-family:'微软雅黑';" onClick="javascript:if(!confirm('\n特别提示!删除后将无法进行恢复。'))  return  false; location.href='weidel.aspx?tushu=<%=request("tushu")%>&banci=<%=request("banci")%>&yingci=<%=request("yingci")%>&id=<%=request("id")%>'"/>
        </td>
        </tr>
			</table>
    </form>
	<Br />
<table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="999999">
    <tr bgcolor="#E3E3E3">
      <td height="30" align="center">视频编号</td>
      <td height="30" align="center">视频名称</td>
      <td height="30" align="center">图书名称</td>
      <td height="30" align="center">图书序列号</td>
      <td height="30" align="center">激活码</td>
      <td align="center">二维码视频链接</td>
      <td height="30" align="center">操作</td>
    </tr>
<%do while not rs.eof%>
    <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
      <td align="center" class="content"><%=rs("videobianhao")%></td>
      <td align="center" class="content"><%=rs("videotitle")%></td>
      <td align="center" class="content"><%=rs("tushutitle")%></td>
      <td align="center" class="content"><%=rs("xuliehao")%></td>
      <td align="center" class="content"><%=rs("jihuoma")%></td>
      <td align="center" class="content">http://yezzj.91gaocai.com//video.aspx?bh=<%=rs("videobianhao")%>&jhm=<%=rs("jihuoma")%></td>
      <td align="center" class="content"><a href="weilook.aspx?id=<%=rs("id")%>">预览二维码</a></td>
    </tr>
<%
	rs.movenext
	loop
	rs.close
	set rs=nothing
%>
           </table>
		   
		   
		   
		   
		   

		</td>
   </tr>
 </table></td>
  </tr>
</table>
</body>
</html>
