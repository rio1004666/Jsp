<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	ArticleBean ab = new ArticleBean();
	request.setCharacterEncoding("utf-8");
	String parent = request.getParameter("parent");
	String content = request.getParameter("content");
	String uid = request.getParameter("uid");
	String regip = request.getRemoteAddr();
	ab.setParent(parent);
	ab.setContent(content);
	ab.setUid(uid);
	ab.setRegip(regip);
	// 댓글 등록하기 
	ArticleDao.getInstance().insertComment(ab);
	// 리다이렉트  => 그냥 가면안된다 그 해당되는 글 보기에가야하므로 seq를 가져가야한다
	response.sendRedirect("/Jboard1/view.jsp?seq="+parent);
%>