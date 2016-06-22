<!--#include file="../../conn.aspx"-->

<%

if 	request("title")="" then
	response.Write "<script language=javascript>alert('请填写商品名称！');history.go(-1);</script>"
	response.end
end if

if 	request("qianbao")="" then
	response.Write "<script language=javascript>alert('请填写兑换价格！');history.go(-1);</script>"
	response.end
end if

    set rs_addnew=server.CreateObject("adodb.recordset") 
    sql_addnew="select * from tbl_pro"
    rs_addnew.Open sql_addnew,conn,1,3
    rs_addnew.AddNew
    rs_addnew("title")=request("title")
	rs_addnew("qianbao")=request("qianbao")
	rs_addnew("flag")=0
    rs_addnew.Update
	rs_addnew.close
    set rs_addnew=nothing
	
	response.Write "<script language=javascript>alert('添加成功！');location.href='addnews.aspx';</script>"
	response.end
	


	%>
	
