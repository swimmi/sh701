<!--#include file="config.aspx"-->
<!--#include file="inc/upload_class.aspx"-->
<!--#include file="inc/session.aspx"-->
<%
if Session_("name")="" then
	response.Write "{err:true,msg:'请登录后再上传文件'}" 
	response.End()
end if

Server.ScriptTimeOut=60000000
i=0
Dim Upload,path,tempCls,e
set Upload=new AnUpLoad	
Upload.SingleSize=AllowFileSizeLimit
Upload.MaxSize=AllowFileSizeLimit
Upload.Exe=AllowExt 
Upload.Charset="utf-8"
Upload.GetData() 
if Upload.ErrorID>0 then
	response.Write("{err:true,msg:'" & Upload.description & "'}")
else
	path=server.MapPath("../video")
	set tempCls=Upload.files("filedata") 
	if tempCls.isfile then
		if tempCls.SaveToFile(path,0,true) then
			i=i+1
			response.Write("{err:false,msg:'../video',name:'" & tempCls.filename & "',src:'" & tempCls.LocalName & "'}")
		else
			response.Write("{err:true,msg:'" & tempCls.Exception & "'}")
		end if
	else
		response.Write("{err:true,msg:'文件表单丢失'}")
	end if
	set tempCls=nothing
end if
set Upload=nothing



%>
