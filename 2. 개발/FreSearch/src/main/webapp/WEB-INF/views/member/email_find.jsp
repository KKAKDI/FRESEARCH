<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기 : FRESEARCH</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/info_find.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/info_find.js"></script>
</head>
<body>
	<div class="page-wrapper">
		<div class="page-logo page-logo-email">
			<h2><a href="/"><img src="/resources/img/logo.png" alt="logo"></a></h2>
		</div>
		<div class="page-content page-content-email">
			<div class="page-form">
			<input type="hidden" name="mb_birthdate" id="mb_birthdate" value="">
				<h2>이메일 찾기</h2>
				<div class="email-form">
					<div class="email-logo-img">
						<img src="/resources/img/micon01.png"/>
					</div>
					<div class="email-msg">
						<div class="email-msg-first">
							<span>이메일 찾기를 위한</span>	
						</div>
						<div class="email-msg-second">
							<span>본인인증 정보</span><span>를 입력해주세요.</span>
						</div>
					</div>
				</div>
				<div class="page-form-input">
					<label for="mb_nick">닉네임</label>
					<input type="text" name="mb_nick" id="mb_nick" placeholder="닉네임" autocomplete="off" maxlength="10">
					<div id="nick_check" class="check"></div>
				</div>
				<div class="form-row-birth">
					<label for="mb_birth">생년월일</label>
					<div class="mb_birth_yy">
						<input type="text" id="mb_birth_yy" placeholder="년(4자)" autocomplete="off" maxlength="4">
					</div>
					<div class="mb_birth_mm">
					<!--  <label for="mb_birth_mm1">월</label>-->
						<select id="mb_birth_mm" name="mb_birth_mm">
							<option value="월" selected>월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
					</div>
					<div class="mb_birth_dd">
						<input type="text" id="mb_birth_dd" placeholder="일" autocomplete="off" maxlength="2">
						<div id="birth_check" class="check"></div>
					</div>
				</div>
				<div class="form-row">
					<label for="mb_phone">전화번호</label>
					<input type="text" name="mb_phone" id="mb_phone" placeholder="전화번호 (-없이 숫자만 입력)" autocomplete="off" maxlength="11">
					<div id="phone_check" class="check"></div>
					<div id="find_check" class="find_check"></div>
				</div>
				<!--  
				<div class="page-form-checkbox">
					<input type="checkbox" name="remember-me" id="mb_remEmail">
					<label for=mb_remEmail>로그인 상태 유지</label>
					<a href="">이메일 찾기</a>
					<span>|</span>
					<a href="">비밀번호 찾기</a>
					<span>|</span>
					<a href="/member/signup">회원가입</a>
				</div>
				<div class="page-form-login">
					<input type="submit" class="login" id="login"  value="로그인">
				</div> -->
				<div class="form-pwd-find">
					<span class="pwdText">비밀번호를 찾으시나요?</span>
					<button class="pwdButton" onClick="location.href='/member/password_find'">
						<span>비밀번호 찾기</span>
					</button>
				</div>
				<div class="form-submit">
					<input type="button" id="emailFind" class="emailFind" value="이메일 찾기" disabled>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</div>
				
				<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
				<!-- <a href="/" onclick="signOut();">Sign out</a> -->
			</div>
		</div>
	</div>

	<div id="myModal" class="modal">
		
		<!-- Modal content -->
		<div class="modal-content">
		<button type="button" class="close"></button>
			<div class="modal-logo">
				<h2>이메일 찾기</h2>
			</div>
			<div class="modal-content-detail">
				<div class="email-logo-img">
					<img src="/resources/img/micon01.png" />
				</div>
				<div class="email-msg">
					<div class="email-msg-first">
						<span>회원님의 본인인증정보와 </span>
					</div>
					<div class="email-msg-second">
						<span>일치하는 이메일 목록입니다.</span>
					</div>
				</div>
			</div>
			<div class="modal-user">
				<div class="modal-user-email"></div>
				<div class="modal-user-regdate"></div>
			</div>
			<div class="modal-button">
				<div class="modal-confirm" onClick="confirm_button();">
					<span>확인</span>
				</div>
			<!--  
				<div class="modal-login" onClick="login_button();">
					<span>로그인하러 가기</span>
				</div>
				<div class="modal-password" onClick="password_button();">
					<span>비밀번호 찾기</span>
				</div>
			-->
			</div>
		</div>
	</div>
	
	<form id="test" action="" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</body>
<script>
$(document).ready(function(){
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
});
</script>
</html>