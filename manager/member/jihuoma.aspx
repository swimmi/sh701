 <!--#include file="../jiance.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<title><%=request.Cookies("bj")("webname")%></title>
</head>

<body>
<!--#include file="../../conn.aspx"-->

<%
	if request("action")="add" then
	
		if request("jihuoma")="" then
			response.Write "<script language=javascript>alert('请填写激活码！');location.href='jihuoma.aspx?huiyuan_id="&request("huiyuan_id")&"';</script>"
			response.end
		end if
'检测激活码
		SQL="select* from jihuoma where jihuoma='"&request("jihuoma")&"'"
		set rs=server.CreateObject("adodb.recordset")
		rs.Open SQL,conn,1,1
		if rs.recordcount=0 then
			response.Write "<script language=javascript>alert('此激活码无效！');location.href='jihuoma.aspx?huiyuan_id="&request("huiyuan_id")&"';</script>"
			response.end
		end if
	rs.close
	set rs=nothing

	
		SQL="select* from huiyuan_jihuoma where jihuoma='"&request("jihuoma")&"' and huiyuan_id="&request("huiyuan_id")
		set rs=server.CreateObject("adodb.recordset")
		rs.Open SQL,conn,1,3
		if rs.recordcount=0 then
		
			rs.addnew
				rs("jihuoma")=request("jihuoma")
				rs("huiyuan_id")=request("huiyuan_id")
				rs("addtime")=now
			rs.update
	else
	response.Write "<script language=javascript>alert('此用户已激活！');location.href='jihuoma.aspx?huiyuan_id="&request("huiyuan_id")&"';</script>"
		response.end
	end if
		rs.close
		set rs=nothing	
		
		response.Write "<script language=javascript>alert('添加成功！');location.href='jihuoma.aspx?huiyuan_id="&request("huiyuan_id")&"';</script>"
		response.end
	
	end if	  
%>
<%

	if request("Submit")="修改" then
	
		conn.execute("update huiyuan_jihuoma set jihuoma='"&request("jihuoma")&"' where huiyuan_id='"&request("huiyuan_id")&"'")
	
		response.Write "<script language=javascript>alert('操作成功！');location.href='jihuoma.aspx?huiyuan_id="&request("huiyuan_id")&"';</script>"
		response.end

	end if

	if request("action")="del" then
	
		conn.execute("delete huiyuan_jihuoma where id="&request("id")&" and huiyuan_id='"&request("huiyuan_id")&"'")
	
		response.Write "<script language=javascript>alert('操作成功！');location.href='jihuoma.aspx?huiyuan_id="&request("huiyuan_id")&"';</script>"
		response.end

	end if
SQL="select * from huiyuan_jihuoma where huiyuan_id="&request("huiyuan_id")&" order by id desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td height="80" colspan="2">激活码</td>
    </tr>
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 会员管理 &gt; 激活码</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
    <tr class="biao">
      <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />激活码</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF"><br /><form id="form1" name="form1" method="post" action="?">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" style="border:1px #CCCCCC solid">
          <tr>
            <td width="100" height="30" align="left">&nbsp;&nbsp;&nbsp;添加激活码</td>
            <td height="30" align="left">
				<input name="jihuoma" type="text" id="jihuoma" />
				<input name="huiyuan_id" type="hidden" value="<%=request("huiyuan_id")%>" />
				<input name="action" type="hidden" id="action" value="add" />			</td>
          </tr>
          <tr>
            <td width="100" height="30" align="left">&nbsp;</td>
            <td height="30" align="left"><input type="submit" name="Submit" value="添加" /></td>
          </tr>
        </table>
      </form>
	  <hr color="#FF9900" />
	  
        <table width="99%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="c1c1c1">
        <tr bgcolor="#e1e1e1" class="titlea1">
          <td width="50%" height="40" align="center" >激活码</td>
          </tr>
		  
<%
if not rs.eof and not rs.bof then
do while not rs.eof
%>
         
          <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
            <td height="30" align="center" class="content"  >
<form id="form1" name="form1" method="post" action="?">
  <table border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td><input name="jihuoma" type="text" id="jihuoma" style="width:250px; height:20px; line-height:20px; font-family:'微软雅黑'" value="<%=rs("jihuoma")%>" />
        <input name="huiyuan_id" type="hidden" id="huiyuan_id" style="width:250px; height:20px; line-height:20px; font-family:'微软雅黑'" value="<%=rs("huiyuan_id")%>" /></td>
      <td width="50" align="right"><input type="submit" name="Submit" value="修改" style="border:1px #CCCCCC solid; background-color:#FFFFFF; line-height:20px; font-family:'微软雅黑';" /></td>
      <td width="50" align="right"><a href="?id=<%=rs("id")%>&action=del&huiyuan_id=<%=rs("huiyuan_id")%>" onClick="javascript:if(!confirm('\n特别提示！？\n\n请慎重进行该操作！\n删除后将无法进行恢复。'))  return  false; "><img src="../images/19.jpg" width="44" height="24" border="0"/></a></td>
    </tr>
  </table>
</form>			</td>
          </tr>
<%
	rs.movenext
	loop
	end if
	rs.close
	set rs=nothing
%>
          </table>
		  <br>
      </td>
    </tr>
  </table>
</body>
</html>
