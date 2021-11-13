### Jsp 

Jsp 수업예제

Ch01. Jsp 페이지 출력하기

- JSP란? HTML태그에 JAVA코드를 생성하여 동적으로 웹페이지를 생성하는 도구

Ch02. JSP스크립트릿(Scriptlet)실습하기

스크립트릿(Scriptlet)

  - JSP 문서에서 자바 프로그래밍이 실행되는 코드영역 
  
  - 모델1에서 사용되는 동적 실행 영역
  
표현식 (Expression)

  - 스크립트릿에서 선언된 변수를 참조하여 출력하는 출력구문  
  

Ch02. JSP 조건문 실습하기 

```
ex)
    <%if( a > 0 ) {%> 
    <%}%>
```

Ch02. JSP 반복문 실습하기

```
ex) 
   <%for(int i=0; i<=3; i++){%>
   <p style="font-size:<%=i%rem>">JSP Tutorial </p>
   <%}%>
```

Ch02. JSP Include 지시자 실습하기  

```
ex) 
  <%include file="./b.jsp" %> // 가져올 파일을 include하기
```

Ch03. JSP - Request객체

- 웹브라우저를 통해 서버에 어떤 정보를 요청하는것

- 클라이언트에서 넘어오는 데이터를 서버 측에서 받아오는 객체

```
ex) 

request.getRemoteAddr(); // 클라이언트 ip주소 가져오기

request.getParameter(파라미터);  // 클라이언트 요청시 전달하는 데이터값 가져오기

```

Ch03. JSP - Response 내장객체

- Client 에서 Server 로 요청한 처리 결과를 응답해주는 객체 

- Server 에서 Client로 전송되는 객체 

Reirect 기능 

- Server에서 Client로 다시 요청을 명령하는 response 객체의 기능 

- 최종 요청에 대한 주소가 반영 

Forward 기능 

- 시스템에서 페이지를 요청하는 pageContext 객체의 기능 

- 최초 요청에 대한 주소가 반영 


Ch03. JSP - pageContext 내장객체

JSP 내부 페이지객체 pageContext => forward 기능 시스템 (서버)내에서 이동 
	
pageContext 내장객체

- JSP 페이지에 대해 1:1 로 연결된 객체로 JSP 페이지당 하나의 pageContext객체가 생성 

- 주요 기능은 페이지의 흐름제어(forward)에 사용 

forward 기능 

- 시스템에서 페이지를 요청하는 pageContext객체의 기능 
- 최초 요청에 대한 주소가 반영, cf) redirect 는 최종 요청에 대한 주소가 반영 
- 서버는 물리적인 시스템, 톰캣 설치, 톰캣 환경, 톰캣 객체 -> application
- 객체는 유무형 형체 동작등을 프로그래밍 코드로 표현 


Ch03. JSP Session 내장객체

session 내장객체

- 최초 요청에서 부터 마지막 요청까지의 전체 시간
- 클라이언트에서 서버로 요청할 때 서버에 기록되는 클라이언트 정보 테이블 (Session Table)
- 서버는 각 클라이언트에 대한 고유번호(Session ID)를 부여 

Ch03. JSP Cookie 실습

Cookie

 - 클라이언트와 서버간의 식별를 위해 사용되는 조각 파일 
 - 쿠키는 서버에서 생성하고 클라이언트에 저장
 - 클라이언트는 전송된 쿠키를 보관, 해당 서버로 다시 요청 할때 보관된 쿠키를 같이 전송 


Ch04. Jsp Insert 실습

Class.forName("com.mysql.jdbc.Driver") // 드라이버 로딩

// DB연결 
String host = "jdbc:mysql://서버주소:db포트번호/db명";
String user = "db사용자아이디";
String password = "db사용자패스워드";

Connection conn = DriverManager.getConnection(host,user,password);

// 쿼리 실행을 위한 statement 또는 preparestatement 객체 생성 

PrepareStatement psmt = conn.prepareStatement("INSERT INTO `MEMBER` VALUES(?,?,?,?);"); // INSERT INTO~ 쿼리문 셋팅 

// 와일드키워드에 각각 차례로 데이터를 저장하도록 합니다. 

psmt.setString(1,uid);
psmt.setString(2,pass);
psmt.setString(3,name);
psmt.setString(4,hp);

//  모든 쿼리문 셋팅완료 했으므로 쿼리문 실행

psmt.executeUpdate();

//  메모리해제 
psmt.close();
conn.close();

Ch05. Jsp JSON 데이터 실습

Json 데이터

- Javascript  Object Notation (자바 객체 표기) 
- 이기종간의 데이터 교환할 때 사용하는 표준 포맷
- 사물인터넷시대에 어떤 클라이언트든 교환가능 

Gson을 활용한 데이터 전송하기 

MemberVo vo = new MemberVo();
vo.setUid("abcd");
vo.setName("홍길동");

Gson gson = new Gson();
String json = gson.toJson(vo);
out.println(json);


Ch05. Jsp AJAX 실습

AJAX(Asychronous Jacascript And Xml)

- 일반적인 페이지 요청을 위한 HTTP 통신과 다르게 데이터 요청을 위한 부분 통신 (비동기)
- 데이터 결과는 일반적으로 Json을 사용 
- 80~90퍼가 이통신을 사용..왜? html문서가 아닌 앱을 주로 사용 !!!!!


Ch06. JSP 표현언어(Expression Language) 기본 실습


Ch06. JSP 표현언어(Expression Language) 내장객체 실습



Ch07. JSP MODEL2 MVC 실습

Model -      비지니스 로직과 데이터베이 연동을 담당하는 영역입니다. 
View -       실제로 화면에 보여지는 영역입니다.
Controller - 뷰와 모델의 중간다리 역할을 하는 영역입니다. 

Model 영역

DBConfig(데이터베이스 접근주소 및 권한 설정)

데이터베이스 접근 설정 영역도 공통으로 사용하므로 싱글톤 패턴으로 생성하도록 하였습니다.
서버주소와 포트번호 DB명 사용자명 비밀번호를 명시해주면 해당 서버 데이터베이스에 접근이 가능하도록 하였습니다.
JDBC 드라이버를 이용해서 Connection객체를 생성하여 위의 정보를 가지고 데이터베이스와 연결합니다.


DAO(Data Access Object)

데이터베이스에 접근하기 위한 객체를 싱글톤 패턴으로 생성하였습니다.
DBConfig 객체를 생성하여  DB연결을 하도록 설정하였고, 
컨트롤러에서 전달한 VO(관계형데이터베이스 레코드에 대응되는 객체)를 
데이터베이스(MySQL)에 저장하도록 하였습니다. 또 반대로 데이터베이스에 있는
데이터들을 검색하여 결과를 가져와서 컨트롤러에 전달을 해주는 역할을 하는 영역입니다.

Sql(Structured Query Language)

데이터베이스에 직접 데이터를 넣거나 삭제 변경하는 작업을 하는 명령어들을 정의해주는 클래스를 생성하도록 하였습니다. 
모든 쿼리문을 여기에 정의해 놓음으로써 매번 쿼리문을 정의하여 사용하거나 쿼리분 변경이 있을 경우 이 영역에서만 수정하면 
보다 재활용성과 유지보수를 수월하게 할 수 있습니다.

Controller 영역

MainController 클래스를 정의하고 요청과 응답의 역할을 해주는 HttpServlet 클래스를 상속받아서
메서드를 오버라이딩하여 구현합니다. 먼저 init을 초기화하는 역할의 메서드로 정의하고 WEB-INF에서 만든
urlMapping.properties파일경로를 찾아서  각 요청주소에 대한 서비스 객체들을 매핑한 정보들을 들고옵니다.
Properties 객체로 맵핑한 정보를 로드하게 되면 해시맵 자료구조로 요청주소와 서비스 객체 값들이 들어오게 되고
객체생성까지 완료하고 키와 값으로 객체들을 생성합니다. 여기서 서비스 객체들은 다양하므로 다형성의 특징을 이용해서
부모인터페이스를 구현하여 각 서비스 객체들의 요청처리 메서드 반환값을 받아옵니다. 요청처리 반환값이 redirect인경우
재요청을 할것이고, json이라면 json형태의 데이터를 전달할 것이고, 파일형태라면 파일을 업로드하게 될것입니다.


View 영역

View영역에서는 데이터를 주거나 받을 때 JSTL라이브러리를 임포트하여 변수들을 참조하거나 
조건문,반복문 등을 사용하도록 하였습니다. 표현식을 사용하여 컨트롤러에서 응답 타입에 따라서 
페이지를 이동하거나 JSON데이터를 받거나 원하는 데이터를 가져오도록 설계 되었습니다.



