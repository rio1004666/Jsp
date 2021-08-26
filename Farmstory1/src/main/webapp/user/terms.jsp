
<%@page import="kr.co.farmstory1.dao.TermsDao"%>
<%@page import="kr.co.farmstory1.bean.TermsBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TermsBean tb = TermsDao.getInstance().selectTerms();
%>
<%@ include file="../_header.jsp" %>
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly><%=tb.getTerms()%></textarea>
                        <p>
                            <label><input type="checkbox" name="chk1"/>동의합니다</label>
                        </p>
                    </td>
                </tr>
            </table>
            <table>
                <caption>개인정보 취급방침</caption>
                <tr>
                    <td>
                        <textarea readonly><%=tb.getPrivacy()%></textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Farmstory1/user/login.jsp">취소</a>
                <a href="/Farmstory1/user/register.jsp">다음</a>
            </div>
        </section>
    <%@ include file="../_footer.jsp" %>