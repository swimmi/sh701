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
<!--#include file="../../time/time.aspx"-->
<%
if request("action")="del" then
conn.execute("delete from huiyuan where id="&request("huiyuan_id"))
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
			search_sql=" and tel='"&Request("search")&"'"
	end select 
end if

if Request("select")<>"" then
	if Request("select")=1 then
			search_sql=search_sql&" and sex=1"
	end if
	if Request("select")=2 then
			search_sql=search_sql&" and sex=2"
	end if
end if

if Request("select1")<>"" then
	if Request("select1")=1 then
			search_sql=search_sql&" and flag=0"
	end if
	if Request("select1")=2 then
			search_sql=search_sql&" and flag=1"
	end if
end if

if request("shijian1")<>"" then
	session("date1")=request("shijian1")
else 
	session("date1")="2013-1-1"
end if

if request("shijian2")<>"" then
	session("date2")=request("shijian2")
else 
	session("date2")="3010-1-1"
end if

SQL="select * from huiyuan where 1=1 "&search_sql&"   and addtime between '"&session("date1")&"' and '"&session("date2")&"' order by addtime desc"

if request("jihuoma")<>"" then
SQL="select * from View_huiyuanjihuoma where jihuoma='"&request("jihuoma")&"'"
end if

set rs=server.CreateObject("adodb.recordset")
rs.Open SQL,conn,1,1



msg_per_page=20
if (Request("page")-1)*msg_per_page-rs.recordcount>0 then
	response.Write "<script language=javascript>alert('�������');history.go(-1);</script>"
	response.end
end if
%>
        <!--#include file="../../inc/headpage.aspx"-->
        <!--#include file="../../inc/safe.aspx"-->
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td height="80" colspan="2">�û��б�</td>
    </tr>
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ��Ա���� &gt; �û��б�</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
    <tr class="biao">
      <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />�û��б�</td>
    </tr>
    <tr>
      <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
        
        <table width="99%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td>
              <table width="100%" height="60" border="0" align="left" cellspacing="0" class="content">

                <tr valign="top">
                  <td height="30" align="left" valign="middle">
				  <form id="form1" name="form1" method="post" action="?" style="margin:0px;">
				  ��ѯ�� ��
                    <select name="type" id="type">
                      <option value="1">�ֻ���</option>
                    </select>
                    <input name="search" type="text" id="search" size="20" />
                    <select name="select" id="select">
                      <option value="0">�����Ա�</option>
                      <option value="1">�б���</option>
                      <option value="2">Ů����</option>
                    </select>
                    <select name="select1" id="select1">
                      <option value="0">����״̬</option>
                      <option value="1">����</option>
                      <option value="2">ʧЧ</option>
                    </select>
                    ʱ�� ��
                    <input name="shijian1" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date1")%>" />
                    -
                    <input name="shijian2" type="text" style="width:100px" onFocus="HS_setDate(this)" value="<%=session("date2")%>" />
                    <input name="Submit2" type="submit" id="Submit" value="��ѯ" />
					</form>					</td>
                  <td align="left" valign="middle"><input name="Submit22" type="submit" id="Submit2" value="�����б�" onClick="javascript:location.href='al_read2_out.aspx?type=<%=request("type")%>&search=<%=request("search")%>&select=<%=request("select")%>&select1=<%=request("select1")%>&shijian1=<%=session("date1")%>&shijian2=<%=session("date2")%>'" /></td>
                </tr>
				                <tr valign="top">
                  <td height="30" align="left" valign="middle">
                    <form id="form3" name="form3" method="post" action="">
                      
                      �������ѯ:  <input name="jihuoma" type="text" id="jihuoma" />

                      <span style="margin:0px;">
                      <input name="Submit23" type="submit" id="Submit22" value="��ѯ" />
                      </span>
                    </form>
                    </td>
                  <td align="left" valign="middle">&nbsp;</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <table width="99%" border="0" align="center" cellpadding="1"  cellspacing="1" bgcolor="c1c1c1">
        <tr bgcolor="#e1e1e1" class="titlea1">
          <td align="center" >�ֻ���</td>
          <td align="center" >�Ա�</td>
          <td height="40" align="center" >ע��ʱ��</td>
          <td height="40" align="center" >ʹ��״̬</td>
          <td height="40" align="center">����</td>
        </tr>
          <%
		  	dim i
			i=1
			do while not rs.eof and rowcount > 0
%>
          <tr bgcolor="FFFFFF" onMouseOver="this.style.backgroundColor='#F1F1F1'"  onmouseout="this.style.backgroundColor=''">
            <td align="center" class="content"  ><%=rs("tel")%></td>
            <td align="center" class="content"><%if rs("sex")=1 then%>�б���<%end if%><%if rs("sex")=2 then%>Ů����<%end if%></td>
            <td height="30" align="center" class="content"><%=rs("addtime")%></td>
          <td height="30" align="center" class="content"><%if rs("flag")=0 then%>
            <a href="dj.aspx?flag=0&amp;id=<%=rs("id")%>">����</a>
            <%else%>
            <a href="dj.aspx?flag=1&amp;id=<%=rs("id")%>"><font color="#FF0000">ʧЧ</font></a>
          <%end if%></td>
          <td height="30" align="center" class="content"><a href="?action=del&amp;huiyuan_id=<%=rs("id")%>">ɾ��</a>&nbsp;<a href="al_info.aspx?huiyuan_id=<%=rs("id")%>">�޸�</a>&nbsp;<a href="jihuoma.aspx?huiyuan_id=<%=rs("id")%>">�鿴������</a></td>
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
      <%if rs.recordcount>0 then%>
        <form id="form2" name="form2" method="post" action="?">
          <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="bon">
            <tr>
              <td height="5"></td>
            </tr>
            <tr>
              <td height="5" align="center"> �� <%=listPages("?kind="&request("kind")&"&type="&request("type")&"&select1="&request("select1")&"&search="&request("search")&"&shijian1="&request("shijian1")&"&shijian2="&request("shijian2")&"")%>
                <input name="page" type="text" size="5" />
                <input name="kink" type="hidden" id="kink" value="<%=request("kink")%>" size="5" />
                <input name="type" type="hidden" id="type" value="<%=request("type")%>" size="5" />
                <input name="select1" type="hidden" id="type" value="<%=request("select1")%>" size="5" />
                <input name="search" type="hidden" id="search" value="<%=request("search")%>" size="5" />
                <input name="shijian1" type="hidden" id="shijian1" value="<%=request("shijian1")%>" size="5" />
                <input name="shijian2" type="hidden" id="shijian2" value="<%=request("shijian2")%>" size="5" />
                <input type="submit" name="Submit" value="ת" style=" border:1px solid #999999; "/>
                �� </td>
            </tr>
          </table>
        </form>
      <%end if%></td>
    </tr>
  </table>
</body>
</html>
