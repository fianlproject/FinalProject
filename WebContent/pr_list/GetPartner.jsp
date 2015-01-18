<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//Ddiv HTML 4.01 divansitional//EN" "http://www.w3.org/div/html4/loose.ddiv">
<html>
<head>

<!-- Custom CSS -->
<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	파트너 상세페이지 ㅋ
	${dtoGetPartner}
	<%--
	<br /> ${dtoGetBoard.pr_id }
	${id }


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
												<th>예상일자 :</th>
												<td>10일</td>
												<th>예상비용 :</th>
												<td>${dtoGetBoard.pr_price}</td>
												<th>필요인원 :</th>
												<td>${dtoGetBoard.pr_needman }</td>
											</tr>
											<tr>
												<th>회사명 :</th>
												<td>${dtoGetBoard.c_name }</td>
												<th>관련기술 :</th>

												<!--  <td><c:forEach items="${dtoGetBoard.pr_skills}" var="dto">${dto}   </c:forEach></td>-->
												<td>${dtoGetBoard.pr_skill }</td>
												<th>지원인원 :</th>
												<td>${dtoGetBoard.pr_cntman}</td>
											</tr>
										</tbody>
									</table>
								</div>
								<h4>프로젝트 내용</h4>
								<p>${dtoGetBoard.pr_content }</p>
							</div>


							<img src="alist/upload/${dtoGetBoard.pr_photo}">


							<!-- 

				<div class="content-inner">
					<div class="summary">
						<div class="project-meta-info well">
							<table>
								<tbody>
									<tr>
										<th><i class="fa fa-clock-o"></i> 예상일자</th>
										<td>10일</td>
										<th><i class="fa fa-won"></i> 예상비용</th>
										<td>1,200,000원</td>
										<th><i class="fa fa-map-marker"></i> 진행지역</th>
										<td>서울특별시 &gt; 서초구</td>
									</tr>
									<tr>
										<th><i class="fa fa-comments"></i> 사전미팅</th>
										<td>오프라인 미팅</td>
										<th><i class="fa fa-calendar-o"></i> 모집마감</th>
										<td>2014년 12월 24일</td>
									</tr>
								</tbody>
							</table>
						</div>
						<p class="paragraph-danger">
							<span class="label label-danger">주의</span> 위 내용은 클라이언트의 제시 기간 및
							금액으로 충분히 변동 가능합니다.
						</p>
						<div class="project-skill-required">
							<h4>관련 기술</h4>
							<span class="project-skill label-skill">web</span>
						</div>
					</div>
					<div class="project-desc">
						<h4>프로젝트 내용</h4>
						<p></p>
						<p></p>
						<p>
							<strong>&lt;회사 소개&gt;</strong><br>안드로이드 앱을 개발해서 출시를 앞두고
							있습니다. 앱 소개용 홈페이지를 만들고 싶습니다.
						</p>
						<br>
						<p>
							<strong>&lt;프로젝트 진행 방식&gt;</strong><br>정확한 정보 전달을 위해서 초기 1회
							미팅 필수<br>추후에 필요하면 미팅을 진행하겠습니다.
						</p>
						<br>
						<p>
							<strong>&lt;프로젝트의 현재 상황&gt;</strong><br>- 앱 출시 예정<br>-
							홈페이지 메인 화면 BI 제작 중, 계약 체결 전 제작 완료 예상<br>- 도메인 구매 안함
						</p>
						<br>
						<p>
							<strong>&lt;상세한 업무 내용&gt;</strong><br>앱 소개 원 페이지 홈페이지 (모바일
							반응 형 포함)
						</p>
						<br>
						<p>
							<strong>&lt;참고 자료/ 유의 사항&gt;</strong><br>타사 참고 홈페이지:
							http://connect.com/
						</p>
						<p></p>
						<p></p>
					</div>
					<div class="project-comment">
						<h4>프로젝트 문의</h4>
						<div class="media">
							<a class="pull-left" href="#"><img alt="mykokoko의 프로필 이미지"
								class="media-object"
								src="%EC%9C%84%EC%8B%9C%EC%BC%93%28Wishket%29%20%C2%B7%20%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20-%20APP%EC%86%8C%EA%B0%9C%EC%9A%A9%20%EC%9B%90%20%ED%8E%98%EC%9D%B4%EC%A7%80%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80_files/default_avatar.jpg"></a>
							<div class="media-body">
								<form class="has-validation-callback" action="." method="POST">
									<input name="csrfmiddlewaretoken"
										value="CsL3WC1xomyuLfTUXt4G0ZTviqVr1rzo" type="hidden">
									<div class="">
										<textarea class="form-control" cols="40" id="id_body"
											name="body" required="" rows="10"></textarea>
									</div>
									<input class="btn btn-primary btn-submit" id="id_submit"
										value="작성하기" type="submit"><span><small
										class="text-warning">프로젝트 문의에 작성한 내용은 수정 및 삭제가 불가능합니다.</small></span>
								</form>
							</div>
						</div>
						<p class="paragraph-danger">
							<span class="label label-danger">주의</span> 이메일, 전화번호 등을 게시하여 직거래를
							유도하는 경우, 서비스 이용에 제재를 받을 수 있습니다.
						</p>
					</div>
				</div>
			</div>
			
			
			<div class="sidebar">
				<div class="inner">
					<a
						class="btn btn-large btn-project-application btn-warning disabled btn-block"
						disabled="" href="#">프로젝트 지원불가</a>
					<div class="client-name-tag">
						<h3 class="client-name-tag-heading">클라이언트</h3>
						<div class="client-name-tag-body">
							<img alt="seonjeehun 사진" class="client-img-lg"
								src="%EC%9C%84%EC%8B%9C%EC%BC%93%28Wishket%29%20%C2%B7%20%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%20-%20APP%EC%86%8C%EA%B0%9C%EC%9A%A9%20%EC%9B%90%20%ED%8E%98%EC%9D%B4%EC%A7%80%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80_files/default_avatar.jpg">
							<h4 class="client-username-bottom">seonjeehun</h4>
						</div>
					</div>
					<div class="client-history">
						<h3 class="client-history-heading">위시켓 히스토리</h3>
						<div class="client-history-body">
							<table class="table table-responsive">
								<tbody>
									<tr>
										<th>프로젝트 등록</th>
										<td>2 <span class="append-unit">건</span></td>
									</tr>
									<tr>
										<th>계약한 프로젝트</th>
										<td>0 <span class="append-unit">건</span></td>
									</tr>
									<tr>
										<th>완료한 프로젝트</th>
										<td>0 <span class="append-unit">건</span></td>
									</tr>
								</tbody>
							</table>
							<dl>
								<dt>누적 완료 금액</dt>
								<dd>
									0 <span class="append-unit">원</span>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		</div>
		 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<form method="post" action="/pfinal/pfinal.do">
			<button class="btn btn-link pl" name="command" value="prupdate">글수정</button>
			<input type="hidden" value="${dtoGetBoard.pr_subject}"
				name="pr_subject" /> <input type="hidden"
				value="${dtoGetBoard.pr_content}" name="pr_content" /> <input
				type="hidden" value="${dtoGetBoard.pr_photo}" name="pr_photo" /> <input
				type="hidden" value="	${dtoGetBoard.pr_id }" name="pr_id" />
		</form>
	</div>
	
	 --%>
</body>
</html>