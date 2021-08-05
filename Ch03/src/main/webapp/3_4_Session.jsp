<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>3_4_Session</title>
<%--
	날짜 : 2021/08/04
	이름 : 강병화
	내용 : JSP Session 내장객체 실습하기 
 	session 내장객체
 	-최초 요청에서 부터 마지막 요청까지의 전체 시간
 	- 클라이언트에서 서버로 요청할 때 서버에 기록되는 클라이언트 정보 테이블 (Session Table)
 	- 서버는 각 클라이언트에 대한 고유번호(Session ID)를 부여 
 --%>
</head>


<body>
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


</body>
</html>