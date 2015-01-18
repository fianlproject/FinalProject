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
<input type="hidden" name="command" value="menu_ui" />
　<input type="checkbox" name="ui" value="1">프로젝트 조회
　<input type="checkbox" name="ui" value="2">관심프로젝트　
　<input type="checkbox" name="ui" value="4">쪽지함
<input type="submit" value="전송">
</form>

</body>
</html>

