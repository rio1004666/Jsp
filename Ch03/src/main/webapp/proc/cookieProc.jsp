<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookieProc</title>
</head>
<body>
	
	<h3>쿠키생성 및 쿠키 전송</h3>
	
	<%
		
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");	// 키를 매개변수로 받고 값을 가져온다 request객체로 
		String pw =  request.getParameter("pw");
		// 쿠키생성
		Cookie c1 = new Cookie("uid",id);
		Cookie c2 = new Cookie("pass",pw);
		// 쿠키는 서버에서 만들어서 클라이언트에게 전송 쿠키 두개 사용자정보 
		// response객체에 실어보냄
		// 쿠키 전송
		response.addCookie(c1);
		response.addCookie(c2);
		
		
	%>
	<h4>클라이언트로 쿠키 전송완료!!</h4>
	
	
	<a href="./cookieConfirm.jsp">서버로 쿠키전송</a>
	
	
	
</body>
</html>