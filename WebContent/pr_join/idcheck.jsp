<%@page contentType="text/html;charset=euc-kr"%>
<jsp:useBean id="idchk" class="pfinal.join.Plist_IdChkCommand" />
<%
 String userid=request.getParameter("userid").trim();
 System.out.println("idcheck.jsp : " +userid);
 String str="";
try{
	boolean isCheck=idchk.searchId(userid);
	if(isCheck){
		str="NO";
		out.print(str);
	}else{
		str="YES";
		out.print(str);
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>