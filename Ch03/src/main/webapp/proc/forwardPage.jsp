<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardPage</title>
</head>
<body>
<h1>포워드 페이지 입니다.</h1>

	<%-- 포워드는 최초 url요청을하고 서버에서 다른 url로 연결해준다  --%>
	<%
		pageContext.forward("../3_1_Request.jsp");
	%>
</body>
</html>