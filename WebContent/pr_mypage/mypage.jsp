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
${ProjectDto.id}
<br/>
<form method="post" action="/pfinal/pfinal.do">
<input type="hidden" name="command" value="inter" />
　<input type="checkbox" name="inter" value="java">java
　<input type="checkbox" name="inter" value="jsp">jsp
　<input type="checkbox" name="inter" value="php">php
　<input type="checkbox" name="inter" value="html">html

<input type="submit" value="전송">
</form>
<a href="/pfinal/pfinal.do?command=project" >프로젝트 등록</a>
<a href="/pfinal/pfinal.do?command=friendlist" >친구목록</a>
<a href="/pfinal/pfinal.do?command=message" >내 메시지함</a>
<a href="/pfinal/pfinal.do?command=free_index" >홈으로</a>
</body>
</html>

