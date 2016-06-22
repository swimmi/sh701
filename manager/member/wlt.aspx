<!--#include file="../../conn.aspx"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%

		set rs=server.CreateObject("adodb.recordset")
		sqla = "select * from tbl_jiebie  where id=1  "
		rs.Open sqla,conn,1,1	
		jiebie1=rs("jiebie")
		rs.close
		set rs=nothing

		set rs=server.CreateObject("adodb.recordset")
		sqla = "select * from tbl_jiebie  where id=2  "
		rs.Open sqla,conn,1,1	
		jiebie2=rs("jiebie")
		rs.close
		set rs=nothing
		
		set rs=server.CreateObject("adodb.recordset")
		sqla = "select * from tbl_jiebie  where id=3  "
		rs.Open sqla,conn,1,1	
		jiebie3=rs("jiebie")
		rs.close
		set rs=nothing
		
		set rs=server.CreateObject("adodb.recordset")
		sqla = "select * from tbl_jiebie  where id=4  "
		rs.Open sqla,conn,1,1	
		jiebie4=rs("jiebie")
		rs.close
		set rs=nothing
		

function tubiao(temp_y)
	select case  temp_y
		case 1
			response.Write jiebie1
		case 2
			response.Write jiebie2
		case 3
			response.Write jiebie3
		case 4
			response.Write jiebie4
		case 6
			response.Write("<img src=../images/tubiao_6.gif border=0>")
		case 7
			response.Write("<img src=../images/tubiao_7.gif border=0>")
		case 8
		  response.Write("<img src=../images/tubiao_7.gif border=0>")
	end select	 
end function

if request("bianhao")<>"" then
	huiyuan_id=request("bianhao")	
else
	huiyuan_id = "A00000000"
end if
%>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td height="80" colspan="2">接点网络图</td>
    </tr>
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 会员管理 &gt; 接点网络图</td>
    </tr>
  </table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />今日会员列表</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="content">
            <tr>
              <td height="207" align="center">
           
             <br />
              <form name="form1" method="post" action="wlt.aspx">
                请输入会员账号： 
                  <input name="bianhao" type="text" id="bianhao2" size="15" maxlength="20">
                  <input type="submit" name="Submit" value="提交">
                  <a 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="javascript:history.back();"><font color="blue" ><strong> 
                  　</strong></font></a>＊友情提示：输入框中，不输入即为抵达网络图顶端
              </form>
            
<%
'on error resume next
'set HyRs=server.CreateObject("adodb.recordset")
'set HyRs1=server.CreateObject("adodb.recordset")
 	 if request("anli_id")<>"" then
	 	huiyuan_id1=request("anli_id")	
	 else
	  huiyuan_id1 = trim(request.form("bianhao"))
	 end if
	 'response.write huiyuan_id1
	 'response.end 
 Level = len(trim(huiyuan_id1))
 if Level=0 then
 	Level=100
 end if
'response.write Level
'response.end  
if Level=100 then
	huiyuan_id="A00000000"
else
	 
	 huiyuan_id = huiyuan_id1
	
end if

 
set Hy1Rs=server.CreateObject("adodb.recordset")
set Hy21Rs=server.CreateObject("adodb.recordset")
set Hy22Rs=server.CreateObject("adodb.recordset")
set Hy31Rs=server.CreateObject("adodb.recordset")
set Hy32Rs=server.CreateObject("adodb.recordset")
set Hy33Rs=server.CreateObject("adodb.recordset")
set Hy34Rs=server.CreateObject("adodb.recordset")
set Hy41Rs=server.CreateObject("adodb.recordset")
set Hy42Rs=server.CreateObject("adodb.recordset")
set Hy43Rs=server.CreateObject("adodb.recordset")
set Hy44Rs=server.CreateObject("adodb.recordset")
set Hy45Rs=server.CreateObject("adodb.recordset")
set Hy46Rs=server.CreateObject("adodb.recordset")
set Hy47Rs=server.CreateObject("adodb.recordset")
set Hy48Rs=server.CreateObject("adodb.recordset")
sql = "select * from tbl_huiyuan  where huiyuan_bianhao ='" & huiyuan_id & "'  "

'response.Write(sql)
'response.end 
Hy1Rs.Open sql,conn,1,1
'response.Write(Hy1Rs.recordcount)
'response.end 
if Hy1Rs.RecordCount>0 then
i=Level
%>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="../../huiyuan/include/e1.css" type="text/css">
		<script language='javascript' src='../../huiyuan/include/common.js'></script>
	</HEAD>
	<center>
              </center>
<STYLE>.OChartCellPadding {
	PADDING-RIGHT: 5px; PADDING-LEFT: 5px
}
.OChartCellStyle {
	BORDER-RIGHT: blue 1px solid; BORDER-TOP: blue 1px solid; FONT-SIZE: 9px; BORDER-LEFT: blue 1px solid; BORDER-BOTTOM: blue 1px solid; BACKGROUND-COLOR: #ffd586; TEXT-ALIGN: left
}
</STYLE><body>
              <br>
              <TABLE width="100" align="center" cellPadding=0 cellSpacing=0>
                <TBODY>
                  <TR>
                    <TD class=OChartCellPadding vAlign=top align=middle width="100%" 
                colSpan=2><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                        <TABLE id=Table2 cellSpacing=1 cellPadding=0 width=82 
                  bgColor=#517dbf border=0>
                          <TBODY>
                            <TR>
                              <TD><TABLE width=130 
                        border=0 align=center 
                        cellPadding=1 cellSpacing=1 borderColor=#cae2f7 bgColor=#ffffff id=Table1>
                                  <TBODY>
                                    <TR align=middle bgColor="<%if Hy1Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy1Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy1Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy1Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy1Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                      <TD 
                            height=9 colspan="3" align="center" vAlign=middle><SPAN 
                              id=chartXP_OChartXP__ctl8_CustomerNO 
                              style="FONT-WEIGHT: bold; COLOR: white;<%if Hy1Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A  href="wlt.aspx?anli_id=<% =Hy1Rs("huiyuan_bianhao")%>" 
                              target=_self> <font color="000000">
                                          <% =Hy1Rs("huiyuan_bianhao")%>
                                          <br>
                                          <% if Hy1Rs("net_hege")=0 and Hy1Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy1Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy1Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
										
											response.Write(tubiao(Hy1Rs("huiyuan_jiebie")))
											%>
                                          </font> </A>
                                                <%'if Hy1Rs("huiyuan_bianhao")<>"A00000000" then
											set Hy0Rs=server.CreateObject("adodb.recordset")
											'response.write "select * from tbl_huiyuan where huiyuan_id='"&Hy1Rs("huiyuan_id")&"'"
											
											Hy0Rs.open "select * from tbl_huiyuan where leftnumber='"&Hy1Rs("huiyuan_id")&"' or rightnumber='"&Hy1Rs("huiyuan_id")&"'",conn,1,1
											if Hy0Rs.recordcount>0 then%>
                                                <br>
                                                <a href="wlt.aspx?anli_id=<%
											
											response.Write Hy0Rs("huiyuan_bianhao")%>"><font color="#000000">上一会员</font></a>
                                                <%end if
											'end if%>
                                      </SPAN></TD>
                                    </TR>
                                    <TR align=middle bgColor="#C0DBF3">
                                      <TD width="55" align="center" vAlign=center 
><font color="#000000">
                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy1Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                      </font></TD>
                                      <TD width="20" align="center" vAlign=center 
><font color="#000000">总</font></TD>
                                      <TD width="55" align="center" vAlign=center 
                          ><font color="#000000">
                                        <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy1Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                      </font></TD>
                                    </TR>
                                    <TR align=middle bgColor="#C0DBF3">
                                      <TD width="55" align="center" vAlign=center 
><font color="#000000">
                                        <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy1Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%></font></TD>
                                      <TD width="20" align="center" vAlign=center 
><font color="#000000">余</font></TD>
                                      <TD width="55" align="center" vAlign=center 
                          ><font color="#000000">
                                        <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy1Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                      </font></TD>
                                    </TR>
                                    <%%>
                                  </TBODY>
                              </TABLE></TD>
                            </TR>
                          </TBODY>
                        </TABLE>                      </TD>
                  </TR>
                  <TR>
                    <TD align=middle colSpan=2><IMG 
                  style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                  src="../../../img/dsis-usernew-xt-3.gif" border=0></TD>
                  </TR>
                  <TR>
                    <TD align=right height=1><IMG style="WIDTH: 50%; HEIGHT: 1px" 
                  alt="" src="../../../img/dsis-usernew-xt-3.gif" 
                border=0></TD>
                    <TD align=left height=1><IMG style="WIDTH: 50%; HEIGHT: 1px" 
                  alt="" src="../../../img/dsis-usernew-xt-3.gif" 
                border=0></TD>
                  </TR>
                  <TR>
                    <TD align=middle><IMG style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                  src="../../../img/dsis-usernew-xt-3.gif" border=0></TD>
                    <TD align=middle><IMG style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                  src="../../../img/dsis-usernew-xt-3.gif" border=0></TD>
                  </TR>
                  <TR>
                    <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                        <TBODY>
                          <TR>
                            <TD class=OChartCellPadding vAlign=top align=middle 
                      width="100%" colSpan=2><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                              <TABLE id=Table2 cellSpacing=1 cellPadding=0 width=82 
                        bgColor=#517dbf border=0>
                                  <TBODY>
                                    <TR>
                                      <TD><%i=i+1
sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy1Rs("leftnumber")  & "'  "

								Hy21Rs.Open sql,conn,1,1
								if Hy21Rs.recordcount>0 then
									L=true
								end if	%>
                                          <TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                            <TBODY>
                                              <%if L=true then%>
                                              <TR align=middle bgColor="<%if Hy21Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy21Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy21Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy21Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy21Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                <TD 
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy21Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy21Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                    <% =Hy21Rs("huiyuan_bianhao")%>
                                                    <br>
                                                    <%if Hy21Rs("net_hege")=0 and Hy21Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy21Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy21Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
											
											response.Write(tubiao(Hy21Rs("huiyuan_jiebie")))
											%>
                                                </font> </A></SPAN><SPAN 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy21Rs("huiyuan_1_flag")=1 then%> <%end if%>"> </SPAN> </TD>
                                              </TR>
                                              <%else%>
                                              <TR align=middle bgColor=#0099FF>
                                                <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy1Rs("huiyuan_bianhao")%>&Location=0"target="_blank">注册</A></TD>
                                              </TR>
                                              <%end if%>
                                              <%if L=true then%>
                                              <TR align=middle bgColor="#C0DBF3">
                                                <TD width="55" align="center" vAlign=center 
><font color="#000000">
                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy21Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                </font></TD>
                                                <TD width="20" align="center" vAlign=center 
><font color="#000000">总</font></TD>
                                                <TD width="55" align="center" vAlign=center 
                          ><font color="#000000">
                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy21Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                </font></TD>
                                              </TR>
                                              <tr align="middle" bgcolor="#C0DBF3">
                                                <td width="55" align="center" valign="center" 
><font color="#000000">
                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy21Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                </font></td>
                                                <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy21Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                </font></td>
                                              </tr>
                                              <%end if%>
                                            </TBODY>
                                        </TABLE></TD>
                                    </TR>
                                  </TBODY>
                                </TABLE>                              </TD>
                          </TR>
                          <%i=i+1
					if L=true then
					sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy21Rs("leftnumber")  & "'  "
								'response.Write(sql)
								'response.end 
								Hy31Rs.Open sql,conn,1,1
								'response.write Hy31Rs.recordcount
								if Hy31Rs.recordcount>0 then
									LL=true
								end if
								%>
                          <TR>
                            <TD align=middle colSpan=2><IMG 
                        style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                        src="../../../img/dsis-usernew-xt-3.gif" 
                    border=0></TD>
                          </TR>
                          <TR>
                            <TD align=right height=1><IMG 
                        style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                        src="../../../img/dsis-usernew-xt-3.gif" 
border=0></TD>
                            <TD align=left height=1><IMG 
                        style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                        src="../../../img/dsis-usernew-xt-3.gif" 
                    border=0></TD>
                          </TR>
                          <TR>
                            <TD align=middle><IMG style="WIDTH: 1px; HEIGHT: 20px" 
                        alt="" src="../../../img/dsis-usernew-xt-3.gif" 
                        border=0></TD>
                            <TD align=middle><IMG style="WIDTH: 1px; HEIGHT: 20px" 
                        alt="" src="../../../img/dsis-usernew-xt-3.gif" 
                        border=0></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                <TBODY>
                                  <TR>
                                    <TD class=OChartCellPadding vAlign=top align=middle 
                            width="100%" colSpan=2><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                      <TABLE id=Table2 cellSpacing=1 cellPadding=0 
                              width=130 bgColor=#517dbf border=0>
                                          <TBODY>
                                            <TR>
                                              <TD><TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                  <TBODY>
                                                    <%if LL=true then%>
                                                    <TR align=middle bgColor="<%if Hy31Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy31Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy31Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy31Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy31Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                      <TD
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy31Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy31Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                          <% =Hy31Rs("huiyuan_bianhao")%>
                                                          <br>
                                                          <%if Hy31Rs("net_hege")=0 and Hy31Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy31Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy31Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
											
											response.Write(tubiao(Hy31Rs("huiyuan_jiebie")))
											%>
                                                      </font> </A></SPAN><SPAN 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy31Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy31Rs("huiyuan_bianhao")%>" 
                                target=_self> </A> </SPAN> </TD>
                                                    </TR>
                                                    <%else%>
                                                    <TR align=middle bgColor=#0099FF>
                                                      <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy1Rs("huiyuan_bianhao")%>&Location=0" target="_blank">注册</A></TD>
                                                    </TR>
                                                    <%end if%>
                                                    <%if LL=true then%>
                                                    <tr align="middle" bgcolor="#C0DBF3">
                                                      <td width="55" align="center" valign="center" 
><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy31Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                      <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                      <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy31Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                    </tr>
                                                    <tr align="middle" bgcolor="#C0DBF3">
                                                      <td width="55" align="center" valign="center" 
><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy31Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                      <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                      <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy31Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                    </tr>
                                                    
                                                    <%end if%>
                                                  </TBODY>
                                              </TABLE></TD>
                                            </TR>
                                          </TBODY>
                                        </TABLE>                                      </TD>
                                  </TR>
                                  <% i=i+1
							if LL=true then
								sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy31Rs("leftnumber")  & "'  "
								Hy41Rs.Open sql,conn,1,1
								if Hy41Rs.recordcount>0 then
									LLL=true
								end if
	 %>
                                  <TR>
                                    <TD align=middle colSpan=2><IMG 
                              style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                  </TR>
                                  <TR>
                                    <TD align=right height=1><IMG 
                              style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                    <TD align=left height=1><IMG 
                              style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                  </TR>
                                  <TR>
                                    <TD align=middle><IMG 
                              style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                    <TD align=middle><IMG 
                              style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                  </TR>
                                  <TR>
                                    <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                        <TBODY>
                                          <TR>
                                            <TD class=OChartCellPadding vAlign=top 
                                align=middle width="100%" colSpan=0><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                              <TABLE id=Table2 cellSpacing=1 cellPadding=0 
                                width=82 bgColor=#517dbf border=0>
                                                  <TBODY>
                                                    <TR>
                                                      <TD><TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                          <TBODY>
                                                            <%if LLL=true then%>
                                                            <TR align=middle bgColor="<%if Hy41Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy41Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy41Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy41Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy41Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                              <TD
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy41Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy41Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                                  <% =Hy41Rs("huiyuan_bianhao")%>
                                                                  <br>
                                                                  <% if Hy41Rs("net_hege")=0 and Hy41Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy41Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy41Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
											
											response.Write(tubiao(Hy41Rs("huiyuan_jiebie")))
											%>
                                                              </font> </A></SPAN> </TD>
                                                            </TR>
                                                            <%else%>
                                                            <TR align=middle bgColor=#0099FF>
                                                              <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy31Rs("huiyuan_bianhao")%>&Location=0"target="_blank">注册</A></TD>
                                                            </TR>
                                                            <%end if%>
                                                            <%if LLl=true then%>
                                                            <tr align="middle" bgcolor="#C0DBF3">
                                                              <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy41Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                              <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                              <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy41Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                            </tr>
                                                            <tr align="middle" bgcolor="#C0DBF3">
                                                              <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy41Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                              <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                              <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy41Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                            </tr>
                                                            
                                                            <%end if%>
                                                          </TBODY>
                                                      </TABLE></TD>
                                                    </TR>
                                                  </TBODY>
                                                </TABLE>
                                              <p></P></TD>
                                          </TR>
                                        </TBODY>
                                    </TABLE></TD>
                                    <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                        <TBODY>
                                          <TR>
                                            <TD class=OChartCellPadding vAlign=top 
                                align=middle width="100%" colSpan=0><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                              <TABLE id=Table2 cellSpacing=1 cellPadding=0 
                                width=82 bgColor=#517dbf border=0>
                                                  <TBODY>
                                                    <TR>
                                                      <TD><%
								sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy31Rs("rightnumber")  & "'  "
								Hy42Rs.Open sql,conn,1,1
									if Hy42Rs.recordcount>0 then
										LLR=true
									end if
								%>
                                                          <TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                            <TBODY>
                                                              <%if LLR=true then%>
                                                              <TR align=middle bgColor="<%if Hy42Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy42Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy42Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy42Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy42Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                                <TD
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy42Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy42Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                                    <% =Hy42Rs("huiyuan_bianhao")%>
                                                                    <br>
                                                                    <% if Hy42Rs("net_hege")=0 and Hy42Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy42Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy42Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
											
											response.Write(tubiao(Hy42Rs("huiyuan_jiebie")))
											%>
                                                                </font> </A></SPAN><SPAN 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy42Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy42Rs("huiyuan_bianhao")%>" 
                                target=_self> </A> </SPAN> </TD>
                                                              </TR>
                                                              <%else%>
                                                              <TR align=middle bgColor=#0099FF>
                                                                <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy31Rs("huiyuan_bianhao")%>&Location=1"target="_blank">注册</A></TD>
                                                              </TR>
                                                              <%end if%>
                                                              <%if LLr=true then%>
                                                              <tr align="middle" bgcolor="#C0DBF3">
                                                                <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy42Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                                <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                                <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy42Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                              </tr>
                                                              <tr align="middle" bgcolor="#C0DBF3">
                                                                <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy42Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                                <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                                <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy42Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                              </tr>
                                                              
                                                              <%end if%>
                                                            </TBODY>
                                                        </TABLE></TD>
                                                    </TR>
                                                  </TBODY>
                                                </TABLE>
                                              <p></P></TD>
                                          </TR>
                                        </TBODY>
                                    </TABLE></TD>
                                  </TR>
                                  <%end if%>
                                </TBODY>
                            </TABLE></TD>
                            <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                <TBODY>
                                  <TR>
                                    <TD class=OChartCellPadding vAlign=top align=middle 
                            width="100%" colSpan=2><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                      <TABLE id=Table2 cellSpacing=1 cellPadding=0 
                              width=82 bgColor=#517dbf border=0>
                                          <TBODY>
                                            <TR>
                                              <TD><%
								sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy21Rs("rightnumber")  & "'  "
								Hy32Rs.Open sql,conn,1,1
								if Hy32Rs.recordcount>0 then
									LR=true
								end if								
								%>
                                                  <TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                    <TBODY>
                                                      <%if LR=true then%>
                                                      <TR align=middle bgColor="<%if Hy32Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy32Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy32Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy32Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy32Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                        <TD
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy32Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy32Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                            <% =Hy32Rs("huiyuan_bianhao")%>
                                                            <br>
                                                            <%if Hy32Rs("net_hege")=0 and Hy32Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy32Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy32Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
											
											response.Write(tubiao(Hy32Rs("huiyuan_jiebie")))
											%>
                                                        </font> </A></SPAN> </TD>
                                                      </TR>
                                                      <%else%>
                                                      <TR align=middle bgColor=#0099FF>
                                                        <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy21Rs("huiyuan_bianhao")%>&Location=1" target="_blank">注册</A></TD>
                                                      </TR>
                                                      <%end if%>
                                                      <%if Lr=true then%>
                                                      <tr align="middle" bgcolor="#C0DBF3">
                                                        <td width="55" align="center" valign="center" 
><font color="#000000">
                                                            <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy32Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                        </font></td>
                                                        <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                        <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                            <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy32Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                        </font></td>
                                                      </tr>
                                                      <tr align="middle" bgcolor="#C0DBF3">
                                                        <td width="55" align="center" valign="center" 
><font color="#000000">
                                                            <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy32Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                        </font></td>
                                                        <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                        <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                            <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy32Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                        </font></td>
                                                      </tr>
                                                      
                                                      <%end if%>
                                                    </TBODY>
                                                </TABLE></TD>
                                            </TR>
                                          </TBODY>
                                        </TABLE>                                      </TD>
                                  </TR>
                                  <% 				if LR=true then
								sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy32Rs("leftnumber")  & "'  "
								Hy43Rs.Open sql,conn,1,1
								if Hy43Rs.recordcount>0 then
									LRL=true
								end if
								%>
                                  <TR>
                                    <TD align=middle colSpan=2><IMG 
                              src="../../../img/dsis-usernew-xt-3.gif" alt="" 
                              border=0 
                              style="WIDTH: 1px; HEIGHT: 20px"></TD>
                                  </TR>
                                  <TR>
                                    <TD align=right height=1><IMG 
                              style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                    <TD align=left height=1><IMG 
                              style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                  </TR>
                                  <TR>
                                    <TD align=middle><IMG 
                              style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                    <TD align=middle><IMG 
                              style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                  </TR>
                                  <TR>
                                    <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                        <TBODY>
                                          <TR>
                                            <TD class=OChartCellPadding vAlign=top 
                                align=middle width="100%" colSpan=0><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                              <TABLE id=Table2 cellSpacing=1 cellPadding=0 
                                width=82 bgColor=#517dbf border=0>
                                                  <TBODY>
                                                    <TR>
                                                      <TD><TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                          <TBODY>
                                                            <%if LRL=true then%>
                                                            <TR align=middle bgColor="<%if Hy43Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy43Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy43Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy43Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy43Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                              <TD
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy43Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy43Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                                  <% =Hy43Rs("huiyuan_bianhao")%>
                                                                  <br>
                                                                  <%if Hy43Rs("net_hege")=0 and Hy43Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy43Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy43Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
											
											response.Write(tubiao(Hy43Rs("huiyuan_jiebie")))
											%>
                                                              </font> </A></SPAN><SPAN 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy43Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy43Rs("huiyuan_bianhao")%>" 
                                target=_self> </A> </SPAN> </TD>
                                                            </TR>
                                                            <%else%>
                                                            <TR align=middle bgColor=#0099FF>
                                                              <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy32Rs("huiyuan_bianhao")%>&Location=0"target="_blank">注册</A></TD>
                                                            </TR>
                                                            <%end if%>
                                                            <%if Lrl=true then%>
                                                            <tr align="middle" bgcolor="#C0DBF3">
                                                              <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy43Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                              <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                              <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy43Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                            </tr>
                                                            <tr align="middle" bgcolor="#C0DBF3">
                                                              <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy43Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                              <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                              <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy43Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                            </tr>
                                                            
                                                            <%end if%>
                                                          </TBODY>
                                                      </TABLE></TD>
                                                    </TR>
                                                  </TBODY>
                                                </TABLE>
                                              <p></P></TD>
                                          </TR>
                                        </TBODY>
                                    </TABLE></TD>
                                    <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                        <TBODY>
                                          <TR>
                                            <TD class=OChartCellPadding vAlign=top 
                                align=middle width="100%" colSpan=0><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                              <TABLE id=Table2 cellSpacing=1 cellPadding=0 
                                width=82 bgColor=#517dbf border=0>
                                                  <TBODY>
                                                    <TR>
                                                      <TD><%
								sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy32Rs("rightnumber")  & "'  "
								Hy44Rs.Open sql,conn,1,1
								if Hy44Rs.recordcount>0 then
									LRR=true
								end if
								%>
                                                          <TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                            <TBODY>
                                                              <%if LRR=true then%>
                                                              <TR align=middle bgColor="<%if Hy44Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy44Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy44Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy44Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy44Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                                <TD
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy44Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy44Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                                    <% =Hy44Rs("huiyuan_bianhao")%>
                                                                    <br>
                                                                    <% if Hy44Rs("net_hege")=0 and Hy44Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy44Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy44Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
											
											response.Write(tubiao(Hy44Rs("huiyuan_jiebie")))
											%>
                                                                </font> </A></SPAN> </TD>
                                                              </TR>
                                                              <%else%>
                                                              <TR align=middle bgColor=#0099FF>
                                                                <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy32Rs("huiyuan_bianhao")%>&Location=1"target="_blank">注册</A></TD>
                                                              </TR>
                                                              <%end if%>
                                                              <%if Lrr=true then%>
                                                              <tr align="middle" bgcolor="#C0DBF3">
                                                                <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy44Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                                <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                                <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy44Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                              </tr>
                                                              <tr align="middle" bgcolor="#C0DBF3">
                                                                <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy44Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                                <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                                <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy44Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                              </tr>
                                                              
                                                              <%end if%>
                                                            </TBODY>
                                                        </TABLE></TD>
                                                    </TR>
                                                  </TBODY>
                                                </TABLE>
                                              <p></P></TD>
                                          </TR>
                                        </TBODY>
                                    </TABLE></TD>
                                  </TR>
                                  <%end if%>
                                </TBODY>
                            </TABLE></TD>
                          </TR>
                          <%end if%>
                        </TBODY>
                    </TABLE></TD>
                    <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                        <TBODY>
                          <TR>
                            <TD class=OChartCellPadding vAlign=top align=middle 
                      width="100%" colSpan=2><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                              <TABLE id=Table2 cellSpacing=1 cellPadding=0 width=82 
                        bgColor=#517dbf border=0>
                                  <TBODY>
                                    <TR>
                                      <TD><% 								sql = "select* from tbl_huiyuan where huiyuan_id ='" & Hy1Rs("rightnumber")  & "'  "
								Hy22Rs.Open sql,conn,1,1
								if Hy22Rs.recordcount>0 then
									R1=true
								end if								
								%>
                                          <TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                            <TBODY>
                                              <%if R1=true then%>
                                              <TR align=middle bgColor="<%if Hy22Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy22Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy22Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy22Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy22Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                <TD 
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy22Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy22Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                    <% =Hy22Rs("huiyuan_bianhao")%>
                                                    <br>
                                                    <%if Hy22Rs("net_hege")=0 and Hy22Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy22Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy22Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
											
											response.Write(tubiao(Hy22Rs("huiyuan_jiebie")))
											%>
                                                </font> </A></SPAN><SPAN 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy22Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy22Rs("huiyuan_bianhao")%>" 
                                target=_self> </A> </SPAN> </TD>
                                              </TR>
                                              <%else%>
                                              <TR align=middle bgColor=#0099FF>
                                                <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy1Rs("huiyuan_bianhao")%>&Location=1" target="_blank">注册</A></TD>
                                              </TR>
                                              <%end if%>
                                              <%if R1=true then%>
                                              <tr align="middle">
                                                <td width="55" align="center" valign="center" bgcolor="#C0DBF3"><font color="#000000">
                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy22Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                </font></td>
                                                <td width="20" align="center" valign="center" bgcolor="#C0DBF3" 
><font color="#000000">总</font></td>
                                                <td width="55" align="center" valign="center" bgcolor="#C0DBF3" 
                          ><font color="#000000">
                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy22Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                </font></td>
                                              </tr>
                                              <tr align="middle" bgcolor="#C0DBF3">
                                                <td width="55" align="center" valign="center" 
><font color="#000000">
                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy22Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                </font></td>
                                                <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy22Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                </font></td>
                                              </tr>
                                              
                                              <%end if%>
                                            </TBODY>
                                        </TABLE></TD>
                                    </TR>
                                  </TBODY>
                                </TABLE>                              </TD>
                          </TR>
                          <% 
							if R1=true then
								sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy22Rs("leftnumber")  & "'  "
								Hy33Rs.Open sql,conn,1,1	
								if Hy33Rs.recordcount>0 then
									RL=true
								end if							
								%>
                          <TR>
                            <TD align=middle colSpan=2><IMG 
                        style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                        src="../../../img/dsis-usernew-xt-3.gif" 
                    border=0></TD>
                          </TR>
                          <TR>
                            <TD align=right height=1><IMG 
                        style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                        src="../../../img/dsis-usernew-xt-3.gif" 
border=0></TD>
                            <TD align=left height=1><IMG 
                        style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                        src="../../../img/dsis-usernew-xt-3.gif" 
                    border=0></TD>
                          </TR>
                          <TR>
                            <TD align=middle><IMG style="WIDTH: 1px; HEIGHT: 20px" 
                        alt="" src="../../../img/dsis-usernew-xt-3.gif" 
                        border=0></TD>
                            <TD align=middle><IMG style="WIDTH: 1px; HEIGHT: 20px" 
                        alt="" src="../../../img/dsis-usernew-xt-3.gif" 
                        border=0></TD>
                          </TR>
                          <TR>
                            <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                <TBODY>
                                  <TR>
                                    <TD class=OChartCellPadding vAlign=top align=middle 
                            width="100%" colSpan=2><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                      <TABLE id=Table2 cellSpacing=1 cellPadding=0 
                              width=82 bgColor=#517dbf border=0>
                                          <TBODY>
                                            <TR>
                                              <TD><TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                  <TBODY>
                                                    <%if RL=true then%>
                                                    <TR align=middle bgColor="<%if Hy33Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy33Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy33Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy33Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy33Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                      <TD
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy33Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy33Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                          <% =Hy33Rs("huiyuan_bianhao")%>
                                                          <br>
                                                          <% if Hy33Rs("net_hege")=0 and Hy33Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy33Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy33Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
										
											response.Write(tubiao(Hy33Rs("huiyuan_jiebie")))
											%>
                                                      </font> </A></SPAN><SPAN 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy33Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy33Rs("huiyuan_bianhao")%>" 
                                target=_self> </A> </SPAN> </TD>
                                                    </TR>
                                                    <%else%>
                                                    <TR align=middle bgColor=#0099FF>
                                                      <TD colspan="3" align="center" vAlign=center ><SPAN 
                                id=chartXP_OChartXP__ctl142_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white; BACKGROUND-COLOR: #0099FF"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy22Rs("huiyuan_bianhao")%>&Location=0"></A> </SPAN> <A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy22Rs("huiyuan_bianhao")%>&Location=0"target="_blank">注册</A></TD>
                                                    </TR>
                                                    <%end if%>
                                                    <%if rL=true then%>
                                                    <tr align="middle" bgcolor="#C0DBF3">
                                                      <td width="55" align="center" valign="center" 
><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy33Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                      <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                      <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy33Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                    </tr>
                                                    <tr align="middle" bgcolor="#C0DBF3">
                                                      <td width="55" align="center" valign="center" 
><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy33Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                      <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                      <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy33Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                    </tr>
                                                    
                                                    <%end if%>
                                                  </TBODY>
                                              </TABLE></TD>
                                            </TR>
                                          </TBODY>
                                        </TABLE>                                      </TD>
                                  </TR>
                                  <% 				if RL=true then
								sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy33Rs("leftnumber")  & "'  "
								Hy45Rs.Open sql,conn,1,1
								if Hy45Rs.recordcount>0 then
									RLL=true
								end if
								%>
                                  <TR>
                                    <TD align=middle colSpan=2><IMG 
                              style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                  </TR>
                                  <TR>
                                    <TD align=right height=1><IMG 
                              style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                    <TD align=left height=1><IMG 
                              style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                  </TR>
                                  <TR>
                                    <TD align=middle><IMG 
                              style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                    <TD align=middle><IMG 
                              style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                  </TR>
                                  <TR>
                                    <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                        <TBODY>
                                          <TR>
                                            <TD class=OChartCellPadding vAlign=top 
                                align=middle width="100%" colSpan=0><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                              <TABLE id=Table2 cellSpacing=1 cellPadding=0 
                                width=82 bgColor=#517dbf border=0>
                                                  <TBODY>
                                                    <TR>
                                                      <TD><TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                          <TBODY>
                                                            <%if RLL=true then%>
                                                            <TR align=middle bgColor="<%if Hy45Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy45Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy45Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy45Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy45Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                              <TD 
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy45Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy45Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                                  <% =Hy45Rs("huiyuan_bianhao")%>
                                                                  <br>
                                                                  <%if Hy45Rs("net_hege")=0 and Hy45Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy45Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if 
											if Hy45Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
											
											response.Write(tubiao(Hy45Rs("huiyuan_jiebie")))
											%>
                                                              </font> </A></SPAN> </TD>
                                                            </TR>
                                                            <%else%>
                                                            <TR align=middle bgColor=#0099FF>
                                                              <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy33Rs("huiyuan_bianhao")%>&Location=0"target="_blank">注册</A></TD>
                                                            </TR>
                                                            <%end if%>
                                                            <%if rLL=true then%>
                                                            <tr align="middle" bgcolor="#C0DBF3">
                                                              <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy45Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                              <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                              <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy45Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                            </tr>
                                                            <tr align="middle" bgcolor="#C0DBF3">
                                                              <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy45Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                              <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                              <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy45Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                            </tr>
                                                            
                                                            <%end if%>
                                                          </TBODY>
                                                      </TABLE></TD>
                                                    </TR>
                                                  </TBODY>
                                                </TABLE>
                                              <p></P></TD>
                                          </TR>
                                        </TBODY>
                                    </TABLE></TD>
                                    <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                        <TBODY>
                                          <TR>
                                            <TD class=OChartCellPadding vAlign=top 
                                align=middle width="100%" colSpan=0><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                              <TABLE id=Table2 cellSpacing=1 cellPadding=0 
                                width=82 bgColor=#517dbf border=0>
                                                  <TBODY>
                                                    <TR>
                                                      <TD><%
								sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy33Rs("rightnumber")  & "'  "
								Hy46Rs.Open sql,conn,1,1
								if Hy46Rs.recordcount>0 then
									RLR=true
								end if
								%>
                                                          <TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                            <TBODY>
                                                              <%if RLR=true then%>
                                                              <TR align=middle bgColor="<%if Hy46Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy46Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy46Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy46Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy46Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                                <TD 
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy46Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy46Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                                    <% =Hy46Rs("huiyuan_bianhao")%>
                                                                    <br>
                                                                    <%if Hy46Rs("net_hege")=0 and Hy46Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy46Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy46Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
											
											response.Write(tubiao(Hy46Rs("huiyuan_jiebie")))
											%>
                                                                </font> </A></SPAN><SPAN 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy46Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy46Rs("huiyuan_bianhao")%>" 
                                target=_self> </A> </SPAN> </TD>
                                                              </TR>
                                                              <%else%>
                                                              <TR align=middle bgColor=#0099FF>
                                                                <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy33Rs("huiyuan_bianhao")%>&Location=1"target="_blank">注册</A></TD>
                                                              </TR>
                                                              <%end if%>
                                                              <%if rlr=true then%>
                                                              <tr align="middle" bgcolor="#C0DBF3">
                                                                <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy46Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                                <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                                <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy46Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                              </tr>
                                                              <tr align="middle" bgcolor="#C0DBF3">
                                                                <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy46Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                                <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                                <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                    <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy46Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                                </font></td>
                                                              </tr>
                                                              
                                                              <%end if%>
                                                            </TBODY>
                                                        </TABLE></TD>
                                                    </TR>
                                                  </TBODY>
                                                </TABLE>
                                              <p></P></TD>
                                          </TR>
                                        </TBODY>
                                    </TABLE></TD>
                                  </TR>
                                  <%end if%>
                                </TBODY>
                            </TABLE></TD>
                            <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                <TBODY>
                                  <TR>
                                    <TD class=OChartCellPadding vAlign=top align=middle 
                            width="100%" colSpan=2><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                      <%						
								sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy22Rs("rightnumber")  & "'  "
								Hy34Rs.Open sql,conn,1,1
								if Hy34Rs.recordcount>0 then
									RR=true
								end if
								%><TABLE id=Table2 cellSpacing=1 cellPadding=0 
                              width=82 bgColor=#517dbf border=0>
                                          <TBODY>
                                            <TR>
                                              <TD><TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                  <TBODY>
                                                    <%if RR=true then%>
                                                    <TR align=middle bgColor="<%if Hy34Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy34Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy34Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy34Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy34Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                      <TD 
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy34Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy34Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                          <% =Hy34Rs("huiyuan_bianhao")%>
                                                          <br>
                                                          <% if Hy34Rs("net_hege")=0 and Hy34Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy34Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy34Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
									
											response.Write(tubiao(Hy34Rs("huiyuan_jiebie")))
											%>
                                                      </font> </A></SPAN><SPAN 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy34Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy34Rs("huiyuan_bianhao")%>" 
                                target=_self> </A> </SPAN> </TD>
                                                    </TR>
                                                    <%else%>
                                                    <TR align=middle bgColor=#0099FF>
                                                      <TD colspan="3" align="center" vAlign=center ><SPAN 
                                id=chartXP_OChartXP__ctl142_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white; BACKGROUND-COLOR: #0099FF"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy22Rs("huiyuan_bianhao")%>&Location=1"></A> </SPAN> <A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy22Rs("huiyuan_bianhao")%>&Location=1"target="_blank">注册</A></TD>
                                                    </TR>
                                                    <%end if%>
                                                    <%if rr=true then%>
                                                    <tr align="middle" bgcolor="#C0DBF3">
                                                      <td width="55" align="center" valign="center" 
><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy34Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                      <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                      <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy34Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                    </tr>
                                                    <tr align="middle" bgcolor="#C0DBF3">
                                                      <td width="55" align="center" valign="center" 
><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy34Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                      <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                      <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                          <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy34Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                      </font></td>
                                                    </tr>
                                                    
                                                    <%end if%>
                                                  </TBODY>
                                              </TABLE></TD>
                                            </TR>
                                          </TBODY>
                                        </TABLE>                                      </TD>
                                  </TR>
                                  <% 				if RR=true then
								sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy34Rs("leftnumber")  & "'  "
								Hy47Rs.Open sql,conn,1,1
								if Hy47Rs.recordcount>0 then
									RRL=true
								end if
								%>
                                  <TR>
                                    <TD align=middle colSpan=2><IMG 
                              style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                  </TR>
                                  <TR>
                                    <TD align=right height=1><IMG 
                              style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                    <TD align=left height=1><IMG 
                              style="WIDTH: 50%; HEIGHT: 1px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                  </TR>
                                  <TR>
                                    <TD align=middle><IMG 
                              style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                    <TD align=middle><IMG 
                              style="WIDTH: 1px; HEIGHT: 20px" alt="" 
                              src="../../../img/dsis-usernew-xt-3.gif" 
                              border=0></TD>
                                  </TR>
                                  <TR>
                                    <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                        <TBODY>
                                          <TR>
                                            <TD class=OChartCellPadding vAlign=top 
                                align=middle width="100%" colSpan=0><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                              <TABLE id=Table2 cellSpacing=1 cellPadding=0 
                                width=82 bgColor=#517dbf border=0>
                                                  <TBODY>
                                                    <TR>
                                                      <TD><TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                          <TBODY>
                                                            <%if RRL=true then%>
                                                            <TR align=middle bgColor="<%if Hy47Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy47Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy47Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy47Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy47Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                              <TD
                                height=9  colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy47Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy47Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                                  <% =Hy47Rs("huiyuan_bianhao")%>
                                                                  <br>
                                                                  <%if Hy47Rs("net_hege")=0 and Hy47Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy47Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy47Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
											
											response.Write(tubiao(Hy47Rs("huiyuan_jiebie")))
											%>
                                                              </font> </A></SPAN> </TD>
                                                            </TR>
                                                            <%else%>
                                                            <TR align=middle bgColor=#0099FF>
                                                              <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy34Rs("huiyuan_bianhao")%>&Location=0"target="_blank">注册</A></TD>
                                                            </TR>
                                                            <%end if%>
                                                            <%if RRL=true then%>
                                                            <tr align="middle" bgcolor="#C0DBF3">
                                                              <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy47Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                              <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                              <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy47Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                            </tr>
                                                            <tr align="middle" bgcolor="#C0DBF3">
                                                              <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy47Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                              <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                              <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy47Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                            </tr>
                                                            
                                                            <%end if%>
                                                          </TBODY>
                                                      </TABLE></TD>
                                                    </TR>
                                                  </TBODY>
                                                </TABLE>
                                              <p></P></TD>
                                          </TR>
                                        </TBODY>
                                    </TABLE></TD>
                                    <TD vAlign=top><TABLE cellSpacing=0 cellPadding=0>
                                        <TBODY>
                                          <TR>
                                            <TD class=OChartCellPadding vAlign=top 
                                align=middle width="100%" colSpan=0><STYLE type=text/css>
              A:link {
	COLOR: white
}
A:visited {
	COLOR: white
}
A:hover {
	COLOR: white
}
              </STYLE>
                                              <%
								sql = "select * from tbl_huiyuan where huiyuan_id ='" & Hy34Rs("rightnumber")  & "'  "
								Hy48Rs.Open sql,conn,1,1
								if Hy48Rs.recordcount>0 then
									RRR=true
								end if
								%>
                                                <TABLE id=Table2 cellSpacing=1 cellPadding=0 
                                width=82 bgColor=#517dbf border=0>
                                                  <TBODY>
                                                    <TR>
                                                      <TD><TABLE id=Table1 borderColor=#cae2f7 cellSpacing=1 
                              cellPadding=1 width=130 align=center 
                              bgColor=#ffffff border=0>
                                                          <TBODY>
                                                            <%if RRR=true then%>
                                                            <TR align=middle bgColor="<%if Hy48Rs("huiyuan_jiebie")=1 then%>00FF00<%end if%><%if Hy48Rs("huiyuan_jiebie")=2 then%>FF7F00<%end if%><%if Hy48Rs("huiyuan_jiebie")=3 then%>FFFF00<%end if%><%if Hy48Rs("huiyuan_jiebie")=4 then%>0099ff<%end if%><%if Hy48Rs("huiyuan_jiebie")=5 then%>00FFFF<%end if%>">
                                                              <TD 
                                height=9 colspan="3" align="center" vAlign=middle> <SPAN 
                                id=chartXP_OChartXP__ctl27_CustomerNO 
                                style="FONT-WEIGHT: bold; COLOR: white;<%if Hy48Rs("huiyuan_1_flag")=1 then%> <%end if%>"><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="wlt.aspx?anli_id=<% =Hy48Rs("huiyuan_bianhao")%>" 
                                target=_self> <font color="000000">
                                                                  <% =Hy48Rs("huiyuan_bianhao")%>
                                                                  <br>
                                                                  <% if Hy48Rs("net_hege")=0 and Hy48Rs("net_flag")=0 then 
																response.write tubiao(6)
															  end if
											if Hy48Rs("huiyuan_1_flag")=1 then
											response.write tubiao(7)
											end if
											if Hy48Rs("net_flag")=1 then
											response.write tubiao(8)
											end if
										
											response.Write(tubiao(Hy48Rs("huiyuan_jiebie")))
											%>
                                                              </font> </A></SPAN> </TD>
                                                            </TR>
                                                            <%else%>
                                                            <TR align=middle bgColor=#0099FF>
                                                              <TD colspan="3" align="center" vAlign=center ><A 
                              onMouseOver="MM_displayStatusMsg('欢迎光临');return document.MM_returnValue" href="../../shop/Reg.aspx?ParentID=<% =Hy34Rs("huiyuan_bianhao")%>&Location=1"target="_blank">注册</A></TD>
                                                            </TR>
                                                            <%end if%>
                                                            <%if RRR=true then%>
                                                            <tr align="middle" bgcolor="#C0DBF3">
                                                              <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy48Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                              <td width="20" align="center" valign="center" 
><font color="#000000">总</font></td>
                                                              <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy48Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong") 
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                            </tr>
                                                            <tr align="middle" bgcolor="#C0DBF3">
                                                              <td width="55" align="center" valign="center" 
><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy48Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("zuo_zong")- rs1("huiyuan_pen_zuo")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                              <td width="20" align="center" valign="center" 
><font color="#000000">余</font></td>
                                                              <td width="55" align="center" valign="center" 
                          ><font color="#000000">
                                                                  <%set rs1=server.CreateObject("adodb.recordset")
											rs1.open "select * from tbl_huiyuan where huiyuan_id='"&Hy48Rs("huiyuan_id")&"'",conn,1,1
											if rs1.recordcount=0 then 
												response.write "0"  
											else
												response.write rs1("you_zong")- rs1("huiyuan_pen_you")
											end if 
											rs1.close
											set rs1=nothing
											%>
                                                              </font></td>
                                                            </tr>
                                                            
                                                            <%end if%>
                                                          </TBODY>
                                                      </TABLE></TD>
                                                    </TR>
                                                  </TBODY>
                                                </TABLE>
                                              <p></P></TD>
                                          </TR>
                                        </TBODY>
                                    </TABLE></TD>
                                  </TR>
                                  <%end if%>
                                </TBODY>
                            </TABLE></TD>
                          </TR>
                          <%end if%>
                        </TBODY>
                    </TABLE></TD>
                  </TR>
                </TBODY>
              </TABLE>
              <br>
              ◆点击节点上方的 账号 可以看到该账号会员的四层以内下属.<br>
              <%else %>
              错误的会员账号！ 
              <%end if%>
            &nbsp;</td>
              </tr>
        </table></td>
      </tr>
    </table>
  
</BODY></HTML>
