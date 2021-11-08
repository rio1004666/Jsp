<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5_5_Ajax.jsp</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script>
	 
 	$(document).ready(function(){
 		$('button').click(function(){
 			/// 데이터 요청하기
 			// html에서는 자동으로 table에 tbody를 삽입합니다.
 			var table = $('table > tbody'); // 테이블 객체 생성 DOM객체!! 문서 객체 모델 
 			$.ajax({
 				url:'./5_3_json.jsp',
 				type:'get',
 				dataType:'json',
 				success:function(data){ // 통신에 성공한다면 처리할 로직이 여기에 들어간다 받아온 데이터를 가지고 
 					// []리스트형식으로 data에 들어온다 
 					for(var i=0; i < data.length;i++){
 						//alert(data[i].name);
 						table.append('<tr></tr>'); // 따끈따근한 tr객체를 생성하고 (태그를 동적으로 생성)
 						 // 마지막 자식 tr즉 이제 막 생성된 tr객체!!!
 						 // tr문서객체의 : 마지막 자식 객체를 찾아서 추가한다 append 동적으로 태그 생성 
 						table.find('tr:last-child').append('<td>'+data[i].uid + '</td>');
 						table.find('tr:last-child').append('<td>'+data[i].name + '</td>');
 						table.find('tr:last-child').append('<td>'+data[i].hp + '</td>');
 						table.find('tr:last-child').append('<td>'+data[i].pos + '</td>');
 						table.find('tr:last-child').append('<td>'+data[i].dep + '</td>');
 						table.find('tr:last-child').append('<td>'+data[i].rdate+'</td>');
 						// for을 순회하면서 한번 데이터 셋팅이 끝나면 또 tr을 생성해서 그 tr객체에 또 데이터 삽입
 					}
 				}
 			// 동적태그를 append시킬것이다!!!! 없는 태그를 생성하며 데이터 붙인다 
 			});
 			
 		});
 		
 	});
 </script>

</head>


<body>
	<h3>5.Ajax 통신 실습하기 </h3>
	<button>데이터 가져오기</button>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>휴대폰</td>
			<td>직급</td>
			<td>부서</td>
			<td>입사일</td>
		</tr>
		<!-- 일일이 행을 만들 필요없이 태그를 동적으로 생성해서 데이터를 넣습니다. -->
	</table>
</body>
</html>