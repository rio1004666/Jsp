

<%@page import="com.google.gson.Gson"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String result = "";
	if(name.equals("김개동")){
		result = "1";
	}
	else if(name.equals("홍길동")){
		result = "0";
	}

	out.print(result);
%>