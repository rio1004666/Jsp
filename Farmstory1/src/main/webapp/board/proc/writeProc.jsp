<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String cate    = request.getParameter("cate");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	String uid     = request.getParameter("uid");
	String regip   = request.getRemoteAddr();
	String uri = request.getParameter("uri"); // 해당되는 프로젝트 파일경로에서 페이지로 다시 돌아가기 위해서 uri값을 받아와야한다 
	ArticleBean article = new ArticleBean();
	article.setCate(cate);
	article.setTitle(title);
	article.setContent(content);
	article.setFile(0);
	article.setUid(uid);
	article.setRegip(regip);
	
	ArticleDao.getInstance().insertArticle(article);
	
	response.sendRedirect(uri);
%>

