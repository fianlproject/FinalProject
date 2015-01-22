<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<title>쪽지보관함</title>
<link href="css/bootstrap.css" rel="stylesheet">

<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">
<style type="text/css">
<!--
A:link {
	color: #0033cc;
	text-decoration: none
}

A:visited {
	color: #0033cc;
	text-decoration: none
}

A:active {
	color: #006600;
	text-decoration: none
}

A:hover {
	color: #ff6600;
	text-decoration: none
}
-->
</style>
</head>
<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						쪽지함 <small class="small-text">내용을 상세하게 작성해주세요.</small>
					</h3>
				</div>
				
				<div class="content" align="center">
					<div class="row">
						<div class="span12">
							<form name="body" id="body">
								<!-- 머릿말 부분.  -->
								<div style="width: 90%;" name="msgList" id="msgList"
									class="span12">
									<h2>${id}님의 쪽지보관함입니다.</h2>
									<table class="table table-bordered table-hover table-condensed">
										<!-- 제목 부분.  -->
										<tr>
											<td><input type="checkbox" id="msg_chk_all"
												name="msg_chk_all" value=" " onchange="fnchkall(this.form)" /></td>
											<th>메세지</th>
											<th>보낸 친구</th>
											<th>보낸 날짜</th>
										</tr>

										<!--  메시지 목록.  -->
										<c:forEach items="${MsgList}" var="dto">
											<c:choose>
												<c:when test="${!empty MsgList}">
													<c:if test="${dto.read_status == 0 }">
														<tr>
															<td><input type="checkbox" id="msg_chk"
																name="msg_chk" value="${dto.msg_id}" /></td>
															<td><div>
																	<b><a
																		href="/pfinal/pfinal.do?command=messagedetail&msg_id=${dto.msg_id }">${dto.msg_content }</a></b>
																</div></td>
															<td><b>${dto.send_id }</b></td>
															<td><b>${dto.send_date }</b></td>
														</tr>
													</c:if>
													<c:if test="${dto.read_status == 1 }">
														<tr>
															<td><input type="checkbox" id="msg_chk"
																name="msg_chk" value="${dto.msg_id}" /></td>
															<td><div>
																	<a href="/pfinal/pfinal.do?command=messagedetail&msg_id=${dto.msg_id }">${dto.msg_content }</a>
																</div></td>
															<td>${dto.send_id }</td>
															<td>${dto.send_date }</td>
														</tr>
													</c:if>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="4" align="center">
														<div>받은 쪽지가 없습니다.</div>
														</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</table>
								</div>
								<br />
								<br />
								<div class="span12">
									<div style="float: left">
										<input type="button" value="메세지 보내기" onclick="fnWrite()"
											class="btn btn-lg btn-client btn-submit" />
									</div>
									<div style="float: left;">
										<input type="button" id="msgdel" name="msgdel" value="선택항목 삭제"
											onclick="fndelmsg(this.form)"
											class="btn btn-lg btn-client btn-submit" />
									</div>
									<div style="float: left">
										<input type="button" value="홈으로" onclick="fnBack()"
											class="btn btn-lg btn-default js-disable-on-click" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		//메세지 작성
		function fnWrite() {
			window.open("/pfinal/pfinal.do?command=messagewrite", "",
					"width=570, height=370");
		}
		function fnWriteDetail() {
			window.open("/pfinal/pfinal.do?command=messagewritedetail", "",
					"width=570, height=370");
		}
		// 뒤로 돌아가기
		function fnBack() {
			document.getElementById("body").submit();
			var url = "/pfinal/pfinal.do?command=free_index";
			location.href = url;
		}
		//전체 체크해제 함수
		function fnchkall(f) {
			if (f.msg_chk_all.checked) {
				//태그네임으로 체크걸면 항목1개 일때 못찾음,
				//체크박스 이름으로는 아예 못찾음
				//엘레먼츠로 해야 인식함?!
				//Dom 시르다. ㅠㅠ
				for (var i = 0; i < f.getElementsByTagName("input").length; i++) {
					//alert(i);
					f.elements[i].checked = true;
				}
			} else {
				//전체 체크 해제
				for (var i = 0; i < f.getElementsByTagName("input").length; i++) {
					f.elements[i].checked = false;
				}
			}

		}
		//체크 메세지 삭제
		function fndelmsg(f) {
			var ids = new Array();
			var j = 0;
			//alert(f.elements.length);
			for (var i = 1; i < f.getElementsByTagName("input").length - 2; i++) {
				if (f.elements[i].checked) {
					//alert(f.elements[i].value);
					ids[j] = f.elements[i].value;
					j += 1;
				}
			}
			ids.sort();
			var ids2 = ids.join(", ").trim();
			url = "/pfinal/pfinal.do?command=messagedelete&msg_ids=" + ids2;
			//alert(url);
			location.href = url;

		}
	</script>
</body>
</html>