<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=request.Cookies("bj")("webname")%></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%' Option Explicit %>

  <!--#include file="../../conn.aspx"--> 
<%
	Const topMamber = "A00000000"
	Const LEFT_ICO = "<div class='ico'></div>"
	
	Dim topId
	topId = Trim(Request.QueryString("id"))
	
	if request("bianhao")<>"" then
		topId=request("bianhao")
	else
		topId=topMamber
	end if


%>

<style type="text/css">
body {
	font-size:13px;
}
.node .title {
	height:20px;
	font-size:13px;
}
.node .title div {
	width:19px;
	height:20px;
	float:left;
}
.node .title span {
	float:left;
	height:20px;
	background:url(Images/user.gif) 2px 2px no-repeat;
	padding-left:20px;
	line-height:20px;
}

.have_0 {
	background:url(Images/ico_1.gif) no-repeat;
}
.have_1 {
	background:url(Images/ico_6.gif) no-repeat;
}
.have_2 {
	background:url(Images/ico_2.gif) no-repeat;
}
.have_display_0 {
	background:url(Images/ico_d_1.gif) no-repeat;
}
.have_display_1 {
	background:url(Images/ico_d_6.gif) no-repeat;
}
.have_display_2 {
	background:url(Images/ico_d_2.gif) no-repeat;
}
.no_0 {
	/*background:url(Images/ico_1.gif) no-repeat;*/
}
.no_1 {
	background:url(Images/ico_5.gif) no-repeat;
}
.no_2 {
	background:url(Images/ico_4.gif) no-repeat;
}
.node .sub ,
.node .sub_0 {
	padding-left:20px;
}
.node .sub {
	background:url(Images/ico_3.gif) repeat-y;
}
</style>
<script type="text/javascript">
<!--
var start = function(fun) {
	document.onreadystatechange = function(){
		if (document.readyState=="complete" && fun)
			fun();
	}
}

var titleClick = function(othis, obj) {
	
	if(obj.style.display == "none") {
		alterClass(othis);
		obj.style.display = "block"
	} else {
		alterClass(othis);
		obj.style.display = "none"
	}
}

var alterClass = function(obj) {
	if(obj.className.indexOf("display") > 0) {
		obj.className = obj.className.replace("_display_", "_")
	} else {
		obj.className = obj.className.replace("_", "_display_")
	}
} 
var alterClassA = function(obj) {
	if(obj.className.indexOf("display") > 0) {
		obj.className = obj.className.replace("_display_", "_")
	}
} 
var alterClassB = function(obj) {
	if(obj.className.indexOf("display") < 0) {
		obj.className = obj.className.replace("_", "_display_")
	}
} 

start(function() {
	var divs = document.getElementsByTagName("div");
	var divico;
	var obj;
	var allobj = new Array();
	for(var i = 0; i < divs.length; i ++) {
		if (divs[i] && divs[i].className == "title") {
			divtitle = divs[i].children[0];
			if (divtitle && (divtitle.className == "have_0" || divtitle.className == "have_1" || divtitle.className == "have_2")) {
				divtitle.style.cursor = "pointer";
				obj = divtitle.parentElement.parentElement.children[1];
				if(obj) {
					obj.style.display = "none";
					divtitle.onclick = function() {
						titleClick(this, this.parentElement.parentElement.children[1]);
					}
					allobj.push({"obj":obj, "divtitle":divtitle});
				}
			}
		}
	}
	
	document.getElementById("FindBtn").onclick = function() {
		window.location = "?bianhao=" + document.getElementById("igtxtValueTxt").value;
	}
	document.getElementById("TopBtn").onclick = function() {
		window.location = "?";
	}
	
	var unfold = function(display) {
		var alterClassFun;
		if(display == "none")
			alterClassFun = alterClassA;
		else 
			alterClassFun = alterClassB;
		for(var i = 0; i < allobj.length; i ++) {
			allobj[i].obj.style.display = display;
			alterClassFun(allobj[i].divtitle);
		}
	}
	document.getElementById("ExpandBtn").onclick = function() {
		unfold("block");
	}
	document.getElementById("CollapseBtn").onclick = function() {
		unfold("none");
	}
	
	
});

//-->
</script>

  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="title">
    <tr>
      <td height="80" colspan="2">�Ƽ�����ͼ</td>
    </tr>
    <tr>
      <td width="2%" align="center" bgcolor="EEEEEE"><img src="../images/3.jpg" width="13" height="10" /></td>
      <td width="98%" height="40" bgcolor="EEEEEE" class="titlea">��ҳ &gt; ��Ա���� &gt; �Ƽ�����ͼ</td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="FFB849">
    <tr class="biao">
      <td height="40" style="padding-left:10px;"><img src="../images/4.jpg" width="18" height="15" />�Ƽ�����ͼ</td>
    </tr>
    <tr>
      <td align="left" bgcolor="#FFFFFF" style="padding-top:10px; padding-bottom:10px;">

			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
				<td height="500" valign="top"><div id="main">
				  <div id="buttarea">
					<table>
					  <tr>
						<td><span id="Label1" style="font-size: 12">�ؼ��֣�</span></td>
						<td><input name="Input" id="igtxtValueTxt" title="��������" value="<% Rw topId %>" maxlength="20" editid="ValueTxt" /></td>
						<td><input name="FindBtn" type="button" id="FindBtn" value="����" /></td>
						<td><input name="TopBtn" type="button" id="TopBtn" value="�ض���" /></td>
						<td><input name="ExpandBtn" type="button" id="ExpandBtn" value="չ���ڵ�" /></td>
						<td><input name="CollapseBtn" type="button" id="CollapseBtn" value="�����ڵ�" /></td>
						<td><input name="ReturnBtn" type="button" id="ReturnBtn" onclick="javascript:history.back(-1)" value="����" /></td>
						<td>&nbsp;</td>
					  </tr>
					</table>
				  </div>
				  <div id="tree">
					<%	
				If topId <> "" Then
					Dim Rs
					Set Rs = Conn.Execute("SELECT * FROM [view_xipu] where [huiyuan_shang_id] = '" & topId & "' and huiyuan_xuhao=0 ")					
					If Not Rs.Bof And Not Rs.Eof Then
						Call traversal(topId, rs("huiyuan_name"),rs("huiyuan_jiebie"), 0)
					Else
						Rw "û�в鵽��Ա��"
					End If
				Else
					Call traversal(topMamber, "��˾",3, 0)
				End If
				
				Sub Rw(s) '...
					Response.Write(s)
				End Sub
				
				Dim ico, all, num
				ico = LEFT_ICO
				
				num = "0"
				
				Sub traversal(memberId, xuhao,jiebie, isEnd)
					num = CInt(num)
					
					Rw "<div class='node'>"
					
					Dim Rs
					Set Rs = Conn.Execute("SELECT * FROM [view_xipu] WHERE [huiyuan_shang_id] = '" & memberId & "' and huiyuan_xuhao=1")
					If Not Rs.Bof And Not Rs.Eof Then
					
					
						set rsa=server.CreateObject("adodb.recordset")
						sqla = "select * from tbl_jiebie  where id="&jiebie&"  "
						rsa.Open sqla,conn,1,1	
						huiyuan_jiebie=rsa("jiebie")
						rsa.close
						set rsa=nothing
						
						set rsa=server.CreateObject("adodb.recordset")
						sqla = "select * from tbl_huiyuan where huiyuan_bianhao='"&memberId&"'  "
						rsa.Open sqla,conn,1,1	
						huiyuan_name=rsa("huiyuan_name")
						rsa.close
						set rsa=nothing
						
						Rw "<div class='title'><div class='have_" & isEnd & "'></div><span><a href=xipu1.aspx?bianhao="&memberId&">["&num&"]["&huiyuan_name&"]["&memberId&"]["&huiyuan_jiebie&"]</a></span></div>"
						If isEnd = 0 Then
							Rw "<div class='sub_0'>"
						Else
							Rw "<div class='sub'>"
						End If
						While Not Rs.Eof
							Dim huiyuan_id, huiyuan_xuhao
							huiyuan_id = Rs("huiyuan_id")
							huiyuan_name = Rs("huiyuan_name")
							huiyuan_jiebie=rs("huiyuan_jiebie")
							cs=cs+1
							Rs.MoveNext
							num = num + 1
							If Rs.Eof Then
								Call traversal(huiyuan_id, huiyuan_name,huiyuan_jiebie, 1)
							Else
								Call traversal(huiyuan_id, huiyuan_name,huiyuan_jiebie, 2)
							End If
							num = num - 1
						Wend
						Rw "</div>"
					Else
					
					
						set rsa=server.CreateObject("adodb.recordset")
						sqla = "select * from tbl_jiebie  where id="&jiebie&"  "
						rsa.Open sqla,conn,1,1	
						huiyuan_jiebie=rsa("jiebie")
						rsa.close
						set rsa=nothing
						
						set rsa=server.CreateObject("adodb.recordset")
						sqla = "select * from tbl_huiyuan where huiyuan_bianhao='"&memberId&"'  "
						rsa.Open sqla,conn,1,1	
						huiyuan_name=rsa("huiyuan_name")
						rsa.close
						set rsa=nothing
						
						
						Rw "<div class='title'><div class='no_" & isEnd & "'></div><span><a href=xipu1.aspx?bianhao="&memberId&"&FindBtn=FindBtn >["&num&"]["&huiyuan_name&"]["&memberId&"]["&huiyuan_jiebie&"]</a></span></div>"
					End If
					
					Rw "</div>"
				End Sub
				
			%>
				  </div>
				</div></td>
			  </tr>
			</table>
</td></tr></table>
</body>
</html>
