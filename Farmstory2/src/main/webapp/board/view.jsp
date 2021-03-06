<%@page import="kr.co.farmstory2.bean.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory2.bean.ArticleBean"%>
<%@page import="kr.co.farmstory2.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	String seq = request.getParameter("seq");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String includeFile = "./_aside"+group+".jsp";
	
	
	ArticleDao dao = ArticleDao.getInstance();	
	// 조회수 업데이트
	dao.updateArticleHit(seq);
	// 글 가져오기
	ArticleBean article = dao.selectArticle(seq);
	// 댓글 가져오기
	List<ArticleBean> comments = dao.selectComments(seq);
%>
<%@ include file="../_header.jsp" %>
<jsp:include page="<%= includeFile %>">
	<jsp:param name="cate" value="<%= cate %>"/>
</jsp:include>

<script>
	$(document).ready(function(){
		
		// 댓글 삭제
		$('.btnCommentDel').click(function(){
			var result = confirm('정말 삭제 하시겠습니까?');
			return result;
		});
		var content = '';
		
		// 댓글 수정
		$('.btnCommentModify').click(function(){
			
			var tag = $(this);
			var mode = $(this).text();    			    			
			var textarea = $(this).parent().prev();
			
			if(mode == '수정'){
				// 수정모드
				content = textarea.val(); 
				
				$(this).prev().css('display', 'none');
				$(this).next().css('display', 'inline');
				$(this).text('수정완료');
				textarea.attr('readonly', false).focus();
    			textarea.css({
    				'background': 'white',
    				'outline': '1px solid gray'
    			});
    			
			}else{
				// 수정완료 모드
				
				var seq     = textarea.attr('data-seq');
				var comment = textarea.val(); 
				
				var jsonData = {
						'seq': seq,
						'comment': comment
					};
				
				$.ajax({
					url: '/Farmstory2/board/proc/updateCommentProc.jsp',
					type: 'post',
					data: jsonData,   // 서버로 전송하는 데이터(JSON) 지정
					dataType: 'json', // 서버로 부터 전달되는 데이터 종류
					success: function(data){
						if(data.result == 1){
							alert('댓글 수정이 성공 했습니다.');
							
							// 수정모드 해제
							tag.text('수정');
							tag.prev().css('display', 'inline');
							tag.next().css('display', 'none');    			    			    							
			    			textarea.attr('readonly', true);
			    			textarea.css({
			    				'background': 'transparent',
			    				'outline': 'none'
			    			});
			    			
						}else{
							alert('댓글 수정이 실패 했습니다.');
						}
					}
				});
			}
			return false;
		});
		
		// 댓글 수정 취소
		$('.btnCommentCancel').click(function(e){
			e.preventDefault();
			$(this).prev().text('수정');
			$(this).prev().prev().css('display', 'inline');
			$(this).css('display', 'none');
			
			var textarea = $(this).parent().prev();
			
			textarea.val(content);
			textarea.attr('readonly', true);
			textarea.css({
				'background': 'transparent',
				'outline': 'none'
			});	
		});
		$('.btnCancel').click(function(){
			var textarea = $(this).parent().prev();
			textarea.val(content);		
			textarea.text('')
		});
	});
</script>
<style>
	*:focus { outline: 0; }
</style>

<section id="board" class="view">
		
    <h3>글보기</h3>
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
        </tr>
        <% if(article.getFile() == 1){ %>
        <tr>
            <td>첨부파일</td>
            <td>
                <a href="/Farmstory2/board/proc/download.jsp?fseq=<%=article.getFb().getFseq()%>"><%= article.getFb().getOriName() %></a>
                <!-- 파일 번호를 줘야 다운로드에서 그에 해당하는 원래이름과 새로운 이름 다운로드 횟수가 저장된다  -->
                <span><%= article.getFb().getDownload()%>회 다운로드</span>
            </td>
        </tr>
        <% } %>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content"  readonly><%= article.getContent() %></textarea>
            </td>
        </tr>
    </table>
    <div>
    	<% if(mb.getUid().equals(article.getUid())){ %>
        	<a href="/Farmstory2/board/proc/deleteProc.jsp?group=<%=group %>&cate=<%=cate %>&seq=<%= article.getSeq()%>" class="btnDelete">삭제</a>
       		<a href="/Farmstory2/board/modify.jsp?group=<%=group %>&cate=<%=cate %>&seq=<%= article.getSeq() %>&uid=<%=mb.getUid() %>" class="btnModify">수정</a>
     	<% } %>
        <a href="/Farmstory2/board/list.jsp?group=<%=group %>&cate=<%=cate %>" class="btnList">목록</a>
    </div>  
    
    <!-- 댓글리스트 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        
        <% for(ArticleBean comment : comments){ %> 
         <article class="comment">
             <span>
                 <span><%= comment.getNick() %></span>
                 <span><%= comment.getRdate().substring(2, 10) %></span>
             </span>
             <textarea name="comment"  data-seq="<%= comment.getSeq() %>" readonly><%= comment.getContent() %></textarea>
             
             <% if(mb.getUid().equals(comment.getUid())){ %>
             <div>
                 <a href="/Farmstory2/board/proc/deleteCommentProc.jsp?parent=<%= comment.getParent() %>&seq=<%= comment.getSeq() %>" class="btnCommentDel">삭제</a>
                 <a href="#" class="btnCommentModify">수정</a>
                 <a href="#" class="btnCommentCancel" style="display:none">취소</a>
             </div>
             <% } %>
         </article>
        <% } %>
        
        <% if(comments.size() == 0){ %>
        	<p class="empty">등록된 댓글이 없습니다.</p>
        <% } %>
    </section>

    <!-- 댓글입력폼 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="/Farmstory2/board/proc/insertCommentProc.jsp" method="post">
        	<input type="hidden" name="parent" value="<%= article.getSeq() %>" />
        	<input type="hidden" name="uid" value="<%= mb.getUid() %>" />
        	<input type="hidden" name="group" value="<%=group%>"/>
        	<input type='hidden' name="cate" value="<%=cate%>"/>        	
            <textarea name="content"></textarea>
            <div>
                <a href="#" class="btnCancel">취소</a>
                <input type="submit" class="btnWrite" value="작성완료"/>
            </div>
        </form>
    </section>
</section>