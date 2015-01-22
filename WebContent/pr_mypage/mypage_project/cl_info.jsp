<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome-4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>지원자정보</title>
<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">

</head>
<br />
<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						지원자정보 <small class="small-text">지원자의 상세정보입니다.</small>
					</h3>
				</div>

				<div class="content-header">
					<div class="form-group">
						<h4>
							<font color="#3DB7CC"> 개인정보 </font>
						</h4>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>이름</th>
									<th>나이</th>
									<th>전화번호</th>
									<th>성별</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${vjoin}">
									<tr>
										<td>${i.name}</td>
										<td>${i.age}</td>
										<td>${i.tel}</td>
										<c:if test="${i.gender==0}">
											<td>남자</td>
										</c:if>
										<c:if test="${i.gender==1}">
											<td>여자</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br />

					<div class="form-group">
						<h4>
							<font color="#3DB7CC"> 경력 </font>
						</h4>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>회사명</th>
									<th>부 서</th>
									<th>직위</th>
									<th>입사기간</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${d_day}">
									<tr>
										<td>${i.cname}</td>
										<td>${i.part}</td>
										<td>${i.position}</td>
										<td><c:if test="${i.year != 0 }">
							${i.year}년
						</c:if> <c:if test="${i.month != 0 }">
							${i.month}월
						</c:if> <c:if test="${i.day != 0 }">
							${i.day}일
						</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br />

					<div class="form-group">
						<h4>
							<font color="#3DB7CC"> 보유기술 </font>
						</h4>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>기술명</th>
									<th>경험</th>
									<th>숙련도</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${skills1}">
									<tr>
										<td>${i.skill}</td>
										<c:choose>
											<c:when test="${i.exp==1}">
												<td>1년미만</td>
											</c:when>
											<c:when test="${i.exp==2}">
												<td>1년 이상 3년 미만</td>
											</c:when>
											<c:when test="${i.exp==3}">
												<td>3년 이상 5년 미만</td>
											</c:when>
											<c:when test="${i.exp==4}">
												<td>5년 이상 10년 미만</td>
											</c:when>
											<c:when test="${i.exp==5}">
												<td>10년 이상</td>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${i.mastery==1}">
												<td>관심있음</td>
											</c:when>
											<c:when test="${i.mastery==2}">
												<td>초급</td>
											</c:when>
											<c:when test="${i.mastery==3}">
												<td>중급</td>
											</c:when>
											<c:when test="${i.mastery==4}">
												<td>고급</td>
											</c:when>
											<c:when test="${i.mastery==5}">
												<td>특급</td>
											</c:when>
										</c:choose>

									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
					<br />

					<div class="form-group">
						<h4>
							<font color="#3DB7CC"> 자격증 </font>
						</h4>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>자격증명</th>
									<th>발행기관</th>
									<th>일련번호</th>
									<th>발행일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${qv}">
									<tr>
										<td>${i.q_name}</td>
										<td>${i.q_house}</td>
										<td>${i.q_num}</td>
										<td>${i.q_date}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>



					<div class="form-group">
						<h4>
							<font color="#3DB7CC"> 학교 </font>
						</h4>

						<table class="table table-hover">
							<thead>
								<tr>
									<th>학교명</th>
									<th>전공</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="${mySchoolList}">
									<tr>
										<td>${dto.schoolname}</td>
										<td>${dto.schoolmajor}</td>
										<td>${dto.schoolstate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="form-group">
						<h4>
							<font color="#3DB7CC"> 자기소개 </font>
						</h4>
						<hr/>
						<c:if test="${sogae!=null }">
							<b>${sogae }</b>
							</c:if>
					</div>


					<br />

					<!-- Portfolio Grid Section -->
					
					<h4>
							<font color="#3DB7CC"> 프로젝트</font>
						</h4>
					<section id="portfolio" class="bg-light-gray">
					<div class="row">
						<c:forEach items="${vector}" var="pDto">
							<div class="col-md-4 col-sm-6 portfolio-item">
								<a href=".${pDto.title }" class="portfolio-link"
									data-toggle="modal">
									<div class="portfolio-hover">
										<div class="portfolio-hover-content">
											<i class="fa fa-plus fa-3x"></i>
										</div>
									</div>
									<div class="crop">
										<img src="upload/${pDto.main_image }" alt="${pDto.contents }">
									</div>
								</a>
								<div class="portfolio-caption">
									<h4>${pDto.title}</h4>
									<p class="text-muted">
										<c:if test="${pDto.category == 2 }" var="category">개발</c:if>
										<c:if test="${pDto.category == 1 }" var="category">디자인</c:if>
									</p>
								</div>
							</div>
						</c:forEach>

					</div>
				
				</section>

				<c:forEach items="${vector}" var="pDto">
					<div class="portfolio-modal modal fade ${pDto.title }"
						tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-content">
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl"></div>
								</div>
							</div>
							<div class="container">
								<div class="row">
									<div class="col-lg-8 col-lg-offset-2">
										<div class="modal-body">
											<!-- Project Details Go Here -->
											<h2>${pDto.title }</h2>
											<img class="img-responsive" src="upload/${pDto.main_image }"
												alt="" align="center">
											<div>${pDto.contents }</div>
											<br />
											<ul class="list-inline">
												<li>${pDto.start }-${pDto.end }</li>
												<c:if test="${pDto.category == 1 }">
													<li>Category: 디자인</li>
												</c:if>
												<c:if test="${pDto.category == 2 }">
													<li>Category: 개발</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  1}">
													<li>Category_Detail: 웹</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  2}">
													<li>Category_Detail: 애플리케이션</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  3}">
													<li>Category_Detail: 워드프레스</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  4}">
													<li>Category_Detail: 퍼블리싱</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  5}">
													<li>Category_Detail: 커머스, 쇼핑몰</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  6}">
													<li>Category_Detail: 일반 소프트웨어</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  7}">
													<li>Category_Detail: 임베디드</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  8}">
													<li>Category_Detail: 기타</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  9}">
													<li>Category_Detail: 웹</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  10}">
													<li>Category_Detail: 애플리케이션</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  11}">
													<li>Category_Detail: 제품</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  12}">
													<li>Category_Detail: 프레젠테이션</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  13}">
													<li>Category_Detail: 인쇄물</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  14}">
													<li>Category_Detail: 커머스, 쇼핑몰</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  15}">
													<li>Category_Detail: 로고</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  16}">
													<li>Category_Detail: 영상</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  17}">
													<li>Category_Detail: 그래픽</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  18}">
													<li>Category_Detail: 기타</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  19}">
													<li>Category_Detail: 게임</li>
												</c:if>
												<c:if test="${pDto.category_sub ==  20}">
													<li>Category_Detail: 게임</li>
												</c:if>
											</ul>
											<button type="button" class="btn btn-primary"
												data-dismiss="modal">
												<i class="fa fa-times"></i> Close Project
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- jQuery -->
				<script src="js/jquery.js"></script>

				<!-- Bootstrap Core JavaScript -->
				<script src="js/bootstrap.min.js"></script>

				<!-- Plugin JavaScript -->
				<script
					src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
				<script src="js/classie.js"></script>
				<script src="js/cbpAnimatedHeader.js"></script>

				<!-- Contact Form JavaScript -->
				<script src="js/jqBootstrapValidation.js"></script>
				<script src="js/contact_me.js"></script>

				<!-- Custom Theme JavaScript -->
				<script src="js/agency.js"></script>
				<br/><br/>
				<form method="post" action="/pfinal/pfinal.do">
					<button class="btn btn-lg btn-default js-disable-on-click" name="command" value="client_index">홈으로</button>
			</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>


