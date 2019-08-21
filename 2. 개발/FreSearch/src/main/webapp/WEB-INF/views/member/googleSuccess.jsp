<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<meta name="google-signin-client_id" content="708907828012-qu34esq94i2i1kp96q28pgs1u2s7tnma.apps.googleusercontent.com">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
	margin: 0;
	padding: 0;
}

h3 {
	display: inline-block;
	padding: 0.6em;
}
</style>


</head>
<body>
	<div
		style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
		<h3>SIST Google_Login Success</h3>
	</div>
	<br>
	<h2 style="text-align: center" id="name"></h2>
	<h4 style="text-align: center" id="email"></h4>
	
	id : <span id="id"></span><br/>
name : <span id="name"></span><br/>
email : <span id="email"></span><br/>

</body>
</html>