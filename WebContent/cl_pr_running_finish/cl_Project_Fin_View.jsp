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
<!-- 	이곳은 상세내용 입니다 ㅋ -->
	<%-- 	<br /> ${dtoGetBoard2.pr_id } --%>


	<div class="container">
		<div class="row">
			<div class="span8">
				<div class="page" align="center">
					<div class="content span8">
							<div class="content-header">
								<h1 class="header-text">${Dto1.pr_subject}</h1>
								<div class=".help-text"><c:if test="${count2!=0 }">${count2 }명의</c:if>프리랜서가 평가한 평가 내용입니다.</div>
							</div>
							
							<div class="content-header">
								<div class="summary">
								<c:if test="${!empty fr_id }">
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
												<div>한마디 : ${dto2.fr_comment} </div>
											</c:if>
										</c:forTokens>
									</c:forEach>
								</c:if>
								</div>
							</div>
							<c:if test="${evals != null }">
							<c:forEach items="${dtoGetBoard2 }" var="dto4" begin="0" end="0">
							<c:if test="${dto4.fr_evaluate != null }">
							<div class="content-header">
								<table id="datatable" style="visibility: hidden;">
									<thead>
										<tr>
											<th>평가</th>
											<th>점수</th>
										</tr>
									</thead>
									<tbody>
										<c:forTokens items="${evals}" delims="," var="eval" varStatus="status">
											<tr class="test">
												<c:if test="${status.count == 1 }">
												<td>전문성</td>
												<td>${eval}</td>
												</c:if>
												<c:if test="${status.count == 2 }">
												<td>사전준비</td>
												<td>${eval}</td>
												</c:if>
												<c:if test="${status.count == 3 }">
												<td>의사소통</td>
												<td>${eval}</td>
												</c:if>
												<c:if test="${status.count == 4 }">
												<td>일정준수</td>
												<td>${eval}</td>
												</c:if>
												<c:if test="${status.count == 5 }">
												<td>적극성</td>
												<td>${eval}</td>
												</c:if>
											
											</tr>
										</c:forTokens>
									</tbody>
								</table>
								<div id="container"
									style="width: 400px; height: 400px; margin: 0 auto"></div>
							</div>
						</c:if>
						<c:if test="${dto4.fr_evaluate == null }">
						<div class="content-header">
							<div>아직 평가 되지 않았습니다.</div>
						</div>
						</c:if>
						</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div align="center">
		<form method="post" action="/pfinal/pfinal.do">
			<button class="btn btn-default active" name="command" value="back">돌아가기</button>
			<input type="hidden" value="${pr_id }" name="pr_id" />
		</form>
		</div>
	</div>
	<script>
		$(function() {
			$('#container').highcharts(
					{
						data : {
							table : document.getElementById('datatable')
						},
						chart : {
							type : 'column'
						},
						title : {
							text : '평가'
						},
						yAxis : {
							allowDecimals : false,
							title : {
								text : '점수'
							}
						},
						tooltip : {
							formatter : function() {
								return '<b>' + this.series.name + '</b><br/>'
										+ this.point.name.toLowerCase() + ' '
										+ this.point.y + '점';
							}
						}
					});
		});
	</script>
</body>
</html>