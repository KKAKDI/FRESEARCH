<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%-- <%@include file="../includes/header.jsp" %> --%>

<style>
div {
   text-align: center;
}

table {
   width: 80%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   margin: auto;
}

th, td {
   border-bottom: 1px solid #444444;
   padding: 10px;
}

th {
   text-align: center;
   background-color: #0c4da2;
   font-family: "Times New Roman", Times, serif;
   font-style: oblique;
   font-size: 20px;
   color: white;
}

td {
   text-align: center;
}

button {
   margin-bottom: 10px;
}

ul, li{
	display:inline;
}
</style>

<div>
	<div>
		<h1>새소식</h1>
	</div>
</div>
<div>
	<div>
		<div>
			<div>공지사항 / 이벤트</div>
			<button id="regBtn" type="button">등록하기</button>
		</div>
		<!-- /.panel-heading -->
		<div>
			<table>
				<thead>
					<tr>
						<th>글번호</th>
						<th>구분</th>
						<th>제목</th>
						<th>등록일</th>
						<th>조회</th>
						<th>첨부</th>
					</tr>
				</thead>

				<c:forEach items="${list}" var="news">
					<tr>
						<td>${news.news_code}</td>
						<td>${news.news_division}</td>
						<td><a class='move' href=${news.news_code}>
								${news.news_subject}</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${news.news_regdate}" /></td>
						<td>${news.news_views}</td>
						<td></td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
</div>



<%-- 페이징 --%>
<div>
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



<%-- 검색 --%>

<div>
	<div>
		<form id='searchForm' action="/news/news_list" method='get'>
			<select name='type'>
				<option value="SC" ${pageMaker.cri.type eq 'SC'?'selected':''}>검색</option>
				<option value="S" ${pageMaker.cri.type eq 'S'?'selected':''}>제목</option>
				<option value="C" ${pageMaker.cri.type eq 'C'?'selected':''}>내용</option>

			</select> <input type='text' name='keyword' value='${pageMaker.cri.keyword}' />
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}' />
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}' />
			<button>검색</button>
		</form>
	</div>
</div>

<%-- 검색 끝 --%>


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
</script>

