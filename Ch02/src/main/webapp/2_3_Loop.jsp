<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2_3_Loop</title>
<%--

	날짜 : 2021/08/04
	이름 : 강병화
	내용 : JSP 반복문 실습하기 


 --%>
</head>
<body>

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
			<td>
			<% out.print(i+"단"); %>
			</td>
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

</body>
</html>