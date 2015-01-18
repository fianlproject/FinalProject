<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="final_schedule.*"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%!List<CalBean> callist;%>
<%
	System.out.println("구");

	CalDAO caldao = new CalDAO();
	callist = caldao.getCal8();
	System.out.println(callist);
	
	JSONArray ja = new JSONArray();
	for (int i = 0; i < callist.size(); i++) {
		CalBean calbean = callist.get(i);
		ja.add(new CalJson(calbean.getId(), calbean.getTitle(), calbean.getDate()));
	}
	out.println(ja);
%>
