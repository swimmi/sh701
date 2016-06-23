<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../../jiance.aspx"-->
<!--#include file="../../../conn.aspx"-->
<%
SQL="select * from video  where id='"&request("id")&"'"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
if not rs.eof and not rs.bof then
flag= rs("flag")
url=rs("video")
end if
rs.close
set rs=nothing
%>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 视频管理 &gt; 预览</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../../images/4.jpg" width="18" height="15" />预览</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px;"><table width="99%" border="0" cellpadding="0" cellspacing="1">
        <tr>
          <td align="center">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2" align="center" class="content">
				<%if flag=1 then%>
				<video style="width:600PX; height:360px; background-color:#000000" controls="controls">
                    <source src="/manager/<%=request("url")%>" type="video/mp4" ></source>
                  </video>
				  <%else%>
				  <%=url%>
				  <%end if%>
                </td>
              </tr>
            </table><br />
            <input type="button" name="Submit" value="返回上一层" onclick="javascript:location.href='/manager/sinkia/product.aspx';" />
            </label></td>
        </tr>
        <tr>
          <td align="center">&nbsp;</td>
        </tr>
      </table>
      </form>
    </td>
  </tr>
</table>
</body>
</html>
