<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ page import="dto.FinalDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<% 
	FinalDto dto = new FinalDto();
	String uploadimg = (String)request.getAttribute("uploadimg"); 
	System.out.println(uploadimg);
%>
<body>
<table border=0 width=100% cellpadding=2 cellspacing=0>
			<tr align=center bgcolor=#D0D0D0 height=120%>
				<td width="10%"> 번호 </td>
				<td width="30%"> 제목 </td>
				<td width="30%"> 내용 </td>
				<td width="30%"> 파일 </td>
			</tr>
		<%-- 	<tr>
				<td align="center"><%=dto.getNum() %></td>
				<td align="center"><%=dto.getSubject() %></td>
				<td align="center"><%=dto.getContent() %></td>
				<td align="center"><%=dto.getUploadname() %>
				<img src="<%=uploadimg%>" width="512" height="384"/></td>
			</tr> --%>
			<tr>
			<c:forEach var="des" items="${vector}">
   		<tr class="lv-bg test">
      	<td width="50">${des.num}</td>
      	<td width="50">${des.subject}</td>
      	<td width="50">${des.content}</td>
      	<td width="50">${des.uploadname}
      	<img src="<%=uploadimg%>" width="512" height="384"/></td>
      	</c:forEach>
   </tr>
   
   

		</table>
</body> 
</html>