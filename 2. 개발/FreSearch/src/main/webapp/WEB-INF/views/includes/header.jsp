<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<style>


@import url(http://weloveiconfonts.com/api/?family=entypo);
[class*="entypo-"]:before {
  font-family: 'entypo', sans-serif;
  font-size: 24px;
  color: #fff;
}
/* html, body {height: 100%;}
body {align-items: center;display: flex;font-family: sans-serif;justify-content: center;}
.container{position:relative;-webkit-perspective: 1000;-webkit-backface-visibility: hidden;}  */
.badge-num {
  box-sizing: border-box;
    font-family: 'Trebuchet MS', sans-serif;
    background: #ff0000;
    cursor: default;
    border-radius: 50%;
    color: #fff;
    font-weight: bold;
    font-size: 6px;
    height: 17px;
    line-height: 1.55em;
    top: 0px;
    right: -6px;
    border: 1px solid #000000;
    position: absolute;
    text-align: center;
    vertical-align: middle;
    width: 17px;
    box-shadow: 1px 1px 5px rgba(0,0,0, .2);
    animation: pulse 1.5s 1;
    margin-top: 1px;
}
.badge-num:after {
  content: '';
  position: absolute;
  top:-2px;
  left:-2px;
  border:2px solid rgba(255,0,0,.5);
  opacity:0;
  border-radius: 50%;
  width:100%;
  height:100%;
  animation: sonar 1.5s 1;
}
@keyframes sonar { 
  0% {transform: scale(.9); opacity:1;}
  100% {transform: scale(2);opacity: 0;}
}
@keyframes pulse {
  0% {transform: scale(1);}
  20% {transform: scale(1.4); } 
  50% {transform: scale(.9);} 
  80% {transform: scale(1.2);} 
  100% {transform: scale(1);}
}


</style>

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
                   <p><sec:authentication property="principal.member.mb_nick"/></p>
                   <div class="bar"></div>
                   <a href="#">마이페이지</a>
                     <!-- <button>로그아웃</button> -->
                     <!-- <input type="submit" value="로그아웃"> -->
                     <a href="/" class="btn btn-lg btn-success btn-block">로그아웃</a>
                     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  </form>
                     <!-- <a href="/customLogout">로그아웃</a> -->
                  </sec:authorize>
                  <sec:authorize access="isAnonymous()">
                     <a href="/member/signin">로그인</a>
                  </sec:authorize>
                 </div>
               </div>
               <!-- <div class="emblembox">
                  <img src="/resources/img/image_1.png" alt="emblem">
               </div> -->
               <div class="dropdown">
               
               <!-- 종모양 알림 -->
	               	<div class="container" id="badge">
	               		
	     					<a class="entypo-bell">
	     					</a>
	     				
					</div>
					<div class="dropdown-content" id="alarm_content"style="overflow:auto; width:300px; height:200px; ">

					</div>
				<!-- 종모양 알림 끝 -->
				
				
                 	<!-- <button class="dropbtn" id="alarm">알림</button>
                 	<div class="dropdown-content" id="alarm_content"style="overflow:auto; width:300px; height:200px; ">
	                 	<c:forEach items="${alarm}" var="list" >
	             	      <a href="#">실험용입니다.</a>
                   
                  		</c:forEach>

                 </div>  -->
                 
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
<script type="text/javascript">


	//최운학
   $(".btn-success").on("click", function(e){
      location.href="/";
      e.preventDefault();
      $("form").submit();
   });
   
   
   
   //곽지훈
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




<!-- 웹소켓 시작 -->
<script>
        var ws;
        var messages = document.getElementById("message");
        
        $(document).ready(function(){
        	


        	console.log("#WebSocket 연결")
        	console.log("event.data : "+event.data)
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED)
            {
                writeResponse("WebSocket is already opend.");

                
                return;
            } 
            
            //웹소켓 객체 만드는 코드
            ws = new WebSocket('ws://localhost:8080/echo');

            
            ws.onopen=function(event){
            	console.log("onopen1 : "+event)
            	//console.log("onopen2 : "+event.data)
                if(event.data===undefined) return;
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
            	console.log("onmessage1 : "+event)
            	//console.log("onmessage2 : "+event.data)
                writeResponse(event.data);
            };
            ws.onclose=function(event){
            	console.log("onclose1 : "+event)
            	//console.log("onclose2 : "+event.data)
                writeResponse("Connection closed");
            }
            console.log("alarm data 전송")
            $('#alarm').html("알림 : " +event.data);

            
/*           send()
            function send(){
            	console.log("send 들어왔다")
                var text = document.getElementById("messageinput").value;
            	var text = "갱신";
                ws.send(text);
                text=""; 
           } */
            
             
            
        });
        
        //웹소켓 메세지 전송
        function send(){
            //var text = document.getElementById("messageinput").value;
        	console.log("send1 : "+event)
        	//console.log("send2 : "+event.data)
            var text = "갱신";
            ws.send(text);
            text="";
            
        }
        
        //웹소켓 닫힘
        function closeSocket(){
        	console.log("#closeSocket");
            ws.close();
        }
        

        
        
        //웹소켓 반응?
        function writeResponse(text, num){
        	var obj = event.data;
        	obj = JSON.parse(obj);
        	if($(".badge-num").html() != obj.length){
	        	$('#badge').html('<div class="badge-num" id="qqq">'+obj.length+'</div><a class="entypo-bell"></a>');
	        	
	        	var html ='';
	        	for(var i = 0; i< obj.length; i++){
	        		html += '<a href="/stats/stats_get?subj_code='+obj[i].subj_code+'">'+obj[i].subj_nm+'</a>';
	        	}
      		}else{
      		}
        	$('#alarm_content').html(html);
            //message.innerHTML+="<br/>"+text;
        }
        
</script>
    <!-- 웹소켓 끝 -->
