<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String uid = request.getParameter("uid");
String name = request.getParameter("name");
String hp = request.getParameter("hp");
String age = request.getParameter("age");
/// 외워라 걍 데이터베이스 처리 로직  = 에러가 발생 할 수 있따 => 예외상황 처리 

// 데이터베이스 mysql용 드라이버 

String host = "jdbc:mysql://54.180.160.240:3306/rio100466";
String user = "rio100466";
String pass = "1234";
try {
	// 1단계 - JDBC 드라이버 로드 
	Class.forName("com.mysql.jdbc.Driver");
	// 2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
	// 3단계 - SQL 실행객체 생성 

	Statement stmt = conn.createStatement();

	// 4단계 - SQL 실행 = 쿼리문에 매핑 

	String sql = "INSERT INTO `USER1` VALUES('" + uid + "','" + name + "','" + hp + "'," + age + ");";
	stmt.executeUpdate(sql); // 업데이트 함수 

	// 5단계 - 결과처리(SELECT 일 경우) insert문이라서 5단계 무시 

	// 6단계 - 데이터베이스 종료 
	stmt.close();
	conn.close();
	
	
} catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("../4_2_Select.jsp");
%>



