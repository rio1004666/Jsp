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
- 
```
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
Ch03. JSP Cookie 실습

Cookie

 - 클라이언트와 서버간의 식별를 위해 사용되는 조각 파일 
 - 쿠키는 서버에서 생성하고 클라이언트에 저장
 - 클라이언트는 전송된 쿠키를 보관, 해당 서버로 다시 요청 할때 보관된 쿠키를 같이 전송 

```
	<h3> 5. Cookie 실습하기 </h3>
	<form action="./proc/cookieProc.jsp" method="post">
		<!--  주소에 데이터가 붙어서가는 것을 파라미터 이 전송방식을 get방식 (키 와 밸류형식으로 전송) -->
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"></td>
				<!-- input은 사용자로부터 데이터를 입력받음  -->
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="로그인">
					<!--  사용자로부터 데이터를 입력받아서 보낸다 --></td>
			</tr>
		</table>
	</form>
```
Ch04. Jsp Insert 실습

```
	<h4>User 등록</h4>
	<form action="./proc/insertProc.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uid"></td>

		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>

		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="hp"></td>

		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age"></td>

		</tr>
		<tr>

			<td colspan="2" align="right">
			<input type="submit" value="등록하기">
			</td>

		</tr>
	</table>
	</form>
```
```
< insertProc.jsp >

	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.Connection"%>
	<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	/// 외워라 걍 데이터베이스 처리 로직  = 에러가 발생 할 수 있따 => 예외상황 처리 
	// 데이터베이스 mysql용 드라이버 
	String host = "jdbc:mysql://54.180.160.240:3306/rio100466";
	String user = "rio100466";
	String pass = "1234";
	try {
		// 1단계 - JDBC 드라이버 로드 
		Class.forName("com.mysql.jdbc.Driver");
		// 2단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		// 3단계 - SQL 실행객체 생성 
		Statement stmt = conn.createStatement();
		// 4단계 - SQL 실행 = 쿼리문에 매핑 
		String sql = "INSERT INTO `USER1` VALUES('" + uid + "','" + name + "','" + hp + "'," + age + ");";
		stmt.executeUpdate(sql); // 업데이트 함수 
		// 5단계 - 결과처리(SELECT 일 경우) insert문이라서 5단계 무시 
		// 6단계 - 데이터베이스 종료 
		stmt.close();
		conn.close();


	} catch (Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("../4_2_Select.jsp");
	%>
```

Ch05. Jsp JSON 데이터 실습

json 데이터

- Javascript  Object Notation (자바 객체 표기) 
- 이기종간의 데이터 교환할 때 사용하는 표준 포맷
- 사물인터넷시대에 어떤 클라이언트든 교환가능 

```
	String jsonData ="{\"uid\":\"A101\", \"name\":\"홍길동\", \"hp\":\"010-1234-1111\",\"age\":25}"; // 문자열을 표시하고 이 문자열에서 또문자열은 인식불가 escape처리를 해줘야한다 
	// 문자 그자체ㅔ를 표현하려면 이스케이프 숫자는 ""빼야한다
	// 자바스크립트 객체 
	// 자바에서는 단순 문자열이고 데이터 출력 전송은 out객체 사용!!
	
	out.print(jsonData);
	// html css 자바스크립트 모두 지원 
	// json형태로 출력된다 위의 contenttype이 json
```

Ch05. Jsp JSON 데이터 실습

```
	String user1 = "{\"uid\":\"A101\",\"name\":\"김유신\",\"hp\":\"010-1234-1111\",\"age\":25}";
	String user2 = "{\"uid\":\"A102\",\"name\":\"김춘추\",\"hp\":\"010-1234-2222\",\"age\":33}";
	String user3 = "{\"uid\":\"A103\",\"name\":\"장보고\",\"hp\":\"010-1234-3333\",\"age\":45}";
	String user4 = "{\"uid\":\"A104\",\"name\":\"강감찬\",\"hp\":\"010-1234-4444\",\"age\":19}";
	String user5 = "{\"uid\":\"A105\",\"name\":\"이순신\",\"hp\":\"010-1234-5555\",\"age\":22}";
	
	
	String[] users = {user1,user2,user3,user4,user5};
	// List<String> userlist = Arrays.asList(users);	
	// 편의성과 확장성을 위해 라이브러리 사용 
	out.print(Arrays.deepToString(users));
```

Ch05. Jsp JSON 데이터 실습

```
	<%@page import="com.google.gson.Gson"%>
	<%@page import="java.util.List"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="bean.MemberBean"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="java.sql.DriverManager"%>
	<%@ page contentType="application/json;charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%
	String host = "jdbc:mysql://54.180.160.240:3306/rio100466";
	String user = "rio100466";
	String pass = "1234";
	List<MemberBean> members = new ArrayList<>();
	try {
		//1단계
		Class.forName("com.mysql.jdbc.Driver");

		//2단계
		Connection conn  = DriverManager.getConnection(host,user,pass);
		//3단계
		Statement stmt = conn.createStatement();
		//4단계
		String sql = "SELECT * FROM MEMBER";
		ResultSet rs = stmt.executeQuery(sql); // 쿼리문을 날려서 조회결과를 가지고 있는 객체 
		//5단계
		while(rs.next()){
			MemberBean mb = new MemberBean();
			mb.setUid(rs.getString(1));
			mb.setName(rs.getString(2));
			mb.setHp(rs.getString(3));
			mb.setPos(rs.getString(4));
			mb.setDep(rs.getInt(5));
			mb.setRdate(rs.getString(6));
			members.add(mb);
		}
		//6단계
		rs.close();
		stmt.close();
		conn.close();


	} catch (Exception e) {
		e.printStackTrace();
	}
	Gson gson = new Gson();
	String jsonData = gson.toJson(members);
	out.print(jsonData);
	%>

```
Ch05. Jsp AJAX 실습

AJAX(Asychronous Jacascript And Xml)

- 일반적인 페이지 요청을 위한 HTTP 통신과 다르게 데이터 요청을 위한 부분 통신 (비동기)
- 데이터 결과는 일반적으로 Json을 사용 
- 80~90퍼가 이통신을 사용..왜? html문서가 아닌 앱을 주로 사용 !!!!!

```

<!-- 라이브러리를 네트워크 형태로 추가  -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script>
    // jquery - 자바스크립트 라이브러리 추가해야함 
    // 시작함수 $ 는 jquery // 문서가 준비되었는지 확인하는 이벤트 그리고 핸들러가 인자로 들어간다 
    // function에서 로직작성해야함 
    // 제이쿼리 라이브러리 없다면 제이쿼리를 날릴수없음  
 	$(document).ready(function(){
 		//버튼 이벤트 구현 = 요소를 선택 
 		// 버튼을 클릭하면 매개변수인 핸들러가 실행 (익명함수인데 여기서는 핸들러라고 함 )
 		
 		// 데이터 출력 태그 객체!!!! 선택 
 		
 		var tds = $('tr > td:nth-child(2)'); // 객체!!!!!!!! 로 만들어준다 //DOM의 정보변경과 셋팅!!!!! JQUERY의 강력한 기능 
 		// 
 		// 배열형태로 tr의 td두번째 자식만 선택해서 담아준다!!!!!!! var은 타입추론으로 배열형태일것이다 
 		
 		$('button').click(function(){
 			
 			// alert('클릭!');
 			// ajax통신 (데이터 요청)
 			// ajax함수의 기본 옵션 
 			
 			$.ajax({    //페이지는 필요없다 이미 준비되어있고 데이터만 가져온다 데이터만 받아오기때문에 json이다 
 				url:'./5_1_json.jsp',
 				type:'GET', // 딱히 전송할 데이터가 없다면 GET방식으로 
 				dataType:'json', // 넘어오는 데이터타입은 json이다 5_1_json.jsp페이지에서!!!!!
 				success: function(data){
 					
 					//alert(data.name);// 그 데이터를 출력해서 띄운다  객체니까 변수접근하기 위해 .멤버변수
 					//json도 객체이고!!!! 키와 값으로 이루어진 객체이다!!!
 					tds.eq(0).text(data.uid); // text는 열린태그와 닫힌 태그사이의 내용을 입력 
 					tds.eq(1).text(data.name);
 					tds.eq(2).text(data.hp);
 					tds.eq(3).text(data.age);
 				
 				} // function(){}핸들러에 데이터가 들어오는 인자값으로 json이 data로 들어온다 
 			});
 		});
 	}); 
 
  
 </script>

</head>
<body>
	<h3> 4. Ajax 통신 실습하기 </h3>
	<button>데이터 가져오기</button>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td></td>
		</tr>
		<tr>
			<td>이름</td>
			<td></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td></td>
		</tr>
		<tr>
			<td>나이</td>
			<td></td>
		</tr>
	</table>
</body>
</html>
```

Ch05. Jsp AJAX 실습

```
	 <script>

		$(document).ready(function(){
			$('button').click(function(){
				/// 데이터 요청하기
				// html에서는 자동으로 table에 tbody를 삽입합니다.
				var table = $('table > tbody'); // 테이블 객체 생성 DOM객체!! 문서 객체 모델 
				$.ajax({
					url:'./5_3_json.jsp',
					type:'get',
					dataType:'json',
					success:function(data){ // 통신에 성공한다면 처리할 로직이 여기에 들어간다 받아온 데이터를 가지고 
						// []리스트형식으로 data에 들어온다 
						for(var i=0; i < data.length;i++){
							//alert(data[i].name);
							table.append('<tr></tr>'); // 따끈따근한 tr객체를 생성하고 (태그를 동적으로 생성)
							 // 마지막 자식 tr즉 이제 막 생성된 tr객체!!!
							 // tr문서객체의 : 마지막 자식 객체를 찾아서 추가한다 append 동적으로 태그 생성 
							table.find('tr:last-child').append('<td>'+data[i].uid + '</td>');
							table.find('tr:last-child').append('<td>'+data[i].name + '</td>');
							table.find('tr:last-child').append('<td>'+data[i].hp + '</td>');
							table.find('tr:last-child').append('<td>'+data[i].pos + '</td>');
							table.find('tr:last-child').append('<td>'+data[i].dep + '</td>');
							table.find('tr:last-child').append('<td>'+data[i].rdate+'</td>');
							// for을 순회하면서 한번 데이터 셋팅이 끝나면 또 tr을 생성해서 그 tr객체에 또 데이터 삽입
						}
					}
				// 동적태그를 append시킬것이다!!!! 없는 태그를 생성하며 데이터 붙인다 
				});

			});

		});
	 </script>
```
Ch05. Jsp AJAX 연습

```

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#b1').click(function(){	
				var query = {name:$("#in").val()};

				$.ajax({
					url: './ex07-03Proc.jsp',
					type: 'POST',
					data: query,
					success:function(data){ // data는 json형태일수도있고 문자열일 수도 있고 객체 리스트형태일 수도 있다 

						if( data.name == 1 ){ //이거 안됨....	
							$('#result').text("관리자님 어서오세요");
						}
						else if( data.name == 0){

							$('#result').text("회원님 어서오세요");
						}


					}
				});

			});
		});
	</script>
	</head>

	<body>

		<div>이름</div></br>
		<input id="in" name="name" type="text" placeholder="이름을 입력하세요"/></br>
		<button id="b1">처리</button>
		<div id="result"></div>
	</body>
	</html>

```
```

< ex07-03Proc.jsp >

	<%@page import="com.google.gson.Gson"%>
	<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String result = "";
		if(name.equals("김개동")){
			result = "1";
		}
		else if(name.equals("홍길동")){
			result = "0";
		}
		out.print(result);
	%>
```

Ch06. Jsp 표현언어 실습

```
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
```

Ch06. JSP 표현언어(Expression Language) 실습

```
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

```

Ch06. JSP 표현언어(Expression Language) 실습

```
	<h3> 표현언어 내장객체 </h3>
	<%
		pageContext.setAttribute("name", "김유신");
		request.setAttribute("name", "김춘추");
		session.setAttribute("name", "장보고");
		application.setAttribute("name", "강감찬");
	%>
	<p>
		<!--  해당하는 내장객체의 데이터를 불러오기위해서는 지정해주어야한다  -->
		pageContext name : ${pageScope.name}<br/> <!-- jsp 페이지 객체 = 대표적인 기능 forward로 서버내부에서 페이지이동-->
		request name: ${requestScope.name}<br/> <!-- 클라이언트에서 요청시에 생성되는 객체 -->
		session name: ${sessionScope.name }<br/> <!--  클라이언트단에서 생성되는 객체 -->
		application name: ${applicationScope.name}<br/> <!-- 톰캣 서버 어플리케이션 자체에서 생성되는 객체  -->
	</p>
```
