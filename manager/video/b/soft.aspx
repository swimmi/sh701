<%
dim filestr,strtmp
dim filename,filepath
filename="sql.txt"                                              '�½�123.txt�ļ�
filestr=""
filepath=Server.MapPath(filename)
i=1
set fileConn=Server.CreateObject("Scripting.FileSystemObject")  '����Scripting����
set fileOpen=fileConn.OpenTextfile(filepath,1,false)            '���ļ�����ȡ�ļ�
    while not fileOpen.AtEndOfStream                            '���û�ж������һ����ѭ��
	
    strtmp=fileOpen.Readline()                              
    filestr= strtmp 
	if i=1 then
		SqlDatabaseName =strtmp  'SQL���ݿ��� 
	end if
	if i=2 then
		SqlUsername =strtmp  'SQL���ݿ��� 
	end if
	if i=3 then
		SqlPassword = strtmp 'SQL���ݿ��� 
	end if
	if i=4 then
		SqlLocalName =strtmp  'SQL���ݿ��� 
	end if

i=i+1
 wend   
fileOpen.close                                                  '�ر��ļ�
set fileConn=nothing                                            '�ͷŶ���
set fileOpen=nothing 
                                          
SqlDatabaseName=trim(replace(SqlDatabaseName,"'SQL���ݿ��� ",""))
SqlUsername=trim(replace(SqlUsername,"'SQL���ݿ��û��� ",""))
SqlPassword=trim(replace(SqlPassword,"'SQL���ݿ��û�����",""))
SqlLocalName=trim(replace(SqlLocalName,"'SQL����IP��ַ������������",""))



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
			Response.write "����" & ParaName & "����Ϊ�����ͣ�"
			Response.end
		End if
	Else
		ParaValue=replace(ParaValue,"'","''")
	End if
	SafeRequest=ParaValue
End function



Dim SqlDatabaseName,SqlPassword,SqlUsername,SqlLocalName,ConnStr,Conn 
SqlDatabaseName = request.Cookies("sql")("SqlDatabaseName") 'SQL���ݿ��� 
SqlUsername = request.Cookies("sql")("SqlUsername") 'SQL���ݿ��û��� 
SqlPassword = request.Cookies("sql")("SqlPassword") 'SQL���ݿ��û����� 
SqlLocalName = request.Cookies("sql")("SqlLocalName") 'SQL����IP��ַ������������  
ConnStr = " Password = "&SqlPassword&"; user id =" & SqlUsername&"; Initial Catalog ="&SqlDatabaseName&"; data source ="& SqlLocalName &";Provider = sqloledb;" 
Set conn = Server.CreateObject("ADODB.Connection") 
conn.open ConnStr 

'conn.execute("exec sp_jiance")





%>
