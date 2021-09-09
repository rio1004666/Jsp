<%@page import="kr.co.farmstory2.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	String success = request.getParameter("success");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="/Farmstory2/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	var success = "<%= success %>";
    	
    	if(success == 100){
    		alert('일치하는 회원이 없습니다.\n아이디, 비밀번호를 다시 확인해 주세요.');
    	}else if(success == 101){
    		alert('정상적으로 로그아웃이 되었습니다.');
    	}else if(success == 102){
    		alert('먼저 로그인을 하셔야 합니다.');
    	}
    </script>
    
</head>
<body>
    <div id="wrapper">
        <header>            
            <a href="/Farmstory2" class="logo"><img src="/Farmstory2/img/logo.png" alt="로고"/></a>
            <p>
                <a href="/Farmstory2">HOME |</a>
                <% if(mb == null){ %>
                	<a href="/Farmstory2/user/login.jsp">로그인 |</a>
                	<a href="/Farmstory2/user/terms.jsp">회원가입 |</a>
                <% }else{ %>
                	<a href="/Farmstory2/user/logout.jsp">로그아웃 |</a>
                <% } %>
                <a href="/Farmstory2/community/qna.jsp">고객센터</a>
            </p>
            <img src="/Farmstory2/img/head_txt_img.png" alt="3만원이상 무료배송, 팜카드 10%적립"/>
            <ul class="gnb">
                <li><a href="/Farmstory2/introduction/hello.jsp">팜스토리 소개</a></li>
                <li><a href="/Farmstory2/board/list.jsp?group=Market&cate=market"><img src="/Farmstory2/img/head_menu_badge.png" class="badge" alt="30%"/>장보기</a></li>
                <li><a href="/Farmstory2/board/list.jsp?group=Croptalk&cate=story">농작물이야기</a></li>
                <li><a href="/Farmstory2/board/list.jsp?group=Event&cate=event">이벤트</a></li>
                <li><a href="/Farmstory2/board/list.jsp?group=Community&cate=notice">커뮤니티</a></li>
            </ul>
        </header>