<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="708907828012-qu34esq94i2i1kp96q28pgs1u2s7tnma.apps.googleusercontent.com">
<title>FRESEARCH</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 관련 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/signin.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(function(){
		$(window).load(function () {
			$(".loading").fadeOut(700);
		});
			$("#GNB > ul > li").hover(
			function () {
				$(this).children("a").addClass("active");
				$(this).find("ul").addClass("active");
			},
			// 마우스가 떠난다면
			function () {
				$(this).children("a").removeClass("active");
				$(this).find("ul").removeClass("active");
			}
		);
		/* $('.bxslider').bxSlider({
			auto: true,
			// autoControls: true, 갤러리 재생 정지 
			stopAutoOnClick: true,
			pager: true,
			slideWidth: 1950
		}); */
		/* 
		e가 들어간 것은 공지와 이벤트 구분을 위한 것입니다
		var height = 높이 / num 공지의 개수를 알아보기 / max = 총 높이 move = 초기값*/ 
		var height = $("#content .notice_area .notice").height();
		var num = $("#content .notice_area .notice li").length;
		var max = height * num;
		var move = 0;
		function noticeRolling() {
			move += height; // move = move + height;
			$("#content .notice_area .notice .notice_rolling").animate({ "top": -move }, 500, function () {
				if (move >= max) {
					$(this).css("top", 0);
					move = 0;
				};
			});
		};
		noticeRollingOff = setInterval(noticeRolling, 2000);
		$("#content .notice_area .notice .notice_rolling").append($("#content .notice_area .notice li").first().clone());
		//마지막 것을 복사해서 추가

		var eheight = $("#content .notice_area .event").height();
		var nume = $("#content .notice_area .event li").length;
		var emax = eheight * nume;
		var emove = 0;
		function eventRolling() {
			emove += eheight;
			$("#content .notice_area .event .event_rolling").animate({ "top": -emove }, 500, function () {
				if (emove >= emax) {
					$(this).css("top", 0);
					emove = 0;
				};
			});
		};
		eventRollingOff = setInterval(eventRolling, 2000);
		$("#content .notice_area .event .event_rolling").append($("#content .notice_area .event li").first().clone());
	
		$("#logout").on("click", function(e){
			location.href="/";
			e.preventDefault();
			$("form").submit();
		});
	});
</script>
</head>
<body>
<div class="loading">로딩</div>
<div class="container">
	<div class="fixed_box">
		<!-- 상단 고정 박스 시작 -->
		<div class="header clearfix">
			<!-- header 시작 -->
			<div class="upper clearfix"> <!-- upper 배경색 적용을 위한 2차 클래스 cf 사용 -->
				<!-- 상단 로그인 -->
				<div class="login">
				<!-- 
					<ul>
						<li><a href="/member/signin">로그인</a></li>
						<li><a href="/member/signup">회원가입</a></li>
						<li><a href="">알림</a></li>
					</ul>
					-->
					<div class="dropdown">
					  <button class="dropbtn">회원</button>
					  <div class="dropdown-content">
					    <!-- <a href="#">회원명</a> -->
					    <sec:authorize access="isAuthenticated()">
					    <form role="form" action="/logout" method='post'>
					    
						    <p>
						    <img class="img_iconFirst" src="/resources/img/ironman.PNG"/>
						    <sec:authentication property="principal.member.mb_nick"/></p>
						    <p>
						    <sec:authentication property="principal.member.mb_email"/>
						    </p>
					    
					    	<div class="bar"></div>
					    	<a class="member_menu" href="#">
					    		<img class="img_iconSecond" src="/resources/img/ironman.PNG"/>
					    		<span class="span_menu">마이페이지</span>
					    	</a>
							<a href="/" class="member_menu" id="logout">
								<img class="img_iconSecond" src="/resources/img/ironman.PNG"/>
								<span class="span_menu">로그아웃</span>
							</a>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a class="member_login" href="/member/signin">
								<img class="img_iconThird" src="/resources/img/ironman.PNG"/>
								<span class="span_login">로그인</span>
							</a>
						</sec:authorize>
					  </div>
					</div>
					<!-- <div class="emblembox">
						<img src="/resources/img/image_1.png" alt="emblem">
					</div> -->
				</div>
			
			</div>
			<div class="header_inner">
				<div class="logo"><h1 id="logo"><a href="/"><img src="/resources/img/logo.png" alt="logo"></a></h1></div>
				<!-- logo -->
				<nav id="GNB">
					<!-- GNB 시작 -->
					<ul>
						<li>
							<a href="/news/news_list">새소식</a>
						</li>
						<li>
							<a href="/research/research_list">리서치</a>
						</li>
						<li>
							<a href="/board/board_list">게시판</a>
						</li>
						<li>
							<a href="/stats/stats_list">데이터베이스</a>
						</li>
						<li>
							<a href="">패널신청</a>
						</li>
					</ul>
				</nav>
					<!-- GNB 끝 -->
			</div>
			<!-- header_inner 끝 -->
			<div class="GNB_sub"></div>
		</div>
		<!-- header 끝 -->
	</div>