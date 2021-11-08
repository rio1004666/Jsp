<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<c:set var="name" value="홍길동"/>
	<p> name : ${name}</p>
	<c:set var="browser" value="${header['User-Agent']}"/> <!--  변수명과 값을 동시에 설정해줍니다.. -->
	<c:out value="${browser}"/><br/> <!-- 변수값을 출력해줍니다. -->
	<c:set var="num1" value="123"/>
	<c:set var="num2" value="345"/>
	<c:choose>
		<c:when test="${num1 gt num2 }">
			<c:out value="num1이 num2보다 큽니다."></c:out>
		</c:when>
		<c:otherwise>
			<p> num1이 num2보다 작습니다.</p>
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="1" end="5">
		<p>${i}</p>
	</c:forEach>
</body>
</html>