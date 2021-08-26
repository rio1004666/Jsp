<%@page import="kr.co.farmstory1.bean.MemberBean"%>
<%@page import="kr.co.farmstory1.dao.MemberDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	// 데이터 기본 수신 
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass1");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String grade = request.getParameter("grade");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	// 받은 데이터를 멤버빈객체로 담아서 데이터베이스에 넘겨줌 
	MemberBean mb = new MemberBean();
	mb.setUid(uid);
	mb.setPass(pass);
	mb.setName(name);
	mb.setNick(nick);
	mb.setEmail(email);
	mb.setHp(hp);
	int num = Integer.parseInt(grade);
	mb.setGrade(num);
	mb.setZip(zip);
	mb.setAdd1(addr1);
	mb.setAdd1(addr2);
	mb.setAdd1(regip);
	// 멤버다오로 데이터 접근해서 데이터베이스에 저장 	
	MemberDao.getInstance().insertMember(mb);
	
%>