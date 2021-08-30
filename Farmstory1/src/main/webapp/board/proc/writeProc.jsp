<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	

	request.setCharacterEncoding("utf-8");

	String path = request.getServletContext().getRealPath("/file"); // file폴더가 있어야한다 
	int maxSize = 1024*1024*10;
	// 데이터 형식이 multipart형식이면 그 리케스트 객체를 생성해서 사용해야한다 
	MultipartRequest mRequest = new MultipartRequest(request,path,maxSize,"utf-8",new DefaultFileRenamePolicy());
	
	String cate    = mRequest.getParameter("cate");
	String uid     = mRequest.getParameter("uid");
	String title   = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String fname = mRequest.getParameter("fname");
	String uri = mRequest.getParameter("uri"); // 해당되는 프로젝트 파일경로에서 페이지로 다시 돌아가기 위해서 uri값을 받아와야한다 
	String regip   = request.getRemoteAddr(); // 아이피주소는 그대로 request사용한다 
	
	
	ArticleBean article = new ArticleBean();
	article.setCate(cate);
	article.setTitle(title);
	article.setContent(content);
	article.setFile(fname == null ? 0 : 1);
	article.setUid(uid);
	article.setRegip(regip);
	
	int seq = ArticleDao.getInstance().insertArticle(article);
	if(fname != null){
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext;
		File oriFile = new File(path+"/"+fname);
		File newFile = new File(path+"/"+newName);
		oriFile.renameTo(newFile);
		
		ArticleDao.getInstance().insertFile(seq, fname, newName);
	}

	response.sendRedirect(uri);
%>

