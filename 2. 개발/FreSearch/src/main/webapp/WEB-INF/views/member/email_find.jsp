<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FreSearch Info Find</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/info_find.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/info_find.js"></script>
</head>
<body>
	<div class="page-wrapper">
		<div class="page-logo">
			<h2><a href="/"><img src="/resources/img/logo.png" alt="logo"></a></h2>
		</div>
		<div class="page-content">
			<form class="page-form" action="/login" method="post" autocomplete="off">
				<h2>이메일 찾기</h2>
				<div class="email-form">
					<div class="email-logo-img">
						<img src="/resources/img/member_logo.jpg"/>
					</div>
					<div class="email-msg">
						<div class="email-msg-first">
							<span>이메일 찾기를 위한</span>	
						</div>
						<div class="email-msg-second">
							<span>본인확인 정보</span><span>를 입력해주세요.</span>
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
					<input type="submit" id="emailFind" class="emailFind" value="이메일 찾기" disabled>
				</div>
				
				<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
				<!-- <a href="/" onclick="signOut();">Sign out</a> -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
	</div>
</body>
</html>