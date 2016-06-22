<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>

<%


	shijian=replace(now(),":","")
	shijian=replace(shijian,"/","")
	shijian=replace(shijian,"-","")
	shijian=replace(shijian," ","")
	yzm=right(shijian,1)&right(right(shijian,3)*right(shijian,3),60)
%>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
	
		<input id="text" type="text" value="http://192.168.1.88:8701/index.aspx?id=5&yzm=<%=yzm%>" style="width:80%; display:none" />
		<div id="qrcode" ></div>
		
		<script src='manager/sinkia/js/jquery-c152c51c4dda93382a3ae51e8a5ea45d.js'></script>
		<script src='manager/sinkia/js/qrcode.min.js'></script>
		<script src="manager/sinkia/js/stopExecutionOnTimeout-6c99970ade81e43be51fa877be0f7600.js"></script>
		<script>
			var qrcode = new QRCode('qrcode');
			function makeCode() {
			var elText = document.getElementById('text');
			if (!elText.value) {
			alert('Input a text');
			elText.focus();
			return;
			}
			qrcode.makeCode(elText.value);
			}
			makeCode();
			$('#text').on('blur', function () {
			makeCode();
			}).on('keydown', function (e) {
			if (e.keyCode == 13) {
			makeCode();
			}
			});
		</script>	</td>
  </tr>
</table>

