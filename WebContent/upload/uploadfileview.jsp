<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ page import="dto.FinalDto" %>
   <%@ page import = "java.util.*" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="dao" class="dto.FinalDao"/>
<%
int count = Integer.parseInt(request.getParameter("count"));
String oriname = (String)request.getAttribute("oriname");
System.out.println("rear111"+ request.getAttribute("ori1"));
String asd = (String)request.getAttribute("ori1");
Vector v = dao.getList();
FinalDto dto = new FinalDto();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<%

for(int i = 1; i<=count; i++){
	System.out.println("12");
    String filename = "fileName"+i;
    String filelength = "fileLength"+i;
    System.out.println(filename);
    System.out.println(filelength);
    System.out.println("upload"+dto.getUploadname());
    System.out.println("oriname"+dto.getOriname());
    
    if(request.getParameter(filename) != null){%>	
     파일이름 : <%=request.getParameter(filename)%><br>
    파일 용량 : <%=request.getParameter(filelength) %>KB<br><br>    
 	 이름:<%=dto.getUploadname()%><br/>
    사진:<img src=<%=asd%> width="100%" height="100%"/><br/>
    <%}    
}
%>
</body>
</html>