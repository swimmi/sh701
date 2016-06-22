<!--#include file="../conn.aspx"--> 
<%
	If Trim(Request.Form("validate_code"))=Empty Or Trim(Session("getCode")) <>Trim(Request.Form("validate_code")) Then 
		response.write(" <script  language=javascript>alert('请输入正确的验证码1');Javascript:window.history.go(-1); </script>") 
		response.end 
	end if

bianhao=request.form("huiyuan_name")
pass=request.form("huiyuan_pass")

set rs_id=server.CreateObject("adodb.recordset")
sql_id="select * from tbl_admin where huiyuan_bianhao='"&bianhao&"'"
rs_id.Open sql_id,conn,1,1

if ( not rs_id.BOF and not rs_id.EOF)  then
    

  if  trim(rs_id("huiyuan_pass"))=trim(pass)  then 

	session("hy_id")=rs_id("huiyuan_id")
	session("hy_bianhao")=rs_id("huiyuan_bianhao")
	session("hy_name")=rs_id("huiyuan_name")
	Session("UserRole")=rs_id("huiyuan_quanxian")

	
   
    response.redirect  "index.aspx"
  else
	response.redirect  "../gl.aspx"
  end if
else
 	response.redirect  "../gl.aspx"

end if
 	response.redirect  "../gl.aspx"
%>
