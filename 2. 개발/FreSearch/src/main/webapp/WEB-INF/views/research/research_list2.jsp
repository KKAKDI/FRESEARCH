<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>설문 목록</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/research_list.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/js/research_list.js"></script>
</head>

<body>
<input type='hidden' id='pageNum' value='${pageMaker.cri.pageNum}'>
<input type='hidden' id='amount' value='${pageMaker.cri.amount}'>
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
				<!--
				<c:forEach items="${list}" var="research"> -->
					
					<!--  
						<li>
						<a href="">
						<span>${research.ctgr_nm}</span>
						<span>${research.subj_nm}</span>
						<span><fmt:formatDate pattern="yy.MM.dd"
											value="${research.subj_regdate}" /></span>
						<span><fmt:formatDate pattern="yy.MM.dd"
											value="${research.subj_startdate}" />
											~
							<fmt:formatDate pattern="yy.MM.dd"
											value="${research.subj_enddate}" /></span>
						</a>
						</li>-->
					
				<!--</c:forEach>
				-->
				
				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
								<a href="${pageMaker.startPage - 1}">이전</a>
							</li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage + 1}">다음</a></li>
						</c:if>
					</ul>
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
</html>