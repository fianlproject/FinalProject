<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<!--     Bootstrap Core CSS -->
<!--     <link href="css/bootstrap.min.css" rel="stylesheet"> -->

<!--     Custom CSS -->
<!--     <link href="css/agency.css" rel="stylesheet"> -->

<!--     Custom Fonts -->
<!--     <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
<!--     <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"> -->
<!--     <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'> -->
<!--     <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'> -->
<!--     <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'> -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
	body{
		padding: 0px;
		margin: 0px;
	}
</style>
</head>
<body >
		<img src="img/media/news_bg.png" usemap="#001"/>
		<map name="001">
 			<area shape="rect" coords="27,11,118,150" href="/pfinal/pfinal.do?command=media&ui=1" onclick="media1()">
 			<area shape="rect" coords="118,11,209,150" href="/pfinal/pfinal.do?command=media&ui=2" onclick="media1()">
 			<area shape="rect" coords="209,11,300,150" href="/pfinal/pfinal.do?command=media&ui=3" onclick="media1()">
 			<area shape="rect" coords="300,11,391,150" href="/pfinal/pfinal.do?command=media&ui=4" onclick="media1()">
 			<area shape="rect" coords="391,11,482,150" href="/pfinal/pfinal.do?command=media&ui=5" onclick="media1()">
 			<area shape="rect" coords="482,11,573,150" href="/pfinal/pfinal.do?command=media&ui=6" onclick="media1()">
 			<area shape="rect" coords="27,150,118,289" href="/pfinal/pfinal.do?command=media&ui=7" onclick="media1()">
 			<area shape="rect" coords="118,150,209,289" href="/pfinal/pfinal.do?command=media&ui=8" onclick="media1()">
 			<area shape="rect" coords="209,150,300,289" href="/pfinal/pfinal.do?command=media&ui=9" onclick="media1()">
 			<area shape="rect" coords="300,150,391,289" href="/pfinal/pfinal.do?command=media&ui=10" onclick="media1()">
 			<area shape="rect" coords="391,150,482,289" href="/pfinal/pfinal.do?command=media&ui=11" onclick="media1()">
 			<area shape="rect" coords="482,150,573,289" href="/pfinal/pfinal.do?command=media&ui=12" onclick="media1()">
		</map>


<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=1" name="media" id="media" onclick="media1()"> -->
<!-- 					<img class="btn-img" src="img/media/news_btn_1.png"/> -->
<!-- 				</a> -->
<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=2" name="media" id="media" onclick="media1()"> -->
<!-- 					<img class="btn-img" src="img/media/news_btn_2.png"/> -->
<!-- 				</a> -->
<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=3" name="media" id="media" onclick="media1()"> -->
<!-- 					<img class="btn-img" src="img/media/news_btn_3.png"/> -->
<!-- 				</a> -->
<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=4" name="media" id="media" onclick="media1()"> -->
<!-- 					<img class="btn-img" src="img/media/news_btn_4.png"/> -->
<!-- 				</a> -->
<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=5" name="media" id="media" onclick="media1()"> -->
<!-- 					<img class="btn-img" src="img/media/news_btn_5.png"/> -->
<!-- 				</a> -->
<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=6" name="media" id="media" onclick="media1()"> -->
<!-- 						<img class="btn-img" src="img/media/news_btn_6.png"/> -->
<!-- 				</a> -->
<!-- 				<br/> -->
<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=7" name="media" id="media" onclick="media1()"> -->
<!-- 					<img class="btn-img" src="img/media/news_btn_7.png"/> -->
<!-- 				</a> -->
<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=8" name="media" id="media" onclick="media1()"> -->
<!-- 					<img class="btn-img" src="img/media/news_btn_8.png"/> -->
<!-- 				</a> -->
<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=9" name="media" id="media" onclick="media1()"> -->
<!-- 					<img class="btn-img" src="img/media/news_btn_9.png"/> -->
<!-- 				</a> -->
<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=10" name="media" id="media" onclick="media1()"> -->
<!-- 					<img class="btn-img" src="img/media/news_btn_10.png"/> -->
<!-- 				</a> -->
<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=11" name="media" id="media" onclick="media1()"> -->
<!-- 					<img class="btn-img" src="img/media/news_btn_11.png"/> -->
<!-- 				</a> -->
<!-- 				<a href="/pfinal/pfinal.do?command=media&ui=12" name="media" id="media" onclick="media1()"> -->
<!-- 					<img class="btn-img" src="img/media/news_btn_12.png"/> -->
<!-- 				</a> -->
<script>
function media1() {		
		window.opener.location.href = "/pfinal/pfinal.do?command=close_media";
		window.close();	
}
</script>
</body>
</html>

