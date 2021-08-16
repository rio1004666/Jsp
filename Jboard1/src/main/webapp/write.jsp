<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 글쓰기를 위해서 세션객체 확인해야한다 
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	if(mb == null){
		// 로그인을 하지 않고 list 페이지를 요청했을 때 => 에러코드도 같이 날려주자 
		response.sendRedirect("/Jboard1/user/login.jsp?success=103");
		return ; // 종료를 해줘야한다 
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link rel="stylesheet" href="/	Jboard1/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="write">
            <h3>글쓰기</h3>
            <article>
               <!-- enctype 으로 파일첨부  -->
                <form action="/Jboard1/user/proc/writeProc.jsp" method="POST" enctype="multipart/form-data"> <!-- GET으로 하는경우 내용은 너무 장문이라 패스 길이제한도잇다  -->
                    <input type="hidden" name="uid"  value="<%=mb.getUid()%>"/> <!--  태그를 숨기기위해 hidden속성값 사용 -->
                    <table>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content"></textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="fname"/></td>
                        </tr>
                    </table>
                    <div>
                        <a href="/Jboard1/list.jsp" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>