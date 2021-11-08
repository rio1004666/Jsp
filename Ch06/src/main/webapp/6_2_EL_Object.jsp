<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>6_2_표현언어 내장객체</title>
</head>
<body>
	<h3> 표현언어 내장객체 </h3>
	<%
		pageContext.setAttribute("name", "김유신");
		request.setAttribute("name", "김춘추");
		session.setAttribute("name", "장보고");
		application.setAttribute("name", "강감찬");
	%>
	<p>
		<!--  해당하는 내장객체의 데이터를 불러오기위해서는 지정해주어야한다  -->
		pageContext name : ${pageScope.name}<br/> <!-- jsp 페이지 객체 = 대표적인 기능 forward로 서버내부에서 페이지이동-->
		request name: ${requestScope.name}<br/> <!-- 클라이언트에서 요청시에 생성되는 객체 -->
		session name: ${sessionScope.name }<br/> <!--  클라이언트단에서 생성되는 객체 -->
		application name: ${applicationScope.name}<br/> <!-- 톰캣 서버 어플리케이션 자체에서 생성되는 객체  -->
	</p>
</body>
</html>