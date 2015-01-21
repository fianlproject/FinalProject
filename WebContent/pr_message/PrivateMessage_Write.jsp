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
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">
<title>쪽지 보내기</title>
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
<br/>
<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						쪽지 보내기<small class="small-text">상세하게 작성해주세요.</small>
					</h3>
				</div>
			<form id="send_msg" name="send_msg" method="post"
				action="/pfinal/pfinal.do?command=privatemessageupload">
			<div class="content-header"><br/>
						<div class="form-group">
			<label class="control-label required" for="title"><span>*</span>친구목록</label>
					 	<c:forEach items="${vDto}" var="vDto">
							<input type="checkbox" name="friends1"  id="friends1" value="${vDto.id }">${vDto.id }</>
							&nbsp;&nbsp;&nbsp;
						</c:forEach>
				<br /><br />
				</div>
				<div>
					<label class="control-label required" for="title"><span>*</span>받는
					사람</label>
					<div>
						<textarea class="form-control" id="msg_content" name="msg_content" cols=60 rows=8
							placeholder="보낼 메세지" style="resize: none;" class="input-xxlarge"
							required="required">저희 프로젝트에 초대합니다.</textarea>
					</div>
				</div>
				<br /> <input type="hidden" name=msgpr_id value="${msgpr_id }">
				<br/><br/><br/>
				<input class="btn btn-lg btn-client js-disable-on-click btn-submit"
					type="button" value="쪽지 보내기" onclick="fnchknull()" class="btn" />
				</div>
			</form>
		</div>
	</div>
</div>
	<script>

		function fnchknull() {
			var fr = document.getElementById("friends1").value;
			if (fr == null || fr == "") {
				alert("친구를 선택해주세요.");
			}else{
				document.getElementById("send_msg").submit();
			}


		}
		window.onload = function() {
			window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
			window.moveTo(0, 0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
			window.resizeTo(480, 510); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
		}
	</script>
</body>
</html>