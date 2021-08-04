<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2_5_Include</title>
<%--
	
	날짜: 2021/ 08 /04
	이름: 강병화 
	내용: JSP Include 지시자 실습하기  
	
--%>
</head>
<body>

	<h3> 5. JSP Include 지시자 </h3>
	
	<%--%는 지시자이다.!는 선언문이다(쓰지않음) @는 모듈화된 프로그램을 임폴트 기능  --%>
	
	<%@ include file="./inc/_header.jsp" %>
	
	<main>
		<h1> 메인 영역 입니다.  </h1>
	</main>
	
	<%@ include file="./inc/_footer.jsp" %>
	
	
</body>
</html>