/**

	 회원가입 사용자 중복체크
 
 */
// 포커스 아웃이벤트를 통해 통신할 것이다 서버로 

// 정규표현식 (Regular Expression)
var reUid  = /^[a-z]+[a-z0-9]{3,10}$/;
var rePass = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,}$/;
var reName = /^[가-힣]{2,10}$/;
var reNick = /^[a-z가-힣0-9]{2,10}$/;
var reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
var reHp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;

// 2,10은 3글자부터 10글자까지 
// 정규표현식 상당히 엄격하다 문법 그대로 
// 영문소문자로 시작하면서 숫자로도 뒤에 표시가능하도록 함 
// 정규표현식은 조금씩 다르다 ~~~~~!!! 패턴이 있다는걸알고 사용할줄안다면 검색해라
// 3자 이상 10자이하 까지 아이디를 적용시키겟다  


var isUidOk = false;   // 최종 유효성 검사에 사용될 상태변수 
var isPassOk = false;
var isNameOk = false;
var isNickOk = false;
$(document).ready(function() { // 이벤트인경우 핸들러 넣을 수 있따 익명함수로 어떤 로직을 처리하기 위해 이벤트 핸들러를 넣는다 
// 아이디 유효성 검사 
	$('input[name=uid]').focusout(function() { // 포커스 즉 커서가 밖으로 나가면 동작한다
		//내가 입력한 데이터를 데이터베이스에 전송후 로직에 맞게 결과를 가져옴 
		var uid = $(this).val(); // 내가 입력한 값을 가져온다 문자열태로
		$.ajax({
			url: '/Jboard1/user/proc/checkUid.jsp?uid=' + uid, // 주소에 실어나른다 get방식 
			type: 'GET',
			dataType: 'json',
			success: function(data) {
				if (data.result1 == 1) {
					$('.resultId').css('color', 'red').text('이미 사용중인 아이디입니다.'); // 태그선택자로 가상으로 만들수도 있고 원래 있는 태그를 선택할 수도 있다 
					isUidOk = false;
				} else {

					//  중복은 아니라는것 또 조건을 건다 아이디 검사 
					if (reUid.test(uid)) { // 아이디를 정규표현식 패턴으로 검사해서 맞으면 참 다르면 거짓으로 뱉는다 
						$('.resultId').css('color', 'green').text('사용 가능한 아이디입니다.'); // text는 태그의 내용을 쓰는 함수이다
						isUidOk = true;
					} else {
						$('.resultId').css('color', 'red').text('사용하실수 없는 아이디입니다 error: 아이디는 영문 소문자 또는 숫자조합 3~10자까지 입니다.'); // 태그선택자로 가상으로 만들수도 있고 원래 있는 태그를 선택할 수도 있다 
						isUidOk = false;
					}
					isUidOk = true;
				}
			}
		});
		//별명에도 해야하고 휴대폰에도 해야하고 이메일도해야한다 
		//$('.resultId').text('이미 사용중인 아이디입니다.');
	});
//비밀번호 유효성검사 
	$('input[name=pass2]').focusout(function(){
		
		var pass1 = $('input[name=pass1]').val();
		var pass2 = $('input[name=pass2]').val();
		
		if(pass1 == pass2){
			
			if(rePass.test(pass2)){
				$('.resultPass').css('color', 'green').text('비밀번호가 일치 합니다.');
				isPassOk = true;
			}else{				
				$('.resultPass').css('color', 'red').text('비밀번호는 영문,숫자 조합 최소 4이상 이어야 합니다.');
				isPassOk = false;
			}
			
		}else{
			$('.resultPass').css('color', 'red').text('비밀번호가 일치 하지 않습니다.');
			isPassOk = false;
		}
		
	});
// 이름 유효성검사
	$('input[name="name"]').focusout(function(){
		
		var name = $(this).val(); // 값을 얻어와서 input태그 선택자로 값을 얻어와서 이름변수에 담는다 
		if(reName.test(name)){
				$('.resultName').css('color','green').text('이름이 유효합니다.');
				isNameOk = true;
		}else{
				$('.resultName').css('color','red').text('이름은 한글로 3~10자까지 입력해주세요');
				isNameOk = false;
		}
	});


	$('input[name=nick]').focusout(function() {
		var nick = $(this).val(); // 자기 자신을 선택하는 객체 
		$.ajax({
			url: '/Jboard1/user/proc/checkNick.jsp?nick=' + nick,
			type: 'GET',
			dataType: 'json',
			success: function(data) {
				if (data.result == 1) {
					$('.resultNick').css('color', 'red').text('이미 사용중인 닉네임입니다.');
					isNickOk = false;
				} else {
					if(reNick.test(nick)){
						$('.resultNick').css('color', 'green').text('사용가능한 닉네임입니다.');
						isNickOk = true;
					}else{
						$('.resultNick').css('color', 'red').text('닉네임은 영문,한글,숫자포함 2~10자입니다.');
						isNickOk = false;
					}
				}
			}
		});
	});
	$('input[name=hp]').focusout(function(){
			var hp = $(this).val();
			$.ajax({
					url: '/Jboard1/user/proc/checkHp.jsp?hp='+hp,
					type: 'GET',
					dataType: 'json',
					success: function(data){
						if(data.result == 1){
							$('.resultHp').css('color','red').text('해당 휴대폰번호가 있습니다 다시입력해주세요');
						}else{
							if(reHp.test(hp)){
									$('.resultHp').css('color','green').text('해당 휴대폰번호 사용가능합니다.');	
							}else{
									$('.resultHp').css('color','red').text('해당 휴대폰번호는 유효하지 않습니다');
							}
						}
					}
			});
	});
	
	$('input[name=email]').focusout(function(){
		var email = $('input[name=email]').val();
		$.ajax({
			url: '/Jboard1/user/proc/checkEmail.jsp?email='+email,
			type: 'GET',
			dataType: 'json',
			success: function(data){
					if(data.result == 1){
						$('.resultEmail').css('color','red').text('해당 이메일은 존재합니다. 다시입력해주세요');
					}else{
						
						if(reEmail.test(email)){
							$('.resultEmail').css('color','green').text('이메일이 유효합니다.');
						}else{
							$('.resultEmail').css('color','red').text('이메일이 유효하지 않습니다.')
						}
					}
			}			
		});
	});
	
	
});