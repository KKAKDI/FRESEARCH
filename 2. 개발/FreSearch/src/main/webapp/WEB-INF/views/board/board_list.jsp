<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@include file="../includes/header.jsp" %>
	

<style>
div.free{

	padding-top:120px; 

}

div {

	text-align: center;
}

table {
	width: 1100px;
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
	
	
	font-size: 20px;
	color: white;
}


td {
	text-align: center;
}

td.title{
	font-weight : 600;
}

button {
	margin-bottom: 10px;
}

ul, li {
	display: inline;
}
</style>


<div class="free" >
	<div>
		<h1>자유게시판</h1>
		<button id="Writein" type="button">새로운 글 등록</button>
	</div>
</div>


<div>
	<div>
		<div>
			<table>
				<thead>
					<tr>
						<th style = width:10%;>번호</th>
						<th style = width:40%;>제목</th>
						<th>닉네임</th>
						<th>조회수</th>
						<th>등록일</th>
						<th>추천</th>
						<th>비추천</th>
					</tr>
				</thead>

				<c:forEach items="${list}" var="board">
					<tr>
						<td>${board.brd_code}</td>
						<td class="title"><a class='move' href="${board.brd_code}">${board.brd_subject} </a></td>
						<td>${board.mb_nick}</td>
						<td>${board.brd_views}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.brd_regdate}" /></td>
						<td>${board.brd_like_cnt}</td>
						<td>${board.brd_dislike_cnt}</td>
						
						
						
					</tr>
				</c:forEach>

			</table>
			
			
<%-- 페이징 --%>
			<div >
				<ul class="pagination">
					
					<c:if test="${pageMaker.prev}">
						<li class="page-item">
						<a href="${path}/board/board_list?pageNum=1">첫페이지</a>
						<li class="paginate_button previous">
						<a href="${pageMaker.startPage-1}">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""}">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage +1}">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>




<form id='actionForm' action="/board/board_list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='keyword' value='${pageMaker.cri.keyword }'>
	<input type='hidden' name='type' value='${pageMaker.cri.type }'> 
</form>


<div>
	<div>		
			<form id='searchForm' action="/board/board_list" method='get'>
							<select name='type'>
								<option value=""
									${pageMaker.cri.type == null?'selected':''}>--</option>
								<option value="S"
									${pageMaker.cri.type eq 'S'?'selected':''}>제목</option>
								<option value="C"
									${pageMaker.cri.type eq 'C'?'selected':''}>내용</option>
								<option value="N"
									${pageMaker.cri.type eq 'N'?'selected':''}>닉네임</option>
								<option value="SC"
									${pageMaker.cri.type eq 'SC'?'selected':''}>제목 or 내용</option>
								<option value="SN"
									${pageMaker.cri.type eq 'SN'?'selected':''}>제목 or 닉네임</option>
								<option value="SCN"
									${pageMaker.cri.type eq 'SCN'?'selected':''}>제목 or 내용 or 닉네임</option>
							</select>
							 
								<input type='text' name='keyword'
								value='${pageMaker.cri.keyword}' /> 
								<input type='hidden' name='pageNum'
								value='${pageMaker.cri.pageNum}' /> 
								<input type='hidden' name='amount'
								value='${pageMaker.cri.amount}' />
							<button>검색</button>
			</form>
		</div>
	</div>


<script type="text/javascript">
	$(document).ready(function() {

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


<%@include file="../includes/footer.jsp" %>

