<!--#include file="soft.aspx"--> 
<%

	conn.execute("insert wendangshow(huiyuan_id,wengdang)values('"&request("huiyuan_id")&"','"&request("video")&"')")

response.Write "<script language=javascript>alert('�����ɹ���');location.href='video_fen.aspx?video="&request("video")&"';</script>"
response.end
%>
