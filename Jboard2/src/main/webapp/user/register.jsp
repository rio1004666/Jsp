<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/Jboard2/css/style.css"/>
    <script>
    	$(function(){
    		//아이디 중복 체크
    		$('input[name=uid]').focusout(function(){
    			var uid = $(this).val(); // 선택한 uid값을 가져옴 
    			$.ajax({
    				url:'/Jboard2/user/checkUid.do?uid='+uid,
    				type:'get', // 클라이언트단에서 보내는 데이터 타입 
    				dataType:'json', // 서버에서 되돌려주는 데이터타입
    				success:function(data){
    					if(data.result == 1){
    						$('.resultId').css('color','red').text('이미 사용중인 아이디입니다.');
    					}else{
    						$('.resultId').css('color','green').text('사용가능한 아이디입니다.');
    					}
    				}
    			});
    			// 비밀번호 유효성 검사 
    			$('input[name=pass2]').focusout(function(){
    				var pass1 = $('input[name=pass1]').val();
    				var pass2 = $('input[name=pass2]').val();
    				
    				if(pass1 == pass2){
    					$('.resultPass').css('color','green').text('비밀번호가 일치합니다.');
    				}else{
    					$('.resultPass').css('color','red').text('비밀번호가 일치하지 않습니다.');
    				}
    			});
    		});
    		// 이름 유효성 검사
    		$('input[name=name]').focusout(function(){
    			var name = $(this).val();
    			$.ajax({
    				url:'/Jboard2/user/checkName.do?name='+name,
    				type:'get',
    				dataType:'json',
    				success: function(data){
    					alert(data.result);
    				}
    			});
    		});
    		//닉네임 중복 체크
    		//이메일 중복 체크     		
    		// 휴대폰 중복 체크 
    	});
    	
    	
    	
    	</script>
</head>
<body>
    <div id="wrapper">
        <section id="user" class="register">
            <form action="/Jboard2/user/register.do" method="POST">
                <table border="1">
                    <caption>사이트 이용정보 입력</caption>
                    <tr>
                        <td>아이디</td>
                        <td>
                            <input type="text" name="uid" placeholder="아이디 입력"/>
                            <span class="resultId"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td>
                            <input type="password" name="pass1" placeholder="비밀번호 입력"/>                            
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td>
                            <input type="password" name="pass2" placeholder="비밀번호 확인 입력"/>
                            <span class="resultPass"></span>
                        </td>
                    </tr>
                </table>
                <table border="1">
                    <caption>개인정보 입력</caption>
                    <tr>
                        <td>이름</td>
                        <td>
                            <input type="text" name="name" placeholder="이름 입력"/>                            
                        </td>
                    </tr>
                    <tr>
                        <td>별명</td>
                        <td>
                            <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                            <input type="text" name="nick" placeholder="별명 입력"/>
                            <span class="resultNick"></span>                            
                        </td>
                    </tr>
                    <tr>
                        <td>E-Mail</td>
                        <td>
                            <input type="email" name="email" placeholder="이메일 입력"/>
                        </td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td>
                            <input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" />
                        </td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>
                            <div>
                                <input type="text" name="zip" placeholder="우편번호" readonly/>
                                <button class="btnZip">주소검색</button>
                            </div>                            
                            <div>
                                <input type="text" name="addr1" placeholder="주소를 검색하세요." readonly/>
                            </div>
                            <div>
                                <input type="text" name="addr2" placeholder="상세주소를 입력하세요."/>
                            </div>
                        </td>
                    </tr>
                </table>

                <div>
                    <a href="/Jboard2/user/login.do" class="btnCancel">취소</a>
                    <input type="submit"   class="btnJoin" value="회원가입"/>
                </div>

            </form>
        </section>
    </div>    
</body>
</html>