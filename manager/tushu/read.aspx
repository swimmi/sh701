
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
    <td height="80" colspan="2">ͼ��ӡˢ����</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ϵͳ���� &gt; ͼ��ӡˢ����</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />ͼ��ӡˢ����</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">



 <table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td height="370" valign="top">

<%

if isnumeric(Request("page"))=false then
	response.Write "<script language=javascript>alert('�������');history.go(-1);</script>"
	response.end
end if


if Request("search")<>"" then
	select case Request("type")
		case 1
			search_sql=" and bianhao='"&Request("search")&"'"
		case 2
			search_sql=" and title like '%"&Request("search")&"%'"
		case 3
			search_sql=" and isbn='"&Request("search")&"'"
	end select 
end if



SQL="select * from tushu where 1=1 "&search_sql&" order by id desc"
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
           <td>
               <table width="99%" height="40" border="0" align="center" cellspacing="0" class="content">
                 <tr valign="top">
                   <form id="form2" name="form2" method="post" action="?">
				   <td height="30" align="left" valign="middle">��ѯ�� ��
                     <select name="type" id="type">
                         <option value="1">ͼ����</option>
                         <option value="2">ͼ������</option>
                         <option value="3">ͼ��ISBN</option>
                     </select>
                       <input name="search" type="text" id="search" size="20" />
                       <input name="Submit2" type="submit" id="Submit" value="��ѯ" />
					 </td>
					   
				      </form>
                   <td align="right" valign="middle"><input name="Submit2" type="submit" id="Submit" value="����ͼ��" onclick="javascript:location.href='add.aspx'" /></td>
                 </tr>
               </table>
           </td>
         </tr>
         <tr>
           <td><table width="99%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="999999">
               <tr bgcolor="#E3E3E3">
                 <td height="35" align="center">ͼ����</td>
                 <td height="35" align="center">ͼ������</td>
                 <td height="35" align="center">ͼ��ISBN</td>
                 <td height="35" align="center">��������</td>
               </tr>
<%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
               <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
                 <td align="center" class="content"><%=rs("bianhao")%></td>
                 <td height="35" align="center" class="content"><%=rs("title")%></td>
                 <td  height="35" align="center" class="content"><%=rs("isbn")%></td>
                 <td height="35" align="center" class="content">
				 <a href="xiugai.aspx?id=<%=rs("id")%>">�޸�</a>&nbsp;
				 <a href="del.aspx?id=<%=rs("id")%>"  onClick="javascript:if(!confirm('\n�ر���ʾ!ɾ�����޷����лָ���'))  return  false; ">ɾ��</a>&nbsp;</td>
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
             <td height="25" align="center">�� <%=listPages("?type="&request("type")&"&search="&request("search")&"")%>
                 <input name="page" type="text" size="5" />
                 <input name="type" type="hidden" id="type" value="<%=request("type")%>" size="5" />
                 <input name="search" type="hidden" id="search" value="<%=request("search")%>" size="5" />
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