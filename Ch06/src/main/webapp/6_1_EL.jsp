<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>6_1_EL</title>
<!--  

	날짜: 2021/09/06
	이름: 강병화
	내용: JSP 표현언어(Expression Language) 실습하기 
 -->
</head>
<body>
	<!-- Model1 과 Model2과 Spring이 있는데 이제 Model2랑 Spring 주로  쓰인다 Spring을 사용하기 위해 Model1과 Model2를 알아야한다  -->
	
	<!--  개발방식 !!!! 이 다르다  -->
	<h3>1.  표현 언어 </h3>
	<%
		String name = "홍길동";
		int num1 =  1;
		int num2 = 2;
		// 표현식으로 출력하기 위해 JSP 내장객체로 저장 
		pageContext.setAttribute("name", name);
		request.setAttribute("num1", num1);
		session.setAttribute("num2", num2);
	%>
	
	<h4>표현식</h4>
	<p>
		name : <%= name %> <br/>
		num1 : <%= num1 %> <br/>
		num2: <%= num2 %> <br/>
	</p>
	<h4>표현언어 출력</h4>
	<p>
		name : ${name} <br/> <!-- name앞에 내장객체가 생략되어있음 -->
		num1 :  ${num1} <br/>
		num2:  ${num2} <br/>
		num1 + num2 = ${num1+num2}
	</p>
</body>
</html>