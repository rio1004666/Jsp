<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객정보 수정</title>
</head>
<body>
	<h3>고객수정</h3>
	<form action="./proc/modifyProc.jsp" method="post">
	<table border="1">
		<tr>
			<td>고객번호</td>
			<td><input type="text" readonly name="custid" value=""></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text"  name="name"></td>

		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address"></td>

		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="phone"></td>

		</tr>
		<tr>

			<td colspan="2" align="right">
			<input type="submit" value="수정하기">
			</td>

		</tr>
	</table>
	</form>
</body>
</html>