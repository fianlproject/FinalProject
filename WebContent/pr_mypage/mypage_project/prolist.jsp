<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/tdemes/smootdness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>프리랜서 임시 프로젝트</title>

<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">

</head>
<br/>
<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">나의 임시 프로젝트</h3>
				</div>

				<div class="content-header">
					<div class="form-group">

						<table class="table table-hover">
							<tdead>
								<tr>
									<th>상태</th>
									<th>프로젝트</th>
									<th>예상금액</th>
									<th>예상기간</th> 
									<th>협상금액</th>
									<th>협상기간</th> 	
									<th>인원</th>
									<th>열람</th>
									<th>승인여부</th>
									<th>내용</th>
									<th>확인</th> 
								</tr>
							</tdead>
							
							<tbody>
								<c:forEach var="i" items="${prolist}">
									<c:if test="${i.f_del == 0}">
										<tr>
											<c:if test="${i.fcheck == 0}">
												<c:choose>
													<c:when test="${i.check==0}">
														<td><font color="red">지원중</font></td>
													</c:when>
													<c:when test="${i.check==1}">
														<td>협상중</td>
													</c:when>
													<c:when test="${i.check==2}">
														<td>거절</td>
													</c:when>
													<c:when test="${i.check==3}">
														<td><font color="blue">클라이언트 승인</font></td>
													</c:when>													
												</c:choose>
											</c:if>

											<c:if test="${i.fcheck == 1}">
												<td><font color="blue">프로젝트 진행중</font></td>
											</c:if>

											<form metdod="post" action="/pfinal/pfinal.do">
												<input type="hidden" name="command" value="getboard" />
												<input type="hidden" name="pr_id" value="${i.pr_id}" />
												<td><button type="submit">${i.pr_subject}</button></td>
											</form>

											<!-- 지원 -->
											<td><fmt:formatNumber value="${i.hprice}" type="currency" /></td>
											<td>${i.hday}일</td>
											<!-- 협상 -->
											<td><fmt:formatNumber value="${i.nprice}" type="currency" /></td>
											<td>${i.nday}일</td>
											
											<!-- 지원 -->
											<td>${i.pr_cntman}명</td>

											<c:choose>
												<c:when test="${i.readchk==0}">
													<td><font color="red">미열람</font></td>
												</c:when>
												<c:when test="${i.readchk==1}">
													<td>열람</td>
												</c:when>
											</c:choose>

											<c:choose>
												<c:when test="${i.fcheck==0 and i.check != 3}">
													<td><font color="red">미승인</font></td>
												</c:when>
												<c:when test="${i.fcheck==0 and i.check == 3}">
													<td><font color="blue">승인대기중</font></td>
												</c:when>
												<c:when test="${i.fcheck==1}">
													<td><font color="blue">승인</font></td>
												</c:when>
											</c:choose>

											<c:choose>
												<c:when test="${i.check == 3}">
													<td>${i.cl_con}</td>
												</c:when>
												<c:when test="${i.check != 3}">
													<td>내용 없음</td>
												</c:when>
											</c:choose>
											<form metdod="post" action="/pfinal/pfinal.do">
												<input type="hidden" name="command" value="refusal" />
												<input type="hidden" name="pr_id" value="${i.pr_id}" />
												<input type="hidden" name="app_id" value="${i.app_id}" />
												<c:if test="${i.check != 0 and i.check == 3 and i.fcheck == 0}">
													<td>
														<select name="check">															
															<option value="0" selected="selected">최종승인</option>
															<option value="1">거절</option>
														</select>
						 								<button type="submit" class="btn">확인</button>
													</td>
												</c:if>
												<c:if test="${i.fcheck==1 }">
													<td>최종승인 완료</td>
												</c:if>
												<c:if test="${i.check==1 }">
													<td>협상중</td>
												</c:if>
											</form>
											<form metdod="post" action="/pfinal/pfinal.do">
												<input type="hidden" name="command" value="f_del" />
												<input type="hidden" name="pr_id" value="${i.pr_id}" />
												<input type="hidden" name="app_id" value="${i.app_id}" />
												<c:if test="${i.check == 0 or i.check == 2}">
													<td><button type="submit" class="btn">삭제</button></td>
												</c:if>
											</form>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table><br/>
						<a href="/pfinal/pfinal.do?command=free_index" class="btn btn-lg btn-client js-disable-on-click btn-submit">홈으로</a>
						<a href="/pfinal/pfinal.do?command=frevaluate" class="btn btn-lg btn-client js-disable-on-click btn-submit">진행/완료 프로젝트 보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


