<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link rel="stylesheet" href="/resources/css/reset.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<%@include file="../includes/header.jsp" %>

<style>
.container_new{
	padding-top: 105px;
	width: 850px;
	margin: 0 auto;
}
table {
   width: 850px;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   margin: auto;
}
div.pagingArea, div.search {
   text-align: center;
   margin: auto;
}
div.search{
	display: inline;
	text-align: right;
}
input.search{
	height: 22px;
}
th, td {
   border-bottom: 1px solid #dcdcdc;
   padding: 10px;
}
td {
   text-align: center;
   color: #505050;
}
hr{
	margin: 8 auto;
	background-color: #0C4DA2;
	width: 5%;
}
button {
   margin-bottom: 10px;
}
button#regBtn{
	text-align: right;
}
ul.pagination, li.page-item, li.paginate_button previous, li.paginate_button, li.paginate_button next{
	display:inline-block;
	padding: 6px 12px;
}
a.move{
	text-decoration: none;
	color:#505050;
}
#pagingArea.a{
	text-decoration: none;
}
a.move:hover{ 
	text-decoration: underline;
	color: #0C4DA2;
	font-weight: bold;
}
td.subject{
	text-align: left;
}
#pagingArea{
	margin-top: 10px;
	text-align: center;
	margin-bottom: 160px;
}
li.paginate_button {
	position: relative;
    float: left;
    padding: 6px 12px;
    margin-left: -1px;
    line-height: 1.42857143;
    color: #337ab7;
    text-decoration: none;
    background-color: #fff;
    border: 1px solid #ddd;
}
.Header {
    margin-top: 0px;
}
</style>
<div class="container_new">

	<div>
		<div>
			<div class="container_form" style="text-align: center;">
					<h2>공지사항 / 이벤트</h2>
					<hr/>
					<p>FreSearch 새소식을 제공합니다.</p>
					<button id="regBtn" type="button">등록하기</button>
					
<%-- 검색 --%>

<div class='search_form'>
	<div class='search'>
		<form id='searchForm' action="/news/news_list" method='get'>
			<select name='type' style="width: 49px; height: 22px;">
				<option value="SC" ${pageMaker.cri.type eq 'SC'?'selected':''}>검색</option>
				<option value="S" ${pageMaker.cri.type eq 'S'?'selected':''}>제목</option>
				<option value="C" ${pageMaker.cri.type eq 'C'?'selected':''}>내용</option>

			</select> <input class="search" type='text' name='keyword' value='${pageMaker.cri.keyword}' />
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}' />
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}' />
			<button style="border: 1px solid #ddd;"><img src="/resources/img/search.png" width=20px; height=21px;></button>
		</form>
	</div>
</div>

<%-- 검색 끝 --%>

				<table>
					<thead>
						<tr style="border-bottom: 1px solid red; border-top: 1px solid #0C4DA2;">
							<th style="background-color: #f0f0f0; width: 15%; font-weight: bold; color: #505050; padding: 15 19;"></th>
							<th style="background-color: #f0f0f0; width: 45%; font-weight: bold; color: #505050; padding: 15 19;">제목</th>
							<th style="background-color: #f0f0f0; width: 5%; font-weight: bold; color: #505050; padding: 15 19;"></th>
							<th style="background-color: #f0f0f0; width: 10%; font-weight: bold; color: #505050; padding: 15 19;">조회</th>
							<th style="background-color: #f0f0f0; width: 15%; font-weight: bold; color: #505050; padding: 15 19;">등록일</th>
							
						</tr>
					</thead>

					<c:forEach items="${list}" var="news">
						<tr>
							<td style="font-weight: bold; padding: 20;">[${news.news_division}]</td>
							<td class="subject"><a class='move' href=${news.news_code} style="text-align: left;">${news.news_subject}</a></td>
							
							<c:choose>
							<c:when test="${news.news_is_attach == 'Y'}">
							<td><img src="/resources/img/file.png" width=20px; height=auto;></td>
							</c:when>
								<c:otherwise>
	         						<td></td>
	         					</c:otherwise>
							</c:choose>
						
					
					
							<td style="padding: 20;">${news.news_views}</td>
							<td style="padding: 20;"><fmt:formatDate pattern="yyyy-MM-dd"
									value="${news.news_regdate}" /></td>
						</tr>		
					</c:forEach>	
							
					
				<!--<c:forEach items="${List}" var="data" varStatus="status">
	          <c:choose>
	           <c:when test="${fn:length(data.nm) > 14}">
	            <c:out value="${fn:substring(data.nm,0,13)}"/>....
	           </c:when>
	           <c:otherwise>
	            <c:out value="${data.nm}"/>
	           </c:otherwise> 
	          </c:choose>
	</c:forEach>-->
					
					
					
					
					
				</table>
			</div>
		</div>
	</div>
</div>





<%-- 페이징 --%>
<div id="pagingArea">
	<ul class="pagination">

		<c:if test="${pageMaker.prev}">
			<li class="page-item"><a href="${path}/news/news_list?pageNum=1">첫페이지</a></li>
			<li class="paginate_button previous"><a
				href="${pageMaker.startPage-1}">Previous</a></li>
		</c:if>

		<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
			<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}">
				<a href="${num}">${num}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next}">
			<li class="paginate_button next"><a
				href="${pageMaker.endPage +1}">Next</a></li>
		</c:if>
	</ul>
</div>

<form id='actionForm' action="/news/news_list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
	<input type='hidden' name='type' value='${pageMaker.cri.type}'>
</form>

<%-- 페이징 끝 --%>





<script type="text/javascript">
	$(document).ready(function() {
		//등록페이지 이동 버튼 스크립트
		$("#regBtn").on("click", function() {
			self.location = "news_register";
		});

		// 페이징 간련 스크립트
		var result = '${result}';
		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log(' click ');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='news_code' value='"+ $(this).attr("href")+ "'>");
			actionForm.attr("action", "/news/news_get");
			actionForm.submit();
			});

		//검색 관련 스크립트
		var searchForm = $("#searchForm");

		$("#searchForm button").on("click",
			function(e) {
				if (!searchForm.find("option:selected").val()) {
					alert("검색 종류를 입력해 주세요");
					return false;
				}

				if (!searchForm.find("input[name='keyword']").val()) {
					alert("키워드를 입력하세요");
					return false;
				}
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchForm.submit();
			});
		
		
	});
	
	/*$(window).on("load", function() {
		//<img src='/resources/img/file.png'>
		//setInterval(function() {console.log("실험11 : "+ $('#test').html())},2);
		if($(".test") != ""){
			var html = '<img src="/resources/img/attach.png">';
			$(".test").html(html);
			console.log("실험 : "+ $(".test").html());
		}
		
	});*/



	
</script>

<%@include file="../includes/footer.jsp" %>