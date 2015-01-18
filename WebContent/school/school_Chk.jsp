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

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function fnSchoolSearch() {
			var url="school/school_Search.jsp";
// 			location.href = url;
			window.open(url, "",	"width=570px, height=370px" );
			
		}
</script>
</head>
<body>


	${SchoolChk } ${schoolname }


	<div id="wrap">
		<div class="container">
			<div class="content">
				<div class="content-inner" style="padding-top: 15px">
					<section style="visibility: visible;" id="p5-education-section">
					<h4 class="header-text">
						최종학력<a class="btn btn-partners pull-right"
							 id="education-add-btn" href="school/school_Search.jsp">추가</a>
					</h4>

					<c:if test="${SchoolChk=='yes'}">

						<form method="post" action="/pfinal/pfinal.do">

							<table
								class="table table-responsive table-hover p5-educationalHistory-table">
								<thead>
									<tr>
										<th class="p5-head-schoolName">학교명</th>
										<th class="p5-head-major">전공</th>
										<th class="p5-head-status">상태</th>
										<th class="p5-head-tool">도구</th>
									</tr>
								</thead>

								<c:forEach items="${mySchoolList}" var="dto">
									<tbody>
										<tr>
											<td class="p5-head-schoolName">${dto.schoolname }</td>
											<td class="p5-head-major">${dto.schoolmajor }</td>
											<td class="p5-head-status">${dto.schoolstate }</td>
											<td class="p5-body-tool"><a
												class="btn btn-default btn-sm skill-edit-btn"
												href="school/school_UpdateSearch.jsp?schoolid=${dto.schoolid }">수정</a>
												<a class="btn btn-default btn-sm skill-edit-btn"
												href="/pfinal/pfinal.do?command=myschooldelete&schoolid=${dto.schoolid }">삭제</a>

										</tr>
									</tbody>
								</c:forEach>

							</table>
						</form>
					</c:if> </section>
				</div>
			</div>
		</div>
	</div>

</body>
</html>