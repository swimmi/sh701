<!--#include file="soft.aspx"--> 
<%

conn.execute("delete wendangshow where wengdang='"&request("id")&"'")

for i=1 to request.Form("queren").count()
	id= request.Form("queren").item(i)

	SQL="select * from wendangshow where huiyuan_id='"&id&"' and wengdang='"&request("id")&"'"
	set rs=server.CreateObject("adodb.recordset")
	rs.Open SQL,conn,1,1
		totala=rs.recordcount
	rs.close
	set rs=nothing
	
	

	if totala=0 then
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from wendangshow"
		rs.open sql,conn,1,3
		rs.addnew
		rs("huiyuan_id")=id
		rs("wengdang")=request("id")
		rs.update
		rs.close
		set rs=nothing
	end if
	

	
next

response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='video_fen.aspx?video="&request("id")&"';</script>"
response.end
%>
