<!--#include file="../../conn.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<HEAD>
<TITLE>�̳ǹ���</TITLE>
<STYLE></STYLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE11 {color: #999999}
.STYLE12 {color: #FF0000}
.STYLE13 {color: #0000FF}
.STYLE16 {color: #006600}
-->
</style>
</HEAD>
<!--#include file="inc/apartPage.aspx" -->
      <!--#include file="../../time/time.aspx"-->


<%
	Dim action
	action = Trim(Request.QueryString("action"))
		Set Rs= Server.CreateObject("ADODB.Recordset")
%>

<BODY>


<script language="javascript">

function checkuserinfo_2008()
{	if(document.form5.forder.value.length<1) {
	alert("����д���������ţ�");
	document.form5.forder.focus();
	return false;
  }
  if(document.form5.fcompany.value.length<1) {
	alert("����д������˾��");
	document.form5.fcompany.focus();
	return false;
  }
  if(document.form5.fnum.value.length<1) {
	alert("����д�����ţ�");
	document.form5.fnum.focus();
	return false;
  }
  
}</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="biao">
  <tr>
    <td height="30" align="center" background="../images/contop_bg.jpg">Ԥ������</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr valign="top" > 
      <td valign="bottom">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="137">
        <tr>
          <td height="184" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="300" valign="top"><form action="?" method="get"><table width="96%" border="0" align="center" cellpadding="3" cellspacing="2"class="content" >
  <tr><td >�����ţ�
      <input name="orders" type="text" id="orders" size="20">
      <select name="select" id="select">
        <option value="" selected="selected">����״̬</option>
        <option value="0" >Ԥ����</option>
        <option value="1" >�ɹ��µ�</option>
        <option value="2" >�µ�ʧ��</option>
      </select>
	  
	  
	  
	  
      <input name="shijian1" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date1")%>" />
-
<input name="shijian2" type="text" style="width:100px" onfocus="HS_setDate(this)" value="<%=session("date2")%>" />
<input type="submit" name="button" id="button" value="����"></td>
    </tr>
</table></form>
      <%
	  
	  
	Select Case action
		Case "del"
			Call del()	
		Case "adds"
			Call adds()
		Case "mod"
			Call mods()
		Case "modsave"
			Call modsave()
		Case "Return"
			Call Return()
		Case "Returns"
			Call Returns()
		Case "modsaves"
			Call modsaves()
		Case Else
			Call member()
	End Select
	Sub member()
	
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
	
	
	sql="select * from view_yuding where addtime between '"&session("date1")&"' and '"&session("date2")&"' "
	if request("orders")&""<>"" then
		sql=sql+" and orders like '%"&request("orders")&"%'"
	end if
	
	if request("select")<>"" then
		if request("select")=0 then
			sql=sql+"and flag=0"
		end if
		if request("select")=1 then
			sql=sql+"and flag=1"
		end if
		if request("select")=2 then
			sql=sql+"and flag=3"
		end if
	end if
	
	sql=sql+" order by addtime desc"	
	Rs.Open (sql),Conn,1,1
	
	IF Rs.Eof And Rs.Bof Then
		Rs.Close
		Set Rs=Nothing
%><br>
<table width="96%" border="0" align="center" cellpadding="3" cellspacing="2"class="content" >
  <tr>
    <td >��ʱû�����ݣ�</td>
  </tr>
</table>
<%
	Else
		
		ic=15
		Rs.pagesize=ic
		pages=Rs.pagecount
		epage=getPage(Trim(Request.QueryString("page")),pages)
		Rs.absolutepage=epage
	 
%><br>
<table width="96%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999" class="content" >
  <tr>
    <td height="40" align="center" bgcolor="#CCCCCC" >������</td>
    <td height="40" align="center" bgcolor="#CCCCCC" >�ֻ�����</td>
    <td height="40" align="center" bgcolor="#CCCCCC" >����</td>
    <td height="40" align="center" bgcolor="#CCCCCC" >�µ�ʱ��</td>
    <td align="center" bgcolor="#CCCCCC" >֧��ʱ��</td>
    <td align="center" bgcolor="#CCCCCC" >֧�����(����ݷ�)</td>
    <td align="center" bgcolor="#CCCCCC" >״̬</td>
    <td height="40" align="center" bgcolor="#CCCCCC" >����/����</td>
    </tr>
<%
		while not Rs.eof and ic>0
		
		
		
%>
  <tr bgcolor="FFFFFF" onmouseover="this.style.backgroundColor='#F1F1F1'"  onMouseOut="this.style.backgroundColor=''">
  <td height="20" align="center" class="tdc" ><a href="?action=mod&id=<%=Rs("orders")%>"><font color="#FF0000"><%=rs("orders")%></font></a></td>
  
		
  	<td height="20" align="center" class="tdc" ><%=Rs("huiyuan_mob")%></td>
  	<td height="20" align="center" class="tdc" ><%=Rs("Name")%></td>
  	<td height="20" align="center" class="tdc" ><%=Rs("addtime")%></td>
  	<td height="20" align="center" class="tdc" ><%=Rs("yuding")%></td>
  	<td height="20" align="center" class="tdc" ><%=Rs("qianbao")+Rs("kuaidi")%></td>
  	<td align="center" class="tdc" ><%if Rs("flag")=0 then%>
  	  <span class="STYLE12">Ԥ����</span>
  	  <%end if%><%if Rs("flag")=1 then%>
  	  <span class="STYLE13">�ɹ��µ�</span>
  	  <%end if%><%if Rs("flag")=2 then%>
  	  <span class="STYLE16">�µ�ʧ��</span>  	  <%end if%></td>
  	<td height="20" align="center" class="tdc" ><a href="?action=mod&id=<%=Rs("orders")%>">����</a></td>
  	</tr>
<%
			Rs.MoveNext
			ic=ic-1
		wend
		
		Rs.Close
		Set Rs = Nothing
		
%> <tr><td colspan="8" align="center" bgcolor="#FFFFFF" class="tdc" ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
      <tr>
        <td height="30" align="right">
              <%call apartPage("?orders="&request("orders")&"&isok="&request("isok")&"&select="&request("select")&"&shijian1="&session("date1")&"&shijian2="&session("date2")&"&",8,epage,pages)%></td>
      </tr>
    </table></td>
  	</tr>
</table>
<%
	End IF
	
	end sub
	
 
 sub mods()
  sql="select * from tbl_yuding where orders='"&request("id")&"'"
	response.write sql

	rs.open sql,conn,1,1
	if not rs.eof then 
 %>
 <br>
 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#AAC5DA">
     <tr>
       <td width="85%" height="25" bgcolor="#FFFFFF"><%		
					Set Rs1= Server.CreateObject("ADODB.Recordset")
					Rs1.open "select * from tbl_sinkia_action where orders ='"&rs("orders")&"'",conn,1,1
				 %>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" class="content">
                                   <tr>
                                    <td width="100" height="30" align="center" bgcolor="#CCCCCC">��ƷͼƬ</td>
                                    <td height="25" align="center" bgcolor="#CCCCCC">��Ʒ����</td>
                                    <td width="150" align="center" bgcolor="#CCCCCC" class="titlea1">��Ʒ���</td>
                                    <td width="150" height="25" align="center" bgcolor="#CCCCCC">�۸�</td>
                                    <td width="150" align="center" bgcolor="#CCCCCC">PV�۸�</td>
                                    <td width="150" height="25" align="center" bgcolor="#CCCCCC">����</td>
                                  </tr>
                                  <%dim m
						   m=0
						  do while not Rs1.eof
						  
Set Rs12= Server.CreateObject("ADODB.Recordset")
Rs12.open "select * from tbl_product where pro_id = '"&rs1("pid")&"'",conn,1,1


						   %>
                                  <tr>
                                     <TD width="100" align="center" bgcolor="#FFFFFF"  ><a href="../../../shop/viewproduct.aspx?id=<%=Rs1("pid")%>" target="_blank"><img style="border:double #999 1px" src="<%=rs12("pro_imgs")%>" width="50" height="50" border="0"></a></TD>
          <TD align="center" bgcolor="#FFFFFF" ><a href="../../../shop/viewproduct.aspx?id=<%=Rs1("pid")%>" target="_blank"><%=Rs12("pro_name")%></a></TD>
          <td width="150" align="center" bgcolor="#FFFFFF" ><span class="STYLE11">
            <%if rs12("pro_type")=1 then%>
            Ԥ��
            <%end if%>
          </span></td>
          <TD width="150" align="center" bgcolor="#FFFFFF" ><%=Formatnumber(Rs12("pro_money"))%></TD>
          <td width="150" align="center" bgcolor="#FFFFFF" ><%=Formatnumber(Rs12("pro_price"))%></td>
          <td width="150" align="center" bgcolor="#FFFFFF" ><%=Rs1("pro_num")%></td>
          </tr>
								  
                                  <%
								  zone=zone+Rs1("pro_num")*Formatnumber(Rs1("pro_price2"))
								  zone_sd=zone_sd+Rs1("pro_num")*Formatnumber(Rs1("pro_price3"))
								  zonepv=zonepv+Rs1("pro_num")*Formatnumber(Rs1("pro_money"))
								  m=m+Rs1("pro_num")
								  
								  
								  
								  
						   Rs1.MoveNext
					loop
					%>
                                  <tr>
                                    <td height="25" align="center" bgcolor="#FFFFFF" colspan="6" ><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                      <%
qianbao_zong=rs("qianbao")
jifen_song=rs("jifen_song")
jifen_hg=rs("jifen_hg")
%>
                                      <tr class="content">
                                        <td width="25%" height="30" align="center"><strong>��Ʒ�ϼƣ�</strong><font color="#FF0000"><%=m%></font><strong>��</strong></td>
                                        <td width="25%" height="30" align="center"><strong>���ͻ��֣�</strong><font color="#FF0000"><%=jifen_song%></font></td>
                                        <td width="25%" align="center"><strong>֧�����֣�</strong><font color="#FF0000"><%=jifen_hg%></font></td>
                                        <td width="25%" height="30" align="center"><strong>�ܼ۸�</strong><font color="#FF0000"><%=qianbao_zong%></font></td>
                                      </tr>
                                    </table></td>
                                  </tr>
            </table>
                              <%
				    Rs1.close
					set Rs1=nothing
				  %>
	              <table>
				                <tr>
				                  <td height="5"></td>
			                    </tr>
            </table>
	              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" class="content">
                                   <form id="form5" name="form5" method="post" action="?action=modsave"><tr>
                                    <td width="160" height="30" align="right" bgcolor="#FFFFFF">�� �� �ţ�</td>
                                    <td width="549" height="25" align="left" bgcolor="#FFFFFF">&nbsp;<%=rs("orders")%></td>
                                    <td width="160" height="25" align="right" bgcolor="#FFFFFF">�ֻ����룺</td>
                                    <td width="552" height="25" align="left" bgcolor="#FFFFFF">&nbsp;<span class="tdc"><%
					Set Rs12= Server.CreateObject("ADODB.Recordset")
					Rs12.open "select * from tbl_huiyuan where huiyuan_id ='"&rs("huiyuan_id")&"'",conn,1,1
					response.Write rs12("huiyuan_mob")
					rs12.close
					set rs12=nothing
					%></span></td>
                                  </tr>
								   <tr>
                                    <td width="160" height="30" align="right" bgcolor="#FFFFFF">�������룺</td>
                                    <td width="549" height="25" align="left" bgcolor="#FFFFFF"  >&nbsp;<%=rs("yb")%></td>
                                    <td width="160" height="25" align="right" bgcolor="#FFFFFF"  >��ϵ��ʽ��</td>
                                    <td width="552" height="25" align="left" bgcolor="#FFFFFF" >&nbsp;<%=rs("tel")%>/<%=rs("phone")%></td>
                                  </tr>
								   <tr>
                                    <td width="160" height="30" align="right" bgcolor="#FFFFFF"  >�ջ���ַ��</td>
                                    <td height="25" align="left" bgcolor="#FFFFFF"  >&nbsp;<%
if rs("bid")<>"" then
	SQLa="select * from tbl_address1 where id="&rs("bid")&""
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	if not rsa.eof and not rsa.bof then
		response.write rsa("dizhi")
	end if
	rsa.close
	set rsa=nothing
end if
	
if rs("mid")<>"" then
	SQLa="select * from tbl_address2 where id="&rs("mid")&""
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	if not rsa.eof and not rsa.bof then
		response.write rsa("dizhi")
	end if
	rsa.close
	set rsa=nothing
end if

if rs("sid")<>"" then
	SQLa="select * from tbl_address3 where id="&rs("sid")&""
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	if not rsa.eof and not rsa.bof then
		response.write rsa("dizhi")
	end if
	rsa.close
	set rsa=nothing
end if

if rs("qid")<>"" then
	SQLa="select * from tbl_address4 where id="&rs("qid")&""
	set rsa=server.CreateObject("adodb.recordset")
	rsa.Open SQLa,conn,1,1
	if not rsa.eof and not rsa.bof then
		response.write rsa("dizhi")
	end if
	rsa.close
	set rsa=nothing
end if
%><%=rs("address")%></td>
                                    <td height="25" align="right" bgcolor="#FFFFFF"  >�� �� �ˣ�</td>
                                    <td height="25" align="left" bgcolor="#FFFFFF"  >&nbsp;<%=rs("name")%></td>
                                   </tr> 
								   <tr>
                                    <td width="160" height="30" align="right" bgcolor="#FFFFFF"  >����״̬��</td>
                                    <td width="549" height="25" align="left" bgcolor="#FFFFFF"  >&nbsp;
                                      <%if rs("isok")=0 then%>δ����
    <%else if rs("isok")=1  then%>�ѷ���
    <%else %>�˻�
    <%end if
	end if%>                                                       </td>
                                    <td width="160" height="25" align="right" bgcolor="#FFFFFF"  >����ʱ�䣺</td>
                                    <td width="552" height="25" align="left" bgcolor="#FFFFFF" >&nbsp;<%=rs("addtime")%></td>
                                  </tr>
								   <tr>
                                    <td width="160" height="30" align="right" bgcolor="#FFFFFF" >�ҵ����ԣ�</td>
                                    <td height="25" colspan="3" align="left" bgcolor="#FFFFFF"  ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                          <td width="94%">&nbsp;<%=rs("content")%>&nbsp;</td>
                                      </tr>
                                     </table></td>
                                  </tr>
                                  <input name="ids" type="hidden" value="<%=rs("id")%>">
								  <%if rs("isok")=0 then%>
                                    <%else%>
									<%end if%>
								  </form>
            </table>
 </td>
     </tr>
 </table>
 <%else
 response.Write "û�����ҵ�����Ϣ~��"
 end if
 rs.close
set rs=nothing
 end sub
 %></td>
              </tr>
</table>

            
            </td>
        </tr>
      </table>
      </td>
    </tr>
  </table>
</BODY></HTML>
