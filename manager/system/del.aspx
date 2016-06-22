<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <%
Response.Expires=-1
Server.ScriptTimeout=1000000
Timeout=1000000
time1=now()
conn.execute("exec sp_del")
time2=now()
time0=datediff("d",cdate(time1),cdate(time2))
response.Redirect("jiesuan.aspx?err=数据清空完成&time="&time0)

%>
