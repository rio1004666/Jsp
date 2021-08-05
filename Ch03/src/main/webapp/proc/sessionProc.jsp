<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionProc</title>
</head>
<body>
	<h3>사용자 정보 세션저장</h3>
	<%
	
		request.setCharacterEncoding("UTF-8"); // post전송 방식에는 인코딩해주어야한다 들어오는 정보를 
		String uid = request.getParameter("uid"); //키값전달만하면된다
		String pass = request.getParameter("pass");//키값만 전달하면 된다 
		// 사용자 정보 세션(Session Table) 저장 
		session.setAttribute("uid", uid);
		session.setAttribute("pass", pass); // 속성을 셋터한다 
	
	%>
	<h4> 세션 저장 완료! </h4>
	<a href="./sessionComfirm.jsp">클라이언트 세션 정보확인하기</a>
</body>
</html>