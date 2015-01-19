<%@page contentType="text/html;charset=euc-kr"%>
<jsp:useBean id="rss" class="pfinal.main.Rss_ChkCommand" />
<%
 String userid=request.getParameter("userid").trim();
 System.out.println("idcheck.jsp : " +userid);
 String str="";
try{
	HttpSession session1 = request.getSession();
	String isCheck=rss.RssSearch(userid);
	System.out.println("rsscheck"+isCheck);	
	session1.setAttribute("rss", isCheck);
	out.print(isCheck);
}
catch(Exception e){
	e.printStackTrace();
}
%>