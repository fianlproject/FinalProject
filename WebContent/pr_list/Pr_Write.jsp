<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
$(function() {
	$("#datepicker").datepicker({
		changeMonth : true,
		changeYear : true,
		showButtonPanel : true,
		dateFormat : "yy/mm/dd"
	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>리스트 글올리기</title>
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
<%
	DecimalFormat df = new DecimalFormat("00");
	Calendar currentCalendar = Calendar.getInstance();

	//현재 날짜 구하기
	String strYear = Integer.toString(currentCalendar
			.get(Calendar.YEAR));
	String strMonth = df
			.format(currentCalendar.get(Calendar.MONTH) + 1);
	String strDay = df.format(currentCalendar.get(Calendar.DATE));
	String pr_start = strYear + "." + strMonth + "." + strDay;
%>


<br/>

<body class="project-list">

	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						프로젝트 등록 <small class="small-text">상세하게 작성해주실수록 더 적합한 파트너스를 만날 수 있습니다.</small>
					</h3>
				</div>

				<div class="content-header">
					<div class="content-inner">


						<div class="map_wrap">

							<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden; top:"></div>

							<div id="menu_wrap" class="bg_white">
								<div class="option">
									<form onsubmit="searchPlaces(); return false;">
										키워드 : <input type="text" id="keyword" size="15">
										<button type="submit">검색하기</button>
									</form>
								</div>
								<hr>
								<ul id="placesList"></ul>
								<div id="pagination"></div>
							</div>
						</div>

						<script type="text/javascript"
							src="//apis.daum.net/maps/maps3.js?apikey=3d9835e43d08f616d89784b77f22a468&libraries=services"></script>
						<script type="text/javascript" src="/pfinal/js/map.js"></script>
						<form enctype="multipart/form-data" name="pr_write" method="post"
							action="/pfinal/pfinal.do?command=prwriteProc">
							<input type="hidden" id="longitude" name="longitude"> <input
								type="hidden" id="latitude" name="latitude">
								<input type="hidden" id="pr_skill" name="pr_skill" value="${pr_skill }"> 
								
							<div class="form-group ">
								<label class="control-label required" for="skill_required">필요기술
									</label>
								<div class="control-wrapper">
									${pr_skill }
							</div>
							
							
							</div>
							<div class="form-group ">
								<label class="control-label required" for="title"><span>*</span>프로젝트
									제목</label>

								<div class="control-wrapper">
									<input class="form-control" id="pr_subject" name="pr_subject"
										maxlength="30" size="30" type="text"><span
										class="help-block">프로젝트 제목을 입력해 주세요. (30자 이내)</span>
								</div>
							</div>
							<input type="hidden" name="pr_start" id="pr_start"
								value=<%=pr_start%> size="8">
							<%
								request.setAttribute("pr_start", pr_start);
							%>
							<div class="form-group project-term-form-group ">
								<label class="control-label required" for="project_term"><span>*</span>종료날짜</label>
								<div id="sm-group">
									<div class="input-group">
										<input autocomplete="off" class="form-control" id="datepicker"
											name="pr_end" required="required" type="text"><span
											class="input-group-addon">일</span>
									</div>
									<span class="help-block">yyyy/mm/dd : ex)2015/02/01</span>
								</div>
							</div>

							<div class="form-group project-term-form-group ">
								<label class="control-label required" for="project_term"><span>*</span>예상날짜</label>
								<div id="sm-group">
									<div class="input-group">
										<input autocomplete="off" class="form-control" id="pr_exday"
											name="pr_exday" required="required" type="text"><span
											class="input-group-addon">일</span>
									</div>

								</div>
							</div>

							<div class="form-group project-budget-form-group ">
								<label class="control-label required" for="budget_maximum"><span>*</span>지출
									가능 예산</label>
								<div id="sm-group">
									<div class="input-group">
										<span class="input-group-addon">￦</span><input
											class="form-control" id="pr_price" name="pr_price"
											required="required" type="text">
									</div>
									<span class="help-block">지출 가능한 예산을 입력해 주세요. (예
										100,000,000)</span>
								</div>
							</div>

							<div class="form-group project-budget-form-group ">
								<label class="control-label required" for="budget_maximum"><span>*</span>필요
									인원 수</label>
								<div id="sm-group">
									<div class="input-group">
										<input autocomplete="off" class="form-control" id="pr_needman"
											name="pr_needman" required="required" type="text"> <span
											class="input-group-addon">명</span>
									</div>
									<span class="help-block">필요한 인원수를 숫자로 적어주세요.</span>
								</div>
							</div>

							<div class="form-group description-form-group ">
								<label class="control-label required" for="description"><span>*</span>프로젝트
									내용</label>
								<div class="control-wrapper">
									<textarea autocomplete="off" class="form-control" cols="40"
										id="pr_content" name="pr_content" required="" rows="15"></textarea>
									<span class="help-block"><p class="text-danger">
											<span class="label label-danger">주의</span> 이메일, 전화번호 등을 게시하는
											경우 서비스 이용에 제재를 받을 수 있습니다.
										</p></span>
								</div>
							</div>

							

							<div class="form-group ">
								<label class="control-label required" for="skill_required"><span>*</span>공개여부</label>
								<div class="control-wrapper">

									<select name="pr_private">
										<option selected="selected" value="y">공개</option>
										<option value="n">비공개</option>
									</select>

								</div>
							</div>

							<div class="form-group ">
								<label class="control-label required" for="skill_required">파일첨부</label>
								<div class="control-wrapper">
									<input type="file" name="pr_photo" id="pr_photo">
								</div>
							</div>



							<div class="form-group">
								<div class="btn-wrapper">
									<input
										class="btn btn-lg btn-client js-disable-on-click btn-submit"
										value="프로젝트 등록" type="submit" onclick="ok()"> <input
										class="btn btn-lg btn-default js-disable-on-click"
										name="save_for_later" value="취소" type="button">
								</div>
							</div>


						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
<script>
	function fnIsNull() {

		var pr_subject = document.getElementsByName("pr_subject").value;
		var pr_content = document.getElementsByName("pr_content").value;
		var pr_photo = document.getElementByName("pr_photo").value;

		if (pr_subject == "" || pr_content == "" || pr_photo == "") {
			alert("값이 비어있습니다.");
		} else {
			document.pr_write.submit();
		}
	}
</script>

</html>
