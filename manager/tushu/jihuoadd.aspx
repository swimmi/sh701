<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--#include file="../../conn.aspx"-->
<!--#include file="md5.aspx"-->
<%	 
if request.form("submit")="�������ɼ�����" then

if Request("tushu")=0 then
	response.Write "<script language=javascript>alert('��ѡ��ͼ�����ƣ�');history.go(-1);</script>"
	response.end
end if
if Request("banci")="" then
	response.Write "<script language=javascript>alert('����дͼ���Σ�');history.go(-1);</script>"
	response.end
end if
if Request("yingci")="" then
	response.Write "<script language=javascript>alert('����дͼ��ӡ�Σ�');history.go(-1);</script>"
	response.end
end if
if Request("shuliang")="" then
	response.Write "<script language=javascript>alert('����д���ɼ�����������');history.go(-1);</script>"
	response.end
end if
if not isnumeric(request.form("shuliang"))  then
	response.Write "<script language=javascript>alert('���ɼ������������������ֱ�ʾ������ȷ������');history.go(-1);</script>"
	response.end
end if
'��ȡ���
	set rs=server.CreateObject("adodb.recordset") 
	sql="select * from tushu where id='"&request("tushu")&"'"
	rs.Open sql,conn,1,1
    bianhao=rs("bianhao")
	rs.close
	set rs=nothing
	'�ж��Ƿ��д����ε�
	geshu=0
	set rs=server.CreateObject("adodb.recordset") 
	sql="select * from jihuoma where banci='"&request("banci")&"' and yingci='"&request("yingci")&"' and tushu='"&request("tushu")&"'"
	rs.Open sql,conn,1,1
	if not rs.eof and not rs.bof then
	geshu=rs.recordcount
	end if
	rs.close
	set rs=nothing
		
'�����������
	for i=1 to request("shuliang")
		biaoji=now()
		biaoji=replace(biaoji,"/","")
		biaoji=replace(biaoji,"-","")
		biaoji=replace(biaoji,":","")
		biaoji=replace(biaoji," ","")
		
		jihuoma=md5(biaoji*i,16,1)
		jihuoma=replace(jihuoma,"O","")
		jihuoma=replace(jihuoma,"0","")
		jihuoma=replace(jihuoma,"L","")
		jihuoma=replace(jihuoma,"I","")
		jihuoma=replace(jihuoma,"1","")
		
		jihuoma=left(jihuoma,10)
		
		if len(i)=1 then
			aa="00000"&i
		end if
		if len(i)=2 then
			aa="0000"&i
		end if
		if len(i)=3 then
			aa="000"&i
		end if
		if len(i)=4 then
			aa="00"&i
		end if
		if len(i)=5 then
			aa="0"&i
		end if
		if len(i)=6 then
			aa=i
		end if
		
		'���к�
		xuliehao=bianhao&request("banci")&request("yingci")&(geshu+i)

		'��������
		set rs=server.CreateObject("adodb.recordset") 
		sql="select * from jihuoma"
		rs.Open sql,conn,1,3
		rs.addnew
		rs("tushu") =Request("tushu")
		rs("xuliehao") =xuliehao
		rs("banci") =request("banci")
		rs("yingci") =request("yingci")
		rs("shuliang") =request("shuliang")
		rs("tushu") =request("tushu")
		rs("jihuoma") =jihuoma
		rs("addtime")= now()
		rs.Update
		rs.close
		set rs=nothing

		
		
		
	next


	response.Write "<script language=javascript>alert('�ɹ�������');location.href='jihuo.aspx';</script>"
	response.end

end if




   %>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">�������ɼ�����</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ϵͳ���� &gt; ���ɼ����� &gt; �������ɼ�����</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />�������ɼ�����</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-bottom:10px; padding-top:10px;">
	
<form id="form1" name="form1" method="post" action="jihuoadd.aspx">
  <table width="100%" border="0" cellpadding="0" cellspacing="1">

    <tr>
      <td align="center"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="157" height="30" align="right" class="content">ͼ�����ƣ�</td>
          <td width="1022"  align="left">
		  
		  
		  <select name="tushu">
			  	<option value="0">��ѡ��ͼ��</option>

<%
	SQL="select * from tushu order by id desc"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
	if not rs.eof and not rs.bof then
	while not rs.eof
%>
	<option value="<%=rs("id")%>"><%=rs("title")%></option>
<%
	rs.movenext
	wend
	end if
%>
              </select></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">ͼ���Σ�</td>
          <td  align="left"><input name="banci" type="text" id="banci" size="50"/>
            <span class="hong">*</span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">ͼ��ӡ�Σ�</td>
          <td  align="left"><input name="yingci" type="text" id="yingci" size="50"/>
            <span class="hong">*</span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">���ɼ�����������</td>
          <td  align="left"><input name="shuliang" type="text" id="shuliang" size="50"/>
            <span class="hong">*</span></td>
        </tr>
        <tr>
          <td height="30" align="right" class="content">&nbsp;</td>
          <td height="40" align="left" valign="middle"><input type="submit" name="Submit" value="�������ɼ�����" />
            <input type="button" name="Submit2" value="������һҳ" onclick='JavaScript:history.go(-1);' /></td>
        </tr>
      </table>
        </td>
    </tr>
  </table>
</form>

	
    </td>
  </tr>
</table>
</body>
</html>
