<!--#include file="soft.aspx"--> 
<%

	conn.execute("delete wendangshow where huiyuan_id='"&request("huiyuan_id")&"' and wengdang='"&request("video")&"'")

response.Write "<script language=javascript>alert('²Ù×÷³É¹¦£¡');location.href='video_fen.aspx?video="&request("video")&"';</script>"
response.end
%>
