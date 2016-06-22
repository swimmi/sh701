<%



	if request("tel")="" or request("tel")="请输入手机号码" then
		response.Write "<script language=javascript>alert('请输入手机号！');top.location.href='index.aspx';</script>"
		response.end
	end if

	shijian=replace(now(),":","")
	shijian=replace(shijian,"/","")
	shijian=replace(shijian,"-","")
	shijian=replace(shijian," ","")
	
	yzm=right(shijian,1)&right(right(shijian,3)*right(shijian,3),60)

	session("phoneyzma")=yzm
	
	Mobile=request("tel")
		
	Content="您好，您的验证码："&yzm&"。"
	Dim HttpUrl,https,xml
		
	If Mobile <> "" and Content <>"" then
		HttpUrl = "http://api.sms.cn/mt/?uid=dmzrj&pwd=507fac3dd8e1f2be2dea310c071e1b58&mobile="&Mobile&"&mobileids=消息编号&content="&Content&""
		Set https = Server.CreateObject("MSXML2.XMLHTTP")
		https.open "post", HttpUrl, False
		https.setRequestHeader "Content-type", "application/x-www-form-urlencoded"
		https.send
		Set xml = Server.CreateObject("Microsoft.XMLDOM")
		xml.async = False
		xml.setProperty "ServerHTTPRequest", True
		xml.Load https.responseBody
		fSnedSM=cstr(https.responseText)
	End if


%>