<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>FRESEARCH</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
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
			},
			// 마우스가 떠난다면
			function () {
				$(this).children("a").removeClass("active");
				$(this).find("ul").removeClass("active");
			}
		);
		$('.bxslider').bxSlider({
			auto: true,
			// autoControls: true, 갤러리 재생 정지 
			stopAutoOnClick: true,
			pager: true,
			slideWidth: 1950
		});
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
						<li><a href="">알림</a></li>
					</ul>
					<div class="emblembox">
						<img src="/resources/img/image_1.png" alt="emblem">
					</div>
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
	<!-- 상단 고정 박스 끝 -->
	<div class="bxslider">
	<!-- keyvisual 시작 -->
		<div><img src="/resources/img/visual1.png" alt="visual2"></div>
		<div><img src="/resources/img/visual2.png" alt="visual1"></div>
		<div><img src="/resources/img/visual3.png" alt="visual3"></div>
	</div>
	<!-- keyvisual 끝 -->
	<section id="content" class="clearfix">
	<!-- 내용 시작 -->
	<div class="notice_back clearfix">
		<div class="notice_area">
			<div class="notice">
				<ul class="notice_rolling">
					<li>
						<a href="">공지사항 <span>임시내용입니다.</span>
							<span class="notice_date">0000.00.00</span>
						</a>
					</li>
					<li>
						<a href="">공지사항 <span>2임시내용입니다.</span>
							<span class="notice_date">0000.00.00</span>
						</a>
					</li>
					<li>
						<a href="">공지사항 <span>3임시내용입니다.</span>
							<span class="notice_date">0000.00.00</span>
						</a>
					</li>
					<li>
						<a href="">공지사항 <span>4임시내용입니다.</span>
							<span class="notice_date">0000.00.00</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="event">
				<ul class="event_rolling">
					<li>
						<a href="">이벤트 <span>임시내용입니다.</span>
							<span class="event_date">0000.00.00</span>
						</a>
					</li>
					<li>
						<a href="">이벤트 <span>2임시내용입니다.</span>
							<span class="event_date">0000.00.00</span>
						</a>
					</li>
					<li>
						<a href="">이벤트 <span>3임시내용입니다.</span>
							<span class="event_date">0000.00.00</span>
						</a>
					</li>
					<li>
						<a href="">이벤트 <span>4임시내용입니다.</span>
							<span class="event_date">0000.00.00</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
		<!-- 공지 끝 / 자유게시판 외 게시판 시작 -->
		<div class="research_area clearfix">
			<div class="hot_board">
				<div class="board_icon">
					<img src="/resources/img/icon02.png" alt="자유게시판">
				</div>
				<div class="board_text">
					<dl>
						<dt>자유게시판</dt>
						<dd>어쩌구</dd>
						<dd>임시내용입니다</dd>
						<a href="/board/board_list">게시판 더보기  ></a>
					</dl>
				</div>
			</div>
			<div class="hot_search">
				<div class="search_icon">
					<img src="/resources/img/icon02.png" alt="리서치참여및제작">
				</div>
				<div class="search_text">
					<dl>
						<dt>리서치참여/제작</dt>
						<dd>저쩌꾸</dd>
						<dd>임시내용입니다</dd>
						<a href="/research/research_list">리서치 더보기  ></a>
					</dl>
				</div>
			</div>
			<div class="hot_chart">
				<div class="chart_icon">
					<img src="/resources/img/icon02.png" alt="데이터베이스">
				</div>
				<div class="chart_text">
					<dl>
						<dt>데이터베이스</dt>
						<dd>에베베</dd>
						<dd>임시내용입니다</dd>
						<a href="/stats/stats_list">통계 더보기  ></a>
					</dl>
				</div>
			</div>
		</div>
		<!-- 게시판 끝 패널신청 시작 -->
		<div class="ad_zone">
			<div class="panel">
				<dl>
					<dt>아직 패널이 아니라면 지금 신청하세요</dt>
					<a href="">신청하기</a>
				</dl>
			</div>
		</div>
		<!-- 패널 끝 / 간단 리서치 시작 -->
		<div class="qreserch_area">
			<ul>
				<li>
					<a href="/research/research_list">
						<!-- <img src="report.png" alt=""> -->
						<dl>
							<dt>흥미로운
							<br>퀵서베이
							</dt>
							<p><img src="/resources/img/report.png" alt=""></p>
							<dd>더보기</dd>
						</dl>
					</a>
					
				</li>
				<li>
					<a href="">
						<div class='item_box'><img src="/resources/img/qresearch01.png" alt="research_1"></div>
						<dl>
							<dt>어떤 결재를 가장 선호하나요?</dt>
							<dd>2000. 00. 00 ~ 2000. 00. 00</dd>
						</dl>
					</a>
				</li>
				<li>
					<a href="">
						<div class='item_box'><img src="/resources/img/qresearch02.png" alt="research_2"></div>
						<dl>
							<dt>가장 좋아하는 간단한 한 끼는?</dt>
							<dd>2000. 00. 00 ~ 2000. 00. 00</dd>
						</dl>
					</a>
				</li>
				<li>
					<a href="">
						<div class='item_box'><img src="/resources/img/qresearch03.png" alt="research_3"></div>
						<dl>
							<dt>메신저 프로필 사진 
							</br>무엇으로 하시나요?</dt>
							<dd>2000. 00. 00 ~ 2000. 00. 00</dd>
						</dl>
					</a>
				</li>
				<li>
					<a href="">
						<div class='item_box'><img src="/resources/img/qresearch04.png" alt="research_4"></div>
						<dl>
							<dt>싫지만 자주 봐야 하는
							</br>사람을 대하는 나만의 방법은?</dt>
							<dd>2000. 00. 00 ~ 2000. 00. 00</dd>
						</dl>
					</a>
				</li>
			</ul>
		</div>
	</section>
	<!-- 내용 시작 끝 -->
	<footer id="footer" class="clearfix">
		<div class="footer_inner">
			<div class="footer_logo">
				<a href=""><img src="/resources/img/logo.png" alt="FRESEARCH"></a>
			</div>
			<div class="footer_text">
				<p>상호: (팀)FRESEARCH | 팀원: 곽지훈,최운학,조성식,변정우,박동진,이재하 | BITCAMP 119th</p>
				<p>주소: (04108)서울특별시 마포구 백범로 23 3층 (신수동, 구프라자 3층)</p>
				<p>TEL : 02-707-1480 | FAX : 02-707-0495 |<a href="https://github.com/KKAKDI/FRESEARCH"> GIT : FRESEARCH</a></p>
				<p>Copyright © FRESEARCH all rights reserved.</p>
			</div>
		</div>
	</footer>
</div>
</body>
</html>