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
<link rel="icon" href="data:;base64,iVBORw0KGgo=">   <!-- 파비콘 오류 관련 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic">
<link rel="stylesheet" href="/resources/stats/notice_css/notice.css">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">


<!-- 조성식 아이콘 -->
<!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" /> -->
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">



<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


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
            <div class="login collapse navbar-collapse justify-content-end">
               <ul class="navbar-nav">
                  <!-- <li><a href="/member/signup">회원가입</a></li> -->
                  <!-- <li><a href=""><svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M10.01 21.01c0 1.1.89 1.99 1.99 1.99s1.99-.89 1.99-1.99h-3.98zM12 6c2.76 0 5 2.24 5 5v7H7v-7c0-2.76 2.24-5 5-5zm0-4.5c-.83 0-1.5.67-1.5 1.5v1.17C7.36 4.85 5 7.65 5 11v6l-2 2v1h18v-1l-2-2v-6c0-3.35-2.36-6.15-5.5-6.83V3c0-.83-.67-1.5-1.5-1.5zM11 8h2v4h-2zm0 6h2v2h-2z"/></svg></a></li> -->
                  <li><i class="far fa-user j" id="test"></i>
                     
                  </li> 
                  
                  <li class="nav-item dropdown show">
                     <i class="fas fa-bell i"></i>
                     <div aria-labelledby="navbarDropdownMenuLink" class="dropdown-menu dropdown-menu-right show">
                     <a class="dropdown-item" href="#">Mike John responded to your email</a>
                     <a class="dropdown-item" href="#">You have 5 new tasks</a>
                     <a class="dropdown-item" href="#">You're now friend with Andrew</a>
                     <a class="dropdown-item" href="#">Another Notification</a>
                     <a class="dropdown-item" href="#">Another One</a></div>
                  </li> 
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
   
   
   $("i").hover(function(){
      console.log("된다!" + $(this).attr("class"));
   },function(){
      console.log("나갔다!" + $(this).attr("class"));
      
   });
   
      
   
   
</script>