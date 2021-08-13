<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application:json;charset=UTF-8" pageEncoding="UTF-8"%>


<%--반환값은 json데이터 !!!! 타입 마임타입 !!!!!! --%>


<%
	//전송데이터 수신 
	request.setCharacterEncoding("utf-8");

	
	
	
	String uid = request.getParameter("uid");
	String nick = request.getParameter("nick");
	int result1 = 0;
	int result2 = 0;
	try{
		Connection conn = DBConfig.getInstance().getConnection();
		
		// 있으면 갯수를 반환 1개이상이면 머 아이디가 있으므로 있다고 데이터 전송 
	
		PreparedStatement psmt1 = conn.prepareStatement(Sql.SELECT_COUNT_UID);
		
		
		psmt1.setString(1, uid);
	
		
		ResultSet rs1 = psmt1.executeQuery(); // select구문은 항상 결과값을 얻어야한다 

		
		if(rs1.next()){
			result1 = rs1.getInt(1); // 테이블 필드의 1번째 
		}
		
		rs1.close();

		psmt1.close();

		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();	
	}
	//json출력
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result1); // 속성을 추가함 키와 값의 형태로 
	out.print(json); // 이  jsp파일은 반환 마임 타입이 json타입이므로 out객체로 어떤 타입이든 반환이 가능하므로 데이터를 뱉어낸다 

%>