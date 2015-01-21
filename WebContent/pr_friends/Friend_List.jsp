<%@page import="java.util.Vector"%>
<%@page import="dto.JoinDto"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
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
<script src="http://code.jquery.com/jquery-2.1.1.js"></script>
<title>친구목록</title>

<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">
</head>
<br />
<body>
	<!-- 친구 목록 -->
<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						나의 친구목록 <small class="small-text">친구목록입니다.</small>
					</h3>
				</div>
				<div class="content-header">
					<form action="/pfinal/pfinal.do" method="post" id="fListItem">

						<div class="form-group">
							<span>${id}님의 친구 목록</span>
							<table class="table">
								<thead>
									<tr>
										<th>구분</th>
										<th>아이디</th>
										<th>전화번호</th>
										<th>삭제</th>
									</tr>
								</thead>
								<c:forEach var="frdto" items="${vector}" varStatus="status">
									<c:if test="${frdto.id != id}">
										<tr>
											<td>${status.count }</td>
											<td>${frdto.id }</td>
											<td>${frdto.tel }</td>
											<td><button
													onclick="subform(this.form, 'pfinal.do?command=deletefriend')"
													class="btn" value="${status.count}" name="del">삭제</button></td>
										</tr>
									</c:if>
									<input type="hidden" name="command" id="command"
										value="deletefriend" />
									<input type="hidden" name="fid" id="fid" value="${frdto.id}" />
								</c:forEach>


								<c:forEach var="frdto" items="${vector}" varStatus="status">
									<c:if test="${frdto.id != id}">
										<input type="checkbox" value="${frdto.name}" name="friend_id"
											id="friend_id">${frdto.id}							
						
								</c:if>
									<input type="hidden" name="command" id="command"
										value="deletefriend" />
									<input type="hidden" name="fid" id="fid" value="${frdto.id}" />
								</c:forEach>


							</table>
						</div>
					</form>
					<hr />
					<!-- 검색창 부분. -->
					<div class="container">
						<div class="row">
							<form method="post" action="pfinal.do?command=find">
								<div class="input-append">
									<input type="text" name="frSearch" id="frSearch"
										placeholder="아이디" /> <input class="btn" type="button" value="아이디 검색"
										onclick="fnfrsearch(this.form)" />
								</div>
							</form>

							<!-- 검색 결과창 -->

							<div class="FrResult">
								<c:choose>
									<c:when test="${empty searchdto}">
					<font color="red">검색결과가 없습니다.</font>
					</c:when>
									<c:when test="${!empty searchdto }">
										<!-- 본인 제외 -->
										<form method="post" action="pfinal.do?command=invitefriends">
											<table class="table">
												<thead>
													<tr>
														<th>아이디</th>
														<th>전화번호</th>
														<th>신청</th>
													</tr>
												</thead>

												<c:forEach var="srv" items="${searchdto }">
													<c:choose>
														<c:when test="${srv.id != id }">
															<tr>
																<td>${srv.id}</td>
																<td>${srv.tel}</td>
																<td><button type="submit" class="btn">친구
																		신청</button></td>
															</tr>
															<input type="hidden" name="fid" id="fid"
																value="${srv.id}" />
														</c:when>
													</c:choose>
												</c:forEach>
											</table>
										</form>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>

					<!--  친구 신청 수락 대기 목록. -->
					<div class="container">
						<div class="row">
							<c:forEach var="frlist" items="${frvector}">
								<form method="post">
									<input type="hidden" name="flag" value="3" />
									<table class="table">
										<thead>
											<tr>
												<th>이름</th>
												<th>전화번호</th>
												<th>수락</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tr>
											<td>${frlist.name}</td>
											<td>${frlist.tel}</td>
											<td><button
													onclick="subform(this.form, 'pfinal.do?command=resfriend')"
													class="btn">친구 수락</button></td>
											<td><button
													onclick="subform(this.form, 'pfinal.do?command=deletefriend')"
													class="btn">삭제</button></td>
										</tr>
									</table>
									<input type="hidden" name="fid" id="fid" value="${frlist.id}" />
								</form>
							</c:forEach><br/>
							<form method="post" action="/pfinal/pfinal.do">
								<Button class="btn btn-lg btn-default js-disable-on-click" name="command" value="mypage">마이페이지</Button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function fnfrsearch(f) {//fSearch 폼(검색창)

			//검색창 조건 검사
			if (f.frSearch.value == null || f.frSearch.value == "") {
				alert("추가할 친구의 이메일을 적어주세요.");
			} else {
				f.submit();
			}
		}
		function subform(f, act) {
			f.action = act;
			f.submit();
		}
	</script>
</body>
</html>