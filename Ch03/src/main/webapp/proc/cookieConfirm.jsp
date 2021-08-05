<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트에서 전송된 쿠키확인</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
	%>
	
		<p>
			쿠키명 : <%= cookie.getName() %>
			쿠키값 : <%= cookie.getValue() %>
		</p>
	
	<%

		}
	%>
</body>
</html>