<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script>
	function KeyWordCheck() {
		if (document.search.keyWord.value == "") {
			alert("검색어를 입력하세요.");
		} else {
			document.search.submit();
		}
	}
</script>

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

	이곳은 리스트 입니다 ㅋ
	<%
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");

	if (keyField == null) {
		keyField = "pr_skill";
	}
	if (keyWord == null) {
		keyWord = "";
	}
%>
	<div class="page">
		<div class="content">
			<div class="content-header">
				<h3 class="header-text">파트너 찾기</h3>
			</div>

			<div class="content-inner">
				<section class="project-unit"> <c:forEach
					items="${mdtoList}" var="dto">
					<!-- 전체링크 -->

					<div class="project-unit-heading">
						<form method="post" action="/pfinal/pfinal.do">
							<p>
								<input type="hidden" name="app_id" value="${dto.id}">
								<button class="btn btn-link pl" name="command"
									value="info">
									<h4 class="project-title">${dto.id}</h4>
								</button>
							</p>

							<span class="label label-sm label-partners-availability possible">활동가능</span>
						</form>
					</div>

					<hr size="10">
				</c:forEach> </section>
			</div>
		</div>
	</div>
</body>
</html>

