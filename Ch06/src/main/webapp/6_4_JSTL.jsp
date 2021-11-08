<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl 라이브러리 코어(중요) 변수 명령어 선언   -->
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- jstl 라이브러리 코어(중요) 함수들  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  
	날짜: 2021/09/06
	이름: 강병화
	내용: JSTL(Java Standards Tag Library)  실습하기 
 -->
</head>
<body>
	<h3>JSTL 실습하기</h3>
	<%
	   // 변수 생성 및 출력 
		String str = "Hello";
		out.print("<p>str : " + str  + "</p>");
		
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		
		
		if(num1 < num2){
			out.print("<p>num1은 num2보다 작다.</p>");
		}
		if(num1 > num2){
			out.print("<p>num1은 num2보다 크다.</p>");
		}else{
			out.print("<p>num1은 num2보다 작다.</p>");
		}
		if(num1  > num2){
			out.print("<p>num1은 num2보다 크다.</p>");
		}else if(num2 > num3){
			out.print("<p>num2은 num3보다 크다.</p>");
		}else{
			out.print("<p>num3이 가장 크다.</p>");
		}
		for(int i=1; i<=5;i++){
			out.print("<p>"+i+".Hello JSTL</p>");
		}
		String people[] = {"김유신","김춘추","장보고","강감찬","이순신"};
		for(String person: people){
			out.print("<em>"+person+ "</em>, ");
		}
		int sum =0;
		for(int k=1;k<=10;k++){
			sum += k;
		}
		out.print("<p> 1부터 10까지 합 : " + sum + "</p>");
		String hello = "Hello Korea";
		out.print("<p> 문자열길이 : "+  hello.length()+"</p>");
		out.print("<p> 문자열 자르기 : "+  hello.substring(6,11)+"</p>");
		out.print("<p> 문자열 교체 :  "+  hello.replace("Korea", "Busan")+"</p>");
		out.print("<p> 문자열 인덱스 : "+  hello.indexOf("e")+"</p>");
	%>
	<h4>JSTL 표현</h4>
	<!-- 변수선언  -->
	<c:set var="str" value="Hello"/> <!-- 이제 jsp의 스크립트릿 쓰지않고 태그로 표현해야한다  -->
	<p> str :  ${str}</p>
	<c:set var="num1" value="1"/> <!--  타입은 신경쓰지 않아도 된다  -->
	<c:set var="num2" value="2"/>
	<c:set var="num3" value="3"/>
	<!-- 조건문 -->
	<c:if test="${num1 lt num2}">
			<p>num1은 num2보다 작다.</p>
	</c:if>
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1은 num2보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num1은 num2보다 작다.</p>
		</c:otherwise>
	</c:choose>
	
	
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1은 num2보다 크다.</p>
		</c:when>
		<c:when test="${num2 gt num3}">
			<p>num2은 num3보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num3이 가장 크다.</p>
		</c:otherwise>
	</c:choose>
	<!-- 반복문 -->
	<c:forEach var="i" begin="1" end="5">
		<p>${i}.Hello JSTL!</p>
	</c:forEach>
	<c:set var="people">김유신,김춘추,장보고,강감찬,이순신</c:set> <!-- 배열선언 -->
	<c:forEach var="person" items="${people}"> <!-- 배열을 표현하는 items속성 -->
		<em>${person}</em>,
	</c:forEach>
	<c:set var="sum"  value="0"></c:set>
	<c:forEach var="k"  begin="1" end="10">
		<c:set var="sum" value="${sum+k}"></c:set>
	</c:forEach>
	<p>1부터 10까지 합:${sum}</p>
	<!-- 문자열 처리 -->
	<c:set var="hello" value="Hello Korea"/>
	<p>문자열 길이: ${f:length(hello)}</p>
	<p>문자열 자르기: ${f:substring(hello,6,11)}</p>
	<p>문자열 길이: ${f:replace(hello,"Korea","Busan")}</p>
	<p>문자열 인덱스: ${f:indexOf(hello, "e")}</p>
</body>
</html>