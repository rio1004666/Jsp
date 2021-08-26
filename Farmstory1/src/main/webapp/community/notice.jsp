<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	String mode = request.getParameter("mode");
// URI값을 얻어와서 페이지를 다르게 표현 
	if(mode == null){
		mode = "l"; // 리스트로 간다 그냥 
	}
%>
<div id="sub" class="cate5">
    <div><img src="../img/sub_top_tit5.png" alt="COMMUNITY"/></div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate5_tit.png" alt="커뮤니티"/>
            <ul>
                <li class="on"><a href="./notice.jsp">공지사항</a></li>                        
                <li><a href="./menu.jsp">오늘의식단</a></li>                        
                <li><a href="./chef.jsp">나도요리사</a></li>                        
                <li><a href="./qna.jsp">고객문의</a></li>                        
                <li><a href="./faq.jsp">자주묻는질문</a></li>                        
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate5_tit1.png" alt="공지사항"/>
                <p>
                    HOME > 커뮤니티 > <strong>공지사항</strong>
                </p>
            </nav>

           	<% if(mode.equals("l")){ %>
            	<jsp:include page="../board/list.jsp"/>
            <% }else if(mode.equals("w")){ %>
            	<jsp:include page="../board/write.jsp">
            		<jsp:param name="uid" value="<%= mb.getUid() %>"/>
            	</jsp:include>
            <% }else if(mode.equals("v")){ %>
            	<jsp:include page="../board/view.jsp"/>
            <% }else if(mode.equals("m")){ %>
            	<jsp:include page="../board/modify.jsp"/>
            <% } %>
        </article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>