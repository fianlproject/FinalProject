<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>

</head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">

<link href="css/bootstrap.css" rel="stylesheet">
<title>쪽지 읽기</title>
<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">

<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">쪽지읽기</h3>
				</div>
				<br />
				<br />
				<br />

				<div class="container" align="center">
					<div class="row">
						<form name="detail" id="detail">
							<div>
								<h2>${id }님쪽지읽기</h2>
							</div>
							<hr />
							<div>
								보낸 사람 <input type="text" id="send_name" name="send_name"
									readonly="readonly" value="${send_id }" /> 받는 사람 <input
									type="text" id="receive_name" name="receive_name"
									readonly="readonly" value="${receive_id }" />
							</div>
							<br />
							<div>
								<br />
								<div>메세지</div>
								<div>
									<textarea id="msg_content" name="msg_content" cols=50 rows=8
										placeholder="보낼 메세지" style="resize: none;"
										class="input-xxlarge" readonly="readonly">${msg_contents }</textarea>
								</div>
						</form>
						<c:if test="${privatepr_id!=null}">
							<form method="post" action="/pfinal/pfinal.do">
								<p>
									<input type="hidden" name="pr_id" value="${privatepr_id}">
									<button class="btn btn-link pl" name="command" value="getboard">
										게시글 바로가기.</button>
								</p>
							</form>
						</c:if>
					</div>
					<br />
					<br />
					<br /> <input type="button" value="답장" onclick="fnWrite()"
						class="btn btn-lg btn-client btn-submit" /> <input type="button"
						value="취소" onclick="fnBack()"
						class="btn btn-lg btn-default js-disable-on-click" />

				</div>
			</div>
		</div>
	</div>
	</div>

	<script>
		function fnWrite() {
			var url = "/pfinal/pfinal.do?command=messagewritedetail&friend_id=${send_id}";
			// 			location.href = url;
			window.open(url, "", "width=570, height=370");
		}
		function fnBack() {
			document.getElementById("detail").submit();
			var url = "/pfinal/pfinal.do?command=message";
			location.href = url;
		}
		window.onload = function() {
			window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
			window.moveTo(0, 0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
			window.resizeTo(480, 480); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
		}
	</script>
</body>
</html>