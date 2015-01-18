<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>


<html>
<head>
<title>쪽지 보내기</title>
</head>
<link href="css/bootstrap.css" rel="stylesheet">

<body>
	<div class="container">
		<div class="row">
			<form id="send_msg" name="send_msg" method="post"
				action="/pfinal/pfinal.do?command=privatemessageupload">
				<input type="text" id="friend_id" name="friend_id" value="" />
				<div>
					<h2>쪽지 보내기</h2>
				</div>
				<hr />
				<div>받는 사람</div>
				<input type="text" id="receive_name" name="receive_name"
					readonly="readonly" placeholder="이메일" />
				<div>
			친구목록 : <br/>
						<c:forEach items="${vDto}" var="vDto">
						
							<input type="checkbox" name="friends1"  id="friends1" value="${vDto.id }">${vDto.id }</>
							
						</c:forEach>
				</div>
				<br />
				<div>
					<div>메세지</div>
					<div>
						<textarea id="msg_content" name="msg_content" cols=50 rows=5
							placeholder="보낼 메세지" style="resize: none;" class="input-xxlarge"
							required="required">저희 프로젝트에 초대합니다.</textarea>
					</div>
				</div>
				<br /> <input type="hidden" name=msgpr_id value="${msgpr_id }">

				<input class="btn btn-lg btn-default js-disable-on-click"
					type="button" value="쪽지 보내기" onclick="fnchknull()" class="btn" />
			</form>
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
			window.resizeTo(480, 480); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
		}
	</script>
</body>
</html>