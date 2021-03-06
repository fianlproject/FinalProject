<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//Ddiv HTML 4.01 divansitional//EN" "http://www.w3.org/div/html4/loose.ddiv">
<html>
<head>

<!-- Custom CSS -->
<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<script src="js/jquery-2.1.1.js"></script>
<style type="text/css">
.btn-lg, .btn-group-lg > .btn {
padding: 7px 7px;
font-size: 15px;
line-height: 1.33;
border-radius: 5px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>프로젝트</title>
</head>
<br/>
<body>
	<%
		String longitude = (String) session.getAttribute("longitude");
		String latitude = (String) session.getAttribute("latitude");
		String c_name = (String) session.getAttribute("c_name");
		System.out.println(c_name+","+longitude+","+latitude);	
	%>
	<jsp:useBean id="dto" class="dto.listDto" />

	<div class="container">
		<div class="row">
			<div class="span8">
				<div class="page" align="center">
					<div class="content span8">
						<div class="content-header">
							<h1 class="header-text">${dtoGetBoard.pr_subject}</h1>
						</div>
						<div class="content-header">
							<div class="summary">
								<div class="project-meta-info well">
									<table class="table table-responsive">
										<tbody>
											<tr>
												<th align="left">등록일 :${dtoGetBoard.pr_start}</th>
												<th>마감날짜 :${dtoGetBoard.pr_end}</th>
												<th></th>
												<c:if test="${cpcheck != 1}">
												<form method="post" action="/pfinal/pfinal.do">
													<input type="hidden" name="pr_id"
														value="${dtoGetBoard.pr_id}">
													<th>지원하기  : 
														<Button type="submit" value="mup" name="command" class="btn btn-lg btn-default js-disable-on-click"> 지원</Button>
													</th>
												</form>
												</c:if>
												<c:if test="${cpcheck != 0}">												
													<th> 														
													</th>												
												</c:if>
												<th></th>
											</tr>
											<tr>
												<c:set var="week" value="${week}" />
												<c:set var="day" value="${day}" />
												<c:if test="${week!=0&&day!=0&&day>0&&week>0 and dtoGetBoard.pr_state != 'Y'}">
													<th>마감일자 :${week}주 ${day}일</th>
												</c:if>
												<c:if test="${week==0&&day!=0&&day>0 and dtoGetBoard.pr_state != 'Y'}">
													<th>마감일자 : ${day}일</th>
												</c:if>
												<c:if test="${day==0&&week!=0&&week>0 and dtoGetBoard.pr_state != 'Y'}">
													<th>마감일자 :${week}주</th>
												</c:if>
												<c:if test="${day==0&&week==0&&dtoGetBoard.pr_state eq 'X'}">
													<th>오늘마감!</th>
												</c:if>
												<c:if test="${dtoGetBoard.pr_state eq 'Y'}">
													<th>마감입니다.</th>
												</c:if>
												
												<th>예상비용 :<fmt:formatNumber value="${dtoGetBoard.pr_price}" type="currency" /></th>
												<th></th>
												<th>필요인원 :${dtoGetBoard.pr_needman }명</th>
												
											</tr>
											<tr>
												<th>회사명 :${c_name }</th>
												<th>관련기술 : ${dtoGetBoard.pr_skill }</th>

												<!--  <td><c:forEach items="${dtoGetBoard.pr_skills}" var="dto">${dto}   </c:forEach></td>-->
												<td></td>
												<th>지원인원 :${dtoGetBoard.pr_cntman}명 </th>
											</tr>
										</tbody>
									</table>
								</div>
								예상일자 : ${dtoGetBoard.pr_exday}일
								<h4>프로젝트 내용</h4>

								<p>${dtoGetBoard.pr_content }</p>
							</div>

							<c:if test="${dtoGetBoard.pr_photo!=null}">
								<img src="pr_list/upload/${dtoGetBoard.pr_photo}">
							</c:if>

							<div class="project-meta-info well">

								<div id="staticMap" style="width: 50%; height: 500px;"></div>

								<script type="text/javascript"
									src="//apis.daum.net/maps/maps3.js?apikey=3d9835e43d08f616d89784b77f22a468&libraries=services"></script>
									<!-- 3d9835e43d08f616d89784b77f22a468 -->
									<!-- a34d02ece8c5eef0e1ec0707707e38f0 내꺼 -->
									<script>
											var mapContainer = document.getElementById('staticMap'), // 지도를 표시할 div 
										    mapOption = {
										            center: new daum.maps.LatLng(<%=longitude%>,<%=latitude%>), // 지도의 중심좌표
										            level: 3 // 지도의 확대 레벨
										        };
	
											var map = new daum.maps.Map(mapContainer, mapOption);
			
											// 마커가 표시될 위치입니다
											var markerPosition  = new daum.maps.LatLng(<%=longitude%>,<%=latitude%>); 
			
											// 마커를 생성합니다
											var marker = new daum.maps.Marker({
											    position: markerPosition
											});
			
											// 마커가 지도 위에 표시되도록 설정합니다
											marker.setMap(map);
											
											
											var iwContent = '<div style="padding:5px;">${c_name}<br><a href="http://map.daum.net/link/map/${c_name},${longitude},${latitude}" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/${c_name},${longitude},${latitude}" style="color:blue" target="_blank">길찾기</a></div>', 

											// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
											    iwPosition = new daum.maps.LatLng(<%=longitude%>,<%=latitude%>); //인포윈도우 표시 위치입니다
			
											// 인포윈도우를 생성합니다
											var infowindow = new daum.maps.InfoWindow({
											    position : iwPosition,
										    content : iwContent 
										});
										  
										// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
										infowindow.open(map, marker);        
									</script>
								<%-- <script>
									var markers = [
											{position : new daum.maps.LatLng(<%=longitude%>,<%=latitude%>)},
											{position : new daum.maps.LatLng(<%=longitude%>,<%=latitude%>)} ];
									var staticMapContainer = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
									staticMapOption = {
										// 위도, 경도 정보는 다음 PC 웹 지도 서비스(http://map.daum.net)에서 마우스 오른쪽 클릭 메뉴의 "여기 정보 보기"를 클릭하시면 확인할 수 있습니다
										center : new daum.maps.LatLng(<%=longitude%>,<%=latitude%>), 
										// 이미지 지도의 중심좌표
										level : 4, // 이미지 지도의 확대 레벨
										marker : markers
									// 이미지 지도에 표시할 마커 
									};
																									
									var staticMap = new daum.maps.StaticMap(
											staticMapContainer, staticMapOption);
								</script> --%>
							</div>
						


	<c:if test="${id == dtoGetBoard.cl_id }">
		<form method="post" action="/pfinal/pfinal.do">
			<button class="btn btn-link pl" name="command" value="prupdate">글수정</button>
			<input type="hidden" value="${dtoGetBoard.pr_subject}"
				name="pr_subject" /> <input type="hidden"
				value="${dtoGetBoard.pr_content}" name="pr_content" /> <input
				type="hidden" value="${dtoGetBoard.pr_photo}" name="pr_photo" /> <input
				type="hidden" value="	${dtoGetBoard.pr_id }" name="pr_id" />
				 <input type="hidden" value="${dtoGetBoard.pr_skill }" name="pr_nowskill" />
				 <input type="hidden" value="${dtoGetBoard.pr_needman }" name="pr_needman" />
				 <input type="hidden" value="${dtoGetBoard.pr_price }" name="pr_price" />
				 <input type="hidden" value="${dtoGetBoard.pr_end }" name="pr_end" />
				 <input type="hidden" value="${dtoGetBoard.pr_private }" name="pr_private" />
				  <input type="hidden" value="${dtoGetBoard.pr_exday }" name="pr_exday" />
		</form>
		
			<form method="post" action="/pfinal/pfinal.do">
			<button class="btn btn-link pl" name="command" value="prskillupdate">기술수정</button>
		 <input type="hidden" value="	${dtoGetBoard.pr_id }" name="pr_id" />
		 <input type="hidden" value="${dtoGetBoard.pr_skill }" name="pr_nowskill" />
				
		</form>




		<form method="post" action="/pfinal/pfinal.do">
			<button class="btn btn-link pl" name="command" value="prdelete">글삭제</button>
		 <input
				type="hidden" value="	${dtoGetBoard.pr_id }" name="pr_id" />
		</form>
</div>
					</div>
				</div>
			</div>
		</div>
	</div>


		<!-- 
		<form method="post" name="f" action="/semi/semi.do">
			<input type="hidden" name="command" value="Mplist-update">
			<td width="50" align="center" valign="middle">
				<button class="btn btn-warning btn-small" name="updatecode"
					id="updatecode" value="${i.pcode }">수정</button>
			</td>
		</form>
 -->

	</c:if>
</body>

<script type="text/javascript">
	function fnPrDelete() {
		if (confirm("정말 삭제합니까?") == true) { //확인

			document.ff.submit();

		} else { //취소

			return;

		}

	}
</script>


<script>
	/*
	 function fnPrDelete(f) {

	 var pr_id = document.getElementById("pr_id").value;
	 alert(pr_id);

	 var chk = confirm('삭제하시겠습니까?');
	 if (chk == true) {
	 f.action = "/pfinal/pfinal.do";
	 f.command.value = "prdelete";
	 f.pr_id = pr_id;
	 f.submit();
	 } else if (chk == false) {
	 // f.command.value = "plist-search";
	 //  f.submit();
	 history.back();
	 }
	 }
	 */
</script>
</html>
