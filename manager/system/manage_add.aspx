<!--#include file="../jiance.aspx"-->
<%
   ' ��ҳWeb·��
   WebRootPath=""

   ' ��ҳ�ϴ��ļ�·��
   WebUpFilePath= WebRootPath & "/Upload"


   ' ��������
   SystemWorkStartDate = "2007-9-1"
   yonghu_id="000001"



Sub GotoPage(PageName)
   Response.redirect PageName
End Sub

function quanxian_gai(type_id,quanxian_str)
   if isnumeric(type_id)=false or type_id<=0  then
   response.write "���ô���!"
   response.end 
   end if

   quanxian_gai=right(left(quanxian_str,type_id),1)
   
   
End function


function quanxian(type_id)
   if isnumeric(type_id)=false or type_id<=0  then
   response.write "���ô���!"
   end if
  
   quanxian_str=Session("UserRole")
   'response.write quanxian_str1
   'response.end 
   quanxian_flag=right(left(quanxian_str,type_id),1)
   
   if quanxian_flag=1 then
      quanxian=true
	else
	   quanxian=false
	end if
   
End function

 



%>
<!-- #include file="../../conn.aspx" -->
<script language="javascript"> 
//����˵��(lulu163.com)��form1Ϊ������memberIdΪ��ѡ��selectbuttonΪȫѡ��ť 
   function selectAll()  
   { 
for (var i=0;i<document.form1.quanxian.length;i++) { 
var temp=document.form1.quanxian[i]; 
temp.checked=!temp.checked; 
} 
   if (document.form1.selectButton.value=="ȫ��ѡ��") 
   { 
     document.form1.selectButton.value="ȡ��ȫѡ"; 
   } 
   else 
   { 
     document.form1.selectButton.value="ȫ��ѡ��"; 
   } 
} 
</script>

<html>
<head>
<base target="_self">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../../css/cssa.css" rel="stylesheet" type="text/css">
</head>
 <style type="text/css">
<!--
-->
</style>
<body bgcolor="#FFFFFF">


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">Ȩ������</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ��ҵ�ʺ� &gt; ����Ա�ʺŹ��� &gt; Ȩ������</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />ϵͳ����</td>
  </tr>
  <tr>
    <td  bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">

<TABLE width=99% border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TR> 
    <TD vAlign=top background=../images/200471602.gif> 
      <p><br>
      </p>
      <form name="form1" method="post" action="quanxian_xiugai.aspx">
	  <%set rs_read=server.CreateObject("adodb.recordset")
	  rs_read.open "select * from tbl_admin where  id='"&request("id")&"'",conn,1,3
	  'response.write "select * from tbl_admin where  id='"&request("id")&"'"
	  'response.end
	  if rs_read.recordcount<0 then
	  	response.Write("���ݴ���")
		response.end 
	  end if%>
        <table width=99% align=center cellpadding="1" cellspacing="1" bgcolor="#D4D0C8" class="content">
          <tbody>
            <tr bgcolor="#FFFFFF"  > 
              <td width="14%" align=middle bgcolor="#FFFFFF" class="content" >����Ա����</td>
              <td width="33%" align=left bgcolor="#FFFFFF" class="content" >  
                  <input name="id" type="hidden" id="id" value="<%=request("id")%>" size="9" maxlength="9" >
                  <input name="yuangong_code" type="text" id="yuangong_code" value="<%=trim(rs_read("huiyuan_bianhao"))%>" size="15" maxlength="20" >
              </td>
              <td width="12%" align=middle bgcolor="#FFFFFF" class="content" >����Ա����</td>
              <td width="41%" align=left bgcolor="#FFFFFF" class="content" >  
                  <input name="yuangong_name" type="text" id="yuangong_name" value="<%=trim(rs_read("huiyuan_name"))%>" size="15" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF" > 
              <td align=middle class="content">��¼����</td>
              <td align=left bgcolor="#FFFFFF" class="content">  
                  <input name="yuangong_pass" type="text"  id="yuangong_pass" value="<%=trim(rs_read("huiyuan_pass"))%>" size="20" maxlength="20">
              </td>
              <td align=middle class="content">&nbsp;</td>
              <td align=middle class="content">&nbsp;</td>
            </tr>
            <%
'
%>
          <input name="actiondo" type="hidden" id="actiondo" value="">
          <input name="NewsTypeID" type="hidden" id="NewsTypeID" value=" ">
        </table>
        <p align="center"> 
          <input type="submit" name="Submit" value="����">
          ��
          
        </p>
      </form>
      <p align="center"></p>
      </TD>
  </TR>
  <tr> 
    <td vAlign=top background=../images/200471602.gif > <bR>
      </td>
  </tr>
</TABLE>
</td>
  </tr>
</TABLE>

</body>
</html>
