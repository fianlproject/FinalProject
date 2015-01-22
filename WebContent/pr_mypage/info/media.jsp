<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body >

<br/>
<!-- 	<table class="table table-bordered table-hover" > -->
<!-- 		<tr> -->
<!-- 			<td> -->
<div class="thumbnail">
				<a href="/pfinal/pfinal.do?command=media&ui=1" name="media" id="media" onclick="media1()">
					<img class="btn-img" src="img/media/new_icon_jj.png"/>
				</a>
</div>
<!-- 			</td> -->
<!-- 			<td> -->
				<a href="/pfinal/pfinal.do?command=media&ui=2" name="media" id="media" onclick="media1()">
					<img class="btn-img" src="img/media/new_icon_zdnet.png"/>
				</a>
<!-- 			</td> -->
<!-- 			<td> -->
				<a href="/pfinal/pfinal.do?command=media&ui=3" name="media" id="media" onclick="media1()">
					<img class="btn-img" src="img/media/new_icon_jo.png"/>
				</a>
<!-- 			</td> -->
<!-- 			<td> -->
				<a href="/pfinal/pfinal.do?command=media&ui=4" name="media" id="media" onclick="media1()">
					<img class="btn-img" src="img/media/new_icon_ja.png"/>
				</a>
<!-- 			</td> -->
<!-- 			<td> -->
				<a href="/pfinal/pfinal.do?command=media&ui=5" name="media" id="media" onclick="media1()">
					<img class="btn-img" src="img/media/new_icon_da.png"/>
				</a>
<!-- 			</td> -->
<!-- 			<td> -->
				<a href="/pfinal/pfinal.do?command=media&ui=6" name="media" id="media" onclick="media1()">
						<img class="btn-img" src="img/media/new_icon_sg.png"/>
				</a>
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td> -->
				<h4 class="service-heading">전자일보</h4>
			</td>
			<td>
				<h4 class="service-heading">지디넷</h4>
			</td>
			<td>
				<h4 class="service-heading">조선일보</h4>
			</td>
			<td>
				<h4 class="service-heading">중앙일보</h4>
			</td>
			<td>
				<h4 class="service-heading">동아일보</h4>
			</td>
			<td>
			<h4 class="service-heading">세계일보</h4>
			</td>
		</tr>
		<tr>
			<td>
				<a href="/pfinal/pfinal.do?command=media&ui=7" name="media" id="media" onclick="media1()">
					<img class="btn-img" src="img/media/new_icon_hk.png"/>
				</a>
			</td>
			<td>
				<a href="/pfinal/pfinal.do?command=media&ui=8" name="media" id="media" onclick="media1()">
					<img class="btn-img" src="img/media/new_icon_kh.png"/>
				</a>
			</td>
			<td>
				<a href="/pfinal/pfinal.do?command=media&ui=9" name="media" id="media" onclick="media1()">
					<img class="btn-img" src="img/media/new_icon_hi.png"/>
				</a>
			</td>
			<td>
				<a href="/pfinal/pfinal.do?command=media&ui=10" name="media" id="media" onclick="media1()">
					<img class="btn-img" src="img/media/new_icon_sk.png"/>
				</a>
			</td>
			<td>
				<a href="/pfinal/pfinal.do?command=media&ui=11" name="media" id="media" onclick="media1()">
					<img class="btn-img" src="img/media/new_icon_ha.png"/>
				</a>
			</td>
			<td>
				<a href="/pfinal/pfinal.do?command=media&ui=12" name="media" id="media" onclick="media1()">
					<img class="btn-img" src="img/media/new_icon_mk.png"/>
				</a>
			</td>
		</tr>
		<tr>
			<td>
				<h4 class="service-heading">한국일보</h4>
			</td>
			<td>
				<h4 class="service-heading">경향신문</h4>
			</td>
			<td>
				<h4 class="service-heading">한겨례</h4>
			</td>
			<td>
				<h4 class="service-heading">서울경제</h4>
			</td>
			<td>
				<h4 class="service-heading">한국경제</h4>
			</td>
			<td>
				<h4 class="service-heading">매일경제</h4>
			</td>
		</tr>
		</table>


<script>
function media1() {		
		window.opener.location.href = "/pfinal/pfinal.do?command=close_media";
		window.close();	
}
</script>
</body>
</html>

