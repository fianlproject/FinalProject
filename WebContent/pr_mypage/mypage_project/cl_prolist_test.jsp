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
<title>기업 임시 프로젝트</title>

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
					<h3 class="header-text">임시 프로젝트</h3>
				</div>
				<div class="content-header">
					<div class="form-group">

						<table class="table table-hover">
							<tdead>
							<tr>
								<th>프로젝트</th>
								<th>지원 인원</th>
							</tr>
							</tdead>

							<tbody>
								<c:forEach var="i" items="${prolist}">
									<tr>
										<td>
											<form method="post" action="/pfinal/pfinal.do">
												<input type="hidden" name="command" value="cl_prolist" /> <input
													type="hidden" name="sub123" value="${i.pr_subject}" />
												<button type="submit" class="btn">${i.pr_subject}</button>
											</form>
										</td>
										<td>${i.pr_cntman}명</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br /> <a href="/pfinal/pfinal.do?command=pindex"
							class="btn btn-lg btn-client js-disable-on-click btn-submit">홈으로</a>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>


