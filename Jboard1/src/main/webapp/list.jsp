<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	
	if(mb == null){
		// 로그인을 하지 않고 list 페이지를 요청했을 때
		response.sendRedirect("/Jboard1/user/login.jsp?success=102");
		return;
	}
	
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String pg = request.getParameter("pg");
	
	// 페이지 처리
	int start = 0;
	int currentPage = Integer.parseInt(pg); // 현재페이지 1번 2번....
	int total = ArticleDao.getInstance().selectCountTotal(); // 게시판글의 총 갯수를 긁어오기 위한 느낌
	int lastPageNum = 0; // 마지막페이지 10개씩 끊어서 구한다 
	
	if(total % 10 == 0){ // 마지막페이지를 구하는 과정 
		lastPageNum = total / 10;
	}else{
		lastPageNum = total / 10 + 1;
	}	
	start = (currentPage - 1) * 10;
	
	int pageStartNum = total - start; // 각 페이지마다 시작되는 번호 196개의 글이라면 196~187까지 1페이지 186~177
	// 1번부터 10번까지 페이지번호는 1번그룹 11번부터 20번까지 페이지번호는 2번그룹 
	int groupCurrent = (int)Math.ceil(currentPage / 10.0);
	// 1그룹을 지어서 1번 페이지 부터 10페이지까지 설정 
	int groupStart = (groupCurrent - 1) * 10 + 1;
	int groupEnd = groupCurrent * 10;
	
	if(groupEnd > lastPageNum){
		groupEnd = lastPageNum;
	}
	
	List<ArticleBean> articles = ArticleDao.getInstance().selectArticles(start);
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글목록</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css">    
</head>
<body>
    <div id="wrapper">
        <section id="board" class="list">
            <h3>글목록</h3>
            <article>
                <p>
                    <%= mb.getNick() %>님 반갑습니다.
                    <a href="/Jboard1/user/proc/logoutProc.jsp" class="logout">[로그아웃]</a>
                </p>
                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                    <!-- 조합한 결과를 화면에 뿌리기위해 스크립트릿과 html문법을 같이 사용 -->
                    <% for(ArticleBean article : articles){ %>
                    <tr>
                        <td><%= pageStartNum-- %></td>
                        <td><a href="/Jboard1/view.jsp"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
                        <td><%= article.getNick() %></td>
                        <td><%= article.getRdate().substring(2, 10) %></td>
                        <td><%= article.getHit() %></td>
                    </tr>
                    <%}%>
                </table>
            </article>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
                <!--  반복되는 부분과 조건을 처리하는 부분은 스크립트릿으로!  -->
                <!--  그룹의 스타트는 1일때는 그 이전이 없으므로 표시하지않는다 이전버튼을 -->
                <!--  그룹의 스타트가 2일때는 이전이 있으므로 표시한다 이전 버튼을  -->
                <% if(groupStart > 1){ %>
                <!--  이전버튼은 그룹 1번으로 돌아가기 위한 버튼이다. -->
                	<a href="/Jboard1/list.jsp?pg=<%= groupStart - 1 %>" class="prev">이전</a>
                <% } %>
                <!-- 그룹 1번은 1번부터 10번까지  -->
                <!--  그룹 2번은 11번부 20번까지  -->
                <% for(int i = groupStart ; i <= groupEnd ; i++){ %>
                 <!--  num 뒤에 currentPage == i 조건을 만족하면 css적용되면서 색이 바뀐다  -->
                	<a href="/Jboard1/list.jsp?pg=<%= i %>" class="num <%= (currentPage == i) ? "current":"" %>"><%= i %></a>
                <% } %>
                <!--  그룹의 끝은 20인데  마지막페이지도 20이라면 더이상 다음버튼을 표시하지않음 -->
                <!--  그룹의 끝이 10라면  마지막페이지가 20이고 조건을 만족하므로 다음 버튼이 표시됨 -->
                <% if(groupEnd < lastPageNum){ %>
                <!-- 다음버튼은 그다음 그룹으로 넘어가기 위한 버튼이다  -->
                	<a href="/Jboard1/list.jsp?pg=<%= groupEnd + 1 %>" class="next">다음</a>
                <% } %>
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="/Jboard1/write.jsp" class="btnWrite">글쓰기</a>

        </section>
    </div>    
</body>
</html>