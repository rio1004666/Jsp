<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	String mode = request.getParameter("mode");
// URI값을 얻어와서 페이지를 다르게 표현 
	if(mode == null){
		mode = "l"; // 리스트로 간다 그냥 
	}
%>
<div id="sub" class="cate2">
    <div><img src="../img/sub_top_tit2.png" alt="MARKET"/></div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate2_tit.png" alt="장보기"/>
            <ul>
                <li class="on"><a href="./market.jsp">장보기</a></li>                        
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                <p>
                    HOME > 장보기 > <strong>장보기</strong>
                </p>
            </nav>

         	<%if(mode.equals("l")){ %>
         		<jsp:include page="../board/list.jsp"/>
			<%}else if(mode.equals("w")){ %>
				<jsp:include page="../board/write.jsp"/>
			<%} else if(mode.equals("v")) {%>
				<jsp:include page="../board/view.jsp"/>
			<% } else if(mode.equals("m")) {%>
			<jsp:include page="../board/modify.jsp"/>
			<% } %>
        </article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>