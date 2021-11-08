<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

/*
	날짜 : 2021/08/09
	이름 : 강병화	
	내용 : Jsp JSON 데이터 실습하기 
	json 데이터
	- Javascript  Object Notation (자바 객체 표기) 
	- 이기종간의 데이터 교환할 때 사용하는 표준 포맷
	- 사물인터넷시대에 어떤 클라이언트든 교환가능 
*/
	String jsonData ="{\"uid\":\"A101\", \"name\":\"홍길동\", \"hp\":\"010-1234-1111\",\"age\":25}"; // 문자열을 표시하고 이 문자열에서 또문자열은 인식불가 escape처리를 해줘야한다 
	// 문자 그자체ㅔ를 표현하려면 이스케이프 숫자는 ""빼야한다
	// 자바스크립트 객체 
	// 자바에서는 단순 문자열이고 데이터 출력 전송은 out객체 사용!!
	
	out.print(jsonData);
	// html css 자바스크립트 모두 지원 
	// json형태로 출력된다 위의 contenttype이 json

%>