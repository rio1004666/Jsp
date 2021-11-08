### Jsp 
#Jsp수업예제
Ch01. Jsp 페이지 출력하기
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
Ch02. JSP스크립트릿(Scriptlet)실습하기

#스크립트릿(Scriptlet)

  - JSP 문서에서 자바 프로그래밍이 실행되는 코드영역 
  - 모델1에서 사용되는 동적 실행 영역
  
#표현식 (Expression)

  - 스크립트릿에서 선언된 변수를 참조하여 출력하는 출력구문  
```
	<%
	// Scriptlet(프로그래밍 역역)
	
		int var1 = 1;
		
		boolean var2 = true;
		
		double var3 = 3.14;
		
		float var4 = 4.667f;
		
		String str = "hello";
		
		out.print("<h4> var1 :" + var1 + "</h4>"); // 바로 out객체 
		out.print("<h4> var2: " + var2 + "</h4>");
		
		
	%>
	
	<%-- 표현식 출력 --%>
	
	<h4>var3 : <%= var3 %></h4>
	<h4>var4 : <%= var4 %></h4>
```
Ch02. JSP 조건문 실습하기 
```
	<h3> 2. 조건문 실습하기 </h3>

	<%
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		int num4 = 4;
		if(num1 > 0){
			out.print("<h4> num1은 0보다 크다. </h4>");
		}
		
		
	
	%>
	
	<%if(num1 > num2){ %>
		<h4>num1 은 num2보다 크다 .</h4>		
	<%}else if(num2 > num3){ %>
		<h4>num2는 num3보다 크다 </h4>
	<%}else if(num3 > num4){ %>
		<h4>num3은 num4보다 크다 </h4>
	<%}else{%>
		<h4> num4가 가장크다 	</h4>
	<% }	%>
```
Ch02. JSP 반복문 실습하기 
```
	<h3>3.JSP 반복문 실습하기</h3>

	<h3>for</h3>
	<%
	for (int i = 1; i <= 5; i++) {
		out.print("<h4> i :" + i + "<h4>");
	}
	%>
	<h3>while</h3>
	<%
	int k = 1;
	while (k <= 5) {
	%>
	<p>
		k : <%=k%>
	</p>
	<%
	k++;
	}
	%>
	<h3>구구단표</h3>
	<table border="3">
		<tr>
			<%for(int i=2;i<=9;i++){%>
				<td><% out.print(i+"단"); %></td>
			<%} %>
		</tr>
		<%
			for (int i = 1; i < 10; i++) {
		%>
		<tr>
			<%
				for (int j = 2; j < 10; j++) {
			%>
					<td><%=j%> x <%=i%> = <%=i * j%></td>
			<%
				}
			%>
			<%
			}
			%>
		</tr>
	</table>
```
Ch02. JSP 클래스 실습하기 
```
	<h3>4. JSP 클래스 실습하기</h3>
	<%
	
	
	Account kb = new Account("국민은행", "101-121-1111", "김유신", 10000);
	Account wr = new Account("우리은행", "101-121-2222", "김춘추", 30000);
	
	
	kb.deposit(5000);
	kb.withdraw(8000);
	kb.show(out); // out을 넣어버린다 scriptlet객체 
	wr.deposit(50000);
	wr.withdraw(7000);
	wr.show(out);
	
	
	%>
```
Ch02. JSP Include 지시자 실습하기  
```
	<h3> 5. JSP Include 지시자 </h3>
	
	<%--%는 지시자이다.!는 선언문이다(쓰지않음) @는 모듈화된 프로그램을 임폴트 기능  --%>
	
	<%@ include file="./inc/_header.jsp" %>
	
	<main>
		<h1> 메인 영역 입니다.  </h1>
	</main>
	
	<%@ include file="./inc/_footer.jsp" %>
```
Ch03. JSP - Request객체
```
	<h4> request 내장 객체 정보 </h4>
	<!--  클래스 AAA = new 클래스() -->
	<!--  new 연산 없이 싱글톤으로 바로 사용가능한 내장객체  -->
	<%
		/// pageContext / request / response / session 이 4가지는 익혀야한다 
		// Client 가 요청 할때 생성되는 객체 request 는 Client다 
		// 사용자의 정보를 가지고 있다 (정보덩어리가 객체는 무수히  많은 정보가 있다 )
		// 브라우저 종료 / 주소 /,,,,
	%>
	<table border="1">
		
		<tr>
			<td>헤더정보</td>	<!-- get으로 시작하는 메서드 => 게터 -->
			<td><%=request.getHeader("User-Agent") %>
		</tr>
		<tr>
			<td>통신규약</td>	<!-- http 프로토콜 - 클라이언트가 서버에 요청을하면 응답받고 끊김  -->
			<td><%=request.getProtocol() %>
		</tr>
		<tr>
			<td>서버이름</td>	<!-- 서버주소 : 아마존서버  -->
			<td><%=request.getServerName() %>
		</tr>
		<tr>
			<td>요청주소</td>	<!--  전체 현재 경로  -->
			<td><%=request.getRequestURI() %>
		</tr>
		<tr>
			<td>요청경로</td>	<!--  포트까지가 도메인 url + path :경로 (uri) -->
			<td><%=request.getRequestURI() %>
		</tr>
			<tr>
			<td>클라이언트 시스템 IP</td>	 <!-- 클라이언트의 ip번호  -->
			<td><%=request.getRemoteAddr() %>
		</tr>
	
	</table>
```
Ch03. JSP - Response 내장객체
```
	response 내장객체 
	- Client 에서 Server 로 요청한 처리 결과를 응답해주는 객체 
	- Server 에서 Client로 전송되는 객체 
		redirect 기능 
		
	-Server에서 Client로 다시 요청을 명령하는 response객체의 기능 
	나는 정보가 없으니까 다른데로 가 
	- 최종 요청에 대한 주소가 반영 
	
	forward 기능 
	- 시스템에서 페이지를 요청하는 pageContext 객체의 기능 
	- 최초 요청에 대한 주소가 반영 
	 --%>
	 <h3>2.response 내장객체 실습하기 </h3>
	 <a href="../proc/redirectPage.jsp"> 리다이렉트 페이지 요청하기 </a>
```
Ch03. JSP - pageContext 내장객체

jsp 내부 페이지객체 pageContext => forward기능 시스템 (서버)내에서 이동 
	
pageContext 내장객체

- JSP 페이지에 대해 1:1 로 연결된 객체로 JSP 페이지당 하나의 pageContext객체가 생성 
- 주요 기능은 페이지의 흐름제어(forward)에 사용 

forward 기능 

- 시스템에서 페이지를 요청하는 pageContext객체의 기능 
- 최초 요청에 대한 주소가 반영, cf) redirect 는 최종 요청에 대한 주소가 반영 
- 서버는 물리적인 시스템, 톰캣 설치, 톰캣 환경, 톰캣 객체 -> application
- 객체는 유무형 형체 동작등을 프로그래밍 코드로 표현 

```
	<h3> 3.pageContext 내장객체 실습</h3>
	<a href="./proc/forwardPage.jsp">포워드페이지요청</a>
```
Ch03. JSP Session 내장객체
session 내장객체
- 최초 요청에서 부터 마지막 요청까지의 전체 시간
- 클라이언트에서 서버로 요청할 때 서버에 기록되는 클라이언트 정보 테이블 (Session Table)
- 서버는 각 클라이언트에 대한 고유번호(Session ID)를 부여 
```
	<h1>4.session 내장객체 실습하기 </h1>
	<form action="./proc/sessionProc.jsp" method="post">
		<!--  주소에 데이터가 붙어서가는 것을 파라미터 이 전송방식을 get방식 (키 와 밸류형식으로 전송) -->
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
				<!-- input은 사용자로부터 데이터를 입력받음  -->
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="로그인">
					<!--  사용자로부터 데이터를 입력받아서 보낸다 --></td>
			</tr>
		</table>
	</form>
```
