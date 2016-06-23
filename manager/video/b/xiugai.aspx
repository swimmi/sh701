<!--#include file="../../../conn.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>
<link href="../../../css/cssa.css" rel="stylesheet" type="text/css" />
<script charset="utf-8" src="../../../editor/kindeditor.js"></script>
<script charset="utf-8" src="../../../editor/lang/zh_CN.js"></script>
<script>    
var editor;
KindEditor.ready(function(K) {editor = K.create('textarea[name="memo"]', {allowFileManager : true});});
</script>

<body>

  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="../../images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 视频管理 &gt; 修改视频</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
    <tr class="biao">
      <td height="40" style="padding-left:10px;"><img src="../../images/4.jpg" width="18" height="15" />修改视频</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF">
	  
<%
	set Rs=server.createobject("adodb.recordset")	
	Rs.Open ("select * from video where id='"&request("id")&"'"),Conn,1,1
		bianhao=rs("bianhao")
		title=rs("title")
		age=rs("age")
		yue=rs("yue")
		guanjian=rs("guanjian")
		leibie=rs("leibie")
		shichang=rs("shichang")
		tushu=rs("tushu")
		memo=rs("memo")
	Rs.Close
	set rs=nothing
%>


<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#E3E7EA" style="margin:10px 0px;">
  <tr class="title">
    <td width="100%" height="40" align="center" bgcolor="#FFFFFF" class="titleb" style="padding:0px 10px;">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:10px;">
            <tr>
              <td height="40" align="right">&nbsp;</td>
              <td height="40" align="left"><span style="font-weight:normal">
                <input type="submit" name="Submit32" value="视频信息" style="height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;" disabled onclick="javascript:location.href='xiugai.aspx?id=<%=request("id")%>'" />
                <input type="submit" name="Submit33" value="上传视频" style="height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;"   onclick="javascript:location.href='xiugai_video.aspx?id=<%=request("id")%>'" />
                <input type="submit" name="Submit3" value="第三方视频" style="height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;" onclick="javascript:location.href='xiugai_videob.aspx?id=<%=request("id")%>'"/>
              </span></td>
            </tr>
			
			 <form id="form1" name="form1" method="post" action="xiugaia.aspx">
            <tr>
            <tr>
              <td height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">视频编号：</font></td>
              <td height="40" align="left"><input name="bianhao" type="text" id="bianhao" style="width:100px; border:1px #CCCCCC solid; height:18px;" value="<%=bianhao%>"/></td>
            </tr>
              <td width="20%" height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">视频名称：</font></td>
              <td width="80%" height="40" align="left">
				  <input name="title" type="text" id="title" style="width:300px; border:1px #CCCCCC solid; height:18px;" value="<%=title%>"/>
				  <input name="id" type="hidden" id="id" style="width:300px; border:1px #CCCCCC solid; height:18px;" value="<%=request("id")%>"/>			  </td>
            </tr>
            <tr>
              <td height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">视频时长：</font></td>
              <td height="40" align="left"><input name="shichang" type="text" id="shichang" style="width:100px; border:1px #CCCCCC solid; height:18px;" value="<%=shichang%>"/></td>
            </tr>
            <tr>
              <td height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">图书名称：</font></td>
              <td height="40" align="left">
                <select name="tushu">
                  <option value="0">请选择图书</option>
                  <%
	SQL="select * from tushu"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if not rs.eof and not rs.bof then
	while not rs.eof
%>
                  <option value="<%=rs("id")%>" <%if tushu-rs("id")=0 then%> selected<%end if%>><%=rs("title")%></option>
                  <%
	rs.movenext
	wend
	end if
%>
                </select></td>
            </tr>
            <tr>
              <td height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">周龄：</font></td>
              <td height="40" align="left">
			  <select name="age">
			  	<option value="0">请选择周龄</option>

<%
	SQL="select * from age order by id desc"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if not rs.eof and not rs.bof then
	while not rs.eof
%>
	<option value="<%=rs("id")%>" <%if rs("id")-age=0 then%>selected<%end if%>><%=rs("age")%></option>
<%
	rs.movenext
	wend
	end if
%>
              </select>              </td>
            </tr>
            <tr>
              <td height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">月龄段：</font></td>
              <td height="40" align="left">
			  <select name="yue">
			  	<option value="0">请选择月龄段</option>

<%
	SQL="select * from yue where id='"&yue&"' order by id desc"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if not rs.eof and not rs.bof then
	while not rs.eof
%>
	<option value="<%=rs("id")%>" <%if rs("id")-yue=0 then%>selected<%end if%>><%=rs("yue")%></option>
<%
	rs.movenext
	wend
	end if
%>
              </select></td>
            </tr>
            <tr>
              <td height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">关键字：</font></td>
              <td height="40" align="left">
			  <select name="guanjian">
			  	<option value="0">请选择关键字</option>

<%
	SQL="select * from guanjian where id='"&guanjian&"' order by id desc"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if not rs.eof and not rs.bof then
	while not rs.eof
%>
	<option value="<%=rs("id")%>" <%if rs("id")-guanjian=0 then%>selected<%end if%>><%=rs("guanjian")%></option>
<%
	rs.movenext
	wend
	end if
%>
              </select></td>
            </tr>
            <tr>
              <td height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">类别：</font></td>
              <td height="40" align="left">
			  <select name="leibie">
			  	<option value="0">请选择类别</option>

<%
	SQL="select * from leibie where id='"&leibie&"' order by id desc"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if not rs.eof and not rs.bof then
	while not rs.eof
%>
	<option value="<%=rs("id")%>" <%if rs("id")-leibie=0 then%>selected<%end if%>><%=rs("leibie")%></option>
<%
	rs.movenext
	wend
	end if
%>
              </select></td>
            </tr>
            <tr>
              <td height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">视频简介：</font></td>
              <td height="40" align="left"><textarea name="memo" rows="5" id="memo" style="width:100%; height:350px; border:1px #CCCCCC solid;"><%=memo%></textarea></td>
            </tr>
            <tr>
              <td height="40" align="right"></td>
              <td height="40" align="left"><input type="submit" id="Submit" name="Submit4" value="确认修改" style="height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;" onClick="swfu.startUploadFiles();"/>
                <input type="button" name="Submit2" value="返回上一层"  onclick="javasprit:history.go(-1)" style="height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;" /></td>
            </tr>
          </form>
        </table>
        </td>
  </tr>
</table>
      </td>
    </tr>
  </table>


<br />
<br /><br />
</body>
</html>
