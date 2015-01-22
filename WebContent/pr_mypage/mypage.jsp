<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>관심기술</title>
<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">
<style type="text/css">
.btn-lg, .btn-group-lg > .btn {
padding: 7px 7px;
font-size: 15px;
line-height: 1.33;
border-radius: 5px;
}
</style>
</head>
<br />
<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						관심기술 <small class="small-text">관심기술 입니다.</small>
					</h3>
				</div>
				<div class="content-header">
					<form method="post" action="/pfinal/pfinal.do">
						<input type="hidden" name="command" value="inter" />

						<div class="form-group">
							<input type="checkbox" name="inter" value="java">java <input
								type="checkbox" name="inter" value="jsp">jsp <input
								type="checkbox" name="inter" value="php">php <input
								type="checkbox" name="inter" value="html">html<input
								type="submit" value="전송" class="btn">
						</div>
					</form><br/><br/>
					<div class="form-group">
						<a href="/pfinal/pfinal.do?command=project"
							class="btn btn-lg btn-client js-disable-on-click btn-submit">프로젝트
							등록</a>
						<a href="/pfinal/pfinal.do?command=free_index"
							class="btn btn-lg btn-default js-disable-on-click">홈으로</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

