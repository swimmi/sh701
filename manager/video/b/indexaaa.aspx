<!--#include file="config.aspx"-->
<!--#include file="inc/session.aspx"-->
<!--#include file="soft.aspx"-->
<link href="../../css/css.css" rel="stylesheet" type="text/css" />

<%Session_ "name","anlige"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>艾恩无组件上传</title>
<link href="images/mo.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="scripts/swfupload.js"></script>
<script type="text/javascript" src="scripts/swfupload.extend.js"></script>
<script type="text/javascript" src="scripts/swfupload.handler.js"></script>
<script type="text/javascript">
var swfu,Files=[];
function UploadSucceedCallBack(file){
	$_("trace").innerHTML+=file.name + " => " + file.newname + "<br />";
	document.getElementById("video").value = file.newname;
}
function BeforeUploadCallBack(file){
	this.SetPostParam("a","测试");
}
window.onload=function(s){
	return function(){swfu=HandlerInit(s);};
}({
	upload_url: "upload.aspx?a=s&sessionid=<%=Mosession.SessionId%>",
	file_post_name : "filedata",
	button_append : "divAddFiles",
	bind_id:"moswf",
	file_types : "<%=AllowExt%>",
	file_types_description : "选择文件",
	file_size_limit : "<%=AllowFileSizeLimit%>",
	file_upload_limit : 1,
	
	button_width: 80,
	button_height: 25,
	button_image_url:"images/btn16.png",
	charset: "gbk",
	auto:false
});
</script>
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:10px;">
      <tr>
        <td background="img/3.png"><img src="../../img/1.png" width="5" height="42" /></td>
        <td width="100%" valign="bottom" background="../../img/3.png"><table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-left:5px;">
            <tr>
              <td height="34" width="135" align="center" background="../img/9.png"><font style="color:#036DB7; font-size:14px; font-weight:bold;">上传课件</font></td>
              <td>&nbsp;&nbsp;</td>
              <td align="right" style="padding-right:20px;"></td>
            </tr>
        </table></td>
        <td align="right" background="img/3.png"><img src="../../img/2.png" width="5" height="42" /></td>
      </tr>
      <tr>
        <td background="../../img/8.png"></td>
        <td bgcolor="#F9F9FB">&nbsp;</td>
        <td background="../../img/7.png"></td>
      </tr>
      <tr>
        <td background="../../img/8.png"></td>
        <td width="100%" height="390" valign="top" bgcolor="#F9F9FB"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td align="right">&nbsp;</td>
            </tr>
          </table>
            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#E3E7EA" style="margin-top:10px;">
              <tr class="title">
                <td width="100%" height="40" align="center" bgcolor="#FFFFFF" class="titleb" style="padding:10px;"><%
	if request("leibie")="" then
		leibie=1
	else
		leibie=request("leibie")
	end if
%>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:10px;">
                      <tr>
                        <td width="20%" height="40" align="right">&nbsp;</td>
                        <td width="80%" height="40" align="left" style="font-weight:normal"><input type="submit" name="Submit2" value="文档" style="width:50px; height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;"  onClick="javascript:location.href='../video_chuan.aspx?leibie=1&id=<%=request("id")%>'" />
                            <input type="submit" name="Submit3" value="本地视频" style="height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;" disabled  onclick="javascript:location.href='index.aspx?leibie=2&id=<%=request("id")%>'" />
                            <input type="submit" name="Submit3" value="第三方视频" style="height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;"  onclick="javascript:location.href='../video_chuan.aspx?leibie=3&id=<%=request("id")%>'" />                        </td>
                      </tr>
                      <tr>
                        <td height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">资源选择：</font></td>
                        <td height="40" align="left"><div id="upload">
                            <div id="btns"><span style="font-size:12px; color:#FF0000">只能上传一个后缀名为：flv的文档，超过限制的文件被忽略</span></div>
                          <div id="moswf">
                              <div class="filelist h24">
                                <div class="process_bar h24"></div>
                                <div class="info_bar h24">
                                  <ul>
                                    <li class="w_name"><span class="s_name">文件名</span></li>
                                    <li class="w_process">进度</li>
                                    <li class="w_size">速度</li>
                                    <li class="w_act">操作</li>
                                  </ul>
                                </div>
                              </div>
                          </div>
                          <div id="trace" style="display:none"></div>
                        </div></td>
                      </tr>
                      <tr>
                        <td height="40" align="right">&nbsp;</td>
                        <td height="40" align="left"><table width="200" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><span id="divAddFiles"></span></td>
                            <td><input type="submit" id="doupload" name="Submit" value="确认上传" style="width:80px; height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;" onClick="swfu.startUploadFiles();"/></td>
                          </tr>
                        </table></td>
                      </tr>
<form id="form1" name="form1" method="post" action="chuan.aspx">
                        <tr>
                          <td height="40" align="right">&nbsp;</td>
                          <td height="40" align="left">&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">资源名称：</font></td>
                          <td height="40" align="left"><input name="title" type="text" id="title" style="width:300px; border:1px #CCCCCC solid; height:18px;"/>
                              <input name="id" type="hidden" id="id" style="width:300px; border:1px #CCCCCC solid; height:18px;" value="<%=request("id")%>"/>
                              <input name="leibie" type="hidden" id="leibie" style="width:300px; border:1px #CCCCCC solid; height:18px;" value="<%=leibie%>"/>
							  <input type="hidden" id="video" name="video"></input>							  </td>
                        </tr>
                        <tr>
                          <td height="40" align="right">
                          </td>
                          <td height="40" align="left"><input type="submit" id="Submit" name="Submit4" value="确认添加" style="width:80px; height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;" onClick="swfu.startUploadFiles();"/></td>
                        </tr>

                          </form>
						                      </table></td>
              </tr>
            </table>
			
          <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#E3E7EA" style="margin-top:10px;">
              <tr class="title">
                <td bgcolor="#F6F7FB" >资源名称</td>
                <td width="180" bgcolor="#F6F7FB" >资源类型</td>
                <td width="180" bgcolor="#F6F7FB" >上传时间</td>
                <td width="150" height="40" bgcolor="#F6F7FB" >操作</td>
              </tr>
<%
SQL="select * from wendang where video='"&request("id")&"' order by addtime desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1

	if not rs.eof and not rs.bof then
	do while not rs.eof
%>
              <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F8F8FA'"  onmouseout="this.style.backgroundColor=''" class="titlea">
                <td ><%=rs("title")%></td>
                <td width="180" ><%=rs("type")%></td>
                <td width="180" ><%=replace(rs("addtime"),"/","-")%></td>
                <td width="150" height="40"><%if rs("flag")=0 then%>
                    <a href="../video_chuan_updatea.aspx?flag=1&video=<%=rs("video")%>&id=<%=rs("id")%>&sub=a">允许</a>
                    <%else%>
                    <a href="../video_chuan_updatea.aspx?flag=0&video=<%=rs("video")%>&id=<%=rs("id")%>">取消</a>
                    <%end if%>
                    <%if rs("leibie")=1 then%>
                    <a href="../<%=rs("url")%>">下载</a>
                    <%else%>
                    <a href="../video_look.aspx?video=<%=rs("id")%>">播放</a>
                    <%end if%>
                </td>
              </tr>
              <%
	rs.movenext
	loop
	end if
rs.close
set rs=nothing

%>
          </table>
		  
		  
	    </td>
        <td background="../../img/7.png"></td>
      </tr>
      <tr>
        <td><img src="../../img/4.png" width="5" height="20" /></td>
        <td width="100%" background="../../img/6.png">&nbsp;</td>
        <td><img src="../../img/5.png" width="5" height="20" /></td>
      </tr>
</table>
	
</body>
</html>