<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>나의 경력</title>

<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">
<style type="text/css">
#sm-group {
	width: 50%;
}
</style>

<script>
	$(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			dateFormat : "yy/mm/dd"
		});
	});

	$(function() {
		$("#datepicker1").datepicker({
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			dateFormat : "yy/mm/dd"
		});
	});
</script>
</head>
<br />
<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						경력 <small class="small-text">상세하게 작성해주실수록 더 적합한 파트너스를 만날 수 있습니다.</small>
					</h3>
				</div>

				<form method="post" action="/pfinal/pfinal.do">
					<input type="hidden" name="command" value="career" />
					<div class="content-header">
						<div class="form-group">
							<label class="control-label required" for="title"><span>*</span>회사명</label>
							<div id="sm-group">
								<div class="control-wrapper">
									<input class="form-control" id="cname" name="cname" maxlength="30" size="30" required="required" type="text">
								</div>
							</div>
						</div>

						<div class="form-group">

							<label class="control-label required" for="title"><span>*</span>부서</label>
							<div id="sm-group">
								<div class="control-wrapper">
									<input class="form-control" id="part" name="part" maxlength="30" size="30" required="required" type="text">
								</div>
							</div>
						</div>

						<div class="form-group">

							<label class="control-label required" for="title"><span>*</span>직위</label>
							<div id="sm-group">
								<div class="control-wrapper">
									<input class="form-control" id="position" name="position" maxlength="30" size="30" required="required" type="text">
								</div>
							</div>
						</div>

						<div class="form-group">

							<label class="control-label required" for="title"><span>*</span>입사일</label>
							<div id="sm-group">
								<div class="control-wrapper">
									<input class="form-control" id="datepicker" name="joins" maxlength="30" size="30" required="required" type="text">
								</div>
							</div>
						</div>

						<div class="form-group">

							<label class="control-label required" for="title"><span>*</span>퇴사일</label>
							<div id="sm-group">
								<div class="control-wrapper">
									<input class="form-control" id="datepicker1" name="resign" maxlength="30" size="30" required="required" type="text">
								</div>
							</div>
							<br/> 
							<input class="btn btn-lg btn-client js-disable-on-click btn-submit" value="추가" type="submit">
						
				</form><br/><br/>
				<form method="post" action="/pfinal/pfinal.do">
						<button class="btn btn-lg btn-default js-disable-on-click" name="command" value="mylist">마이리스트</button>
			</form>
				</div>
			</div>
		</div>
	</div>
			

</body>
</html>

