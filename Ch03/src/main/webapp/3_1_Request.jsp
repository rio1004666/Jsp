<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3_1_Request</title>
</head>
<body>
	<h3>1. JSP request 객체</h3>
	<form action="./proc/loginProc.jsp" method="post">
		<!--  주소에 데이터가 붙어서가는 것을 파라미터 이 전송방식을 get방식 (키 와 밸류형식으로 전송) -->
		<table border="3">
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
	<h4>회원가입</h4>
	<form action="/Ch03/proc/registerProc.jsp" method="get">
		<table border="2">
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name">
				</td>

			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" value="1">남</label>
					<label><input type="radio" name="gender" value="2">여</label>
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<label><input type="checkbox" name="hobby" value="등산">등산하기</label> 
					<label><input type="checkbox" name="hobby" value="독서">독서하기</label>
					<label><input type="checkbox" name="hobby" value="여행">여행하기</label> 
					<label><input type="checkbox" name="hobby" value="운동">운동하기</label>
					<label><input type="checkbox" name="hobby" value="영화">영화보기</label>
				</td>

			</tr>
			<tr>
				<td>주소</td>
				
				<td>
				<select name="addr">
						<option value="서울">서울특별시</option>
						<option value="대전">대전광역시</option>
						<option value="대구">대구광역시</option>
						<option value="부산">부산광역시</option>
						<option value="광주">광주광역시</option>
				</select>
				</td>
				
			</tr>
			<tr>
					<tr>
				<td colspan="2" align="right"><input type="submit" value="가입하기">
					<!--사용자로부터 데이터를 입력받아서 보낸다--></td>
			</tr>
			
		</table>

	</form>
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





</body>
</html>