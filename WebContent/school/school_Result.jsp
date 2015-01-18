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
	${schoolResultChk }

	<c:if test="${schoolResultChk=='yes'}">
		<div style="overflow: scroll; width: 570px; height: 600px;">
			<c:forEach items="${schoolResult}" var="dto">
				<form method="post" name="frm"
					action="/pfinal/pfinal.do?command=myschoolenter">
					<div>
						<div>
							<input type="hidden" name="schoolnumber" id="schoolnumber"
								value="${dto.number }"> <input type="hidden"
								name="schoolname" id="schoolname" value="${dto.name}">
							<button onclick="fnWindowClose()">
								<div>${dto.name}</div>
							</button>

							<div>${dto.address }</div>
						</div>
					</div>

				</form>
			</c:forEach>
		</div>
	</c:if>

	<c:if test="${schoolResultChk=='no'}">
		<script>
			alert("학교가 없습니다.");
			history.back();
		</script>
	</c:if>

	<script>
		function fnWindowClose() {
			/*
			var schoolnumber = document.getElementById("schoolnumber").value;
			var schoolname = encodeURIComponent(document
					.getElementById("schoolname").value);
			alert( encodeURIComponent(schoolname));
			 */
			/*
			window.opener.location.href = "/pfinal/pfinal.do?command=myschoolenter&schoolnumber="
					+ schoolnumber + "&schoolname=" + schoolname;
			 */

			document.frm.submit();
			window.close();
			//document.getElementById("search").submit();

		}
	</script>


</body>
</html>