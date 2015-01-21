<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<title>답장하기</title>
</head>
<link href="css/bootstrap.css" rel="stylesheet">

<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">
<style type="text/css">
#sm-group {
	width: 30%;
}
</style>

<body>
	<div class="container">
		<div class="row">
			<form id="send_msg" name="send_msg" method="post"
				action="/pfinal/pfinal.do?command=messageupload">
				<div id="sm-group">
					<input class="form-control" type="text" id="friend_id"
						name="friend_id" value="${send_id }" />
				</div>
				<div>
					<h2>${id }님쪽지 보내기</h2>
				</div>
				<label class="control-label required" for="title"><span>*</span>받는
					사람</label>
				<div id="sm-group">
					<input class="form-control" type="text" id="receive_name"
						name="receive_name" readonly="readonly" value="${send_name }" />
				</div>
				<div>
					<label class="control-label required" for="title"><span>*</span>메시지</label>
					<div>
				<div>
					<textarea id="msg_content" name="msg_content" cols=50 rows=5
						placeholder="보낼 메세지" style="resize: none;" class="input-xxlarge"
						required="required"></textarea>
				</div>
		</div><br/>
		<input class="btn btn-lg btn-default js-disable-on-click" type="button" value="쪽지 보내기" onclick="fnchknull()"
			class="btn" />
		</form>
	</div>
	</div>
	<script>
		function fnchknull() {
			var fid = document.getElementById("msg_content").value;
			if (fid == null || fid == "") {
				alert("내용을 입력해 주세요");
			} else {
				document.getElementById("send_msg").submit();
				window.opener.location.href = "/pfinal/pfinal.do?command=message";
				window.close();
			}
		}
		window.onload = function() {
			window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
			window.moveTo(0, 0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
			window.resizeTo(480, 480); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
		}
	</script>
</body>
</html>