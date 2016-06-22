<%
	shijian=replace(now(),":","")
	shijian=replace(shijian,"/","")
	shijian=replace(shijian,"-","")
	shijian=replace(shijian," ","")
	yzm=right(shijian,1)&right(right(shijian,3)*right(shijian,3),60)
	
%>
	 
	<input id="text" type="text" value="http://192.168.1.88:8701/video.aspx?id=<%=request("id")%>&video=<%=request("video")%>&yzm=<%=yzm%>" style="width:100%; display:none" />
											<div id="qrcode" style="width:250px; height:200px;" ></div>
											
											  <script src='js/jquery-c152c51c4dda93382a3ae51e8a5ea45d.js'></script>
											 
											  <script src='js/qrcode.min.js'></script>
											  <script src="js/stopExecutionOnTimeout-6c99970ade81e43be51fa877be0f7600.js"></script>
											
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
											  </script>