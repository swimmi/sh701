 
 <!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%



Set Rs= Server.CreateObject("ADODB.Recordset")
Rs.Open ("select * from tbl_huiyuan where huiyuan_id='"&request("huiyuan_id")&"'"),Conn,3,3

response.Cookies("bj")("huiyuan_name")=request("huiyuan_name")

rs("huiyuan_name")=request("huiyuan_name")
rs("yx")=request("yx")
rs("huiyuan_sex")=request("radiobutton")
rs("huiyuan_name")=request("huiyuan_name")
rs("huiyuan_pass")=request("pass")
if request("shijian1")<>"" then
	rs("shijian1")=request("shijian1")
end if
rs("huiyuan_mob")=request("huiyuan_mob")
Rs.Update
Rs.Close



	response.Write "<script language=javascript>alert('ÐÞ¸Ä³É¹¦£¡');location.href='al_read2.aspx';</script>"
	response.end
%>
