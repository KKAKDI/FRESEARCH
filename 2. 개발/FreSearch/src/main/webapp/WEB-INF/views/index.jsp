<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>navigation :: basic navigation</title>
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
		$("#GNB > ul > li").hover(
			function () {
				$(this).children("a").addClass("active");
				$(this).find("ul").addClass("active");
				$(this).parent("ul").stop().animate({ height: 264 }, 300);
				$(this).parents().find(".GNB_sub").stop().animate({ height: 185 }, 300);
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
				$(this).parent("ul").stop().animate({ height: 80 }, 300);
				$(this).parents().find(".GNB_sub").stop().animate({ height: 0 }, 300);
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
			$(this).parent("ul").stop().animate({ height: 264 }, 300);
			$(this).parents().find(".GNB_sub").stop().animate({ height: 185 }, 300);
		});
		$("#GNB > ul > li").focusout(function () {
			$(this).children("a").removeClass("active");
			$(this).find("ul").removeClass("active");
			$(this).parent("ul").stop().animate({ height: 80 }, 300);
			$(this).parents().find(".GNB_sub").stop().animate({ height: 0 }, 300);
		});
		//접근성을 위하여 tab키로 접근시 마우스로 접근한 것처럼 똑같이 나타나도록 작성한 스크립트

		$('.bxslider').bxSlider({
			auto: true,
			autoControls: true,
			stopAutoOnClick: true,
			pager: true,
			slideWidth: 1920
		});
	});

</script>
</head>
<body>
<div class="container">
	<div class="fixed_box">
		<!-- 상단 고정 박스 시작 -->
		<div class="header clearfix">
			<!-- header 시작 -->
			<div class="upper clearfix"> <!-- upper 배경색 적용을 위한 2차 클래스 cf 사용 -->
				<!-- 상단 로그인 -->
				<div class="login">
					<ul>
						<li><a href="">1</a></li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
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
							<a href="">1DEPTH</a>
							<ul>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
							</ul>
						</li>
						<li>
							<a href="">1DEPTH</a>
							<ul>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
							</ul>
						</li>
						<li>
							<a href="">1DEPTH</a>
							<ul>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
							</ul>
						</li>
						<li>
							<a href="">1DEPTH</a>
							<ul>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
							</ul>
						</li>
						<li>
							<a href="">1DEPTH</a>
							<ul>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
							</ul>
						</li>
						<li>
							<a href="">1DEPTH</a>
							<ul>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
								<li><a href="">2depth</a></li>
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
	<!-- 상단 고정 박스 끝 -->
	<div class="bxslider">
	<!-- keyvisual 시작 -->
		<div><img src="/resources/img/visual1.png" alt="visual1"></div>
		<div><img src="/resources/img/visual2.png" alt="visual2"></div>
		<div><img src="/resources/img/visual3.png" alt="visual3"></div>
	</div>
	<!-- keyvisual 끝 -->
	<section id="content" class="clearfix">
	<!-- 내용 시작 -->
		<div class="research_area">
			<div class="box">박스 박스</div>
			<div class="box">박스 박스</div>
			<div class="box">박스 박스</div>
		</div>
		<div class="notice_area">
			<div class="box">박스 박스</div>
			<div class="box">박스 박스</div>
			<div class="box">박스 박스</div>
		</div>
	</section>
	<!-- 내용 시작 끝 -->
</div>
</body>
</html>