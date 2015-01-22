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
<title>나의 보유기술</title>

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
</head>
<br />
<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						보유기술 <small class="small-text">상세하게 작성해주실수록 더 적합한 파트너스를 만날
							수 있습니다.</small>
					</h3>
				</div>
				<form method="post" action="/pfinal/pfinal.do">
					<input type="hidden" name="command" value="skill_update" />
					<input type="hidden" name="skill_index" value="${skill_index}" />
					<div class="content-header">
						<div class="form-group">
							<label class="control-label required" for="title"><span>*</span>기술명</label>
							<div id="sm-group">
								<div class="control-wrapper">
									<input class="form-control" id="skill" name="skill"
										maxlength="30" size="30" required="required" type="text" value="${skill}">
								</div>
							</div>
						</div>
						
						<div id="sm-group">
						<label class="control-label required" for="title"><span>*</span>경험</label>
						<select name="exp" class="form-control">
							<c:if test="${exp==1}">
								<option value="" >경험</option>
								<option value="1" selected="selected">1년미만</option>
								<option value="2">1년 이상 3년 미만</option>
								<option value="3">3년 이상 5년 미만</option>
								<option value="4">5년 이상 10년 미만</option>
								<option value="5">10년 이상</option>
							</c:if>
							<c:if test="${exp==2}">
								<option value="" >경험</option>
								<option value="1">1년미만</option>
								<option value="2" selected="selected">1년 이상 3년 미만</option>
								<option value="3">3년 이상 5년 미만</option>
								<option value="4">5년 이상 10년 미만</option>
								<option value="5">10년 이상</option>
							</c:if>
							<c:if test="${exp==3}">
								<option value="" >경험</option>
								<option value="1">1년미만</option>
								<option value="2">1년 이상 3년 미만</option>
								<option value="3" selected="selected">3년 이상 5년 미만</option>
								<option value="4">5년 이상 10년 미만</option>
								<option value="5">10년 이상</option>
							</c:if>
							<c:if test="${exp==4}">
								<option value="" >경험</option>
								<option value="1">1년미만</option>
								<option value="2">1년 이상 3년 미만</option>
								<option value="3">3년 이상 5년 미만</option>
								<option value="4" selected="selected">5년 이상 10년 미만</option>
								<option value="5">10년 이상</option>
							</c:if>
							<c:if test="${exp==5}">
								<option value="" >경험</option>
								<option value="1" selected="selected">1년미만</option>
								<option value="2">1년 이상 3년 미만</option>
								<option value="3">3년 이상 5년 미만</option>
								<option value="4">5년 이상 10년 미만</option>
								<option value="5" selected="selected">10년 이상</option>
							</c:if>
						</select> <br/>
						</div>
						
						<div id="sm-group">
						<label class="control-label required" for="title"><span>*</span>숙련도</label>
						<select name="mastery" class="form-control">
							<c:if test="${mastery==1}">
								<option value="">숙련도</option>
								<option value="1" selected="selected">관심있음</option>
								<option value="2">초급</option>
								<option value="3">중급</option>
								<option value="4">고급</option>
								<option value="5">특급</option>
							</c:if>
							<c:if test="${mastery==2}">
								<option value="">숙련도</option>
								<option value="1">관심있음</option>
								<option value="2" selected="selected">초급</option>
								<option value="3">중급</option>
								<option value="4">고급</option>
								<option value="5">특급</option>
							</c:if>
							<c:if test="${mastery==3}">
								<option value="">숙련도</option>
								<option value="1">관심있음</option>
								<option value="2">초급</option>
								<option value="3" selected="selected">중급</option>
								<option value="4">고급</option>
								<option value="5">특급</option>
							</c:if>
							<c:if test="${mastery==4}">
								<option value="">숙련도</option>
								<option value="1">관심있음</option>
								<option value="2">초급</option>
								<option value="3">중급</option>
								<option value="4" selected="selected">고급</option>
								<option value="5">특급</option>
							</c:if>
							<c:if test="${mastery==5}">
								<option value="">숙련도</option>
								<option value="1">관심있음</option>
								<option value="2">초급</option>
								<option value="3">중급</option>
								<option value="4">고급</option>
								<option value="5" selected="selected">특급</option>
							</c:if>
						</select>
						</div>
						<br/><br/><br/> <input type="submit" value="전송" class="btn btn-lg btn-client js-disable-on-click btn-submit" >
				</form>
				<br/><br/>
				<form method="post" action="/pfinal/pfinal.do">
					<button class="btn btn-lg btn-default js-disable-on-click" name="command" value="mylist">마이리스트</button>
			</form>
			</div>
			</div>
		</div>
	</div>

</body>
</html>

