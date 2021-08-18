<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
       // 프로젝트 시작 처리 페이지 
	  // index.jsp  ,   index.html 등의 파일은 web.xml에 등록되어잇다 시작페이지 
	  // 실제서비스로 바뀌면 도메인으로 Jboard.co.kr로 바뀐다
	  // url요청은 시작페이지가 있어야하고 uri는  user이후이다 
	  // localhost:8181/Jboard1이 index.html을 잡는다 
	  MemberBean mb =  (MemberBean) session.getAttribute("sessMember");
 		// 세션에 정보가 저장이 안되어 있다면 클라이언트당 한개..... 로그인으로 저장되어 있다면 바로 리스트페이지로 
	  if(mb == null){
		  	pageContext.forward("./user/login.jsp"); // forward는 절대경로가 안된다 
	  }else{
		  	pageContext.forward("./list.jsp"); // 내부적으로 이동하는것이므로 상대경로로 이동한다 
	  }
		
%>