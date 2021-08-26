<%@page import="kr.co.farmstory1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="/Farmstory1/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <header>            
            <a href="/Farmstory1" class="logo"><img src="/Farmstory1/img/logo.png" alt="로고"/></a>
            <p>
                <a href="/Farmstory1">HOME |</a>
                <%if(mb == null){ %> <!-- 로그인 안했을 경우 -->
                	<a href="/Farmstory1/user/login.jsp">로그인 |</a>
                	<a href="/Farmstory1/user/terms.jsp">회원가입 |</a>
                <%}else{ %> <!-- 로그인햇을 경우  로그아웃활성화 -->
                	<a href="/Farmstory1/user/logout.jsp">로그아웃</a>
                <%} %>
                	<a href="/Farmstory1/community/qna.jsp">고객센터</a>
            </p>
            <img src="/Farmstory1/img/head_txt_img.png" alt="3만원이상 무료배송, 팜카드 10%적립"/>
            <ul class="gnb">
                <li><a href="/Farmstory1/introduction/hello.jsp">팜스토리 소개</a></li>
                <li><a href="/Farmstory1/market/market.jsp"><img src="/Farmstory1/img/head_menu_badge.png" class="badge" alt="30%"/>장보기</a></li>
                <li><a href="/Farmstory1/croptalk/story.jsp">농작물이야기</a></li>
                <li><a href="/Farmstory1/event/event.jsp">이벤트</a></li>
                <li><a href="/Farmstory1/community/notice.jsp">커뮤니티</a></li>
            </ul>
        </header>