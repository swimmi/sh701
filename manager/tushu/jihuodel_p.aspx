<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="../../conn.aspx"-->
<!--#include file="md5.aspx"-->
<%	 
if request.form("submit")="批量生成激活码" then

if Request("tushu")=0 then
	response.Write "<script language=javascript>alert('请选择图书名称！');history.go(-1);</script>"
	response.end
end if
if Request("banci")="" then
	response.Write "<script language=javascript>alert('请填写图书版次！');history.go(-1);</script>"
	response.end
end if
if Request("yingci")="" then
	response.Write "<script language=javascript>alert('请填写图书印次！');history.go(-1);</script>"
	response.end
end if
if Request("shuliang")="" then
	response.Write "<script language=javascript>alert('请填写生成激活码数量！');history.go(-1);</script>"
	response.end
end if
if not isnumeric(request.form("shuliang"))  then
	response.Write "<script language=javascript>alert('生成激活码数量必须用数字表示，请正确操作！');history.go(-1);</script>"
	response.end
end if

	set rs=server.CreateObject("adodb.recordset") 
	sql="select * from tushu where id='"&request("tushu")&"'"
	rs.Open sql,conn,1,3
    bianhao=rs("bianhao")
	rs.close
	set rs=nothing


	
	
	for i=1 to request("shuliang")
	
		biaoji=now()
		biaoji=replace(biaoji,"/","")
		biaoji=replace(biaoji,"-","")
		biaoji=replace(biaoji,":","")
		biaoji=replace(biaoji," ","")
		
		jihuoma=left(md5(biaoji*i,16,1),10)
		
		
		if len(i)=1 then
			aa="00000"&i
		end if
		if len(i)=2 then
			aa="0000"&i
		end if
		if len(i)=3 then
			aa="000"&i
		end if
		if len(i)=4 then
			aa="00"&i
		end if
		if len(i)=5 then
			aa="0"&i
		end if
		if len(i)=6 then
			aa=i
		end if
		
		
		xuliehao=bianhao&request("banci")&request("yingci")&aa

		set rs=server.CreateObject("adodb.recordset") 
		sql="select * from jihuoma"
		rs.Open sql,conn,1,3
		rs.addnew
		rs("tushu") =Request("tushu")
		rs("xuliehao") =xuliehao
		rs("banci") =request("banci")
		rs("yingci") =request("yingci")
		rs("shuliang") =request("shuliang")
		rs("tushu") =request("tushu")
		rs("jihuoma") =jihuoma
		rs("addtime")= now()
		rs.Update
		rs.close
		set rs=nothing
	next




	response.Write "<script language=javascript>alert('成功发布！');location.href='jihuo.aspx';</script>"
	response.end

end if




   %>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">批量生成激活码</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 系统设置 &gt; 生成激活码 &gt; 批量生成激活码</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />批量生成激活码</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px; padding-top:10px;">
	
<form id="form1" name="form1" method="post" action="jihuodel_p.aspx">
  <table width="100%" border="0" cellpadding="0" cellspacing="1">

    <tr>
      <td align="center">
	  
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="157" height="30" align="right" class="content">图书名称：</td>
          <td width="1022"  align="left">
		  
		  
		  <select name="tushu">
			  	<option value="0">请选择图书</option>

<%
	SQL="select * from tushu order by id desc"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if not rs.eof and not rs.bof then
	while not rs.eof
%>
	<option value="<%=rs("id")%>"><%=rs("title")%></option>
<%
	rs.movenext
	wend
	end if
%>
              </select></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">图书版次：</td>
          <td  align="left"><input name="banci" type="text" id="banci" size="50"/><input name="action" type="hidden" id="action" size="50" value="del"/>
            <span class="hong">*</span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">图书印次：</td>
          <td  align="left"><input name="yingci" type="text" id="yingci" size="50"/>
            <span class="hong">*</span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">&nbsp;</td>
          <td height="40" align="left" valign="middle"><input type="submit" name="Submit" value="查询" /></td>
        </tr>
      </table>
	  
	  
        </td>
    </tr>
  </table>
</form>

<%if request("action")="del" then%>
	<table width="99%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" align="right">
		
		<div style="width:50px; height:20px; cursor:pointer; border:1px #CCCCCC solid; background-color:#f1f1f1">
		<a href="jihuodel_p2.aspx?tushu=<%=request("tushu")%>&banci=<%=request("banci")%>&yingci=<%=request("yingci")%>"  onClick="javascript:if(!confirm('\n特别提示!删除后将无法进行恢复。'))  return  false; ">全部删除</a>
		</div>
		
		
      </tr>
    </table>
	<table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="999999">
	  <tr bgcolor="#E3E3E3">
		<td height="35" align="center">图书序列号</td>
		<td height="35" align="center">图书名称</td>
		<td height="35" align="center">图书ISBN</td>
		<td align="center">图书版次</td>
		<td align="center">图书印次</td>
		<td align="center">激活码</td>
		<td align="center">生成日期</td>
		<td height="35" align="center">操作方法</td>
	  </tr>
	  <%
	  
	  
		if Request("tushu")<>"" then
			search_sql=" and tushu='"&Request("tushu")&"'"
		end if
		if Request("banci")<>"" then
			search_sql=search_sql&" and banci='"&Request("banci")&"'"
		end if
		if Request("yingci")<>"" then
			search_sql=search_sql&" and yingci='"&Request("yingci")&"'"
		end if
		
		
		
		SQL="select * from view_jihuoma where addtime between '"&session("date1")&"' and '"&session("date2")&"' "&search_sql&" order by id desc"
		set rs=server.CreateObject("adodb.recordset")
		rs.Open SQL,conn,1,1
	
		do while not rs.eof
	%>
	  <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
		<td align="center" class="content"><%=rs("xuliehao")%></td>
		<td align="center" class="content"><%=rs("title")%></td>
		<td align="center" class="content"><%=rs("isbn")%></td>
		<td align="center" class="content"><%=rs("banci")%></td>
		<td align="center" class="content"><%=rs("yingci")%></td>
		<td align="center" class="content"><%=rs("jihuoma")%></td>
		<td align="center" class="content"><%=rs("addtime")%></td>
		<td align="center" class="content"><a href="jihuodel_p1.aspx?id=<%=rs("id")%>&tushu=<%=request("tushu")%>&banci=<%=request("banci")%>&yingci=<%=request("yingci")%>"  onclick="javascript:if(!confirm('\n特别提示!删除后将无法进行恢复。'))  return  false; ">删除</a>&nbsp;</td>
	  </tr>
	<%
		rs.movenext
		loop
		rs.close
		set rs=nothing	  
	%>
	</table>
<%end if%>

</td>
  </tr>
</table>
</body>
</html>
