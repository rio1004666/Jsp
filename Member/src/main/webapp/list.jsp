
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록page</title>
</head>
<body>
	<h3> 회원목록 </h3>
	<a href="./register.jsp">회원등록 가기</a>

	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>기타</th>
		</tr>
			<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.uid}</td>
				<td>${user.name}</td>
				<td>${user.hp}</td>
				<td>${user.pos}</td>
				<td>${user.dep}</td>
				<td>${user.rdate.substring(2,10)}</td>
				<td>
					<a href="/Ch07/member/modify.do?uid=${user.uid}" > 수정 </a>
					<a href="/Ch07/member/delete.do?uid=${user.uid}" > 삭제</a>
				</td>
			</tr>
			</c:forEach>
	</table>	
</body>
</html>