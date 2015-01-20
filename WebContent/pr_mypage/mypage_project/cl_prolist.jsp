<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>지원자 목록</title>

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
					<h3 class="header-text">지원자 목록</h3>
				</div>

				<div class="content-header">
					<div class="form-group">
					
						<table class="table table-hover">
							<tdead>
							<tr>
								<th>지원자</th>
								<th>프로젝트</th>
								<th>희망금액</th>
								<th>희망기간</th>
								<th>지원내용</th>
								<th>지출금액</th>
								<th>예상기간</th>
								<th>상태</th>							
								<th>확인</th> 							
							</tr>
							</tdead>
							<tbody>
								<c:forEach var="i" items="${prolist}">
									<c:if test="${i.cl_del == 0 }">
										<tr>
											<c:if test="${i.f_del == 0}">
												<form method="post" action="/pfinal/pfinal.do">
													<input type="hidden" name="command" value="info" /> <input
														type="hidden" name="app_id" value="${i.app_id}" />
													<td>
														<button type="submit" class="btn">${i.app_id}</button>
													</td>
												</form>
											</c:if>
											<c:if test="${i.f_del == 1 }">
												<td>${i.app_id}</td>												
											</c:if>
											<form method="post" action="/pfinal/pfinal.do">
												<td>${i.pr_subject}</td>
												<td><fmt:formatNumber value="${i.hprice}" type="currency" /></td>
												<td>${i.hday}일</td>
												<td>${i.app_con}</td>
												<td><fmt:formatNumber value="${i.nprice}" type="currency" /></td>
												<td>${i.nday}일</td>
												<td> 
															<c:if test="${i.check==0}">
															<select name="check">
																<option value="">선택</option>
																<option value="0" selected="selected">지원요청</option>
																<option value="1">협상중</option>
															</select>	
															</c:if>
															<c:if test="${i.check==1}">
															<select name="check">
																<option value="">선택</option> 
																<option value="1" selected="selected">협상중</option>
																<option value="2">거절</option>
															</select>
															</c:if>
															<c:if test="${i.check==2}">
																거절
															</c:if>
															<c:if test="${i.check==3 and i.fcheck == 0}">
																프리랜서 승인 대기중
															</c:if>
															<c:if test="${i.check==3 and i.fcheck == 1}">
																승인
															</c:if>
															<c:if test="${i.check==4}">
																협상 거절
															</c:if>
														</td>
											<c:if test="${i.check != 2 and i.check != 3 and i.f_del != 1}">
												<td>
													<input type="hidden" name="command"	value="check_update" />
													<input type="hidden" name="pr_id" value="${i.pr_id}" />
													<input type="hidden" name="app_id" value="${i.app_id}" />
													<button type="submit" class="btn">상태 업데이트</button>
												</td>
											</c:if>											
									</c:if>
									<c:if test="${i.f_del == 1 and i.check != 4}">
										<td>지원자가 지원을 취소한 상태 입니다.</td>
									</c:if>
									</form>
									<form method="post" action="/pfinal/pfinal.do">
										<input type="hidden" name="command" value="cl_del" />
										<input type="hidden" name="pr_id" value="${i.pr_id}" />
										<input type="hidden" name="app_id" value="${i.app_id}" />
										<c:if test="${i.check ==2 or i.f_del == 1}">
											<td><button type="submit">삭제</button></td>
										</c:if>
									</form>


									<form method="post" action="/pfinal/pfinal.do">
										<input type="hidden" name="command" value="cl_agree" />
										<input type="hidden" name="pr_id" value="${i.pr_id}" />
										<input type="hidden" name="app_id" value="${i.app_id}" />
										<c:if test="${i.fcheck == 0 and i.check == 1}">
											<td><button type="submit">최종승인</button></td>
										</c:if>
										<c:if test="${i.fcheck == 1}">
											<td>프로젝트 진행중</td>
										</c:if>
									</form>
									</tr>									
								</c:forEach>
							</tbody>
						</table>
						<br />
						<a href="/pfinal/pfinal.do?command=client_index" 
						class="btn btn-lg btn-client js-disable-on-click btn-submit">홈으로</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


