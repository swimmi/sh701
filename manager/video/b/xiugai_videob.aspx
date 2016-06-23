<!--#include file="config.aspx"-->
<!--#include file="inc/session.aspx"-->
<!--#include file="../../../conn.aspx"-->
<link href="../../../css/cssa.css" rel="stylesheet" type="text/css" />

<%Session_ "name","anlige"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
      <tr>
        <td width="2%" align="center" bgcolor="EEEEEE"><img src="../../images/3.jpg" width="13" height="10" /></td>
        <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 视频管理 &gt; 上传视频资源</td>
      </tr>
    </table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
    <tr class="biao">
      <td height="40" style="padding-left:10px;"><img src="../../images/4.jpg" width="18" height="15" />上传视频</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF">
	  
	<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#E3E7EA" style="margin:10px 0px;">
              <tr class="title">
                <td width="100%" height="40" align="center" bgcolor="#FFFFFF" class="titleb" style="padding:10px;">
<%
		if request("leibie")="" then
			leibie=1
		else
			leibie=request("leibie")
		end if
	
		set Rs=server.createobject("adodb.recordset")	
		Rs.Open ("select * from video where id='"&request("id")&"'"),Conn,1,1
		videoid=rs("id")
		video=rs("video")
		Rs.Close
		set rs=nothing

%>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:10px;">
                      <tr>
                        <td width="20%" height="40" align="right">&nbsp;</td>
                        <td width="80%" height="40" align="left" style="font-weight:normal"><input type="submit" name="Submit32" value="视频信息" style="height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;" onClick="javascript:location.href='xiugai.aspx?id=<%=request("id")%>'" />
                          <input type="submit" name="Submit33" value="上传视频" style="height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;"    onclick="javascript:location.href='xiugai_video.aspx?id=<%=request("id")%>'" />
                          <input type="submit" name="Submit3" value="第三方视频" style="height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;"  onclick="javascript:location.href='xiugai_videob.aspx?id=<%=request("id")%>'" disabled="disabled"/></td>
                      </tr>
<form id="form1" name="form1" method="post" action="xiugai_videoc.aspx">
                        <tr>
                          <td height="40" align="right"><font style="font-size:12px; font-weight:bold; color:#000000">视频资源：</font></td>
                          <td height="40" align="left">
                             <input name="videoid" type="hidden" id="videoid" style="width:300px; border:1px #CCCCCC solid; height:18px;" value="<%=videoid%>"/>
							 <textarea name="video" rows="10" id="video" style="width:400px; border:1px #CCCCCC solid; color:#000000"><%=video%></textarea></input>						   </td>
                        </tr>
                        <tr>
                          <td height="40" align="right">                          </td>
                          <td height="40" align="left"><input type="submit" id="Submit" name="Submit4" value="确认修改" style="width:80px; height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;" onClick="swfu.startUploadFiles();"/>
                          <input type="button" name="Submit2" value="返回上一层"  onclick="javasprit:history.go(-1)" style=" height:25px; border:1px #BCBCBC solid; background-color:#f4f4f4;" /></td>
                        </tr>
                      </form>
                  </table></td>
              </tr>
            </table>
			
			
			
      </td>
    </tr>
  </table>
	
</body>
</html>