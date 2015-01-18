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
<form method="post" action="/pfinal/pfinal.do">
<input type="hidden" name="command" value="media" />
　<input type="radio" name="ui" value="1">전자신문
　<input type="radio" name="ui" value="2">zdnet　
　<input type="radio" name="ui" value="3">조선일보　
　<input type="radio" name="ui" value="4">중앙일보
　<input type="radio" name="ui" value="5">동아일보
　<input type="radio" name="ui" value="6">세계일보
　<input type="radio" name="ui" value="7">한국일보
　<input type="radio" name="ui" value="8">경향신문
　<input type="radio" name="ui" value="9">한겨레
　<input type="radio" name="ui" value="10">서울경제
　<input type="radio" name="ui" value="11">한국경제
　<input type="radio" name="ui" value="12">매일경제
<input type="submit" value="전송">
</form>

</body>
</html>

