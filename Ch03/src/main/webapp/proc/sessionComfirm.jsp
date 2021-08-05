<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 현재 클라이언트 세션확인</h3>
	
	<%
		String sid =  session.getId(); // 현재 클라이언트의 번호표!!!!
		String uid  = (String) session.getAttribute("uid"); // Object는 어떤 객체로든 캐스팅가능하다!!!!!!!
		String pass = (String) session.getAttribute("pass");
	
	%>
	<p>
	
	
	클라이언트 세션아이디 : <%= sid %>  </br> <!-- 절대로 중복되면 안된다 기본키로 설정한다!! -->
	클라이언트 아이디 :    <%= uid %>  </br>
	클라이언트 비밀번호 :   <%= pass %>  </br>



	</p>
	
	
	<a href="../3_4_Session.jsp"> 돌아가기</a>
</body>
</html>