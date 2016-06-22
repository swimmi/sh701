<%
dim filestr,strtmp
dim filename,filepath
filename="sql.txt"                                              '新建123.txt文件
filestr=""
filepath=Server.MapPath(filename)
i=1
set fileConn=Server.CreateObject("Scripting.FileSystemObject")  '建立Scripting对象
set fileOpen=fileConn.OpenTextfile(filepath,1,false)            '打开文件并读取文件
    while not fileOpen.AtEndOfStream                            '如果没有读到最后一行则循环
	
    strtmp=fileOpen.Readline()                              
    filestr= strtmp 
	if i=1 then
		SqlDatabaseName =strtmp  'SQL数据库名 
	end if
	if i=2 then
		SqlUsername =strtmp  'SQL数据库名 
	end if
	if i=3 then
		SqlPassword = strtmp 'SQL数据库名 
	end if
	if i=4 then
		SqlLocalName =strtmp  'SQL数据库名 
	end if

i=i+1
 wend   
fileOpen.close                                                  '关闭文件
set fileConn=nothing                                            '释放对象
set fileOpen=nothing 
                                          
SqlDatabaseName=trim(replace(SqlDatabaseName,"'SQL数据库名 ",""))
SqlUsername=trim(replace(SqlUsername,"'SQL数据库用户名 ",""))
SqlPassword=trim(replace(SqlPassword,"'SQL数据库用户密码",""))
SqlLocalName=trim(replace(SqlLocalName,"'SQL主机IP地址（服务器名）",""))



response.Cookies("sql")("SqlDatabaseName")=SqlDatabaseName
response.Cookies("sql")("SqlUsername")=SqlUsername
response.Cookies("sql")("SqlPassword")=SqlPassword
response.Cookies("sql")("SqlLocalName")=SqlLocalName



response.Cookies("sql")("SqlDatabaseName")=request.Cookies("sql")("SqlDatabaseName")
response.Cookies("sql")("SqlUsername")=request.Cookies("sql")("SqlUsername")
response.Cookies("sql")("SqlPassword")=request.Cookies("sql")("SqlPassword")
response.Cookies("sql")("SqlLocalName")=request.Cookies("sql")("SqlLocalName")





Function SafeRequest(ParaName,ParaType)
	Dim ParaValue
	ParaValue=Request(ParaName)
	If ParaType=1 then
		If ParaValue="" or not isNumeric(ParaValue) then
			Response.write "参数" & ParaName & "必须为数字型！"
			Response.end
		End if
	Else
		ParaValue=replace(ParaValue,"'","''")
	End if
	SafeRequest=ParaValue
End function



Dim SqlDatabaseName,SqlPassword,SqlUsername,SqlLocalName,ConnStr,Conn 
SqlDatabaseName = request.Cookies("sql")("SqlDatabaseName") 'SQL数据库名 
SqlUsername = request.Cookies("sql")("SqlUsername") 'SQL数据库用户名 
SqlPassword = request.Cookies("sql")("SqlPassword") 'SQL数据库用户密码 
SqlLocalName = request.Cookies("sql")("SqlLocalName") 'SQL主机IP地址（服务器名）  
ConnStr = " Password = "&SqlPassword&"; user id =" & SqlUsername&"; Initial Catalog ="&SqlDatabaseName&"; data source ="& SqlLocalName &";Provider = sqloledb;" 
Set conn = Server.CreateObject("ADODB.Connection") 
conn.open ConnStr 

'conn.execute("exec sp_jiance")





%>
