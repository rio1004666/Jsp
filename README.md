### Jsp 
#Jsp수업예제
Ch1. Jsp 페이지 출력하기
```
greeting.jsp

  	<h1>Greeting!!!</h1>
	<a href="./hello.jsp">hello</a>
	<a href="./welcome.jsp">welcome</a>
	<a href="./greeting.jsp">greeting</a>
```
```
hello.jsp

	<h1>Hello World!</h1>
	<a href="./hello.jsp">hello</a>
	<a href="./welcome.jsp">welcome</a>
	<a href="/Ch01/greeting.jsp">greeting</a>
```
```
welcome.jsp

	<h1>welcome jsp!</h1>
	<a href="./hello.jsp">hello</a>
	<a href="./welcome.jsp">welcome</a>
	<a href="./greeting.jsp">greeting</a>
```
Ch2. JSP스크립트릿(Scriptlet)실습하기

#스크립트릿(Scriptlet)

  - JSP 문서에서 자바 프로그래밍이 실행되는 코드영역 
  - 모델1에서 사용되는 동적 실행 영역
  
#표현식 (Expression)

  -스크립트릿에서 선언된 변수를 참조하여 출력하는 출력구문  
