<!--#include file="../../conn.aspx"-->
<%



			
	if request("banci")="" then
		response.Write "<script language=javascript>alert('请选择版次！');history.go(-1);</script>"
		response.end
	end if
	
	if request("yingci")="" then
		response.Write "<script language=javascript>alert('请选择印次！');history.go(-1);</script>"
		response.end
	end if
	
    set rs=server.createobject("adodb.recordset")   
    sql = "select *  from view_video where id='"&request("id")&"'"   
    rs.open sql,conn,1,3
	videoid=rs("id")
	videobianhao=rs("bianhao")
	videotitle=rs("title")
	tushuid=rs("tushu")
	tushutitle=rs("tushutitle")
	url=rs("video")
	rs.close
	set rs=nothing

    set rs=server.createobject("adodb.recordset")   
    sql = "select *  from jihuoma where flag=0 and tushu='"&request("tushu")&"' and banci='"&request("banci")&"' and yingci='"&request("yingci")&"'"   
    rs.open sql,conn,1,3
	if not rs.eof and not rs.bof then
	while not rs.eof 
	
		conn.execute("insert weixing(videoid,videobianhao,videotitle,tushuid,tushutitle,xuliehao,jihuoma,url,banci,yingci)values('"&videoid&"','"&videobianhao&"','"&videotitle&"','"&tushuid&"','"&tushutitle&"','"&rs("xuliehao")&"','"&rs("jihuoma")&"','"&url&"','"&request("banci")&"','"&request("yingci")&"')")
		conn.execute("update jihuoma set flag=1 where banci='"&request("banci")&"' and yingci='"&request("yingci")&"'")
	rs.movenext
	wend
	
	
	else
		response.Write "<script language=javascript>alert('对不起，请先生成激活码！');history.go(-1);</script>"
		response.end
	end if
	rs.close
	set rs=nothing





	response.Write "<script language=javascript>alert('操作成功！');location.href='wei.aspx?id="&request("id")&"&tushu="&request("tushu")&"&banci="&request("banci")&"&yingci="&request("yingci")&"';</script>"
	response.end


%>
