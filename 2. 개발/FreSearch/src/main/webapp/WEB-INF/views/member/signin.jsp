<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="708907828012-qu34esq94i2i1kp96q28pgs1u2s7tnma.apps.googleusercontent.com">
<title>로그인 : FRESEARCH</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/signin.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/resources/js/signin.js"></script>
</head>
<body>
	<div class="page-wrapper">
		<div class="page-logo">
			<h2><a href="/"><img src="/resources/img/logo.png" alt="logo"></a></h2>
		</div>
		<div class="page-content">
			<form class="page-form" action="/login" method="post" autocomplete="off">
				<h2>로그인</h2>
				<!-- <h2><a href="/"><img src="/resources/img/logo.png" alt="logo"></a></h2> -->
				<div class="page-form-input">
					<label for="mb_email">이메일</label> 
					<input type="text" name="mb_email" id="mb_email" placeholder="이메일" maxlength="30" value="${email}">
					<div id="email_check" class="check"></div>
				</div>
				<div class="page-form-input">
					<label for="mb_pwd">비밀번호</label> 
					<input type="password" name="mb_pwd" id="mb_pwd" placeholder="비밀번호" maxlength="20">
					<div id="pwd_check" class="check">
					<c:if test="${not empty param.fail}">
						<span id="login_fail">아이디 또는 비밀번호를 다시 확인하세요. (이메일 인증 확인 필수)</span>
					</c:if>
					</div>
				</div>
				<div class="page-form-checkbox">
					<input type="checkbox" name="remember-me" id="mb_remEmail">
					<label for=mb_remEmail>로그인 상태 유지</label>
					<a href="email_find">이메일 찾기</a>
					<span>|</span>
					<a href="password_find">비밀번호 찾기</a>
					<span>|</span>
					<a href="/member/signup">회원가입</a>
				</div>
				<div class="page-form-login">
					<input type="submit" class="login" id="login"  value="로그인">
				</div>
				<div class="page-form-googleLogin">
					<a class="googleLogin" id="googleLogin" href="${google_url}">
					<span></span>
					Google 계정으로 사용
					</a>
				</div>
				<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
				<!-- <a href="/" onclick="signOut();">Sign out</a> -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
	</div>
	
	<!--  
	<button class="trigger">이메일 보내기</button>
     <div class="modal"> 
         <div class="modal-content"> 
             <span class="close-button">&times;</span> 
             <h1 class="title">메일 보내기</h1> 
             <form action="#post.php" method="POST"> 
               <label for="email">Email</label> 
               <input type="email" name="email" placeholder="Your email" required="required"> 
               <label></label> 
               <textarea name="message" placeholder="Test Message" required="required"></textarea> 
               <input type="button" id="cancel" value="취소"> 
               <input type="submit" id="submit" value="보내기"> 
             </form> 
         </div> 
     </div>
     -->
</body>
</html>