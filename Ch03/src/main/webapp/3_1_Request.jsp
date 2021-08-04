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
	<h4>회원가입</h4>
	<form action="/Ch03/proc/registerProc.jsp" method="get">
		<table>
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
				</select></td>
			</tr>
			<tr>
					<tr>
				<td colspan="2" align="right"><input type="submit" value="가입하기">
					<!--  사용자로부터 데이터를 입력받아서 보낸다 --></td>
			</tr>
			</tr>
		</table>




	</form>







</body>
</html>