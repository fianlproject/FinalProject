<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>프로젝트 평가하기</title>
<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style type="text/css">
#sm-group {
	width: 30%;
}
</style>

</head>

<body class="project-list">

	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						프로젝트 평가하기 <small class="small-text">정확한 평가가 좋은 파트너를 찾게 도와
							줍니다.</small>
						프로젝트 평가하기 <small class="small-text">평가한 항목은 수정할 수 없으니 신중하게 평가 해주시기 바랍니다.</small>
					</h3>
				</div>
				<form name="pr_write" id="pr_write" method="post"
					action="/pfinal/pfinal.do?command=evaluateup">
					<input type="hidden" name="pr_id" value="${dtoGetBoard.pr_id}" />
					<span>${dtoGetBoard.pr_id }</span>
					<div class="content-header">
						<div class="content-inner">
							<div class="form-group ">
								<label class="control-label required" for="title"><span>*</span>프로젝트
									제목</label>
								<div class="control-wrapper">
									<span>${dtoGetBoard.pr_subject }</span>
								</div>
							</div>

							<div class="form-group project-term-form-group ">
								<label class="control-label required" for="project_term"><span>*</span>시작일</label>
								<div id="sm-group">
									<span>${dtoGetBoard.start_day }</span>
									<span class="help-block">프로젝트 시작일 입니다.</span>
								</div>
							</div>
							<div class="form-group project-term-form-group ">
								<label class="control-label required" for="project_term"><span>*</span>종료일</label>
								<div id="sm-group">
									<span>${dtoGetBoard.end_day }</span>
									<span class="help-block">프로젝트 종료일 입니다.</span>
								</div>
							</div>
							<div class="form-group project-term-form-group ">
								<label class="control-label required" for="project_term"><span>*</span>계약기간</label>
								<div id="sm-group">
									<span>계약기간 ${dtoGetBoard.total_day } 일</span>
									<span class="help-block">프로젝트 시작일로 부터 실제 계약된 기간입니다.</span>
								</div>
							</div>

							<div class="form-group project-budget-form-group ">
								<label class="control-label required" for="budget_maximum"><span>*</span>비용</label>
								<div id="sm-group">
									<span><fmt:formatNumber value="${dtoGetBoard.fin_price }" type="currency"/></span>
									<span class="help-block">프로젝트에 사용된 비용입니다.</span>
								</div>
							</div>

							<div class="form-group project-budget-form-group ">
								<label class="control-label required" for="budget_maximum"><span>*</span>평가하기</label>
								<div id="sm-group">
									<div class="input-group">
										<span class="input-group-addon">전문성</span><input
											class="form-control" id="pr_evaluate1" name="pr_evaluate1"
											required="required" type="text">
									</div>
									<div class="input-group">
										<span class="input-group-addon">사전준비</span><input
											class="form-control" id="pr_evaluate2" name="pr_evaluate2"
											required="required" type="text">
									</div>
									<div class="input-group">
										<span class="input-group-addon">의사소통</span><input
											class="form-control" id="pr_evaluate3" name="pr_evaluate3"
											required="required" type="text">
									</div>
									<div class="input-group">
										<span class="input-group-addon">일정준수</span><input
											class="form-control" id="pr_evaluate4" name="pr_evaluate4"
											required="required" type="text">
									</div>
									<div class="input-group">
										<span class="input-group-addon">적극성</span><input
											class="form-control" id="pr_evaluate5" name="pr_evaluate5"
											required="required" type="text">
									</div>
								</div>
								<span class="help-blocks">각 항목에 맞는 평가 값(1~10)을 입력해 주세요..</span>
							</div>
							<div class="form-group ">
								<label class="control-label required" for="title"><span>*</span>한줄
									평가</label>

								<div class="control-wrapper">
									<input class="form-control" id="comment" name="comment"
										maxlength="30" size="30" type="text"><span
										class="help-block">프로젝트의 간단한 평가를 내려 주세요. (30자 이내)</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="btn-wrapper">
								<input class="btn btn-lg btn-client js-disable-on-click btn-submit"	value="평가 등록" type="submit"> 
								<input class="btn btn-lg btn-default js-disable-on-click" name="save_for_later" value="취소" type="button" onclick="fnBack()">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready( function() {
	 $('.content').on('keyup','.form-control', function() {
        var temp = $('.form-control').val();
            if(temp <= 10 && temp >= 1 && parseInt(temp) == temp) {
            	$('.help-blocks').css('color', '#555');
        	} else {
            	$('.help-blocks').css('color', 'red');
        	}
   		});
	 $('.content').on('keyup','#pr_evaluate2', function() {
        var temp = $('#pr_evaluate2').val();
            if(temp <= 10 && temp >= 1 && parseInt(temp) == temp) {
            	$('.help-blocks').css('color', '#555');
        	} else {
            	$('.help-blocks').css('color', 'red');
        	}
   		});
	 $('.content').on('keyup','#pr_evaluate3', function() {
        var temp = $('#pr_evaluate3').val();
            if(temp <= 10 && temp >= 1 && parseInt(temp) == temp) {
            	$('.help-blocks').css('color', '#555');
        	} else {
            	$('.help-blocks').css('color', 'red');
        	}
   		});
	 $('.content').on('keyup','#pr_evaluate4', function() {
        var temp = $('#pr_evaluate4').val();
            if(temp <= 10 && temp >= 1 && parseInt(temp) == temp) {
            	$('.help-blocks').css('color', '#555');
        	} else {
            	$('.help-blocks').css('color', 'red');
        	}
   		});
	 $('.content').on('keyup','#pr_evaluate5', function() {
        var temp = $('#pr_evaluate5').val();
            if(temp <= 10 && temp >= 1 && parseInt(temp) == temp) {
            	$('.help-blocks').css('color', '#555');
        	} else {
            	$('.help-blocks').css('color', 'red');
        	}
   		});
	});
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
	function fnBack() {
		document.getElementById("pr_write").submit();
		var url = "/pfinal/pfinal.do?command=evaluate";
		location.href = url;
	}
	
</script>

</html>
