<%

Function SafeRequest(ParaName,ParaType)
	Dim ParaValue
	ParaValue=Request(ParaName)
	If ParaType=1 then
		If ParaValue="" or not isNumeric(ParaValue) then
			Response.write "参数" & ParaName & "必须为数字型"
			Response.end
		End if
	Else
		ParaValue=replace(ParaValue,"'","''")
	End if
	SafeRequest=ParaValue
End function

Dim SqlDatabaseName,SqlPassword,SqlUsername,SqlLocalName,ConnStr,Conn 
SqlDatabaseName = "sh701" 'SQL数据库名  
SqlUsername = "sh701" 'SQL数据库用户名  
SqlPassword = "sh701sh701" 'SQL数据库用户密码  
SqlLocalName = "." 'SQL主机IP地址（服务器名）   
ConnStr = " Password = "&SqlPassword&"; user id =" & SqlUsername&"; Initial Catalog ="&SqlDatabaseName&"; data source ="& SqlLocalName &";Provider = sqloledb;" 
Set conn = Server.CreateObject("ADODB.Connection") 
conn.open ConnStr 

if request.Cookies("bj")("orders")="" then
	dingdan_=now()
	dingdan_=replace(trim(dingdan_),"-","")
	dingdan_=replace(dingdan_,":","")
	dingdan_=replace(dingdan_," ","")
	dingdan_=replace(trim(dingdan_),"/","")
	response.Cookies("bj")("orders")=dingdan_
end if

if request.Cookies("bj")("huiyuan_id")&""<>"" then
	set rsa=server.CreateObject("adodb.recordset")
	rsa.open "select * from tbl_sinkia_action where isok=0 and username='"&request.Cookies("bj")("orders")&"' and orders ='"&request.Cookies("bj")("orders")&"'",conn,1,3
	while not rsa.eof
	rsa("username")=request.Cookies("bj")("huiyuan_id")
	rsa.MoveNext
	wend
	rsa.close
	set rsa=nothing
end if
%>
