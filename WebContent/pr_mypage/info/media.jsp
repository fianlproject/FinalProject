<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
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
<script>
function media1() {		
		window.opener.location.href = "/pfinal/pfinal.do?command=close_media";
		window.close();	
}
</script>
</body>
</html>

