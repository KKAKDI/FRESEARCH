<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기 : FRESEARCH</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/info_find.css">
<link rel="stylesheet" href="/resources/css/email_confirm.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/signup.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div class="page-wrapper page-wrapper-confirm">
		<div class="page-logo">
			<h2><a href="/"><img src="/resources/img/logo.png" alt="logo"></a></h2>
		</div>
		<div class="page-content page-content-confirm">
			<div class="page-form">
				<h2>이메일 인증</h2>
				<div class="email-form">
					<div class="email-logo-img">
						<img src="/resources/img/email_icon01.png"/>
					</div>
					<div class="email-msg">
						<div class="email-confirm-first">
							<span>가입 완료를 위한 </span>	<span>이메일 인증</span><span>을 해주세요.</span>
						</div>
						<div class="email-confirm-second">
							<span>이메일 인증을 받으셔야 정상적으로 가입이 완료됩니다.</span>
						</div>
					</div>
				</div>
				<div class="form-submit">
					<button type="button" id="emailReSend" class="emailReSend">재전송 요청</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="dialog" class="dialog">
		<div class="dialog-content">
			<div class="dialog-content-detail">
				<div class="dialog-msg">
					<div class="dialog-msg-first">
						<span>확인 후 받은 메일함을 확인해주세요.</span>
					</div>
				</div>
			</div>
			<div class="dialog-button">
				<div class="dialog-confirm">
					<form class="confirm-form" id="confirm" action="/member/email_confirm" method="post">
						<input type="hidden" name="mb_email" id="mb_email" value="${mb_email}">
						<input type="hidden" name="mb_nick" id="mb_nick" value="${mb_nick}">
						<input type="submit" id="emailConfirm" class="emailConfirm" value="확인">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>