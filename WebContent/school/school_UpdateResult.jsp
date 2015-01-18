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


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>학교 결과</title>
</head>
<body>

	<c:if test="${schoolResultChk=='yes'}">

	<c:forEach items="${schoolUpdateResult}" var="dto">
		<form method="post" action="/pfinal/pfinal.do">
			<div>
				<div>
					<input type="hidden" name="schoolnumber" value="${dto.number }">
					<input type="hidden" name="schoolname" value="${dto.name }">
					<button name="command" value="myschoolupdateenter">
						<div>${dto.name }</div>
					</button>

					<div>${dto.address }</div>
				</div>
			</div>
		</form>
	</c:forEach>
	</c:if>

	<c:if test="${schoolResultChk=='no'}">
		<script>
			alert("학교가 없습니다.");
			history.back();
		</script>
	</c:if>



</body>
</html>