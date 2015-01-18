<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<form method="post" enctype="multipart/form-data" action="/pfinal/pfinal.do">
	<input type="hidden" name="command" value="img" />
	
	<table width=80% cellspacing=0 cellpadding=3 align=center>
 <tr>
     <td width=10%>제 목</td> 
     <td width=90%><input type="text" name="subject" size="50" maxlength="30"></td>
    </tr>
 <tr>
     <td width=10%>내 용</td>
     <td width=90%><textarea name="content" rows="10" cols="50"></textarea></td>
 </tr>
 <tr>
 <td width=10%>파일 업로드</td>
<td width=90%><input type="file" name="uploadname" size=40></td>
</tr>
<tr>
<td><input type="submit" value="등록"></td>
</tr> 
</table>
</form>
<body>
</body>
</html>
