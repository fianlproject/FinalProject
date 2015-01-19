<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<body class="project-list">

	
	<div class="page">
		<div class="content">
			<div class="content-header">
				<h3 class="header-text">진행 프로젝트 목록</h3>
			</div>
			<div class="content-inner">
				<section class="project-unit">
				<c:if test="${!empty dtoList1 }">
				<c:forEach items="${dtoList1}" var="dto" varStatus="status">
				<span>${status.count}</span>
				<c:if test="${dto.evaluate == null}">
					<form method="post" action="/pfinal/pfinal.do?command=finview" id="${pr_id }" name="${pr_id }">
					<div class="project-unit-heading">
					${dto.pr_subject }
					</div>
					<div class="project-unit-body">
						<div class="project-unit-basic-info">
							<span><i class="fa fa-won"></i>금액 <fmt:formatNumber value="${dto.total_price}" type="currency" /></span> 
							<span class="applied"><i class="fa fa-pencil"></i>총 ${dto.fr_ids }명 지원</span>
							<span class="applied"><i class="fa fa-pencil"></i>진행률??</span>
						</div>
						<div class="project-unit-desc">
							<p></p>
						</div>
						<button class="btn btn-warning active" value="${dto.pr_id }" id="num" >프로젝트 완료하기</button>
					</div>
					<c:if test="${status.count != count1}">
					<hr size="10">
					</c:if>
					<input type="hidden" name="count" value="${status.count }"	/>
					<input type="hidden" name="pr_id" id="pr_id" value="${dto.pr_id}" />
					<input type="hidden" name="pr_subject" id="pr_subject" value="${dto.pr_subject }" />
					</form>
				</c:if>
				</c:forEach> 
				</c:if>
				<c:if test="${empty dtoList1}">
					<h3 class="header-text">
						진행중인 프로젝트가 없습니다.
					</h3>
				</c:if>
				</section>
			</div>
		</div>
	</div>
	<div class="page">
		<div class="content">
			<div class="content-header">
				<h3 class="header-text">완료 프로젝트 목록</h3>
			</div>
			<div class="content-inner">
<!-- 			<form name="evaluate" method="post" action="/pfinal/pfinal.do?command=evaluateup"> -->
				<section class="project-unit">
				<c:if test="${!empty dtoList2 }">
				<c:forEach items="${dtoList2}" var="dto" varStatus="status">
				<c:if test="${dto.evaluate == null or empty dto.evaluate}">
					<form action="/pfinal/pfinal.do?" method="post" name="${pr_id }" id="${pr_id }">
					<div class="project-unit-heading">
					${dto.pr_subject }
					</div>
					<div class="project-unit-body">
						<div class="project-unit-basic-info">
							<span><i class="fa fa-won"></i>금액 <fmt:formatNumber value="${dto.total_price}" type="currency" /></span> 
							<span class="applied"><i class="fa fa-pencil"></i>총 ${dto.fr_ids }명 지원</span>
							<span class="applied"><i class="fa fa-pencil"></i>총 계약 기간 : ${dto.total_day}</span>
							<span class="date-recruitment">등록일 ${dto.start_day}</span>
							<span class="date-recruitment">마감일 ${dto.end_day}</span>
						</div>
						<div class="project-unit-desc">
							<p></p>
						</div>
						<button class="btn btn-client active"  id="command" name="command" value="evaluatewrite">프로젝트 평가하기</button>
						<button class="btn btn-default active" id="command" name="command" value="projectfin">프로젝트 보기</button>
					</div>
					<c:if test="${status.count != count2}">
					<hr size="10">
					</c:if>
					<input type="hidden" name="count" value="${status.count }"	/>
					<input type="hidden" name="pr_id" id="pr_id" value="${dto.pr_id}" />
					<input type="hidden" name="pr_subject" id="pr_subject" value="${dto.pr_subject }" />
					</form>
				</c:if>
				<c:if test="${!empty dto.evaluate or dto.evaluate != null}">
				<form id="${pr_id }" name="${pr_id }" method="post" action="/pfinal/pfinal.do">
					<div class="project-unit-heading">
					${dto.pr_subject }
					</div>
					<div class="project-unit-body">
						<div class="project-unit-basic-info">
							<span><i class="fa fa-won"></i>금액 <fmt:formatNumber value="${dto.total_price}" type="currency" /></span> 
							<span class="applied"><i class="fa fa-pencil"></i>총 ${dto.fr_ids }명 지원</span>
							<span class="applied"><i class="fa fa-pencil"></i>총 계약 기간 : ${dto.total_day}</span>
							<span class="date-recruitment">등록일 ${dto.start_day}</span>
							<span class="date-recruitment">마감일 ${dto.end_day}</span>
						</div>
						<div class="project-unit-desc">
							<p>평가된 프로젝트</p>
						</div>
						<button class="btn btn-default active" name="command" value="projectfinview">평가 및 자세히 보기</button>
					</div>
					<input type="hidden" name="pr_id" id="pr_id" value="${dto.pr_id}" />
					<input type="hidden" name="pr_subject" id="pr_subject" value="${dto.pr_subject }" />
					<c:if test="${status.count != count2}">
					<hr size="10">
					</c:if>
				</form>
				</c:if>
				</c:forEach> 
				</c:if>
				<c:if test="${empty dtoList2}">
					<h3 class="header-text">
						완료된 프로젝트가 없습니다.
					</h3>
				</c:if>
				</section>
			</div>
		</div>
	</div>
			<div align="center">
				<form method="post" action="/pfinal/pfinal.do">
				<button class="btn btn-default pl" name="command" value="home" >홈으로</button>
				</form>
				</div>
	<script>
	function KeyWordCheck() {
		if (document.search.keyWord.value == "") {
			alert("검색어를 입력하세요.");
		} else {
			document.search.submit();
		}
	}
// 	function fnView(f){
// 		var pr_id = document.getElementById("num").value;
// 		alert(pr_id);
// 		window.location.href = "/pfinal/pfinal.do?command=projectfinview";
// 	}
// 	function fnViewfin(f){
// 		window.location.href = "/pfinal/pfinal.do?command=projectfin";
// 	}
</script>

</body>
</html>

