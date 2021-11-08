<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>5_4_Ajax</title>
<%--

	날짜 : 2021 / 08 /09
	이름 : 강병화
	내용 : AJAX 실습하기 
	AJAX(Asychronous Jacascript And Xml)
	- 일반적인 페이지 요청을 위한 HTTP 통신과 다르게 데이터 요청을 위한 부분 통신 (비동기)
	- 데이터 결과는 일반적으로 Json을 사용 
	- 80~90퍼가 이통신을 사용..왜? html문서가 아닌 앱을 주로 사용 !!!!!
 --%>
 <!-- 라이브러리를 네트워크 형태로 추가  -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script>
    // jquery - 자바스크립트 라이브러리 추가해야함 
    // 시작함수 $ 는 jquery // 문서가 준비되었는지 확인하는 이벤트 그리고 핸들러가 인자로 들어간다 
    // function에서 로직작성해야함 
    // 제이쿼리 라이브러리 없다면 제이쿼리를 날릴수없음  
 	$(document).ready(function(){
 		//버튼 이벤트 구현 = 요소를 선택 
 		// 버튼을 클릭하면 매개변수인 핸들러가 실행 (익명함수인데 여기서는 핸들러라고 함 )
 		
 		// 데이터 출력 태그 객체!!!! 선택 
 		
 		var tds = $('tr > td:nth-child(2)'); // 객체!!!!!!!! 로 만들어준다 //DOM의 정보변경과 셋팅!!!!! JQUERY의 강력한 기능 
 		// 
 		// 배열형태로 tr의 td두번째 자식만 선택해서 담아준다!!!!!!! var은 타입추론으로 배열형태일것이다 
 		
 		$('button').click(function(){
 			
 			// alert('클릭!');
 			// ajax통신 (데이터 요청)
 			// ajax함수의 기본 옵션 
 			
 			$.ajax({    //페이지는 필요없다 이미 준비되어있고 데이터만 가져온다 데이터만 받아오기때문에 json이다 
 				url:'./5_1_json.jsp',
 				type:'GET', // 딱히 전송할 데이터가 없다면 GET방식으로 
 				dataType:'json', // 넘어오는 데이터타입은 json이다 5_1_json.jsp페이지에서!!!!!
 				success: function(data){
 					
 					//alert(data.name);// 그 데이터를 출력해서 띄운다  객체니까 변수접근하기 위해 .멤버변수
 					//json도 객체이고!!!! 키와 값으로 이루어진 객체이다!!!
 					tds.eq(0).text(data.uid); // text는 열린태그와 닫힌 태그사이의 내용을 입력 
 					tds.eq(1).text(data.name);
 					tds.eq(2).text(data.hp);
 					tds.eq(3).text(data.age);
 				
 				} // function(){}핸들러에 데이터가 들어오는 인자값으로 json이 data로 들어온다 
 			});
 		});
 	}); 
 
  
 </script>

</head>
<body>
	<h3> 4. Ajax 통신 실습하기 </h3>
	<button>데이터 가져오기</button>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td></td>
		</tr>
		<tr>
			<td>이름</td>
			<td></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td></td>
		</tr>
		<tr>
			<td>나이</td>
			<td></td>
		</tr>
	</table>
</body>
</html>