<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
   <title>TAKE A LOOK</title>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="initial-scale=1, width=device-width">
   <!-- <link rel="shortcut icon" href="favicon.ico"> -->
   <!-- <link href="https://fonts.googleapis.com/css?family=Titillium+Web:400,600,700" rel="stylesheet"> -->
   <!-- <link rel="stylesheet" href="css/font.css"> -->
   <link rel="stylesheet" href="/resources/css/reset.css">
   <link rel="stylesheet" href="/resources/css/style.css">
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
   <!--[if IE 9]>
	<script src="js/main_ie9.js"></script>
	<script src="js/gnb.js"></script>
	<link rel="stylesheet" href="css/ie9.css">
	<![endif]-->

   <!--[if IE 8]>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv-printshiv.js"></script>
	<script src="js/main_ie8.js"></script>
	<script src="js/gnb.js"></script>
	<link rel="stylesheet" href="css/ie8.css">
	<![endif]-->

   <!--[if gt IE 9]><!-->
   <!-- <script src="js/main.js"></script>
	<script src="js/gnb.js"></script> -->
   <!--<![endif]-->
   <script src="/resources/js/main.js"></script>
</head>

<body>
   <div class="wrap">
      <div id="skip_navi" class="skip_navi">
         <div class="skip_wrap">
            <a href="#content">본문 내용 바로가기</a>
            <a href="#GNB">주 메뉴 바로가기</a>
         </div>
      </div>
      <header id="header" class="clearflx">
         <div class="logo"><a href=""><img src="/resources/img/logo.png" alt="logo"></a></div>
         
         <div class="location">
            <ul>
               <li><a href="">Login</a></li>
               <li><a href="">Join</a></li>
               <li><form action="검색서블릿" method="POST">
               <div class="search_bar">
                  <input type="text" id="search_t" class="search_text" name="" value="" placeholder="아이폰7">
               </div>
               <div class="search_button">
                  <input type="submit" value="검색">
               </div>
            </form></li>
            </ul>
         </div>
      </header>
      <div class="nav_wrap">
         <nav id="GNB">
            <ul>
               <li>
                  <a href="">새소식</a>
                  <ul class="sub">
                     <li><a href="">공지사항</a></li>
                     <li><a href="">이벤트</a></li>
                  </ul>
               </li>
               <li>
                  <a href="">리서치</a>
                  <ul class="sub">
                     <li><a href="">리서치 목록</a></li>
                     <li><a href="">리서치 만들기</a></li>                    
                  </ul>
               </li>
               <li>
                  <a href="">자유게시판</a>
                  <ul class="sub">
                     <li><a href="">게시판 목록</a></li>
                     <li><a href="">게시글 작성</a></li>                    
                  </ul>
               </li>
               <li>
                  <a href="">데이터베이스</a>
                  <ul class="sub">
                     <li><a href="stats/stats_list">리서치 통계</a></li>
                     <li><a href="">결과 목록</a></li>
                  </ul>
               </li>
               <li>
                  <a href="">문의</a>
                  <ul class="sub">
                     <li><a href="">패널 신청</a></li>
                  </ul>
               </li>
            </ul>
         </nav>
         <div class="sub_shadow"></div>
      </div>
      
      <div class="keyvisual">
         <ul class="gallery">
            <li><img src="/resources/img/key1.png" alt=""></li>
            <li><img src="/resources/img/key2.png" alt=""></li>
            <li><img src="/resources/img/key3.png" alt=""></li>
            <li><img src="/resources/img/key4.png" alt=""></li>
         </ul>
         <ul class="direction_nav">
            <li class="left"><a href="" title="left"><img src="/resources/img/btn_left.png"></a></li>
            <li class="right"><a href="" title="right"><img src="/resources/img/btn_right.png"></a></li>
         </ul>
      </div>
   </div>
   <section id="content" class="clearflx">
      <div class="product_area">
         <div class="pro_buy">
            <ul>
               <li>
                  
               </li>
               <li>
                  <a href="">
                     
                     <dl>
                        <dt>공지사항</dt>
                        <dd><img src="/resources/img/demo_img.png" alt="demo"></dd>
                        <dd class="comment">댓글</dd>
                        <dd class="comment_int">00</dd>
                        <dd class="contant">연락</dd>
                        <dd class="contant_int">00</dd>
                     </dl>
                  </a>
               </li>
               <li>
                  <a href="">                     
                     <dl>
                        <dt>이벤트</dt>
                         <dd><img src="/resources/img/demo_img.png" alt="demo"></dd>
                        <dd class="comment">댓글</dd>
                        <dd class="comment_int">00</dd>
                        <dd class="contant">연락</dd>
                        <dd class="contant_int">00</dd>
                     </dl>
                  </a>
               </li>
               <li>
                  <a href="">                  
                     <dl>
                        <dt>리서치 참여 및 내역</dt>
                         <dd><img src="/resources/img/demo_img.png" alt="demo"></dd>
                        <dd class="comment">댓글</dd>
                        <dd class="comment_int">00</dd>
                        <dd class="contant">연락</dd>
                        <dd class="contant_int">00</dd>
                     </dl>
                  </a>
               </li>
               
               <li>               
               </li>
            </ul>
         </div>
         <div class="pro_sell">
            <ul>
               <li>
                 
               </li>
               <li>
                  <a href="">                   
                     <dl>
                        <dt>자유게시판</dt>
                         <dd><img src="/resources/img/demo_img.png" alt="demo"></dd>
                        <dd class="comment">댓글</dd>
                        <dd class="comment_int">00</dd>
                        <dd class="contant">연락</dd>
                        <dd class="contant_int">00</dd>
                     </dl>
                  </a>
               </li>
               <li>
                  <a href="">
                     <dl>
                        <dt>데이터베이스</dt>
                         <dd><img src="/resources/img/demo_img.png" alt="demo"></dd>
                        <dd class="comment">댓글</dd>
                        <dd class="comment_int">00</dd>
                        <dd class="contant">연락</dd>
                        <dd class="contant_int">00</dd>
                     </dl>
                  </a>
               </li>
               <li>
                  <a href="">
                     <dl>
                        <dt>패널 신청</dt>
                         <dd><img src="/resources/img/demo_img.png" alt="demo"></dd>
                        <dd class="comment">댓글</dd>
                        <dd class="comment_int">00</dd>
                        <dd class="contant">연락</dd>
                        <dd class="contant_int">00</dd>
                     </dl>
                  </a>
               </li>
               <li>
                  
               </li>
            </ul>
         </div>         
      </div>
      
   </section>
   <!--  
   <div class="ad_zone">
      <div class="ad_promo">
         <a href="">프로모션 보러가기</a>
      </div>
   </div>   
	-->
   <footer id="footer">
      <div class="footer_inner">
         <div class="footer_list">
            <ul>
               <li><a href="">이용약관</a></li>
               <li><a href="">개인정보 취급방침</a></li>           
            </ul>
         </div>
         <small class="txt_copyright">
            Copyright © <a href="https://github.com/KKAKDI/5GONG.git">Team.5GONG</a> All rights reserved.
         </small>
      </div>
   </footer>
</body>

</html>