<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3_3_PageContext</title>
</head>
<body>
	<h3> 3.pageContext 내장객체 실습</h3>
	<!--  jsp 내부 페이지객체 pageContext =>forward기능 시스템 (서버)내에서 이동  -->
	<!--  
	pageContext 내장객체
	-JSP 페이지에 대해 1:1 로 연결된 객체로 JSP 페이지당 하나의 pageContext객체가 생성 
	- 주요 기능은 페이지의 흐름제어(forward)에 사용 
	forward 기능 
	- 시스템에서 페이지를 요청하는 pageContext객체의 기능 
	- 최초 요청에 대한 주소가 반영, cf) redirect 는 최종 요청에 대한 주소가 반영 
	- 서버는 물리적인 시스템, 톰캣 설치, 톰캣 환경, 톰캣 객체 -> application
	- 객체는 유무형 형체 동작등을 프로그래밍 코드로 표현 
	
	 -->
	<a href="./proc/forwardPage.jsp">포워드페이지요청</a>
</body>
</html>