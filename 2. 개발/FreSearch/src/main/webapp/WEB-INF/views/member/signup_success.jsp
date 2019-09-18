<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공 : FRESEARCH</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/signup_success.css">
<script src="/resources/js/signup_success.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
	<div class="page-content">
		<div class="list-content">
			<div class="detail-list">
				<div class="confirm_img">
					<img src="/resources/img/check_icon01.png"/>
				</div>
				<div class="confirm_msg">
					<span>회원가입이</span><span>완료 </span><span>되었습니다.</span>
					<span>로그인 후 서비스를 이용해주세요.</span>
				</div>
				<hr>
				<div class="confirm_button">
					<span><a href="/">메인</a></span>
					<span><a href="/member/signin">로그인</a></span>
				</div>
			</div>
		</div>
	</div>
<%@include file="../includes/footer.jsp"%>