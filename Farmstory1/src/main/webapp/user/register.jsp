<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../_header.jsp" %>

		<section id="user" class="register">
			<form action="/Farmstory1/user/proc/registerProc.jsp" method="POST">
				<table border="1">
					<caption>사이트 이용정보 입력</caption>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="uid" placeholder="아이디 입력" /> <span
							class="resultId"></span></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pass1" placeholder="비밀번호 입력" />
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="pass2" placeholder="비밀번호 확인 입력" /> 
						<span class="resultPass"></span></td>
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
						<td><input type="email" name="email" placeholder="이메일 입력" />
						<span class="resultEmail"></span>
						</td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td><input type="text" name="hp" placeholder="- 포함 13자리 입력"
							minlength="13" maxlength="13" />
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
					<a href="/Farmstory1/user/login.jsp" class="btnCancel">취소</a> <input
						type="submit" class="btnJoin" value="회원가입" />
				</div>
			</form>
		</section>
		
		
	<%@ include file="../_footer.jsp" %>