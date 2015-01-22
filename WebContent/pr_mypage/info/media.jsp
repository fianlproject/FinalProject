<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<br/>
 
<a href="/pfinal/pfinal.do?command=media&ui=1" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_jj.png"/>전자신문</a>
<a href="/pfinal/pfinal.do?command=media&ui=2" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_zdnet.png"/>ZDNet</a>
<a href="/pfinal/pfinal.do?command=media&ui=3" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_jo.png"/>조선일보</a>
<a href="/pfinal/pfinal.do?command=media&ui=4" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_ja.png"/>중앙일보</a><br/>

<a href="/pfinal/pfinal.do?command=media&ui=5" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_da.png"/>동아일보</a>
<a href="/pfinal/pfinal.do?command=media&ui=6" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_sg.png"/>세계일보</a>
<a href="/pfinal/pfinal.do?command=media&ui=7" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_hk.png"/>한국일보</a>
<a href="/pfinal/pfinal.do?command=media&ui=8" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_kh.png"/>경향신문</a><br/>

<a href="/pfinal/pfinal.do?command=media&ui=9" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_hi.png"/>한겨레　</a>
<a href="/pfinal/pfinal.do?command=media&ui=10" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_sk.png"/>서울경제</a>
<a href="/pfinal/pfinal.do?command=media&ui=11" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_ha.png"/>한국경제</a>
<a href="/pfinal/pfinal.do?command=media&ui=12" name="media" id="media" onclick="media1()">
<img class="btn-img" src="img/media/new_icon_mk.png"/>매일경제</a>

	 
 

<script>
function media1() {		
		window.opener.location.href = "/pfinal/pfinal.do?command=close_media";
		window.close();	
}
</script>
</body>
</html>

