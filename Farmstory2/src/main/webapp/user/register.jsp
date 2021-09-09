<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script>
	var reUid  = /^[a-z]+[a-z0-9]{3,10}$/;
	var rePass = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,}$/;
	var reName = /^[가-힣]{2,10}$/;
	var reNick = /^[a-z가-힣0-9]$/;
	var isUidOk  = false;
	var isPassOk = false;
	var isNameOk = false;
	var isNickOk = false;
	$(document).ready(function(){
		$('input[name=uid]').focusout(function(){
			var uid = $(this).val(); // 현재 아이디값을 가져와서 데이터를 ajax로 보낼 것이다.
			$.ajax({
				url = '/Farmstory2/user/proc/checkUid.jsp?uid='+uid; // 주소에 실어보낸다 
				type = 'get'; // 보내는 형식이 get방식 
				dataType ='json'; // 받는 타입이 json
				success:function(data){
					if(data.result == 1){ // 중복검사 => 이미 사용중인 아이디가 있다면 결과값은 1이될것이고
						$('.resultId').css('color:red').text('이미 사용중인 아이디입니다.');
						isUidOk = false; // 리턴값을 넘겨줘서 처리는 다른 곳에서 해준다 alert를 띄우기 위해 
					}else{
						if(reUid.test(uid)){
							$('.resultId').css('color','green').text('사용가능한 아이디입니다.');
						}else{
							$('resultId').css('color','red').text('아이디는 영문 소문자, 숫자 조합 4 ~ 10자 까지 입니다.')
						}
					}
				}
			});
		});
	});
	
</script>

		<section id="user" class="register">
			<form action="/Farmstory2/user/proc/registerProc.jsp" method="POST">
				<table border="1">
					<caption>사이트 이용정보 입력</caption>
					<tr>
						<td>아이디</td>
							<td><input type="text" name="uid" placeholder="아이디 입력" /> 
							<span class="resultId"></span>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name="pass1" placeholder="비밀번호 입력" />
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td>
							<input type="password" name="pass2" placeholder="비밀번호 확인 입력" /> 
							<span class="resultPass"></span>
						</td>
					</tr>
				</table>
				<table border="1">
					<caption>개인정보 입력</caption>
					<tr>
						<td>이름</td>
							<td><input type="text"  name="name" placeholder="이름 입력" />
							<span class="resultName" ></span>
						</td>
					</tr>
					<tr>
						<td>별명</td>
						<td>
							<p>공백없이 한글, 영문, 숫자만 입력가능</p> <input type="text" name="nick"
							placeholder="별명 입력" /> <span class="resultNick"></span>
						</td>
					</tr>
					<tr>
						<td>E-Mail</td>
						<td>
							<input type="email" name="email" placeholder="이메일 입력" />
							<span class="resultEmail"></span>
						</td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td>
							<input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" />
							<span class="resultHp"></span> <!-- 문자열이 길이가 정해지지 않았으므로 문자열이 들어오면 영역이 맞게 정해지는 span inline 요소  -->
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<div>
								<input type="text" id="zip" name="zip" placeholder="우편번호" readonly />
								<button type="button" class="btnZip" onclick="zipcode()">주소검색</button> <!-- type으로 button을 넣어준당 -->
							</div>
							<div>
								<input type="text" id="addr1" name="addr1" placeholder="주소를 검색하세요."
									readonly />
							</div>
							<div>
								<input type="text" id="addr2" name="addr2" placeholder="상세주소를 입력하세요." />
							</div>
						</td>
					</tr>
				</table>

				<div>
					<a href="/Farmstory2/user/login.jsp" class="btnCancel">취소</a> <input
						type="submit" class="btnJoin" value="회원가입" />
				</div>
			</form>
		</section>
		
		
	<%@ include file="../_footer.jsp" %>