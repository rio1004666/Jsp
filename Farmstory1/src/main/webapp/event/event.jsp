<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	String mode = request.getParameter("mode");
// URI값을 얻어와서 페이지를 다르게 표현 
	if(mode == null){
		mode = "l"; // 리스트로 간다 그냥 
	}
%>
<div id="sub" class="cate4">
    <div><img src="../img/sub_top_tit4.png" alt="EVENT"/></div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate4_tit.png" alt="이벤트"/>
            <ul>
                <li class="on"><a href="./event.jsp">이벤트</a></li>                        
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate4_tit1.png" alt="이벤트"/>
                <p>
                    HOME > 이벤트 > <strong>이벤트</strong>
                </p>
            </nav>

            <!-- 내용 시작 -->
            <%if(mode.equals("l")){ %>
         		<jsp:include page="../board/list.jsp"/>
			<%}else if(mode.equals("w")){ %>
				<jsp:include page="../board/write.jsp"/>
			<%} else if(mode.equals("v")) {%>
				<jsp:include page="../board/view.jsp"/>
			<% } else if(mode.equals("m")) {%>
			<jsp:include page="../board/modify.jsp"/>
			<% } %>

            <!-- 내용 끝 -->
        </article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>