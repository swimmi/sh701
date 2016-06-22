 
 <!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%



Set Rs= Server.CreateObject("ADODB.Recordset")
Rs.Open ("select * from tbl_huiyuan where huiyuan_id='"&request("huiyuan_id")&"'"),Conn,3,3


rs("huiyuan_name")=request("huiyuan_name")
rs("yx")=request("yx")
rs("huiyuan_name")=request("huiyuan_name")
rs("sh_name")=request("sh_name")
rs("huiyuan_pass")=request("pass")
rs("huiyuan_mob")=request("huiyuan_mob")

rs("sh_name")=request("sh_name")
rs("sh_jingying")=request("sh_jingying")
rs("sh_zhuce")=request("sh_zhuce")
rs("sh_tel")=request("sh_tel")
Rs.Update
Rs.Close



	response.Write "<script language=javascript>alert('ÐÞ¸Ä³É¹¦£¡');location.href='al_read20.aspx';</script>"
	response.end
%>
