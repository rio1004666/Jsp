<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

/// 외워라 걍 데이터베이스 처리 로직  = 에러가 발생 할 수 있따 => 예외상황 처리 

	// 데이터베이스 mysql용 드라이버 

	String host = "jdbc:mysql://54.180.160.240:3306/rio1004666";
	String user = "rio1004666";
	String pass = "1234";
	try{
		
	

 	// 1단계 - JDBC 드라이버 로드 
	Class.forName("com.mysql.jdbc.Driver");
 	// 2단계 - 데이터베이스 접속
 	Connection connection = DriverManager.getConnection(host,user,pass);
	// 3단계 - SQL 실행객체 생성 
 
 	// 4단계 - SQL 실행
 
 	// 5단계 - 결과처리(SELECT 일 경우 )

 	// 6단계 - 데이터베이스 종료 
 
 
 
	}catch(Exception e){
		e.printStackTrace();
	}
%>



