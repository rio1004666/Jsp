<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerProc</title>

<!-- 
	날짜 : 2021/08/04
	이름 : 강병화
	내용 : JSP request 내장객체 실습하기 
	request 내장객체 
	- 클라이언트의 요청정보를 갖는 객체 
	- 클라이언트의 전송 데이터(Parameter)를 수신 기능을 제공 
	Get 전송방식 
	- 기본 데이터 전송방식 
	- 주세요하는 거임 옛다 받아라 ( html ) -> db가있다면 해당 회원 조회 ㅇㅋ 맞아 하고 응답해줌 
	- 서버에 페이지나 데이터를 요청하는 전송방식
	Post 전송방식
	- 서버에 데이터를 전달하면서 처리를 요청하는 전송방식 
	- 전송 데이터를 요청메세지에 삽입해서 전송하므로 데이터 노출 안됨 
 -->
</head>
<body>

	<h3>회원가입 데이터 수신하기 </h3>
	
	
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobbies = request.getParameterValues("hobby");
		// 취미는 여러개 받을 수 있으므로 문자열 여러개로 받는 배열!!! ~s로 끝나면 배열이다 무조건 
		String addr = request.getParameter("addr");
		
		// 받는 모든 것들은 문자열 객체이다 
	%>
	
	<p>
		
		이름 : <%=name %></br>
		성별 : <%= (gender.equals("1"))? "남자" :  "여자" %> </br>
		취미 : <%
				for(String str : hobbies){
					//out.print(str + " , ");
					
				
				}
				%>
				</br>
		주소 : <%=addr %></br>
		
	</p>
	<a href="/Ch03/3_1_Request.jsp"></a>
</body>
</html>