<!--#include file="../../conn.aspx"-->  
<!--#include file="../jiance.aspx"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>
<%	
if Request("submit")="确认修改" then

	set rs_addnew=server.createobject("adodb.recordset")
    rs_addnew.open "select * from tbl_canshu",conn,1,3  
	rs_addnew("canshu_gonggao")=trim(Request("canshu_gonggao"))
	rs_addnew("tikuan_sx")=trim(Request("tikuan_sx"))
	rs_addnew("tikuan_di")=trim(Request("tikuan_di"))
	rs_addnew("canshu_001")=trim(Request("canshu_001"))
	rs_addnew("canshu_002")=trim(Request("canshu_002"))
	rs_addnew("canshu_003")=trim(Request("canshu_003"))
	rs_addnew("canshu_004")=trim(Request("canshu_004"))
	rs_addnew("canshu_005")=trim(Request("canshu_005"))
	rs_addnew("canshu_006")=trim(Request("canshu_006"))
	rs_addnew("canshu_007")=trim(Request("canshu_007"))
	rs_addnew("canshu_008")=trim(Request("canshu_008"))
	rs_addnew("canshu_009")=trim(Request("canshu_009"))
	rs_addnew("canshu_010")=trim(Request("canshu_010"))
	rs_addnew("canshu_011")=trim(Request("canshu_011"))
	rs_addnew("canshu_012")=trim(Request("canshu_012"))
	rs_addnew("canshu_016")=trim(Request("canshu_016"))
	rs_addnew("canshu_017")=trim(Request("canshu_017"))
	rs_addnew("canshu_018")=trim(Request("canshu_018"))
	rs_addnew("canshu_019")=trim(Request("canshu_019"))
	rs_addnew("canshu_020")=trim(Request("canshu_020"))
	rs_addnew("canshu_021")=trim(Request("canshu_021"))
	rs_addnew("canshu_022")=trim(Request("canshu_022"))
	rs_addnew("canshu_023")=trim(Request("canshu_023"))
	rs_addnew("canshu_024")=trim(Request("canshu_024"))
	rs_addnew("canshu_025")=trim(Request("canshu_025"))
	rs_addnew("canshu_026")=trim(Request("canshu_026"))
	rs_addnew("canshu_027")=trim(Request("canshu_027"))
	rs_addnew("canshu_028")=trim(Request("canshu_028"))
	rs_addnew("canshu_029")=trim(Request("canshu_029"))
	rs_addnew("canshu_030")=trim(Request("canshu_030"))
	rs_addnew("canshu_031")=trim(Request("canshu_031"))
	rs_addnew("canshu_032")=trim(Request("canshu_032"))
	rs_addnew("canshu_033")=trim(Request("canshu_033"))
	rs_addnew("canshu_034")=trim(Request("canshu_034"))
	rs_addnew("canshu_035")=trim(Request("canshu_035"))
	rs_addnew("canshu_036")=trim(Request("canshu_036"))
	rs_addnew("canshu_037")=trim(Request("canshu_037"))
	rs_addnew("canshu_040")=trim(Request("canshu_040"))
	rs_addnew("canshu_041")=trim(Request("canshu_041"))
	rs_addnew("canshu_042")=trim(Request("canshu_042"))
	rs_addnew("canshu_043")=trim(Request("canshu_043"))
	rs_addnew("canshu_044")=trim(Request("canshu_044"))
    rs_addnew("a")=trim(Request("a"))
    rs_addnew("b")=trim(Request("b"))
	rs_addnew.update
	response.Write "<script language=javascript>alert('操作成功！');location.href='canshu.aspx';</script>"
	response.end

end if


set rs=server.createobject("adodb.recordset")
sql="select * from tbl_jiebie where id=1"
rs.open sql,conn,1,1 
jb1=rs("jiebie")
rs.close
set rs=nothing

set rs=server.createobject("adodb.recordset")
sql="select * from tbl_jiebie where id=2"
rs.open sql,conn,1,1 
jb2=rs("jiebie")
rs.close
set rs=nothing

set rs=server.createobject("adodb.recordset")
sql="select * from tbl_jiebie where id=3"
rs.open sql,conn,1,1 
jb3=rs("jiebie")
rs.close
set rs=nothing

set rs=server.createobject("adodb.recordset")
sql="select * from tbl_jiebie where id=4"
rs.open sql,conn,1,1 
jb4=rs("jiebie")
rs.close
set rs=nothing


set rs=server.createobject("adodb.recordset")
sql2="select * from tbl_canshu where id=1"
rs.open sql2,conn,1,1 
if rs.RecordCount=0 then
Response.Write "非法操作！"
Response.end
end if

%>

<body>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
  <tr>
    <td height="80" colspan="2">系统参数设置</td>
  </tr>
  <tr>
    <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
    <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">首页 &gt; 系统设置 &gt; 系统参数设置</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
  <tr class="biao">
    <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />系统参数设置</td>
  </tr>
  <tr>
    <td  bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">
	

  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#D3D3D3" class="content">
    <tr bgcolor="#F7F7F7" >
      <td width="100%" height="30" align="center" bgcolor="#FFFFFF"><table width="98%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#D3D3D3">
	    <form id="form1" name="form1" method="post" action="?">

          <tr bgcolor="#F7F7F7" style="display:none">
            <td height="30" colspan="4" align="left" bgcolor="#FFFFFF"><strong>&nbsp;&nbsp;&nbsp;&nbsp;滚动公告：
              <input name="canshu_gonggao" type="text" id="canshu_gonggao" value="<%=rs("canshu_gonggao")%>" size="50" />
            </strong></td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td height="30" colspan="4" align="left" bgcolor="#CCCCCC">&nbsp;&nbsp;&nbsp;&nbsp;<strong>其他参数设置</strong></td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td width="200" height="40" align="right" bgcolor="#FFFFFF">拓展奖：</td>
            <td height="40" colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10px;">
										<%=jb1%>：<input name="canshu_040" type="text" id="canshu_040" value="<%=rs("canshu_040")%>" size="10" /> 
										<%=jb2%>：<input name="canshu_001" type="text" id="canshu_001" value="<%=rs("canshu_001")%>" size="10" /> 
										<%=jb3%>：<input name="canshu_002" type="text" id="canshu_002" value="<%=rs("canshu_002")%>" size="10" /> 
										<%=jb4%>：<input name="canshu_003" type="text" id="canshu_003" value="<%=rs("canshu_003")%>" size="10" />			</td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td width="200" height="40" align="right" bgcolor="#F8f8f8">管理奖：</td>
            <td height="40" colspan="3" align="left" bgcolor="#F8f8f8" style="padding:5px 5px 5px 5px;"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D3D3D3">
              <tr>
                <td width="100" height="30" align="right" bgcolor="#F8F8F8">2-5层：</td>
                <td height="30" bgcolor="#F8F8F8"><span style="padding-left:10px;"><%=jb1%>：
                    <input name="canshu_004" type="text" id="canshu_004" value="<%=rs("canshu_004")%>" size="10" />
                    <%=jb2%>：
                    <input name="canshu_005" type="text" id="canshu_005" value="<%=rs("canshu_005")%>" size="10" />
                    <%=jb3%>：
                    <input name="canshu_006" type="text" id="canshu_006" value="<%=rs("canshu_006")%>" size="10" />
                    <%=jb4%>：
                    <input name="canshu_041" type="text" id="canshu_041" value="<%=rs("canshu_041")%>" size="10" />
                </span></td>
                </tr>
              <tr>
                <td width="100" height="30" align="right" bgcolor="#F8F8F8">6-15层：</td>
                <td height="30" bgcolor="#F8F8F8"><span style="padding-left:10px;"><%=jb1%>：
                    <input name="canshu_007" type="text" id="canshu_007" value="<%=rs("canshu_007")%>" size="10" />
                    <%=jb2%>：
                    <input name="canshu_008" type="text" id="canshu_008" value="<%=rs("canshu_008")%>" size="10" />
                    <%=jb3%>：
                    <input name="canshu_009" type="text" id="canshu_009" value="<%=rs("canshu_009")%>" size="10" />
                    <%=jb4%>：
                    <input name="canshu_042" type="text" id="canshu_042" value="<%=rs("canshu_042")%>" size="10" />
                </span></td>
                </tr>
              <tr>
                <td height="30" colspan="2" align="left" bgcolor="#F8F8F8" style="padding-left:50px;">推荐 <input name="canshu_010" type="text" id="canshu_010" value="<%=rs("canshu_010")%>" size="10" /> 人享2－5层</td>
                </tr>
              <tr>
                <td height="30" colspan="2" align="left" bgcolor="#F8F8F8" style="padding-left:50px;">推荐 <input name="canshu_011" type="text" id="canshu_011" value="<%=rs("canshu_011")%>" size="10" /> 人享2－10层</td>
                </tr>
              <tr>
                <td height="30" colspan="2" align="left" bgcolor="#F8F8F8" style="padding-left:50px;">推荐 <input name="canshu_012" type="text" id="canshu_012" value="<%=rs("canshu_012")%>" size="10" /> 人以上享2－15层</td>
                </tr>
            </table></td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td height="40" align="right" bgcolor="#FFFFFF">组织奖：</td>
            <td height="40" colspan="3" align="left" bgcolor="#FFFFFF" style="padding-left:10px;">
				参数：<input name="canshu_016" type="text" id="canshu_016" value="<%=rs("canshu_016")%>" size="10" /><br />
              <%=jb1%>封顶：
                <input name="canshu_017" type="text" id="canshu_017" value="<%=rs("canshu_017")%>" size="10" />
                <%=jb2%>封顶：
              <input name="canshu_018" type="text" id="canshu_018" value="<%=rs("canshu_018")%>" size="10" />
                <%=jb3%>封顶：
              <input name="canshu_019" type="text" id="canshu_019" value="<%=rs("canshu_019")%>" size="10" />           
                <%=jb4%>封顶：
              <input name="canshu_043" type="text" id="canshu_043" value="<%=rs("canshu_043")%>" size="10" />            </td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td height="40" align="right" bgcolor="#F8F8F8">领导奖：</td>
            <td height="40" colspan="3" align="left" bgcolor="#F8F8F8" style="padding:5px 5px 5px 5px;"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D3D3D3">
              <tr>
                <td width="100" height="30" align="right" bgcolor="#F8F8F8">上一代：</td>
                <td height="30" bgcolor="#F8F8F8"><input name="canshu_020" type="text" id="canshu_020" value="<%=rs("canshu_020")%>" size="10" /></td>
              </tr>
              <tr>
                <td height="30" align="right" bgcolor="#F8F8F8">无推荐：</td>
                <td height="30" bgcolor="#F8F8F8"><span style="padding-left:10px;">
                  下
                  <input name="canshu_021" type="text" id="canshu_021" value="<%=rs("canshu_021")%>" size="10" />
                  代
                  <input name="canshu_022" type="text" id="canshu_022" value="<%=rs("canshu_022")%>" size="10" />
                </span></td>
              </tr>
              <tr>
                <td height="30" align="right" bgcolor="#F8F8F8">推荐一人：</td>
                <td height="30" bgcolor="#F8F8F8"><span style="padding-left:10px;">
                  下
                  <input name="canshu_023" type="text" id="canshu_023" value="<%=rs("canshu_023")%>" size="10" />
                  代
                  <input name="canshu_024" type="text" id="canshu_024" value="<%=rs("canshu_024")%>" size="10" />
                </span></td>
              </tr>
              <tr>
                <td height="30" align="right" bgcolor="#F8F8F8">推荐二人以上：</td>
                <td height="30" bgcolor="#F8F8F8"><span style="padding-left:10px;">
                  下
                  <input name="canshu_025" type="text" id="canshu_025" value="<%=rs("canshu_025")%>" size="10" />
                  代
                  <input name="canshu_026" type="text" id="canshu_026" value="<%=rs("canshu_026")%>" size="10" />
                </span></td>
              </tr>


            </table></td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td height="40" align="right" bgcolor="#FFFFFF">贡献奖：</td>
            <td height="40" colspan="3" align="left" bgcolor="#FFFFFF" style="padding:5px 5px 5px 5px;"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D3D3D3">
              <tr>
                <td height="30" bgcolor="#FFFFFF">当小市场销售业绩达到
                  <input name="canshu_027" type="text" id="canshu_027" value="<%=rs("canshu_027")%>" size="10" />
                  万时享受本团队新增业绩
                  <input name="canshu_028" type="text" id="canshu_028" value="<%=rs("canshu_028")%>" size="10" /></td>
              </tr>
              <tr>
                <td height="30" bgcolor="#FFFFFF">当小市场销售业绩达到
                  <input name="canshu_029" type="text" id="canshu_029" value="<%=rs("canshu_029")%>" size="10" />
                  万时享受本团队新增业绩
                  <input name="canshu_030" type="text" id="canshu_030" value="<%=rs("canshu_030")%>" size="10" /></td>
              </tr>
              <tr>
                <td height="30" bgcolor="#FFFFFF">当小市场销售业绩达到
                  <input name="canshu_031" type="text" id="canshu_031" value="<%=rs("canshu_031")%>" size="10" />
                  万时享受本团队新增业绩
                  <input name="canshu_032" type="text" id="canshu_032" value="<%=rs("canshu_032")%>" size="10" /></td>
              </tr>

            </table></td></tr>
          <tr bgcolor="#F7F7F7">
            <td height="40" align="right" bgcolor="#F8F8F8">报单费：</td>
            <td height="40" colspan="3" align="left" bgcolor="#F8F8F8" style="padding-left:5px;"><%=jb1%>：
              <input name="canshu_035" type="text" id="canshu_035" value="<%=rs("canshu_035")%>" size="10" />
              <%=jb2%>：
              <input name="canshu_036" type="text" id="canshu_036" value="<%=rs("canshu_036")%>" size="10" />
              <%=jb3%>：
              <input name="canshu_037" type="text" id="canshu_037" value="<%=rs("canshu_037")%>" size="10" />
              <%=jb4%>：
              <input name="canshu_044" type="text" id="canshu_044" value="<%=rs("canshu_044")%>" size="10" />
              </td>
            </tr>
          <tr bgcolor="#F7F7F7">
            <td height="40" align="right" bgcolor="#F8F8F8">A值：</td>
            <td height="40" align="left" bgcolor="#F8F8F8" style="padding-left:5px;"><input name="a" type="text" id="a" value="<%=rs("a")%>" size="10" /></td>
            <td height="40" align="right" bgcolor="#F8F8F8">B值：</td>
            <td height="40" align="left" bgcolor="#F8F8F8" style="padding-left:5px;"><input name="b" type="text" id="b" value="<%=rs("b")%>" size="10" /></td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td height="40" align="right" bgcolor="#F8F8F8">扣税：</td>
            <td height="40" align="left" bgcolor="#F8F8F8" style="padding-left:5px;"><input name="canshu_033" type="text" id="canshu_033" value="<%=rs("canshu_033")%>" size="20" /></td>
            <td height="40" align="right" bgcolor="#F8F8F8">重复消费：</td>
            <td height="40" align="left" bgcolor="#F8F8F8" style="padding-left:5px;"><input name="canshu_034" type="text" id="canshu_034" value="<%=rs("canshu_034")%>" size="20" /></td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td width="200" height="40" align="right" bgcolor="#FFFFFF">提现手续费：</td>
            <td height="40" align="left" bgcolor="#FFFFFF" style="padding-left:5px;"><input name="tikuan_sx" type="text" id="tikuan_sx" value="<%=rs("tikuan_sx")%>" size="20" /></td>
            <td height="40" align="right" bgcolor="#FFFFFF">提现超过：</td>
            <td height="40" align="left" bgcolor="#FFFFFF" style="padding-left:5px;"><input name="tikuan_di" type="text" id="tikuan_di" value="<%=rs("tikuan_di")%>" size="20" /></td>
          </tr>
          <tr bgcolor="#F7F7F7">
            <td height="50" colspan="4" align="center" bgcolor="#FFFFFF"><input type="submit" name="Submit" value="确认修改" style="height:30px; width:100px;"/></td>
          </tr>
		  </form>

		  
      </table>
	  </td>
    </tr>
  </table>
  
</td></tr></table></body>
</html>
