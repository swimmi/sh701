<!--#include file="../../conn.aspx"-->
<%	 
	
conn.execute("update tbl_huiyuan set sh_flag='"&request("flag")&"'where huiyuan_id='"&request("huiyuan_id")&"'")

	response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='al_read20.aspx';</script>"
	response.end

	






   %>
   
   
   
