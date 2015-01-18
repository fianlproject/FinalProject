<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	학교번호 : ${schoolnumber}
	<br /> 학교이름 : ${schoolname } 로그인 아이디 : ${id }
	<br />${schoolchk }
	입력

	<div id="wrap">
		<div class="container">
			<div class="content">
				<div class="content-header">

					<section>
					<h4>최종학력</h4>
					<form class="has-validation-callback" method="post"
						action="/pfinal/pfinal.do">
						<input type="hidden" name="schoolnumber" value="${schoolnumber }">
						<input type="hidden" name="loginid" value="${id }">
						<div class="form-group p5-portfolio-form-group">
							<label class="control-label required p5-box-control-label" for=""><span>*</span>학교명</label>
							<div class="control-wrapper">
								<input class="form-control portfolio_title" id="schoolname"
									name="schoolname" type="text" value="${schoolname }"
									readonly="readonly">

							</div>
						</div>
						<div class="form-group p5-portfolio-form-group">
							<label class="control-label required p5-box-control-label" for=""><span>*</span>전공</label>
							<div class="control-wrapper">
								<input class="form-control portfolio_title" id="schoolmajor"
									name="schoolmajor" type="text">
							</div>
						</div>

						<div class="form-group p5-portfolio-form-group">
							<label class="control-label required p5-box-control-label" for=""><span>*</span>상태</label>
							<div class="control-wrapper">
								<select class="form-control p5-status-select" id="schoolstate"
									name="schoolstate"><option selected="selected"
										value="">상태</option>
									<option value="1">재학</option>
									<option value="2">휴학</option>
									<option value="3">졸업</option>
								</select>
							</div>
						</div>

						<span class="pull-left"> 
						
							
								<button class="btn btn-partners btn-submit" name="command"
									value="myschoolinsert">추가</button>
						
							

							<button class="btn btn-partners btn-submit" type="reset">취소</button>


						</span>
					</form>
					</section>
				</div>
			</div>
		</div>
	</div>

</body>
</html>