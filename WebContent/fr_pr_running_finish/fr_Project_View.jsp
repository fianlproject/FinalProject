<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//Ddiv HTML 4.01 divansitional//EN" "http://www.w3.org/div/html4/loose.ddiv">
<html>
<head>

<!-- Custom CSS -->
<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="js/highcharts.js"></script>
<script src="js/modules/exporting.js"></script>
<script src="js/modules/data.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	이곳은 상세내용 입니다 ㅋ
	<%-- 	<br /> ${dtoGetBoard2.pr_id } --%>


	<div class="container">
		<div class="row">
			<div class="span8">
				<div class="page" align="center">
					<div class="content span8">
						<c:if test="${flag == 'N' }">
							<div class="content-header">
								<h1 class="header-text">${Dto1.pr_subject}</h1>
							</div>
							<div class="content-header">
								<div class="summary">

									<div>
										프로젝트 참여자 :
										<c:forTokens items="${fr_id}" delims="," var="dto">
											<span class="label label-sm label-open">${dto}</span>
										</c:forTokens>
									</div>
									<c:forEach items="${dtoGetBoard2 }" var="dto2" begin="0"
										varStatus="status">
										<%-- 								 	<span class="label label-sm label-open">${fr_id[status.count]}</span> --%>
										<c:forTokens items="${fr_id}" delims="," var="dto">
											<c:if test="${dto2.fr_id eq dto }">
												<h1 class="header-text">${dto}</h1>
												<div>시작일 : ${dto2.start_day }</div>
												<div>
													총 비용 :
													<fmt:formatNumber value="${dto2.fin_price}" type="currency" />
												</div>
												<div>시작일로 부터 현재까지 : ${dto2.total_day } 일 소요</div>
											</c:if>
										</c:forTokens>
									</c:forEach>
								</div>
							</div>
						</c:if>
						<c:if test="${flag =='F' }">
							<div class="content-header">
								<h1 class="header-text">${Dto1.pr_subject}</h1>
							</div>
							<div class="content-header">
								<div class="summary">

									<div>
										프로젝트 참여자 :
										<c:forTokens items="${fr_id}" delims="," var="dto">
											<span class="label label-sm label-open">${dto}</span>
										</c:forTokens>
									</div>
									<c:forEach items="${dtoGetBoard2 }" var="dto2" begin="0"
										varStatus="status">
										<c:forTokens items="${fr_id}" delims="," var="dto">
											<c:if test="${dto2.fr_id eq dto }">
												<h1 class="header-text">${dto}</h1>
												<div>시작일 : ${dto2.start_day }</div>
												<div>
													총 비용 :
													<fmt:formatNumber value="${dto2.fin_price}" type="currency" />
												</div>
												<div>진행기간 : ${dto2.total_day } 일 소요</div>
											</c:if>
										</c:forTokens>
									</c:forEach>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${flag =='F' }">
		<form method="post" action="/pfinal/pfinal.do">
<!-- 			<button class="btn btn-link pl" name="command" value="frevaluatewrite">프로젝트 평가하기</button> -->
			<button class="btn btn-link pl" name="command" value="frback">취소</button>
			<input type="text" value="${pr_id }" name="pr_id" />
		</form>
		</c:if>
		<c:if test="${flag =='N' }">
		<form method="post" action="/pfinal/pfinal.do">
<!-- 			<button class="btn btn-link pl" name="command" value="frfinprojectup">프로젝트 완료하기</button> -->
			<button class="btn btn-link pl" name="command" value="frback">취소</button>
			<input type="text" value="${pr_id }" name="pr_id" />
		</form>
		</c:if>
	</div>
</body>
</html>