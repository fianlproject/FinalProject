<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
<title>소개글쓰기</title>
<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">
<style type="text/css">
#sm-group {
	width: 30%;
}
</style>

</head>

<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=3d9835e43d08f616d89784b77f22a468&libraries=services"></script>
<script type="text/javascript" src="/pfinal/js/map.js"></script>
							


<br />
<body class="project-list">

	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						${id }님의 자기소개를 해주세요. 
					</h3>
				</div>
							<form name="sogae" method="post"
								action="/pfinal/pfinal.do?command=sogaeProc">
				<div class="content-header">
					<div class="form-group">

								<div class="form-group description-form-group ">
									<label class="control-label required" for="description"><span>*</span>자기소개 내용</label>
									<div class="control-wrapper">
										<textarea autocomplete="off" class="form-control" cols="40"
											id="mysogae" name="mysogae" required="" rows="25"></textarea>
										<span class="help-block"><p class="text-danger">
											자신을 자세하게 소개해주세요.
											</p></span>
									</div>
								</div>
							</div>

								<div class="form-group">
									<div class="btn-wrapper">
										<input
											class="btn btn-lg btn-client js-disable-on-click btn-submit"
											value="등록" type="submit">

							</form><br/><br/>
							<form method="post" action="/pfinal/pfinal.do">
									<button class="btn btn-lg btn-default js-disable-on-click" name="command" value="mylist">마이리스트</button>
							</form>
									</div>
								</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		</div>
</body>
<script>

</script>

</html>
