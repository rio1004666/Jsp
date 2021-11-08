<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-03.jsp페이지 입니다.</title>
<style>
	#result{
		width: 200px;
		height: 200px;
		border: 5px solid #6699FF;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#b1').click(function(){	
			var query = {name:$("#in").val()};
			
			$.ajax({
				url: './ex07-03Proc.jsp',
				type: 'POST',
				data: query,
				success:function(data){ // data는 json형태일수도있고 문자열일 수도 있고 객체 리스트형태일 수도 있다 
					
					if( data.name == 1 ){ //이거 안됨....	
						$('#result').text("관리자님 어서오세요");
					}
					else if( data.name == 0){
						
						$('#result').text("회원님 어서오세요");
					}
					
					
				}
			});
			
		});
	});
</script>
</head>

<body>
	
	<div>이름</div></br>
	<input id="in" name="name" type="text" placeholder="이름을 입력하세요"/></br>
	<button id="b1">처리</button>
	<div id="result"></div>
</body>
</html>