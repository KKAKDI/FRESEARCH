<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<%@include file="../includes/header.jsp"%>


<style>
div.container_new {
	padding-top: 150px;
	width: 850px;
	margin: 0 auto;
}

.board-head span {
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

.board-head span a {
	color: #fff;
	padding: 10px 59px 13px;
}

.board-head h2 {
	position: relative;
	font-size: 30px;
	padding: 3px 0 7px;
	margin-left: 0px;
}

.board-head h2::after {
	background: #1428a0;
	width: 99.9%;
	height: 2px;
	content: "";
	position: absolute;
	top: 100%;
	left: 0px;
}

div.search {
	display: inline;
	text-align: right;
	margin: auto;
}

input.search {
	height: 22px;
}

#searchForm {
	margin-left: auto;
	margin-right: auto;
	text-align: right;
	width: 848px;
	margin-top: 45px;
	margin-bottom: 5px;
}

table {
	width: 850px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin: auto;
}

th, td {
	border-bottom: 1px solid #dcdcdc;
	padding: 10px;
	font-size: 16px;
}

td {
	text-align: center;
	color: #505050;
}

td.title {
	text-align: left;
}

button {
	margin-bottom: 10px;
}

ul, li {
	display: inline;
}

#pagingArea ul {
	text-align: center;
}

#pagingArea {
	text-align: center;
	padding-top: 20px;
	s
}

#pagingArea li {
	display: inline-block;
	min-width: 40px;
	height: 40px;
	margin: 0 1px;
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

#pagingArea ul .paginate_button a:hover {
	background-color: #1428a0;
	cursor: pointer;
	color: #fff;
	opacity: 0.4;
}

#pagingArea ul .paginate_button_move a:hover {
	cursor: pointer;
	color: #1428a0;
	border: 1px solid #000;
}

#pagingArea ul .paginate_button.active .page-link {
	background-color: #1428a0;
	font-style: normal;
	color: #fff;
	width: 40px;
	height: auto;
}

#pagingArea ul .paginate_button.active .page-link:hover {
	cursor: auto;
}
</style>

<div class="container_new">
	<div>
		<div>
			<div class="container_form">
				<div class="board-head">
					<h2>자유게시판</h2>
					<span> <a href="/board/board_register">등록</a>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>

<div class='search_form'>
	<div class='search'>
		<form id='searchForm' action="/board/board_list" method='get'>
			<select name='type' style="width: 155px; height: 22px;">
				<option value="S" ${pageMaker.cri.type eq 'S'?'selected':''}>제목</option>
				<option value="C" ${pageMaker.cri.type eq 'C'?'selected':''}>내용</option>
				<option value="N" ${pageMaker.cri.type eq 'N'?'selected':''}>닉네임</option>
				<option value="SC" ${pageMaker.cri.type eq 'SC'?'selected':''}>제목
					or 내용</option>
				<option value="SN" ${pageMaker.cri.type eq 'SN'?'selected':''}>제목
					or 닉네임</option>
				<option value="SCN" ${pageMaker.cri.type eq 'SCN'?'selected':''}>제목
					or 내용 or 닉네임</option>
			</select> <input class="search" type='text' name='keyword'
				value='${pageMaker.cri.keyword}' /> <input type='hidden'
				name='pageNum' value='${pageMaker.cri.pageNum}' /> <input
				type='hidden' name='amount' value='${pageMaker.cri.amount}' />
			<button style="border: 1px solid #ddd;">
				<img src="/resources/img/search.png" width=20px; height=21px;>
			</button>
		</form>
	</div>
</div>

<div>
	<div>
		<div>
			<table>
				<thead>
					<tr
						style="border-bottom: 1px solid red; border-top: 1px solid #0C4DA2;">
						<th
							style="background-color: #f0f0f0; width: 5%; font-weight: bold; color: #505050; padding: 16 19;">No</th>
						<th
							style="background-color: #f0f0f0; width: 50%; font-weight: bold; color: #505050; padding: 16 19;">제목</th>
						<th
							style="background-color: #f0f0f0; width: 5%; font-weight: bold; color: #505050; padding: 16 19;"></th>
						<th
							style="background-color: #f0f0f0; width: 14%; font-weight: bold; color: #505050; padding: 16 19;">닉네임</th>
						<th
							style="background-color: #f0f0f0; width: 10%; font-weight: bold; color: #505050; padding: 16 19;">등록일</th>
						<th
							style="background-color: #f0f0f0; width: 10%; font-weight: bold; color: #505050; padding: 16 19;">조회수</th>

					</tr>
				</thead>

				<c:forEach items="${list}" var="board">
					<tr>
						<td>${board.brd_code}</td>
						<td class="title"><a class='move' href="${board.brd_code}">${board.brd_subject}
						</a></td>
						<c:choose>
							<c:when test="${board.brd_is_attach == 'Y'}">
								<td><img src="/resources/img/bicon01_1.png" width=20px;
									height=auto;></td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
						<td>${board.mb_nick}</td>
						<td><fmt:formatDate pattern="yy-MM-dd"
								value="${board.brd_regdate}" /></td>
						<td>${board.brd_views}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>

<%-- 페이징 --%>
<div id="pagingArea">
	<ul class="pagination">

		<c:if test="${pageMaker.prev}">
			<li class="page-item"><a
				href="${path}/board/board_list?pageNum=1">첫페이지</a>
			<li class="paginate_button_move"><a
				href="${pageMaker.startPage-1}">이전</a></li>
		</c:if>

		<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
			<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""}">
				<a class="page-link" href="${num}">${num}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next}">
			<li class="paginate_button_move"><a
				href="${pageMaker.endPage +1}">다음</a></li>
		</c:if>
	</ul>
</div>

<form id='actionForm' action="/board/board_list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='keyword' value='${pageMaker.cri.keyword }'>
	<input type='hidden' name='type' value='${pageMaker.cri.type }'>
</form>

<script type="text/javascript">
	$(document).ready(function() {
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$(document).ajaxSend(function(e, xhr, options){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});

		var result = '${result}';

		$("#Writein").on("click", function() {
			self.location = "board_register";

		});
		
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
		
		$(".move")
		.on(
				"click",
				function(e) {

					e.preventDefault();
					actionForm
							.append("<input type='hidden' name='brd_code' value='"
									+ $(this).attr(
											"href")
									+ "'>");
					actionForm.attr("action",
							"/board/board_content");
					actionForm.submit();

				});
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e){
			
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 입력해 주세요");
				return false;
			}
					
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
			
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>