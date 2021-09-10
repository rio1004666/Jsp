<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<h3> 고객목록 </h3>
	<a href="/Customer/register.do">고객등록</a>
	<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>주소</td>
				<td>휴대폰</td>
				<td>정보수정</td>
			</tr>
			<c:forEach var="cust" items="${customers}">
			<tr>
					<td>${cust.custid}</td>
					<td>${cust.name}</td>
					<td>${cust.address}</td>
					<td>${cust.phone}</td>
					<td>
						<a href="/Customer/modify.do?custid="${cust.custid}"> 수정 </a> <!-- 주소에 정보를 담아서 보냄 -->
						<a href="/Customer/delete.do?custid="${cust.custid}"> 삭제 </a> <!--  get방식으로 보냄  -->
					</td>
			</tr>
			</c:forEach>
	</table>	
</body>
</html>