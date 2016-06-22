<!--#include file="../../conn.aspx"--> 
<!--#include file="../jiance.aspx"--> <HTML>
<HEAD>
<TITLE>会员管理系统</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link rel="stylesheet" href="../../CSS/ZT0.CSS" type="text/css">
<style type="text/css">
<!--
.STYLE14 {
	color: #000000;
	font-weight: bold;
}
.STYLE16 {font-size: 13px}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE17 {font-size: 12px}
.STYLE19 {font-size: 12px; color: #FFFFFF; }
-->
</style>
</HEAD>
<BODY >
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" bgcolor="#CCCCCC"><span class="STYLE14">&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE16">公司当日总业绩及收入汇总报表</span></span> </td>
  </tr>
  <tr>
    <td height="30"><table width="100%" cellpadding="0" cellspacing="1" bgcolor="#999999">
      <TR>
        <TD width="150" height="35" align="right" bgColor="#FFFFFF"><span class="STYLE16"><STRONG>会员注册总数：</STRONG> </span></TD>
        <TD height="35" align="left" bgcolor="#FFFFFF"><span class="STYLE16"><STRONG>&nbsp;
                  <%
	SQL1="select 'bb'=count(*) from tbl_huiyuan where huiyuan_id<>'A00000000' and net_hege=1"
	set rs1=server.CreateObject("adodb.recordset")
	rs1.Open SQL1,conn,1,1
		response.Write 	rs1("bb")
	rs1.close
	set rs1=nothing
	
%>
        </STRONG> 个 </span></TD>
        <TD width="150" height="35" align="right" bgColor="#FFFFFF"><span class="STYLE16"><STRONG>今日注册会员数：</STRONG> </span></TD>
        <TD height="35" align="left" bgcolor="#FFFFFF"><span class="STYLE16"><STRONG>&nbsp;
                  <%
	SQL1="select 'bb'=count(*) from tbl_huiyuan where huiyuan_id<>'A00000000' and datediff(day,huiyuan_add_time,getdate())=0 and net_hege=1"
	set rs1=server.CreateObject("adodb.recordset")
	rs1.Open SQL1,conn,1,1
		response.Write 	rs1("bb")
	rs1.close
	set rs1=nothing
	
%>
        </STRONG> 个 </span></TD>
      </TR>
      <TR>
        <TD height="35" align="right" bgColor="#FFFFFF"><span class="STYLE16"><STRONG>今日收入记录：</STRONG> </span></TD>
        <TD height="35" align="left" bgcolor="#FFFFFF"><span class="STYLE16">&nbsp;
              <%
	SQL1="select 'bb'=sum(xiaofei_money) from tbl_xiaofei where datediff(day,xiaofei_date,getdate())=0 and xiaofei_qr_flag=1"
	set rs1=server.CreateObject("adodb.recordset")
	rs1.Open SQL1,conn,1,1
	if rs1("bb")<>"" then
		response.Write rs1("bb")
	else
		response.Write 	"0"
	end if
	rs1.close
	set rs1=nothing
	
%>
          元 </span></TD>
        <TD height="35" align="right" bgColor="#FFFFFF"><span class="STYLE16"><STRONG>历史收入总计：</STRONG> </span></TD>
        <TD height="35" align="left" bgcolor="#FFFFFF"><span class="STYLE16">&nbsp;
              <%
	SQL1="select 'bb'=sum(xiaofei_money) from tbl_xiaofei where xiaofei_qr_flag=1 "
	
	set rs1=server.CreateObject("adodb.recordset")
	rs1.Open SQL1,conn,1,1
	if rs1("bb")<>"" then
		response.Write rs1("bb")
	else
		response.Write 	"0"
	end if
	rs1.close
	set rs1=nothing
	
%>
          元</span></TD>
      </TR>
	  <%
	SQL1="select 'cc'=sum(xiaofei_money) from tbl_xiaofei where xiaofei_qr_flag=1"
	set rs1=server.CreateObject("adodb.recordset")
	rs1.Open SQL1,conn,1,1
	if isnull(rs1("cc")) then
		cc=0
	else
		cc=rs1("cc")
	end if
	rs1.close
	set rs1=nothing
%>
<%
	SQL1="select 'dd'=sum(cha_013) from tbl_cha"
	set rs1=server.CreateObject("adodb.recordset")
	rs1.Open SQL1,conn,1,1
	if isnull(rs1("dd")) then
		dd=0
	else
		dd=rs1("dd")
	end if
	rs1.close
	set rs1=nothing
	
%>
      <TR>
        <TD height="35" align="right" bgColor="#FFFFFF"><span style="font-weight: bold">发放奖金总和</span></TD>
        <TD height="35" align="left" bgcolor="#FFFFFF"><span class="STYLE16">
          &nbsp;
           <%=dd
	
%>
元 </span></TD>
        <TD height="35" align="right" bgColor="#FFFFFF">&nbsp;</TD>
        <TD height="35" align="left" bgcolor="#FFFFFF">&nbsp;</TD>
      </TR>
      <TR>
        <TD width="150" height="35" align="right" bgColor="#FFFFFF"><span class="STYLE16"><STRONG>总拨比：</STRONG> </span></TD>
        <TD height="35" colSpan="3" align="left" vAlign="middle" bgColor="#FFFFFF">

		<%if dd<>0 and cc<>0 then%>
         <table width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr>
              <td><table width="<%=round(dd/cc*100,2)%>%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                   <td height="18" align="center" bgcolor="#3399FF"><span class="STYLE19"><%=round(dd/cc*100,2)%>%</span></td>
                </tr>
                  </table>			  </td>
           </tr>
         </table>
          <%else%><span class="STYLE17">&nbsp;&nbsp;暂无结算奖金</span><%end if%>		  </TD>
      </TR>
    </table>
    </td>
  </tr>
</table>
</BODY></HTML>
