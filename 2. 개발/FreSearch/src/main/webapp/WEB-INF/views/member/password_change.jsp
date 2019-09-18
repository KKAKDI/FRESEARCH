<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호 변경 : FRESEARCH</title>
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
			<form class="page-form-submit" id="pwd_change" name="pwd_change" action="/member/pwd_change" method="post">
			<input type="hidden" name="mb_email" value="${password_email}" />
				<h2>비밀번호 찾기</h2>
				<div class="email-form">
					<div class="email-logo-img">
						<img src="/resources/img/picon01.png"/>
					</div>
					<div class="email-msg">
						<div class="email-msg-first2">
							<span>${password_email}</span>님,	
						</div>
						<div class="email-msg-second2">
							<span>이제 새로운 비밀번호로 설정해 주세요.</span>
						</div>
					</div>
				</div>
				<div class="form-row">
					<label for="mb_pwd">새 비밀번호</label> <input type="password"
						name="mb_pwd" id="mb_pwd" placeholder="새 비밀번호" maxlength="20">
					<div id="pwd_check" class="check"></div>
				</div>
				<div class="form-row">
					<label for="mb_pwd2">새 비밀번호 확인</label> <input type="password"
						name="mb_pwd2" id="mb_pwd2" placeholder="새 비밀번호 확인" maxlength="20">
					<div id="pwd2_check" class="check"></div>
				</div>
				<div class="form-submit">
					<input type="submit" id="pwdChange" class="pwdChange" value="비밀번호 변경" disabled>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>