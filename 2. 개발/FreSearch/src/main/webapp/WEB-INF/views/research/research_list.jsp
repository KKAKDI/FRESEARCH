<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file="../includes/header.jsp"%>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="708907828012-qu34esq94i2i1kp96q28pgs1u2s7tnma.apps.googleusercontent.com">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/research_list.css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="/resources/js/research_list.js"></script>
</head>
	<div class="page-content">
		<div class="list-content">
			<div class="detail-list">
				<div class="list-head">
				<h2>설문 목록</h2>
				<span>
					<a href="/research/research_register">등록</a>
				</span>
				</div>
				<div class="tab-content">
					<div class="tab-button">
						<input type='button' class="research" name="research" id="ing" value="진행중설문">
	                	<input type='button' class="research" name="research" id="end" value="종료된설문">
					</div>
					<div class="content" id="test"></div>
					<div class="paging"></div>
				</div>
				<div class="g-signin2" data-onsuccess="onSignIn" style="display:none"></div>
			</div>
		</div>
	</div>
<script type="text/javascript">
      $(document).ready(function(){
    	  $("#ing").css("color", "#222");
    	  $("#end").css("background", "#f9f9f9");
    	  $("#ing").css("font-weight", "700");
    	  
    	  var research = $(".research").val();
    	  
    	  showList(1);
    	  
    	  function showList(page){
    	  
    		  researchService.list({data:research, page: page|| 1}, function(researchCnt, list){
    			  	console.log("research : " + research);
    			  	console.log("researchCnt : " + researchCnt);
  					console.log("list : " + list);
  					console.log(list);
 
	    		    if(page == -1){
						pageNum = Math.ceil(researchCnt/5.0);
						showList(pageNum);
						return;
					}
					
					var html="";
					
					if(list == null || list.length == 0){
						html += '<ul>';
		      			html += '<li>';
		      			html += '<a>';
		      			html += '<span> 작성된 설문이 없습니다.';
		      			html += '</span>';
		      			html += '</a>';
		      			html += '</li>';
		      			html += '</ul>';
						return;
					}
					for(var i =0, len = list.length||0; i < len; i++){
						
	                	html += '<ul class="research_list">';
	         			html += '<li>';
	         			html += "<a href='/research/research_content?subj_code="+list[i].subj_code+"'>";
	         			if(list[i].ctgr_nm == "교육, 학문"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/education.jpg"/>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "컴퓨터 통신"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/computer.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "게임"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/game.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "엔터테인먼트, 예술"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/entertainment.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "생활"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/life.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "건강"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/health.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "사회, 정치"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/social.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "경제"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/economy.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "여행"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/travel.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "스포츠, 레저"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/sports.PNG"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "쇼핑"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/shopping.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "지역"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/area.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "결혼"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/marriage.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}else{
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/noimg.jpg"></img>';
	         				html += '<p id="status">진행</p>';
	         				html += '</div>';
	         			}
	         			/*html += '<span>' + list[i].subj_code + '</span>';*/
	         			html += '<span>' + list[i].ctgr_nm + '</span>';
	         			html += '<div class="subj_nm">';
	         			html += '<span>' + list[i].subj_nm + '</span>';
	         			html += '</div>';
	         			/*html += '<span>' + researchService.displayTime(list[i].subj_regdate) + '</span>';*/
	         			html += '<span>' + researchService.displayTime(list[i].subj_startdate) + ' ~ ' 
	         				 + researchService.displayTime(list[i].subj_enddate) + '</span>';
	         			html += '</a>';
	         			html += '</li>';
	         			html += '</ul>';
	         		}
	                $('#test').html(html);
	              
	                showResearchPage(researchCnt);
	          });
    	}
    	  
    	var pageNum = 1;
  		var researchPageFooter = $(".paging");
  		
  		function showResearchPage(researchCnt){
  			var endNum = Math.ceil(pageNum / 5.0) * 5;
  			console.log("endNum : " + endNum);
  			var startNum = endNum - 4;
  			console.log("startNum : " + startNum);
  			var prev = startNum != 1;
  			var next = false;
  			
  			if(endNum * 6 >= researchCnt){
  				endNum = Math.ceil(researchCnt/6.0);
  			}
  			
  			if(endNum * 6 < researchCnt){
  				next = true;
  			}
  			
  			var str = "<ul class='pagination pull-right'>";
  			
  			if(prev){
  				str+= "<li class='page-item-move'><a class='page-link' href='"+(startNum - 1)+"'>이전</a></li>";
  			}
  			
  			for(var i = startNum; i<=endNum; i++){
  				var active = pageNum == i? "active":"";
  				str+= "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
  			}
  			
  			if(next){
  				str+= "<li class='page-item-move'><a class='page-link' href='"+(endNum+1)+"'>다음</a></li>";
  			}
  			
  			str += "</ul>";
  			console.log(str);
  			researchPageFooter.html(str);
  		}
  		
  		/*researchPageFooter.on("click", "li a", function(e){*/
  		researchPageFooter.off('click','li a').on('click','li a',function(e){ 
  			e.preventDefault();
  			console.log("page click");
  			
  			var targetPageNum = $(this).attr("href");

  			console.log("targetPageNum: " + targetPageNum);
  			
  			pageNum = targetPageNum;
  			
  			showList(pageNum);
  		});
  		/*
  		researchPageFooter.off('click','a').on('click','a',function(e){ 
  			var str = "<ul class='pagination pull-right'>";
  		
  			researchPageFooter.css("color", "#fff");
  			researchPageFooter.css("background", "#222");
  			researchPageFooter.css("font-style", "normal");
  		});*/
  	});
      
      //$(".research").click(function(e) {
    $(".tab-content").off('click','.research').on('click','.research',function(e){  
    	  var research = $(this).val();
    	  showList(1);
    	  
    	  function showList(page){
    	  
    		  researchService.list({data:research, page: page|| 1}, function(researchCnt, list){
    			  	console.log("research : " + research);
    			  	console.log("researchCnt : " + researchCnt);
  					console.log("list : " + list);
  					console.log(list);
  					
	    		  if(page == -1){
						pageNum = Math.ceil(researchCnt/5.0);
						showList(pageNum);
						return;
					}
					
					var html="";
					
					if(list == null || list.length == 0){
						html += '<ul>';
		      			html += '<li>';
		      			html += '<a>';
		      			html += '<span> 작성된 설문이 없습니다.';
		      			html += '</span>';
		      			html += '</a>';
		      			html += '</li>';
		      			html += '</ul>';
						return;
					}
					for(var i =0, len = list.length||0; i < len; i++){
		                
	                	html += '<ul>';
	         			html += '<li>';
	         			html += "<a href='/research/research_content?subj_code="+list[i].subj_code+"'>";
	         			if(list[i].ctgr_nm == "교육, 학문"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/education.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "컴퓨터 통신"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/computer.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "게임"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/game.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "엔터테인먼트, 예술"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/entertainment.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "생활"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/life.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "건강"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/health.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "사회, 정치"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/social.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "경제"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/economy.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "여행"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/travel.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "스포츠, 레저"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/sports.PNG"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "쇼핑"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/shopping.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "지역"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/area.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else if(list[i].ctgr_nm == "결혼"){
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/marriage.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}else{
	         				html += '<div class="ctgr_img">';
	         				html += '<img src="/resources/img/noimg.jpg"></img>';
	         				if(research == "진행중설문"){
	         					html += '<p id="status">진행</p>';
	         				}else if(research == "종료된설문"){
	         					html += '<p id="status">종료</p>';
	         				}
	         				html += '</div>';
	         			}
	         			/*html += '<span>' + "[" +list[i].ctgr_nm + "] " + list[i].subj_nm +'</span>';*/
	         			html += '<span>' + list[i].ctgr_nm + '</span>';
	         			html += '<div class="subj_nm">';
	         			html += '<span>' + list[i].subj_nm + '</span>';
	         			html += '</div>';
	         			/*html += '<span>' + researchService.displayTime(list[i].subj_regdate) + '</span>';*/
	         			html += '<span>' + researchService.displayTime(list[i].subj_startdate) + ' ~ ' 
	         				 + researchService.displayTime(list[i].subj_enddate) + '</span>';
	         			html += '</a>';
	         			html += '</li>';
	         			html += '</ul>';
	         		}
	              $('#test').html(html);
	              
	              showResearchPage(researchCnt);
	           });
    		  }
    	  
    	var pageNum = 1;
  		var researchPageFooter = $(".paging");
  		
  		function showResearchPage(researchCnt){
  			var endNum = Math.ceil(pageNum / 5.0) * 5;
  			console.log("endNum : " + endNum);
  			var startNum = endNum - 4;
  			console.log("startNum : " + startNum);
  			var prev = startNum != 1;
  			var next = false;
  			
  			if(endNum * 6 >= researchCnt){
  				endNum = Math.ceil(researchCnt/6.0);
  			}
  			
  			if(endNum * 6 < researchCnt){
  				next = true;
  			}
  			
  			var str = "<ul class='pagination pull-right'>";
  			
  			if(prev){
  				str+= "<li class='page-item-move'><a class='page-link' href='"+(startNum - 1)+"'>이전</a></li>";
  			}
  			
  			for(var i = startNum; i<=endNum; i++){
  				var active = pageNum == i? "active":"";
  				str+= "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
  			}
  			
  			if(next){
  				str+= "<li class='page-item-move'><a class='page-link' href='"+(endNum+1)+"'>다음</a></li>";
  			}
  			
  			str += "</ul></div>";
  			console.log("str : " + str);
  			researchPageFooter.html(str);
  		}
  		
  		//researchPageFooter2.on("click", "li a", function(e){
  		researchPageFooter.off('click','li a').on('click','li a',function(e){  
  			e.preventDefault();
  			console.log("page click");
  			
  			var targetPageNum = $(this).attr("href");
  			
  			console.log("targetPageNum: " + targetPageNum);
  			
  			pageNum = targetPageNum;
  			
  			showList(pageNum);
  		});
  	});
  		
  	$("#ing").click(function() {
  		$("#ing").css("color", "#222");
  		$("#ing").css("background", "#fff");
  		$("#ing").css("font-weight", "700");
  		$("#end").css("color", "#888");
  		$("#end").css("background", "#f9f9f9");
  		$("#end").css("font-weight", "400");
  	});

  	$("#end").click(function() {
  		$("#end").css("color", "#222");
  		$("#end").css("background", "#fff");
  		$("#end").css("font-weight", "700");
  		$("#ing").css("color", "#888");
  		$("#ing").css("background", "#f9f9f9");
  		$("#ing").css("font-weight", "400");
  	});
  	
  	$(".paging").on('click','li a',function(){ 
  		$(".paging li a").css("color", "#fff");
  		$(".paging li a").css("background", "#222");
  		$(".paging li a").css("font-style", "normal");
  	});
  	
</script>
<%@include file="../includes/footer.jsp"%>