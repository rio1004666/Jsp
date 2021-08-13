<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="kr.co.jboard1.bean.TermsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<%
	
	TermsBean tb = new TermsBean();
	
	try{
		Connection conn = DBConfig.getInstance().getConnection();
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS);
		
		if(rs.next()){ // 빈객체로 담아야한다 자바빈이 필요하다!!!! 테이블의 개체 
			tb.setTerms(rs.getString(1));
			tb.setPrivacy(rs.getString(2));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}



%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="../css/style.css"/>    
    <script type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script> // jQuery라이브러리 import해야한다 
     // 로직을 만들기위한 자바스크립트!!!!!!
    	$(document).ready(function(){ 
    		// DOM으로 객체 태그 객체 생성 
    		// 태그 선택자를 객체로 ! 
    		
    		
    		var btnNext = $('.terms > div > a:nth-child(2)') // 태그선택자를 객체로 만듬 
    		btnNext.click(function(){ // 버튼 클릭이 이벤트!!!
    			// 상태변수 체크 됫냐 안됫냐를 나타내는 변수 
    			var isChecked1 = $('input[name=chk1]').is(':checked'); // input선택자 그중에서도 키가 ck1 이냐 
        		var isChecked2 = $('input[name=chk2]').is(':checked'); // 반환값이 true false 상태 
    			
    			if(!isChecked1 || !isChecked2){ // 체크가 되었는지 하나라도 안되면 
    				alert('동의 체크를 하셔야 합니다.');
    				return false;
    			}else {
    				alert('회원가입 페이지로 넘어 갑니다.');
    				return true; // 링크이동이 취소가 된다 
    			}
    		});
    	
    		
    	});// $대신 jquery를 사용해도된다 
    </script>
</head>
<body>
    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly><%= tb.getTerms() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <table>
                <caption>개인정보 취급방침</caption>
                <tr>
                    <td>
                        <textarea readonly> <%= tb.getPrivacy() %> </textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard1/user/login.jsp">취소</a>
                <a href="/Jboard1/user/register.jsp">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>