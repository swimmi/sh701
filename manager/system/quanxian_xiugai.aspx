<!-- #include file="../../conn.aspx" -->
<!--#include file="../jiance.aspx"-->
 <% 
UserID = Request.form("id")
	set Usr_oRs=server.CreateObject("adodb.recordset")
     sql = "select * from tbl_admin where 1=1  and id='"&UserID&"'"
     Usr_oRs.open sql,Conn,1,3

     If Usr_oRs.RecordCount >0 then 
        Usr_oRs.Close
        Usr_oRs.open sql,Conn,1,3
		Usr_oRs("huiyuan_bianhao")= Request("yuangong_code")
        Usr_oRs("huiyuan_pass")= Request("yuangong_pass")
		Usr_oRs("pass_two")= Request("pass_two")
		Usr_oRs("huiyuan_name")= Request("yuangong_name")
        'Usr_oRs("kaitong_sum")= Request("kaitong_sum")
		'response.write request("quanxian").count
		quanxian_str=""
		i=0
		'dim shu(27) as array
		dim shu(60)
	'response.write request("quanxian").count
	'response.end
		for k=1 to request("quanxian").count
			'response.write request("quanxian").item(k)
			shu(request("quanxian").item(k))=1
			
		'
		next
		
	   for k=1 to 60
			if shu(k)=1 then
			   quanxian_str=quanxian_str&"1"
			else
			   quanxian_str=quanxian_str&"0"				
			end if
			
		next
		Usr_oRs("huiyuan_quanxian")=quanxian_str
		
		
        'Usr_oRs("GroupCode")= Request("GroupCode")
        Usr_oRs.Update
        user_add_lqs = True
     Else
        'oError.Append "没有该记录",0
        user_add_lqs = False
     End IF
     Usr_oRs.Close

	response.Write "<script language=javascript>alert('操作成功！');location.href='manage.aspx';</script>"
	response.end

%>
