<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>FRESEARCH</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 관련 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
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
				$(this).parent("ul").stop().animate({ "height": 178 }, 300);
				$(this).parents().find(".GNB_sub").stop().animate({ "height": 96 }, 300);
				/* 마우스가 들어온다면 이벤트가 발생된다
				GNB ul li 자식 a에게 active 를 addClass - 관련 css-style-126
				GNB ul li 자식 중 ul을 찾아 active 를 addClass - 관련 css-style-135
				GNB ul li의 부모인 ul의 height를 animate 효과로 3초동안 변경
				GNB ul li의 모든 부모들의 자식 중 GNB_sub를 찾아 height를 animate 효과로 3초동안 변경
				*/
			},
			// 마우스가 떠난다면
			function () {
				$(this).children("a").removeClass("active");
				$(this).find("ul").removeClass("active");
				$(this).parent("ul").stop().animate({ "height": 80 }, 300);
				$(this).parents().find(".GNB_sub").stop().animate({ "height": 0 }, 300);
				/* 마우스가 떠난다면 이벤트가 발생된다 
				GNB ul li 자식 a에게 active를 removeClass css-style-126
				GNB ul li 자식 중 ul을 찾아 active를 removeClass - 관련 css-style-135
				GNB ul li의 부모인 ul의 변경했던 height를 3초간 animate를 주어 원래대로 변경
				GNB ul li의 모든 부모들의 자식 중 GNB_sub를 찾아 변경했던 height를 3초간 animate를 주어 원래대로 변경
				*/
			}
		);
		$("#GNB > ul > li").focusin(function () {
			$(this).children("a").addClass("active");
			$(this).find("ul").addClass("active");
			$(this).parent("ul").stop().animate({ "height": 178 }, 300);
			$(this).parents().find(".GNB_sub").stop().animate({ "height": 142 }, 300);
		});
		$("#GNB > ul > li").focusout(function () {
			$(this).children("a").removeClass("active");
			$(this).find("ul").removeClass("active");
			$(this).parent("ul").stop().animate({ "height": 80 }, 300);
			$(this).parents().find(".GNB_sub").stop().animate({ "height": 0 }, 300);
		});
		//접근성을 위하여 tab키로 접근시 마우스로 접근한 것처럼 똑같이 나타나도록 작성한 스크립트
		
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
					<ul>
						<li><a href="">로그인</a></li>
						<li><a href="/member/signup">회원가입</a></li>
						<li><a href="">가나다라</a></li>
					</ul>
					<div class="emblembox">
						<img src="/resources/img/image_1.png" alt="emblem">
					</div>
				</div>
			
			</div>
			<div class="header_inner">
				<div class="logo"><h1 id="logo"><a href=""><img src="/resources/img/logo.png" alt="logo"></a></h1></div>
				<!-- logo -->
				<nav id="GNB">
					<!-- GNB 시작 -->
					<ul>
						<li>
							<a href="/news/news_list">새소식</a>
							<ul>
								<li><a href="/news/news_list">공지사항</a></li>
								<li><a href="/news/news_list">이벤트</a></li>
							</ul>
						</li>
						<li>
							<a href="/research/research_list">리서치</a>
							<ul>
								<li><a href="/research/research_list">리서치목록</a></li>
								<li><a href="/research/research_register">리서치 만들기</a></li>
							</ul>
						</li>
						<li>
							<a href="/board/board_list">게시판</a>
							<ul>
								<li><a href="/board/board_list">게시판 목록</a></li>
								<li><a href="/board/board_register">글쓰기</a></li>
							</ul>
						</li>
						<li>
							<a href="/stats/stats_list">데이터베이스</a>
							<ul>
								<li><a href="/stats/stats_table">통계 목록</a></li>
								<li><a href="/stats/stats_list">차트</a></li>
							</ul>
						</li>
						<li>
							<a href="">문의</a>
							<ul>
								<li><a href="">패널신청</a></li>
								<li><a href="">승인요청</a></li>
							</ul>
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