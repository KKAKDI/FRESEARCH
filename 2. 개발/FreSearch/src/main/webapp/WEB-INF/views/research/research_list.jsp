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
				   <!--  
					<a href="javascript:void(0);" class="research">진행중설문</a>
					<a href="javascript:void(0);" class="research">종료된설문</a> -->
					<input type='button' class="research" name="research" id="ing" value="진행중설문">
                    <input type='button' class="research" name="research" id="end" value="종료된설문">
				</div>
				<div id="test">
				</div>
				<div class="paging">
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
      /*
      $(document).ready(function(){
        $("a").on("click",function(event){ // a태그 클릭시 작동
          // 클릭된 태그의 본래의 기능을 막음 즉, a태그 본래 기능을 막음
          //event.preventDefault();
          //var txt = $(this).attr("href"); // href에 입력된 값을 가져옴 즉 클릭된 a의 국어, 영어, 수학 중 하나를 가져옴
 
          //alert(txt + "가 클릭됨");
        });
      });
      
      function clickA(){
    	  location.href = "/research/research_list";
    	  $("#clickA").css("background", "red");
      }
      function clickB(){
    	  location.href = "/research/research_list";
    	  $("#clickB").css("background", "red");
      }
      */
      $(document).ready(function(){
    	  $("#ing").css("color", "#222");
    	  $("#end").css("background", "#f9f9f9");
    	  var data = {
    			  research : "진행중설문"
          }
    	  
    	  showList(1);
    	  
    	  function showList(page){
    	  
    		  researchService.list({page: page|| 1}, function(researchCnt, list){
	              /*
	    		  var html = '';
	              if (list.length == 0 || list == null){
	            	html += '<ul>';
	      			html += '<li>';
	      			html += '<a>';
	      			html += '<span> 작성된 설문이 없습니다.';
	      			html += '</span>';
	      			html += '</a>';
	      			html += '</li>';
	      			html += '</ul>';
	              }else{
	                 for(var i =0, len = list.length||0; i < len; i++){
	                 
	                	html += '<ul>';
	         			html += '<li>';
	         			html += '<a>';
	         			html += '<span>' + list[i].ctgr_nm + '</span>';
	         			html += '<span>' + list[i].subj_nm + '</span>';
	         			html += '<span>' + research.displayTime(list[i].subj_regdate) + '</span>';
	         			html += '<span>' + research.displayTime(list[i].subj_startdate) + ' ~ ' 
	         				 + research.displayTime(list[i].subj_enddate) + '</span>';
	         			html += '</a>';
	         			html += '</li>';
	         			html += '</ul>';
	                 }
	              }*/
	    		  if(page == -1){
						pageNum = Math.ceil(researchCnt/10.0);
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
	         			html += '<span>' + list[i].subj_code + '</span>';
	         			html += '<span>' + list[i].subj_nm + '</span>';
	         			html += '<span>' + researchService.displayTime(list[i].subj_regdate) + '</span>';
	         			html += '<span>' + researchService.displayTime(list[i].subj_startdate) + ' ~ ' 
	         				 + researchService.displayTime(list[i].subj_enddate) + '</span>';
	         			html += '</a>';
	         			html += '</li>';
	         			html += '</ul>';
	         		}
	              $('#test').html(html);
	           });
    		  }
    	  
    	  var pageNum = 1;
  		var researchPageFooter = $(".paging");
  		
  		function showResearchPage(researchCnt){
  			var endNum = Math.ceil(pageNum / 10.0) * 10;
  			var startNum = endNum - 9;
  			
  			var prev = startNum != 1;
  			var next = false;
  			
  			if(endNum * 10 >= researchCnt){
  				endNum = Math.ceil(researchCnt/10.0);
  			}
  			
  			if(endNum * 10 < researchCnt){
  				next = true;
  			}
  			
  			var str = "<ul class='pagination pull-right'>";
  			
  			if(prev){
  				str+= "<li class='page-item'><a class='page-link' href='"+(startNum - 1)+"'>이전</a></li>";
  			}
  			
  			for(var i = startNum; i<=endNum; i++){
  				var active = pageNum == i? "active":"";
  				str+= "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
  			}
  			
  			if(next){
  				str+= "<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>다음</a></li>";
  			}
  			
  			str += "</ul></div>";
  			console.log(html);
  			researchPageFooter.html(html);
  		}
  		
  		researchPageFooter.on("click", "li a", function(e){
  			e.preventDefault();
  			console.log("page click");
  			
  			var targetPageNum = $(this).attr("href");
  			
  			console.log("targetPageNum: " + targetPageNum);
  			
  			pageNum = targetPageNum;
  			
  			showList(pageNum);
  		});
    	  });
      
      $(".research").click(function(e) {
    	  var researchVal = $(this).val();
    	  var data = {
    			  research : researchVal  
           }
    	  console.log(data);
    	  research.list(data,function(list){
              var html = '';
              if (list.length == 0){
            	html += '<ul>';
      			html += '<li>';
      			html += '<a>';
      			html += '<span> 데이터가 없습니다.';
      			html += '</span>';
      			html += '</a>';
      			html += '</li>';
      			html += '</ul>';
              }else{
                 for(var i =0, len = list.length||0; i < len; i++){
                 
                	html += '<ul>';
         			html += '<li>';
         			html += '<a>';
         			html += '<span>' + list[i].ctgr_nm + '</span>';
         			html += '<span>' + list[i].subj_nm + '</span>';
         			html += '<span>' + research.displayTime(list[i].subj_regdate) + '</span>';
         			html += '<span>' + research.displayTime(list[i].subj_startdate) + ' ~ ' 
         				 + research.displayTime(list[i].subj_enddate) + '</span>';
         			html += '</a>';
         			html += '</li>';
         			html += '</ul>';
                 }
              }
              $('#test').html(html);
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
      
</script>
<%@include file="../includes/footer.jsp"%>