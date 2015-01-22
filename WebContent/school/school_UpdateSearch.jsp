<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String schoolid = request.getParameter("schoolid");
	System.out.println(schoolid);
	//request.setAttribute("rsschoolid", schoolid);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function checkfrm() {
		if (document.frm.schoolname.value == ""
				|| document.frm.schoolname.value == null) {
			alert("학교를 입력하세요");
			return;
		}
		document.frm.submit();
	}
</script>

</head>
<body>
	${SchoolChk } ${schoolname } 업데이트

	<form name="frm" method="post"
		action="/pfinal/pfinal.do?command=updateschoolsc">
		<table border="1">
			<tr>
				<td colspan="2">학교 이름 검색</td>
				<!-- colspan : 셀을 합칠때 사용  -->
			</tr>
			<tr>
				<td><input type="text" name="schoolname" size="20" /></td>
				<input type="hidden" name="nowschoolnumber" value="${schoolid }">
				<td><input type="button" value="검색" onclick="checkfrm()" /></td>
			</tr>
		</table>
	</form>



	<c:if test="${schoolResultChk=='yes'}">

		<c:forEach items="${schoolUpdateResult}" var="dto">
			<form method="post" action="/pfinal/pfinal.do">
				<div>
					<div>
						<input type="hidden" name="schoolnumber" value="${dto.number }">
						<input type="hidden" name="schoolname" value="${dto.name }">
						<input type="hidden" name="nowschoolnumber" value="${nowschoolnumber}">
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