<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 : FRESEARCH</title>
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
			<div class="page-form">
				<h2>비밀번호 찾기</h2>
				<div class="email-form">
					<div class="email-logo-img">
						<img src="/resources/img/picon01.png"/>
					</div>
					<div class="email-msg">
						<div class="email-msg-first">
							<span>비밀번호 찾기를 위한</span>	
						</div>
						<div class="email-msg-second">
							<span>이메일</span><span>을 입력해주세요.</span>
						</div>
					</div>
				</div>
				<div class="page-form-input">
					<label for="mb_email">이메일</label> 
					<input type="text" name="mb_email" id="mb_email" placeholder="이메일" maxlength="30" autocomplete="off" value="${email}">
					<div id="email_check" class="check"></div>
					<div id="find_check" class="find_check"></div>
				</div>
				<div class="form-pwd-find">
					<span class="pwdText">이메일을 찾으시나요?</span>
					<button class="pwdButton" onClick="location.href='/member/email_find'">
						<span>이메일 찾기</span>
					</button>
				</div>
				<div class="form-submit">
					<input type="button" id="pwdFind" class="pwdFind" value="비밀번호 찾기">
				</div>
			</div>
		</div>
	</div>
	
	<div id="myModal" class="modal">
		
		<!-- Modal content -->
		<div class="modal-content2">
		<button type="button" class="close"></button>
			<div class="modal-logo">
				<h2>비밀번호 찾기</h2>
			</div>
			<div class="modal-content-detail">
				<div class="email-logo-img">
					<img src="/resources/img/picon01.png" />
				</div>
				<div class="email-msg">
					<div class="email-msg-first"></div>
					<div class="email-msg-second">
						<span>이메일 인증 버튼을 누르시면 이메일로 전송됩니다.</span>
					</div>
				</div>
			</div>
			<div class="modal-form">
				<form class="modal-form-submit" id="find_send" name="find_send" action="/member/find_send" method="post">
					<div class="modal-confirm">
						<input type="submit" id="findConfirm" class="findConfirm" value="이메일 인증">
					</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</div>
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