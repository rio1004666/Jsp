<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//세션체크해서 로그인햇는지 확인 안했으면 체크하고 여기로 넘어와야한다 
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");

	if(mb == null){
		// 로그인을 하지 않고 list 페이지를 요청했을 때 => 에러코드도 같이 날려주자 
		response.sendRedirect("/Jboard1/user/login.jsp?success=103");
		return ; // 종료를 해줘야한다 
	}
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	
	ArticleDao dao = ArticleDao.getInstance();
	
	// 조회수 업데이트
	dao.updateArticleHit(seq);
	// 글 가져오기
	ArticleBean article = dao.selectArticle(seq);
	// 댓글 가져오기 
	 List<ArticleBean> comments = dao.selectComments(seq);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%=article.getTitle() %>" readonly/></td>
                </tr>
                <%if(article.getFile() ==1){ %>
                   <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="#"><%= article.getFb().getOriName() %></a>
                        <span><%= article.getFb().getDownload() %>회 다운로드</span>
                    </td>
                </tr>
                <%} %>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content"  readonly><%=article.getContent() %></textarea> <!--  내용은 건들면 안되니까 readonly -->
                    </td>
                </tr>
            </table>
            <div>
                  <a href="#" class="btnDelete">삭제</a>
                <a href="/Jboard1/modify.jsp" class="btnModify">수정</a>
                <a href="/Jboard1/list.jsp" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
           
            <section class="commentList">
                <h3>댓글목록</h3>
                  <%for(ArticleBean comment: comments){ %>
                <article class="comment">
                    <span>
                        <span><%=comment.getNick() %></span>
                        <span><%=comment.getRdate().substring(2, 10) %></span>
                    </span>
                    <textarea name="comment" readonly><%=comment.getContent() %></textarea>
                    <div>
        					<a href="#">삭제</a>
                        	<a href="#">수정</a>
                    </div>
                </article>
               <%} %>
               <%if(comments.size() == 0){ %>
                <p class="empty">
                    등록된 댓글이 없습니다.
                </p>
                <%} %>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/Jboard1/user/proc/commentProc.jsp" method="post">
                	<!-- form방식으로 데이터를 전송하는 경우 input방식 hidden으로  -->
                	<input type="hidden" name="parent" value="<%=article.getSeq()%>"/>
                	<input type="hidden" name="uid" value="<%=mb.getUid()%>"/> <!-- 내 현재 로그인한 아이디로 작성 -->
                    <textarea name="content" ></textarea>
                    <div>
                        <a href="/Jboard1/list.jsp" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>
        </section>
    </div>    
</body>
</html>