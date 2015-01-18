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
<title>상태 입력하기</title>

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

</head>
<br/>
<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						작성하기<small class="small-text">상세하게 작성해주세요</small>
					</h3>
				</div>

				<form method="post" action="/pfinal/pfinal.do">
					<input type="hidden" name="command" value="cl_up" />
					<div class="content-header">
						<c:if test="${check == 5 }">
							<div class="form-group">
								<label class="control-label required" for="title"><span>*</span>재협상기간</label>
								<div id="sm-group">
									<div class="input-group">
										<input class="form-control" id="nday" name="nday"
											required="required" type="text">
										<span class="input-group-addon">일</span>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label required" for="title"><span>*</span>재협상비용</label>
								<div id="sm-group">
									<div class="input-group">
										<span class="input-group-addon">￦</span><input
											class="form-control" id="nprice" name="nprice" required="required" type="text">
									</div>
								</div>
							</div>
						</c:if>

						<div class="form-group">
							<label class="control-label required" for="title"><span>*</span>협상내용</label>

							<div class="control-wrapper">
								<input class="form-control" id="content" name="content"
									maxlength="30" size="30" required="required" type="text">
							</div>

						</div>
						<br /> <input type="hidden" value="${pr_id}" name="pr_id">
						<input type="hidden" value="${check}" name="check"> <input
							type="submit" value="전송"
							class="btn btn-lg btn-client js-disable-on-click btn-submit">
					</div>
			</div>
			</form>
		</div>
	</div>

</body>
</html>