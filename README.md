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
Ch03. JSP 반복문 실습하기 
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
