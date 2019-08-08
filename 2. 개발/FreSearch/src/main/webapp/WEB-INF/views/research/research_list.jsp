<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/research_list.css">
<script src="/resources/js/research_list.js"></script>
	<div class="page-content">
		<div class="list-content">
			<div class="detail-list">
				<h2>설문 목록</h2>
				<div class="tab-content">
					<div class="tab-button">
						<input type='button' class="research" name="research" id="ing" value="진행중설문">
	                	<input type='button' class="research" name="research" id="end" value="종료된설문">
					</div>
					<div class="content" id="test"></div>
					<div class="paging"></div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
      $(document).ready(function(){
    	  $("#ing").css("color", "#222");
    	  $("#end").css("background", "#f9f9f9");
    	  
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
		                 
	                	html += '<ul>';
	         			html += '<li>';
	         			html += '<a>';
	         			if(list[i].ctgr_nm == "스포츠, 레저"){
	         			html += '<span><img class="manImg" src="/resources/img/research.png"></img>' + list[i].ctgr_nm + '</span>';
	         			}
	         			html += '<span>' + list[i].subj_nm + '</span>';
	         			html += '<span>' + researchService.displayTime(list[i].subj_regdate) + '</span>';
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
  				str+= "<li class='page-item1 aaa'><a class='page-link' href='"+(startNum - 1)+"'>이전</a></li>";
  			}
  			
  			for(var i = startNum; i<=endNum; i++){
  				var active = pageNum == i? "active":"";
  				str+= "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
  			}
  			
  			if(next){
  				str+= "<li class='page-item1 aaa'><a class='page-link' href='"+(endNum+1)+"'>다음</a></li>";
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
  			var aa = $(this).attr("class");
  			console.log("aa : " + aa);
  			var a = researchPageFooter.children("ul").children("li").children("a").attr("class");
  			console.log("children : " + a);
  			
  			/*
  			researchPageFooter.css("color", "#fff");
  	  		researchPageFooter.css("background", "#222");
  	  		researchPageFooter.css("font-style", "normal");*/

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
	         			html += '<a>';
	         			html += '<span>' + list[i].ctgr_nm + '</span>';
	         			html += '<span>' + list[i].subj_nm + '</span>';
	         			html += '<span>' + researchService.displayTime(list[i].subj_regdate) + '</span>';
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
  		$("#end").css("color", "#888");
  		$("#end").css("background", "#f9f9f9");
  	});

  	$("#end").click(function() {
  		$("#end").css("color", "#222");
  		$("#end").css("background", "#fff");
  		$("#ing").css("color", "#888");
  		$("#ing").css("background", "#f9f9f9");
  	});
  	
  	$(".paging").on('click','li a',function(e){ 
  		
  		$(".paging li a").css("color", "#fff");
  		$(".paging li a").css("background", "#222");
  		$(".paging li a").css("font-style", "normal");
  		
  	});
  	
</script>
<%@include file="../includes/footer.jsp"%>