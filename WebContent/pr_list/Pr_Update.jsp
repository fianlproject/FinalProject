<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function fnIsNull() {

		var pr_subject = document.getElementById("pr_subject").value;

		if (pr_subject == "") {
			alert("제목을 입력해주세요..");
		} else {
			document.pr_update.submit();
		}
	}
</script>

${pr_id }
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>리스트 글 수정하기</title>
</head>
<!-- 
<form name="pr_write" method="post" enctype="multipart/form-data"
	action="/pfinal/pfinal.do">
	<input type="hidden" name="command" value="prwriteProc" />
	 -->

<body>

	<form name="pr_update" method="post"
		action="/pfinal/pfinal.do?command=prupdateProc"
		enctype="multipart/form-data">
		<input type="hidden" name="pr_id" value="${pr_id }"> <input
			type="hidden" name="uppr_photo" value="${pr_photo }">

		<table width=80% cellspacing=0 cellpadding=3 align=center>
			<tr>
				<td width=10%>제 목</td>
				<td width=90%><textarea name="pr_subject" id="pr_subject"
						rows="1" cols="50">${pr_subject}</textarea></td>
			</tr>
			<tr>

				<td width=10%>내 용</td>
				<td width=90%><textarea name="pr_content" id="pr_content"
						rows="10" cols="50"> ${pr_content}</textarea></td>
			</tr>
			<tr>
				<td width=10%>파일 업로드</td>
				<td width=50%><input type="file" name="pr_photo" id="pr_photo"
					size=40> ${pr_photo}</td>

			</tr>
			<tr>
				<td>사진삭제<input type="checkbox" name="deletephoto" value="deletephoto">
				</td>
			</tr>
			
			<tr>
				<td><input type="button" value="수정" onclick="fnIsNull()"></td>
			</tr>
		</table>
	</form>
</body>

</html>
