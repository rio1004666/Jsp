
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
  // 데이터를 받는것은 request객체 !!!!!
	String success = request.getParameter("success"); //키값으로 값을 가져온다 
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
    <script>
			var success = "<%=success%>"; // 자바코드를 자바스크립트 형식으로 => 표현식 사용     
			if  (success == 100){
				alert('일치하는 회원이 없습니다.\n아이디, 비밀번호를 다시 확인해주세요.,');
			}else if(success == 101){
				alert('정상적으로 로그아웃 되었습니다..,');
			}else if(success == 102){
				alert('먼저 로그인을 하셔야합니다..,');
			}
    
    </script>
    
</head>
<body>
    <div id="wrapper">
        <section id="user" class="login" >
            <form action="/Jboard1/user/proc/loginProc.jsp"  method="POST">
                <table border="0">
                    <tr>
                        <td><img src="/Jboard1/img/login_ico_id.png" alt="아이디"/></td>
                        <td><input type="text" name="uid" placeholder="아이디를 입력" /></td>
                    </tr>
                    <tr>
                        <td><img src="../img/login_ico_pw.png" alt="비밀번호"/></td>
                        <td><input type="password" name="pass" placeholder="비밀번호 입력" /></td>
                    </tr>
                </table>
                <input type="submit" class="btnLogin" value="로그인"/>
            </form>
            <div class="info">
                <h3>회원로그인 안내</h3>
                <p>
                    아직 회원이 아니시면 회원으로 가입하세요.
                </p>
                <a href="/Jboard1/user/terms.jsp">회원가입</a> <!-- root최상위 디렉터리의 user폴더의 terms.jsp로 절대경로  -->
                <!-- 상대경로로하면 불편해짐 -->
            </div>

        </section>
    </div>    
</body>
</html>