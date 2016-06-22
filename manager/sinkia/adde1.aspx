<!--#include file="../../conn.aspx"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="../../css/cssa.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top">
 
	   <table width="600" border="0" align="center" cellpadding="3" cellspacing="1" class="content">
        <tr>
<td >
<%
					set Rs=server.createobject("adodb.recordset")	

		Rs.Open ("select * from tbl_productc"),Conn,3,3
			rs.addnew
							Rs("pro_id")      =   request("proid")	
							
							Rs("title")  = request("title")
							Rs("fz")  = request("fz")
							Rs("memo")  = request("memo")
							Rs.Update
							Rs.Close
								Response.Redirect "adde.aspx?id="&request("proid")	
					set rs=nothing
		
	%>
	
	</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
