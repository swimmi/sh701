<!--#include file="../../conn.aspx"-->
<!--#include file="inc/apartPage.aspx" -->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<TITLE>商城管理</TITLE>
<STYLE></STYLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />

<!--#include file="../../time/time.aspx"-->

<%
	Dim action
	action = Trim(Request.QueryString("action"))
		Set Rs= Server.CreateObject("ADODB.Recordset")
%>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</HEAD>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">商品排名</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 商品管理 &gt; 商品排名</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />商品排名</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">




<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr valign="top" > 
      <td valign="bottom">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="137">
        <tr>
          <td height="184" valign="top">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center">
			  
      <%
	  
	  
	if request("submit")="设置" then
	
	
		if request.form("pm")=""  then
			response.Write "<script language=javascript>alert('排名请以数字填写，请正确填写！');history.go(-1);</script>"
			response.end
		end if
		if not isnumeric(request.form("pm"))  then
			response.Write "<script language=javascript>alert('排名请以数字填写，请正确操作！');history.go(-1);</script>"
			response.end
		end if
	
		conn.execute("update tbl_product set pm1="&request("pm")&" where pro_id='"&request("id")&"'")
	
		response.Write "<script language=javascript>alert('设置成功');location.href='pm.aspx';</script>"
		response.end
	
	
	end if  
	  
	  
	  
	  
	  
	  
	
	sql="select * from tbl_product where 1=1 and pro_type=0"
	if request("pid")&""<>"" then
		sql=sql+"and pro_pid="&request("pid")
	end if
	if request("pro_isok")&""<>"" then
		sql=sql+"and pro_isok="&request("pro_isok")
	end if
	sql=sql+" order by pm1 desc"
	
	
	Rs.Open (sql),Conn,1,1
	IF Rs.Eof And Rs.Bof Then
		Rs.Close
		Set Rs=Nothing
%><br>
<table width="99%" border="0" align="center" cellpadding="3" cellspacing="2"class="content" >
  <tr>
    <td align="center" >暂时没有内容！</td>
  </tr>
</table>
<%
	Else
		
		ic=8
		Rs.pagesize=ic
		pages=Rs.pagecount
		epage=getPage(Trim(Request.QueryString("page")),pages)
		Rs.absolutepage=epage
	 
%><br>
<table width="99%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c1c1c1">
  <tr bgcolor="#e1e1e1" class="titlea1" >
    <td height="35" align="center">图片</td>
    <td align="center">上传者</td>
    <td height="35" align="center">会员价格</td>
    <td height="35" align="center">操作</td>
  </tr>
  <%
  while not Rs.eof and ic>0
  
	SQLa="select * from tbl_sinkia_classa where id="&Rs("pro_pida")&""
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	if rsa.recordcount>0 then
		classa=rsa("pro_class")
	end if
  	rsa.close
	set rsa=nothing
  
  %>
  <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
    <td height="90" align="center" class="content"><span class="tdc"><img src="<%=rs("pro_imgs")%>" width="100" height="80"></span></td>
    <td align="center" class="content"><span class="tdc"><%=Rs("pro_user")%></span></td>
    <td height="90" align="center" class="content"><span class="tdc"><%=Rs("pro_money")%>&nbsp;</span></td>
    <td height="90" align="center" class="content"><form id="form1" name="form1" method="post" action="">
      <input type="text" name="pm"  value="<%=rs("pm1")%>" />
      <input type="hidden" name="id"  value="<%=rs("pro_id")%>" />
        <input type="submit" name="Submit" value="设置" />
    </form>
    </td>
  </tr>
  <%
			Rs.MoveNext
			ic=ic-1
		wend
		Rs.Close
		Set Rs = Nothing
		
%>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
			  <tr>
				<td height="30" align="right">
					  <%call apartPage("?pid="&request("pid")&"&pro_isok="&request("pro_isok")&"&",8,epage,pages)%></td>
			  </tr>
			</table>
</td>
            </tr>
</table>
<%end if%>
            
          </td>
        </tr>
      </table>
      </td>
    </tr>
</table>


      </td>
    </tr>
</table>

</BODY>
</HTML>
