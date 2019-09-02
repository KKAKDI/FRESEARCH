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
<link rel="icon" href="data:;base64,iVBORw0KGgo=">   <!-- 파비콘 오류 관련 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/signin.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
@import url(http://weloveiconfonts.com/api/?family=entypo);
[class*="entypo-"]:before {
  font-family: 'entypo', sans-serif;
  font-size: 24px;
  color: #fff;
}
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
    right: -11px;
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

#alarm_content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  font-family: 'Noto Sans CJK', AppleSDGothicNeo, 'Malgun Gothic', arial;
  cursor: pointer;
}
</style>
</head> 
<body>

<div class="loading"><img src='/resources/img/logo1_1.png'/></div>
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
                 <button class="dropbtn"><img src="/resources/img/bicon14.png"/></button>
                 <div class="dropdown-content">
                   <!-- <a href="#">회원명</a> -->
                   <sec:authorize access="isAuthenticated()">
                    <form class="mypage_form" action="/member/myPage" method="post">
                       <input id="token" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />                      	
                   </form>
                   <form class="dropdown-form" role="form" action="/logout" method='post'>
                   
                      <p>
                      <img class="img_iconFirst" src="/resources/img/member_icon01.png"/>
                      <sec:authentication property="principal.member.mb_nick"/></p>
                      <p>
                      <sec:authentication property="principal.member.mb_email"/>
                      </p>
                   
                      <div class="bar"></div>
                      <a href="/" id="mypage">
                         <img class="img_iconSecond" src="/resources/img/mypage_icon01.png"/>
                         <span class="span_mypage">마이페이지 </span>
                      </a>
                     <a class="logout_a" id="logout">
                        <img class="img_iconSecond" src="/resources/img/logout_icon01.png"/>
                        <span class="span_logout">로그아웃</span>
                     </a>
                  </form>
                  </sec:authorize>
                  <sec:authorize access="isAnonymous()">
                     <a href="/member/signin">
                        <img class="img_iconThird" src="/resources/img/login_icon01.png"/>
                        <span class="span_login">로그인</span>
                     </a>
                     <a href="/member/signup">
                        <img class="img_iconThird" src="/resources/img/signup_icon01.png"/>
                        <span class="span_signup">회원가입</span>
                     </a>
                  </sec:authorize>
                 </div>
               </div>
               
               		<div class="dropdown-alarm widget-gnb">
               
               		<!-- 종모양 알림 -->
	               		<div class="container" id="badge" style="height: 25px;">
	     					<a class="entypo-bell" style="display:none;"></a>
	     					<img src="/resources/img/bicon16_1.png" style="width: 18px; margin-left: 3px; margin-top: 3px;">
						</div>
						<div id="alarm_content">

						</div>
					<!-- 종모양 알림 끝 -->
               		</div>
               		

					<!-- <div class="emblembox">
						<img src="/resources/img/image_1.png" alt="emblem">
					</div> -->
				</div>
			
			</div>
			<div class="header_inner">
				<div class="logo"><h1 id="logo"><a href="/"><img src="/resources/img/logo1.png" alt="logo"></a></h1></div>
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
		                     <sec:authentication property="principal" var="pinfo"/>
		                     <sec:authorize access="isAuthenticated()">
			                     <c:choose>
			                        <c:when test="${pinfo.member.authList[0].auth eq 'ROLE_ADMIN'}">
			                              <a href="/apply/approval_list">패널승인</a>
			                        </c:when>
			                        <c:when test="${pinfo.member.authList[0].auth eq 'ROLE_USER' || pinfo.member.authList[0].auth eq 'ROLE_PANEL'}">
			                              <a href="/apply/apply">패널신청</a>
			                        </c:when>        
			                     </c:choose>
			                 </sec:authorize>
			                 <sec:authorize access="isAnonymous()">
			                              <a href="/member/signin">패널신청</a>
			                 </sec:authorize>
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
	
<script src="/resources/stats/js/chartMy.js"></script>
<script type="text/javascript">
 
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	 
 

	//최운학
	$("#logout").on("click", function(e) {
		//location.href = "/";
		e.preventDefault();
		$("form").submit();
	});

	//곽지훈
	$(function() { 
		$(window).load(function() {
			$(".loading").fadeOut(1000);
		});
		
		var url = $(location).attr('href');
		console.log("url : "+$(location).attr('href'));
		var urls = url.split("/");
		console.log(urls[3]);
		
		if(urls[3]=="news"){
			$("#GNB > ul > li:nth-child(1) a").addClass("page");
		}else if(urls[3]=="research"){
			$("#GNB > ul > li:nth-child(2) a").addClass("page");
		}else if(urls[3]=="board"){
			$("#GNB > ul > li:nth-child(3) a").addClass("page");
		}else if(urls[3]=="stats"){
			$("#GNB > ul > li:nth-child(4) a").addClass("page");
		}else if(urls[3]=="apply"){
			$("#GNB > ul > li:nth-child(5) a").addClass("page");
		}
		
		$("#GNB > ul > li").hover(function() {
			$(this).children("a").addClass("active");
			$(this).find("ul").addClass("active");
		},
		// 마우스가 떠난다면
		function() {
			$(this).children("a").removeClass("active");
			$(this).find("ul").removeClass("active");
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
			$("#content .notice_area .notice .notice_rolling").animate({
				"top" : -move
			}, 500, function() {
				if (move >= max) {
					$(this).css("top", 0);
					move = 0;
				}
				;
			});
		};
		noticeRollingOff = setInterval(noticeRolling, 2000);
		$("#content .notice_area .notice .notice_rolling").append(
				$("#content .notice_area .notice li").first().clone());
		//마지막 것을 복사해서 추가

		var eheight = $("#content .notice_area .event").height();
		var nume = $("#content .notice_area .event li").length;
		var emax = eheight * nume;
		var emove = 0;
		function eventRolling() {
			emove += eheight;
			$("#content .notice_area .event .event_rolling").animate({
				"top" : -emove
			}, 500, function() {
				if (emove >= emax) {
					$(this).css("top", 0);
					emove = 0;
				}
				;
			});
		}
		;
		eventRollingOff = setInterval(eventRolling, 2000);
		$("#content .notice_area .event .event_rolling").append(
		$("#content .notice_area .event li").first().clone());
		
		$("#mypage").on("click",function(e){
			location.href="/";
			e.preventDefault();
			$(".mypage_form").submit();
		});
	});

		//조성식
        var ws;
        
        $(document).ready(function(){
        	var mb_email =($)
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED)
            {
                writeResponse("WebSocket is already opend.");

                return;
            } 
            
            //웹소켓 객체 만드는 코드
            //ws = new WebSocket('ws://localhost:8080/echo');
            ws = new WebSocket('ws://www.fresearch.cf/echo');
            ws.onopen=function(event){
            	
                if(event.data===undefined) return;
                writeResponse(event.data);
                
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("Connection closed");
            }
        });
        
        //웹소켓 메세지 전송
        function send(){
            //var text = document.getElementById("messageinput").value;
            var text = "갱신";
            ws.send(text);
            text="";
            
        }
        
        //웹소켓 닫힘
        function closeSocket(){
            ws.close();
        }
        
        
        
        
        //웹소켓 반응?
        function writeResponse(text){
        	
        	if($(".bar").prev().html() === undefined){
        		var mb_email = '';
        	}else{
        		var mb_email = $(".bar").prev().html().trim();
        	}
        	var subj_code = '';
        	
        	//subj_code 가져오는 ajax
        	$(document).ready(function(){
                $(document).on("click",".alarm_button",function(event){
                  // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
                  subj_code = $(this).prev().text();
                  
                  var data ={
                		  subj_code : subj_code,
                		  mb_email : mb_email
                  }
                  
                 	tableService.headerUpdate(data, function(list){
                	  location.href="/research/research_content?subj_code="+subj_code;
                  }); 
                });
            }); 
        	
        	
        	
        	//ajax 알림 리스트 and 알림 종 갯수  시작
        	
        	if(!($(".bar").prev().html() === undefined)){
	         	var data ={
	        		mb_email : mb_email
	        	}
	        	
	        	tableService.header(data,function(list){
	
	        		var html = '';
	        		if($(".badge-num").html() != list.length){
	        			$('#alarm_content').attr('style','overflow:auto;  overflow-x: hidden; width:430px; max-height:400px;margin-top: 0px; ');
	        			$('#alarm_content').attr('class','dropdown-content');
	        			$('#badge').html('<div class="badge-num" id="qqq">'+list.length+'</div><a class="entypo-bell" style="display:none;"></a> <img src="/resources/img/bicon16_1.png" style="width: 18px; margin-left: 3px; margin-top: 3px;">');
	        			html += '<div class="gnb-tab-item">알림메시지 '+list.length+'개</div>';
	        			for(var i=0; i < list.length; i++){
	        				
	        				html += '<div style="display:none;">'+list[i].subj_code+'</div>';
	        				html += '<a class="alarm_button"><span class="jss-font">';
	        				html +=	'<strong class="jss-font">'+list[i].mb_nick+'</strong>님이 ';
	        				html += '<strong class="jss-font">'+list[i].ctgr_nm+'</strong>태그에 글을 작성하였습니다.';
	        				html += '</span><span class="jss-icon"></span></br>';
	        				html += '<span class="jss-font" style="font-size: 13px;">"'+list[i].subj_nm+'"</span></br>';
	        				html += '<small class="jss-small">'+tableService.displayTime(list[i].subj_regdate)+'</small></a>';

	        			}
	        			html += '<div class="all-read"><span class="all-read-span">모두 읽은 상태로 표시</span></div>'
	        			$('#alarm_content').html(html);
	        		}else{ 
	        		} 
	        	});
        	}
        	
        }

        $(document).ready(function(){
        	$(document).on("click",".all-read",function(evnet){
        		
        		console.log($(this).html());
        		
        	});
        });
        
        
        
        
/*         $(document).ready(function(){
            $(document).on("click","#moveBtn",function(event){
              // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
              alert($(this).text());
            });
        }); */
</script>
    <!-- 웹소켓 끝 -->
