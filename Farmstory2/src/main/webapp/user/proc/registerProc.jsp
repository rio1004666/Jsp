<%@page import="kr.co.farmstory2.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory2.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.farmstory2.bean.MemberBean"%>
<%@page import="kr.co.farmstory2.dao.MemberDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

			request.setCharacterEncoding("utf-8"); // 한글데이터로 복호화해준다
			
			String uid = request.getParameter("uid"); //1
			String name = request.getParameter("name"); //2
			String pass1 = request.getParameter("pass1"); //3
			String nick = request.getParameter("nick"); //4
			String email = request.getParameter("email");//5
			String hp = request.getParameter("hp");//6
			String zip = request.getParameter("zip");//7
			String addr1 = request.getParameter("addr1");//8
			String addr2 = request.getParameter("addr2");//9
			String regip = request.getRemoteAddr(); //10   사용자 시스템 아이피주소
			
			
			try{
				
				Connection conn = DBConfig.getInstance().getConnection();
				
				PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_MEMBER);
				psmt.setString(1, uid);
				psmt.setString(2, pass1);
				psmt.setString(3, name);
				psmt.setString(4, nick);
				psmt.setString(5, email);
				psmt.setString(6, hp);
				psmt.setString(7, zip);
				psmt.setString(8, addr1);
				psmt.setString(9, addr2);
				psmt.setString(10, regip);
				psmt.executeLargeUpdate();
				psmt.close();
				conn.close();
			}catch(Exception e){ // 아이디 중복데이터가 들어오면 예외발생하고 그대로 진행시킨다 그치만 데이터 입력안된다 
				
				e.printStackTrace();
			
			}

			response.sendRedirect("/Farmstory1/user/login.jsp");
%>