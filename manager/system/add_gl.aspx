<!-- #include file="../../conn.aspx" -->
<!--#include file="../jiance.aspx"--> <%
if Request("yuangong_name")="" or Request("yuangong_code")="" or Request("yuangong_pass")="" then
  Response.Write "<script language=javascript>alert('请输入管理员编号、姓名、密码！');history.go(-1);</script>"
  Response.End 
end if
set Grp_oRs=server.CreateObject("adodb.recordset")
sql = "select * from tbl_admin where huiyuan_bianhao='"&Request("yuangong_code")&"'"
Grp_oRs.open sql,conn,1,3
if Grp_oRs.recordcount>0 then 
  Response.Write "<script language=javascript>alert('已经有该管理员,无法重复添加！');history.go(-1);</script>"
  Response.End 
else
     Grp_oRs.addnew
     Grp_oRs("huiyuan_name")= Request("yuangong_name")
     Grp_oRs("huiyuan_bianhao")= Request("yuangong_code")
     Grp_oRs("huiyuan_pass")= Request("yuangong_pass")
	 'Grp_oRs("pass_two")= Request("pass_two")
	 Grp_oRs("huiyuan_id")= Request("yuangong_code")
     Grp_oRs.update
     Grp_oRs.close
end if

'response.Redirect("bumen_set.aspx")
Response.Write "<script language=javascript>alert('管理员添加成功！');location.href='manage.aspx';</script>"
Response.End 
%>

