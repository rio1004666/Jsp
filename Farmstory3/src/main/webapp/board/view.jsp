<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../_header.jsp" %> 
<jsp:include page="./_aside${group}.jsp">
	<jsp:param name="cate" value="${cate}"/>
</jsp:include>
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title"  value=" ${article.title}"readonly/></td>
                </tr>            
                <c:if test="${article.file eq 1}">
                	<tr>
		                <td>첨부파일</td>	                    
			            <td>
			            	<!-- 파일번호는 글객체에 있다!!!!!! -->
			                   <a href="/Farmstory3/board/fileDownload.do?fseq=${article.fb.fseq}">${article.fb.oriName}</a>
			                   <span>${article.fb.download} 회 다운로드</span>
			            </td>	 
               		</tr>
                </c:if>    
                
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly>${article.content}</textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Farmstory3/board/delete.do" class="btnDelete">삭제</a>
                <a href="/Farmstory3/board/modify.do?group=${group}&cate=${cate}&seq=${article.seq}" class="btnModify">수정</a>
                <a href="/Farmstory3/board/list.do?group=${group}&cate=${cate}" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                <c:forEach var="comm"  items="${comments}">
	                <article class="comment">
	                	<span>
	                        <span>${comm.nick}</span>
	                        <span>${comm.rdate}</span>
	                    </span>
	                    <textarea name="comment" readonly>${comm.content}</textarea>
	                    <div>
	                        <a href="#">삭제</a>
	                        <a href="#">수정</a>
	                    </div>
	                </article>
                </c:forEach>
                <c:if test="${article.comment eq 0}"> <!-- 글의 코멘트 갯수가 저장되어있는데 0개면 -->
                <!-- 혹은 comments.size == 0  갯수가 0개면 -->
                	<p class="empty">
                		등록된 댓글이 없습니다.
                	</p>
                </c:if>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/Farmstory3/board/comment.do" method="post">
                	<input type="hidden"  name="parent" value="${article.seq}">
                	<input type="hidden"  name="uid" value="${sessMember.uid}">
                    <textarea name="content"></textarea>
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
<%@ include file="../_footer.jsp"%>