
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../jiance.aspx"-->
<!--#include file="../../time/time.aspx"-->
<!--#include file="../../conn.aspx"-->
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">��Ƶ����</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ��Ƶ���� &gt; ��Ƶ����</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />��Ƶ����</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">



 <table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="370" valign="top">
	 <%
	 if request("action")="isok" then
	 conn.execute("update video set isok="&request("isok")&" where id="&request("id"))
	 end if
	 %>

<%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('�������');history.go(-1);</script>"
	response.end
end if


if Request("search")<>"" then
	select case Request("type")
		case 1
			search_sql=" and title like '%"&Request("search")&"%'"
		case 2
			search_sql=" and tushutitle like '%"&Request("search")&"%'"
		case 3
			search_sql=" and bianhao='"&Request("search")&"'"
	end select 
end if

if Request("leibie")<>"" then
	if Request("leibie")<>0 then
			search_sql=search_sql&" and leibie='"&Request("leibie")&"'"
	end if
end if

if Request("guanjian")<>"" then
	if Request("guanjian")<>0 then
			search_sql=search_sql&" and guanjian='"&Request("guanjian")&"'"
	end if
end if

if Request("age")<>"" then
	if Request("age")<>0 then
			search_sql=search_sql&" and age='"&Request("age")&"'"
	end if
end if

if Request("yue")<>"" then
	if Request("yue")<>0 then
			search_sql=search_sql&" and yue='"&Request("yue")&"'"
	end if
end if

if request("shijian1")<>"" then
	session("date1")=request("shijian1")
else if request("cx")<>1 then
		session("date1")="2013-1-1"
	end if
end if

if request("shijian2")<>"" then
	session("date2")=request("shijian2")
else if request("cx")<>1 then
		session("date2")="3010-1-1"
	end if
end if


SQL="select * from view_video where addtime between '"&session("date1")&"' and '"&session("date2")&"' "&search_sql&" order by addtime desc"
set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1
msg_per_page=8
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('�������');history.go(-1);</script>"
	response.end
end if
%>
       <!--#include file="../../inc/headpage.aspx"-->
       <!--#include file="../../inc/safe.aspx"-->
       <table width="100%" border="0" cellpadding="0" cellspacing="0">
         <tr>
           <td><form id="form2" name="form2" method="post" action="?">
               <table width="99%" height="40" border="0" align="center" cellspacing="0" class="content">
                 <tr valign="top">
                   <td height="30" align="left" valign="middle">��ѯ�� ��
                     <select name="type" id="type">
                         <option value="3">��Ƶ���</option>
                         <option value="1">��Ƶ����</option>
                         <option value="2">ͼ������</option>
                     </select>
                       <input name="search" type="text" id="search" size="20" />
                     <select name="leibie" id="type">
                         <option value="0">������Ƶ���</option>
							<%
								SQLa="select * from leibie order by id desc"
								set rsa=server.CreateObject("adodb.recordset")
								rsa.Open SQLa,conn,1,1
								if not rsa.eof and not rsa.bof then
								while not rsa.eof
							%>
								<option value="<%=rsa("id")%>"><%=rsa("leibie")%></option>
							<%
								rsa.movenext
								wend
								end if
								rsa.close
								set rsa=nothing
							%>
                     </select>
                     <select name="age" id="type">
                         <option value="0">��������</option>
                         <%
							SQLa="select * from age order by id desc"
							set rsa=server.CreateObject("adodb.recordset")
							rsa.Open SQLa,conn,1,1
							if not rsa.eof and not rsa.bof then
							while not rsa.eof
						%>
							<option value="<%=rsa("id")%>"><%=rsa("age")%></option>
						<%
							rsa.movenext
							wend
							end if
							rsa.close
							set rsa=nothing
						%>
                     </select>
                     <select name="yue" id="type">
                         <option value="0">���������</option>
							<%
								SQLa="select * from yue order by id desc"
								set rsa=server.CreateObject("adodb.recordset")
								rsa.Open SQLa,conn,1,1
								if not rsa.eof and not rsa.bof then
								while not rsa.eof
							%>
								<option value="<%=rsa("id")%>"><%=rsa("yue")%></option>
							<%
								rsa.movenext
								wend
								end if
								rsa.close
								set rsa=nothing
							%>
                     </select>
                     <select name="guanjian" id="type">
                         <option value="0">���йؼ���</option>
							<%
								SQLa="select * from guanjian order by id desc"
								set rsa=server.CreateObject("adodb.recordset")
								rsa.Open SQLa,conn,1,1
								if not rsa.eof and not rsa.bof then
								while not rsa.eof
							%>
								<option value="<%=rsa("id")%>"><%=rsa("guanjian")%></option>
							<%
								rsa.movenext
								wend
								end if
								rsa.close
								set rsa=nothing
							%>
                     </select>
                     ʱ�� ��
                     <input name="shijian1" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date1")%>" />
                     -
                     <input name="shijian2" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date2")%>" />
                     <input name="Submit2" type="submit" id="Submit" value="��ѯ" /></td>
                 </tr>
               </table>
           </form></td>
         </tr>
         <tr>
           <td><table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="999999">
               <tr bgcolor="#E3E3E3">
                 <td align="center">��Ƶ���</td>
                 <td height="35" align="center">��Ƶ����</td>
                 <td align="center">ͼ������</td>
                 <td height="35" align="center">����</td>
                 <td height="35" align="center">�����</td>
                 <td height="35" align="center">�ؼ���</td>
                 <td height="35" align="center">���</td>
                 <td align="center">���Ŵ���</td>
                 <td align="center">���ʱ��</td>
                 <td align="center">״̬</td>
                 <td height="35" align="center">��������</td>
               </tr>
<%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
               <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
                 <td align="center" class="content"><%=rs("bianhao")%></td>
                 <td  height="35" align="center" class="content"><%=rs("title")%></td>
                 <td align="center" class="content"><%=rs("tushutitle")%></td>
                 <td height="35" align="center" class="content"><%=rs("age1")%></td>
                 <td  height="35" align="center" class="content"><%=rs("yue1")%></td>
                 <td height="35" align="center" class="content"><%=rs("guanjian1")%></td>
                 <td height="35" align="center" class="content"><%=rs("leibie1")%></td>
                 <td align="center" class="content"><%=rs("num")%></td>
                 <td align="center" class="content"><%=rs("addtime")%></td>
                 <td align="center" class="content"><% if rs("isok")=1 then%><a href="?action=isok&amp;isok=0&amp;id=<%=rs("id")%>" style="color:#00FF00">����</a><%else%><a href="?action=isok&amp;isok=1&amp;id=<%=rs("id")%>" style="color:#FF0000">ʧЧ</a><%end if%></td>
                 <td height="35" align="center" class="content">
				<a href="../video/b/yulan.aspx?id=<%=rs("id")%>">Ԥ��</a>
				 <a href="../video/b/xiugai.aspx?id=<%=rs("id")%>">�޸�</a>&nbsp;
				 <a href="del.aspx?id=<%=rs("id")%>"  onClick="javascript:if(!confirm('\n�ر���ʾ!ɾ�����޷����лָ���'))  return  false; ">ɾ��</a>&nbsp;
				 <a href="wei.aspx?id=<%=rs("id")%>&tushu=<%=rs("tushu")%>">��ά�����</a></td>
               </tr>
               <%
			  i=i+1
			  icolor=icolor+1
			  if icolor>1 then icolor=0
			  rowcount=rowcount-1
			  rs.movenext
			  loop
%>
           </table></td>
         </tr>
       </table>
       <%if  rs.recordcount>0 then%>
       <form id="form1" name="form1" method="post" action="?">
         <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
           <tr>
             <td height="5"></td>
           </tr>
           <tr>
             <td height="25" align="center">�� <%=listPages("?type="&request("type")&"&search="&request("search")&"&leibie="&request("leibie")&"&age="&request("age")&"&yue="&request("yue")&"&guanjian="&request("guanjian")&"&shijian1="&session("date1")&"&shijian2="&session("date2")&"")%>
                 <input name="page" type="text" size="5" />
                 <input name="type" type="hidden" id="type" value="<%=request("type")%>" size="5" />
                 <input name="search" type="hidden" id="search" value="<%=request("search")%>" size="5" />
                 <input name="leibie" type="hidden" id="leibie" value="<%=request("leibie")%>" size="5" />
                 <input name="age" type="hidden" id="age" value="<%=request("age")%>" size="5" />
                 <input name="yue" type="hidden" id="yue" value="<%=request("yue")%>" size="5" />
                 <input name="guanjian" type="hidden" id="guanjian" value="<%=request("guanjian")%>" size="5" />
                 <input name="shijian1" type="hidden" id="qishu_date1" value="<%=session("date1")%>" size="5" />
                 <input name="shijian2" type="hidden" id="qishu_date2" value="<%=session("date2")%>" size="5" />
                 <input type="submit" name="Submit" value="ת" style=" border:1px solid #999999; "/>
               �� </td>
           </tr>
         </table>
       </form>
     <%end if%></td>
   </tr>
 </table></td>
   </tr>
 </table>
</body>
</html>
