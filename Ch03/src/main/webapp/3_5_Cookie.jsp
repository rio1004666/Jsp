<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3_5_Cookie</title>
<%-- 
	날짜 : 2021/08/04
	이름 : 강병화
	내용 : JSP Cookie 실습하기 
 	Cookie
 	 - 클라이언트와 서버간의 식별를 위해 사용되는 조각 파일 
 	 - 쿠키는 서버에서 생성하고 클라이언트에 저장
 	 - 클라이언트는 전송된 쿠키를 보관, 해당 서버로 다시 요청 할때 보관된 쿠키를 같이 전송 
 --%>
</head>
<body>
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
</body>
</html>