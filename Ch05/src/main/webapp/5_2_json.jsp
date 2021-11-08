<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="java.util.Arrays"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user1 = "{\"uid\":\"A101\",\"name\":\"김유신\",\"hp\":\"010-1234-1111\",\"age\":25}";
	String user2 = "{\"uid\":\"A102\",\"name\":\"김춘추\",\"hp\":\"010-1234-2222\",\"age\":33}";
	String user3 = "{\"uid\":\"A103\",\"name\":\"장보고\",\"hp\":\"010-1234-3333\",\"age\":45}";
	String user4 = "{\"uid\":\"A104\",\"name\":\"강감찬\",\"hp\":\"010-1234-4444\",\"age\":19}";
	String user5 = "{\"uid\":\"A105\",\"name\":\"이순신\",\"hp\":\"010-1234-5555\",\"age\":22}";
	
	
	String[] users = {user1,user2,user3,user4,user5};
	// List<String> userlist = Arrays.asList(users);	
	// 편의성과 확장성을 위해 라이브러리 사용 
	out.print(Arrays.deepToString(users));

%>