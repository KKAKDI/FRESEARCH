<%@ page contentType="text/html;charset=utf-8"%>
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
    right: -10px;
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

.widget-gnb ::-webkit-scrollbar {
    width: 5px;
    height: 5px;
    background-clip: padding-box;
    background-color: rgba(121, 124, 144, 0.3);
    border: 0px solid transparent;
    border-radius: 5px;

}
.widget-gnb ::-webkit-scrollbar-thumb {
    background-color: #cdd2d2;
    border: 2px solid #cdd2d2;
    border-radius: 5px;
}
.widget-gnb ::-webkit-scrollbar-track{
    background-color: #fff;
}

.gnb-tab-item{
    background-color: #fff;
    border-bottom-color: #fff;
	position: relative;
    width: 100%;
    padding: 14px 10px 14px 10px;
    font-size: 12px;
    color: #333;
    font-weight: bold;
    text-align: center;
    border: 1px solid #d9d9d9;
    white-space: nowrap;
    border-right: none;
    border-left: none;
    vertical-aligh:middle;

}
.gnb-tab-item:before{
    content: '';
    position: absolute;
    top: -1px;
    left: 0;
    right: 0;
    height: 3px;
    background-color: #1820b7;


}

.jss-icon{
	margin-left : 5px;
    width: 18px;
    height: 17px;
    
    /*background: url(/resources/img/bicon16_1.png) no-repeat 0 0;*/
    background: url(/resources/img/new_icon_01.svg) no-repeat 0 0;
    display: inline-block;
    vertical-align: middle;
    cursor: pointer;
    overflow: hidden;
}
.jss-font{
    font-family: 'Noto Sans CJK', AppleSDGothicNeo, 'Malgun Gothic', arial;
    vertical-align: top;
    color: #666666;
}
.jss-small{
	font-size: 11px;
	color: #999;
}
.all-read{

    padding-top: 15px;
    text-align: center;
    font-size: 13px;
    color: #999;
    border-top: 1px solid #ebebeb;
}

</style>
<script>
	$(function(){
		$(window).load(function () {
			$(".loading").fadeOut(500);
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
		
		$("#logout").on("click", function(e){
			location.href="/";
			e.preventDefault();
			$("form").submit();
		});
	});
</script>
</head>
<body>
<div class="loading"><label>FRESEARCH</label></div>
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
					    <form class="dropdown-form" role="form" action="/logout" method='post'>
					    
						    <p>
						    <img class="img_iconFirst" src="/resources/img/ironman.PNG"/>
						    <sec:authentication property="principal.member.mb_nick"/></p>
						    <p>
						    <sec:authentication property="principal.member.mb_email"/>
						    </p>
					    
					    	<div class="bar"></div>
					    	<a href="#">
					    		<img class="img_iconSecond" src="/resources/img/ironman.PNG"/>
					    		<span class="span_mypage">마이페이지 </span>
					    	</a>
							<a href="/" id="logout">
								<img class="img_iconSecond" src="/resources/img/ironman.PNG"/>
								<span class="span_logout">로그아웃</span>
							</a>
							<input id="token" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a href="/member/signin">
								<img class="img_iconThird" src="/resources/img/ironman.PNG"/>
								<span class="span_login">로그인</span>
							</a>
							<a href="/member/signup">
								<img class="img_iconThird" src="/resources/img/ironman.PNG"/>
								<span class="span_login">회원가입</span>
							</a>
						</sec:authorize>
					  </div>
					</div>
					
					<div class="dropdown-alarm widget-gnb">
               
               		<!-- 종모양 알림 -->
	               	<div class="container" id="badge">
	     				<a class="entypo-bell" style="display:none;"></a>
	     				<img src="/resources/img/bicon16_1.png" style="width: 16px; margin-left: 3px; margin-top: 3px;">
					</div>
					<div class="dropdown-content" id="alarm_content"style="overflow:auto; width:300px; max-height:200px; ">
					<a>로그인 후 이용해 주세요.</a>
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
						<a href="/news/news_get?news_code=555">공지사항 <span>2019년 8월 31일 이용약관 일부 개정 안내</span>
							<span class="notice_date">2019.08.13</span>
						</a>
					</li>
					<li>
						<a href="/news/news_get?news_code=444">공지사항 <span>신고 기능이 잠시 중지됩니다.</span>
							<span class="notice_date">2019.08.13</span>
						</a>
					</li>
					<li>
						<a href="/news/news_get?news_code=333">공지사항 <span>8월 24일(토) 오전 2시~6시, FreSearch 서버 점검 안내</span>
							<span class="notice_date">2019.08.13</span>
						</a>
					</li>
					<li>
						<a href="/news/news_get?news_code=222">공지사항 <span>"FreSerach" 가 서비스를 시작 되었습니다.</span>
							<span class="notice_date">2019.08.13</span>
						</a>
					</li>
				</ul>
			</div>
			<div class="event">
				<ul class="event_rolling">
					<li>
						<a href="/news/news_get?news_code=666">이벤트 <span>통계 예측 이벤트 '2045년 우리는?</span>
							<span class="event_date">2019.08.13</span>
						</a>
					</li>
					<li>
						<a href="/news/news_get?news_code=111">이벤트 <span>[FreSearch] FreSearch 1주일 기념 설문조사 이벤트!</span>
							<span class="event_date">2019.08.13</span>
						</a>
					</li>
					<li>
						<a href="/news/news_get?news_code=777">이벤트 <span>매주 진행되는 리서치 이벤트!!</span>
							<span class="event_date">2019.08.13</span>
						</a>
					</li>
					<li>
						<a href="/news/news_get?news_code=888">이벤트 <span>서비스 오픈 기념 이벤트!!</span>
							<span class="event_date">2019.08.13</span>
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
					<img src="/resources/img/icon_image01_.png" alt="자유게시판">
				</div>
				<div class="board_text">
					<dl>
						<dt>자유게시판</dt>
						<dd>다양한 게시글을</dd>
						<dd>작성해 보세요.</dd>
						<a href="/board/board_list">게시판 더보기  ></a>
					</dl>
				</div>
			</div>
			<div class="hot_search">
				<div class="search_icon">
					<img src="/resources/img/icon_image03_.png" alt="리서치참여및제작">
				</div>
				<div class="search_text">
					<dl>
						<dt>리서치 참여</dt>
						<dd>원하는 조사를</dd>
						<dd>참여해 보세요.</dd>
						<a href="/research/research_register">리서치 더보기  ></a>
					</dl>
				</div>
			</div>
			<div class="hot_chart">
				<div class="chart_icon">
					<img src="/resources/img/icon_image02_.png" alt="데이터베이스">
				</div>
				<div class="chart_text">
					<dl>
						<dt>데이터베이스</dt>
						<dd>다양한 통계를</dd>
						<dd>제공합니다.</dd>
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
					<a href="/research/research_content?subj_code=8O18KXBD">
						<div class='item_box'><img src="/resources/img/qresearch01.png" alt="research_1"></div>
						<dl>
							<dt>어떤 결재를 가장 선호하나요?</dt>
							<dd>2019. 08. 13 ~ 2019. 08. 30</dd>
						</dl>
					</a>
				</li>
				<li>
					<a href="/research/research_content?subj_code=2A19HBCB">
						<div class='item_box'><img src="/resources/img/qresearch02.png" alt="research_2"></div>
						<dl>
							<dt>가장 좋아하는 간단한 한 끼는?</dt>
							<dd>2019. 08. 13 ~ 2019. 08. 23</dd>
						</dl>
					</a>
				</li>
				<li>
					<a href="/research/research_content?subj_code=4KTGHZ41">
						<div class='item_box'><img src="/resources/img/qresearch03.png" alt="research_3"></div>
						<dl>
							<dt>메신저 프로필 사진 
							</br>무엇으로 하시나요?</dt>
							<dd>2019. 08. 14 ~ 2020. 01. 23</dd>
						</dl>
					</a>
				</li>
				<li>
					<a href="/research/research_content?subj_code=N2IQ5NED">
						<div class='item_box'><img src="/resources/img/qresearch04.png" alt="research_4"></div>
						<dl>
							<dt>싫지만 자주 봐야 하는
							</br>사람을 대하는 나만의 방법은?</dt>
							<dd>2019. 08. 13 ~ 2025. 05. 14</dd>
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
				<a href=""><img src="/resources/img/logo1_1.png" alt="FRESEARCH"></a>
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


<script src="/resources/stats/js/chartMy.js"></script>
<!-- 웹소켓 시작 -->
<script>
        var ws;
        
        $(document).ready(function(){
        	var mb_email =($)
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED)
            {
                writeResponse("WebSocket is already opend.");

                return;
            } 
            
            //웹소켓 객체 만드는 코드
            ws = new WebSocket('ws://localhost:8080/echo');
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
	         	console.log("이게 왜 ㅜㅜ")
	        	
	        	tableService.header(data,function(list){ 
	
	        		var html = '';
	        		if($(".badge-num").html() != list.length){
	        			$('#badge').html('<div class="badge-num" id="qqq">'+list.length+'</div><a class="entypo-bell" style="display:none;"></a> <img src="/resources/img/bicon16_1.png" style="width: 16px; margin-left: 3px; margin-top: 3px;">');
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

        
        
/*         $(document).ready(function(){
            $(document).on("click","#moveBtn",function(event){
              // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
              alert($(this).text());
            });
        }); // end of ready() */
</script>
    <!-- 웹소켓 끝 -->


</html>