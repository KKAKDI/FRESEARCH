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
					<!-- <form class="confirm-form" id="confirm" action="/member/email_confirm" method="post"> -->
					<!--  
					<form class="confirm-form" id="confirm" action="" method="post">
						<input type="hidden" name="mb_email" id="mb_email" value="${mb_email}">
						<input type="hidden" name="mb_nick" id="mb_nick" value="${mb_nick}">
						<input type="button" id="emailConfirm" class="emailConfirm" value="재전송 요청">
					</form>
					-->
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</div>
		</div>
	</div>
	
	<div id="dialog" class="dialog">
		<div class="dialog-content">
			<div class="dialog-content-detail">
				<div class="dialog-msg">
					<div class="dialog-msg-first">
						<span>받은 메일함을 확인해주세요.</span>
					</div>
				</div>
			</div>
			<div class="dialog-button">
				<div class="dialog-confirm">
					<form class="confirm-form" id="confirm" action="/member/email_confirm" method="post">
						<input type="hidden" name="mb_email" id="mb_email" value="${mb_email}">
						<input type="hidden" name="mb_nick" id="mb_nick" value="${mb_nick}">
						<input type="submit" id="emailConfirm" class="emailConfirm" value="확인">
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- <div class="dialog dialog--center dialog--alert">
		<div class="dialog__content">
			받은 메일함을 확인해주세요.
		</div>
		<footer class="dialog__footer">
			<button class="button--base-c button--shape-a js-alert-x" type="button">확인</button>
			<button class="dialog__x js-alert-x" type="button">닫기</button>
		</footer>
	</div> -->
	<!-- <form id="email_confirm" action="" method="post"></form> -->
</body>
<script>
/*
	var count = 0;
	var cnt = $("#count").val();
	$(".emailConfirm").on("click",function(){
		count++;
		console.log("카운트  : " + count);
		if(count > 1){
			alert("너무 많은 메일을 보냈습니다. 더 이상 재전송 불가능 합니다.");
			return false;
		}else {
			alert("받은 메일함을 확인해주세요." + count);
			return true;
		}
	});
*/
</script>
</html>