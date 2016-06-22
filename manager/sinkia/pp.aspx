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
    <td height="80" colspan="2">品牌管理</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 商品管理 &gt; 品牌管理</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />品牌管理</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px; padding-top:10px;">
	
<form action="pp1.aspx"  enctype="multipart/form-data" name="form1" method="post">
  <table width="100%" border="0" cellpadding="0" cellspacing="1">

    <tr>
      <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="495" height="30" align="right" class="content">品牌名：</td>
          <td width="703"  align="left"><input name="title" type="text" id="title" size="50" /></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">品牌图片：</td>
          <td  align="left"><span style="font-size:12px;">
            <input name="imgs" type="file" id="imgs"/>
          图片格式：gif/jpg 图片大小&lt;150K ，尺寸：230*103 </span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">&nbsp;</td>
          <td height="40" align="left" valign="bottom"><input type="submit" name="Submit" value="确认发布" /></td>
        </tr>
      </table>
        </td>
    </tr>
  </table>
</form>




<br />


<%

if request("action")=10 then

	conn.execute("delete from tbl_pp where id='"&request("id")&"'")

	response.Write "<script language=javascript>alert('操作成功！');location.href='pp.aspx';</script>"
	response.end

end if




if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if


SQL="select * from tbl_pp order by id desc" 
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

msg_per_page=20
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('输入错误！');history.go(-1);</script>"
	response.end
end if
%>


<!--#include file="../../inc/headpage.aspx"-->
<!--#include file="../../inc/safe.aspx"--> 



<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="c1c1c1">
  <tr class="titlea1" bgcolor="#e1e1e1">
    <td height="40" align="center">品牌图片</td>
    <td width="200" height="40" align="center">品牌名</td>
    <td width="100" height="40" align="center">操作</td>
  </tr>
<%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
  <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''" class="content">
    <td height="55" align="center"><img src="<%=rs("img")%>" width="100" height="50" /></td>
    <td height="55" align="center"><%=rs("title")%></td>
    <td height="55" align="center">
			<a href="?id=<%=rs("id")%>&action=10"   onclick="javascript:if(!confirm('\n特别提示！？\n\n删除后将无法进行恢复。'))  return  false; ">删除</a></td>
  </tr>
  <%
			  i=i+1
			  icolor=icolor+1
			  if icolor>1 then icolor=0
			  rowcount=rowcount-1
			  rs.movenext
			  loop
%>
</table>
<%if  rs.recordcount>0 then%>
<form id="form1" name="form1" method="post" action="?">
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
    <tr>
      <td height="5"></td>
    </tr>
    <tr>
      <td height="25" align="center">【 <%=listPages("?search_condition="&request("search_condition")&"&select="&request("select")&"")%>
            <input name="page" type="text" size="5" />
            <input name="select" type="hidden" id="select" value="<%=request("select")%>" size="5" />
            <input name="search_condition" type="hidden" id="search_condition" value="<%=request("search_condition")%>" size="5" />
            <input name="qishu_date1" type="hidden" id="qishu_date1" value="<%=request("qishu_date1")%>" size="5" />
            <input name="qishu_date2" type="hidden" id="qishu_date2" value="<%=request("qishu_date2")%>" size="5" />
            <input type="submit" name="Submit" value="转" style=" border:1px solid #999999; "/>
      】 </td>
    </tr>
  </table>
</form>
<%end if%>








	
    </td>
  </tr>
</table>
</body>
</html>
