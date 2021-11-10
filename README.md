### Jsp 

Jsp수업예제

Ch01. Jsp 페이지 출력하기

Ch02. JSP스크립트릿(Scriptlet)실습하기

스크립트릿(Scriptlet)

  - JSP 문서에서 자바 프로그래밍이 실행되는 코드영역 
  - 모델1에서 사용되는 동적 실행 영역
  
표현식 (Expression)

  - 스크립트릿에서 선언된 변수를 참조하여 출력하는 출력구문  
  

Ch02. JSP 조건문 실습하기 



Ch02. JSP 반복문 실습하기 


Ch02. JSP Include 지시자 실습하기  


Ch03. JSP - Request객체


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



Ch05. Jsp JSON 데이터 실습

json 데이터

- Javascript  Object Notation (자바 객체 표기) 
- 이기종간의 데이터 교환할 때 사용하는 표준 포맷
- 사물인터넷시대에 어떤 클라이언트든 교환가능 


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

DAO(Data Access Object)

데이터베이스에 접근하기 위한 객체를 싱글톤 패턴으로 생성하였습니다.
com.mysql.jdbc.driver 클래스를 통해 db연결을 하도록 설정하였고, 
컨트롤러에서 전달한 VO(관계형데이터베이스 레코드에 대응되는 객체)를 
데이터베이스(MySQL)에 저장하도록 하였습니다.

Model

