<%
function getPage(page,pages)
	if page<>"" then
		page=cint(page)
		if page<1 then page=1
		if page>pages then page=pages
	else
		page=1
	end if
	getPage=page
end function

sub apartPage(link,num,epage,pages)
	if epage>1 then
		Response.Write("<a href='"&link&"page="&(epage-1)&"'>上一页</a>")  
	end if
	if pages>num then
		if epage-(num/2)<0 then
			RemoveHTML 1,num,epage,link
		elseif epage+(num/2)>pages then
			xc=pages-num
			RemoveHTML xc,pages,epage,link
		else
			xc1=epage-(num/2)
			xc2=epage+(num/2)
			RemoveHTML xc1,xc2,epage,link
		end if
	else
		RemoveHTML 1,pages,epage,link
	end if
	
	if epage<pages then
		Response.Write("<a href='"&link&"page="&(epage+1)&"'>下一页</a>&nbsp;")
	end if
		Response.Write("第"&epage&"/"&pages&"页&nbsp;")
end sub 

Sub RemoveHTML(tx,ps,ep,link) 
	Response.Write("&nbsp;")
	For x = tx To ps
		if x=ep then
			Response.Write("<font style='color:#FF0000'>["&x&"]</font>&nbsp;")
		else
			Response.Write("<a href='"&link&"page="&x&"'>["&x&"]</a>&nbsp;")
		end if
	Next
End Sub


%>
