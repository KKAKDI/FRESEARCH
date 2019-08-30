<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<%@include file="../includes/header.jsp" %>



<style>
body {
	font-family: "Open Sans", sans-serif;
	min-width: 850px;
	font-weight: 500;
	font-size: 16px;
}

.container_new {
	padding-top: 150px;
	width: 850px;
	margin: 0 auto;
	min-height: 872px;
}

table {
	width: 850px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin: auto;
	table-layout: fixed;
}

div.search {
	display: inline;
	text-align: right;
	margin: auto;
}

input.search {
	height: 22px;
}

.search_form {
	padding-top: 30px;
}

th, td {
	border-bottom: 1px solid #dcdcdc;
	padding: 10px;
	font-size: 16px;
}

td {
	text-align: center;
	color: #505050;
	padding-top: 20px;
}

hr {
	margin: 8 auto;
	background-color: #0C4DA2;
	width: 5%;
}

button {
	margin-bottom: 10px;
}

button#regBtn {
	text-align: right;
}

a.move {
	text-decoration: none;
	color: #505050;
}

a.move:hover {
	text-decoration: underline;
	color: #0C4DA2;
	font-weight: bold;
}

td.subject {
	text-align: left;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.Header {
	margin-top: 0px;
}

.tab-news, .tab-event {
	padding-top: 15px;
	margin-bottom: -2px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	text-decoration: none;
	font-size: 16px;
	color: #888;
	width: 425px;
	height: 50px;
	line-height: 38px;
	background: #fff;
	padding: 5px;
	margin-right: -3px;
	margin-left: -3px;
	border: 1px solid #ddd;
	cursor: pointer;
	outline: none;
}

.tab-news {
	font-weight: bold;
}

.tab-event {
	background: rgb(249, 249, 249);
}

div.tab-news a {
	color: rgb(34, 34, 34);
}

div.tab-event a {
	color: #888;
}

.tab-event {
	background: rgb(249, 249, 249);
}

.news-head h2 {
	position: relative;
	font-size: 30px;
	padding: 3px 0 7px;
	/*margin-bottom: 40px;*/
	margin-left: 0px;
}

.news-head h2::after {
	background: #1428a0;
	width: 99.9%;
	height: 2px;
	content: "";
	position: absolute;
	top: 100%;
	left: 0px;
}

.news-head span {
	position: absolute;
	margin-left: 699px;
	margin-top: -46px;
	background: #1428a0;
	width: 150px;
	height: 45px;
	text-align: center;
	padding-top: 10px;
	cursor: pointer;
}

.news-head span a {
	color: #fff;
}

#search_image {
	cursor: pointer;
}

a {
	display: block;
}

#pagingArea ul{
	text-align: center;
	/*margin-top: 30%;*/
}

#pagingArea li{
    display: inline-block;
    min-width: 40px;
    height: 40px;
    margin: 0 1px;
    /*padding: 0 5px;*/
    box-sizing: border-box;
    line-height: 40px;
    vertical-align: top;
}

#pagingArea ul .paginate_button a {
	color: #888;
	display: inline-block;
    width: 40px;
    height: auto;
}
#pagingArea ul .paginate_button_move a {
	transition: border .2s;
    display: inline-block;
    position: relative;
    width: 40px;
    height: 40px;
    margin: 0 -1px;
    box-sizing: border-box;
    border: 1px solid #ebebeb;
    vertical-align: top;
    color: #888;
}
#pagingArea ul .paginate_button a:hover{
	background-color: #1428a0;
    cursor: pointer;
	color: #fff;
	opacity: 0.4;
}
#pagingArea ul .paginate_button_move a:hover{
    cursor: pointer;
	color: #000;
	border: 1px solid #000;
}

#pagingArea ul .paginate_button.active .page-link{
	background-color: #1428a0;
    font-style: normal;
    color: #fff;
    width: 40px;
    height: auto;
}
#pagingArea ul .paginate_button.active .page-link:hover{
	cursor: auto;
}

</style>
<div class="container_new">

	<div>
		<div>
			<div class="container_form">
			
				<div class="news-head">
				<h2>새소식</h2>
				<span>
					<a href="/news/news_register">등록</a>
				</span>
				</div>
				
					<div class="tab" style="text-align: center">
						<div class="tab-news">
							<a href="/news/news_list">공지사항</a>
						</div>
						<div class="tab-event">
		                	<a href="/news/news_list_event">이벤트</a>
						</div>
					</div>
					<%-- <hr/>
					<p>FreSearch 새소식을 제공합니다.</p>
					<button id="regBtn" type="button">등록하기</button> --%>
					


				<table>
					<thead>
						<tr style="border-bottom: 1px solid red; border-top: 1px solid white;">
							<th style="background-color: #f0f0f0; width: 15%; font-weight: bold; color: #505050; padding: 15 19;"></th>
							<th style="background-color: #f0f0f0; width: 45%; font-weight: bold; color: #505050; padding: 15 19;">제목</th>
							<!-- <th style="background-color: #f0f0f0; width: 5%; font-weight: bold; color: #505050; padding: 15 19;"></th> -->
							<th style="background-color: #f0f0f0; width: 10%; font-weight: bold; color: #505050; padding: 15 19;">조회</th>
							<th style="background-color: #f0f0f0; width: 15%; font-weight: bold; color: #505050; padding: 15 19;">등록일</th>
							
						</tr>
					</thead>

					<c:forEach items="${list}" var="news">
						<tr>
							<td style="font-weight: bold; padding: 20;">[${news.news_division}]</td>
							<td class="subject"><a class='move' href=${news.news_code} style="text-align: left;">${news.news_subject}</a></td>
							
							<!-- 
							<c:choose>
							<c:when test="${news.news_is_attach == 'Y'}">
							<td><img src="/resources/img/file.png" width=20px; height=auto;></td>
							</c:when>
								<c:otherwise>
	         						<td></td>
	         					</c:otherwise>
							</c:choose>
							 -->
						
					
					
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
				
<%-- 검색 --%>

<div class='search_form'>
	<div class='search'>
		<form id='searchForm' action="/news/news_list_event" method='get'>
			<select name='type' style="width: 49px; height: 22px;">
				<option value="SC" ${pageMaker.cri.type eq 'SC'?'selected':''}>검색</option>
				<option value="S" ${pageMaker.cri.type eq 'S'?'selected':''}>제목</option>
				<option value="C" ${pageMaker.cri.type eq 'C'?'selected':''}>내용</option>

			</select> <input class="search" type='text' name='keyword' value='${pageMaker.cri.keyword}' />
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}' />
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}' />
			<button style="border: 1px solid #ddd;"><img id='search_image' src="/resources/img/search.png" width=20px; height=20px;></button>
		</form>
	</div>
</div>

<%-- 검색 끝 --%>
			</div>
		</div>
	</div>
		<%-- 페이징 --%>
		<div id="pagingArea">
			<ul class="pagination">
		
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a href="${path}/news/news_list_event?pageNum=1">첫페이지</a></li>
					<li class="paginate_button_move"><a
						href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>
		
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}">
						<a class="page-link" href="${num}">${num}</a>
					</li>
				</c:forEach>
		
				<c:if test="${pageMaker.next}">
					<li class="paginate_button_move"><a
						href="${pageMaker.endPage +1}">Next</a></li>
				</c:if>
			</ul>
		</div>
		<form id='actionForm' action="/news/news_list_event" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
			<input type='hidden' name='type' value='${pageMaker.cri.type}'>
		</form>
		
		<%-- 페이징 끝 --%>
</div>













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
		
		$(".paginate_button_move a").on("click", function(e) {
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
					swal({
						title:"키워드를 입력해 주세요.",
						text:"키워드 입력이 안되어 있습니다. 확인해주세요!",
						icon:"warning",
						button:"확인",
						});
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