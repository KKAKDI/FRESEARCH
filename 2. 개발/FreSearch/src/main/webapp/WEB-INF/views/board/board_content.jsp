<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<style>
h1 {
	text-align: center;
}

div {
	text-align: left;
	width: 850px;
	margin: auto;
}

body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>


<div>
	<div>
		<h1>글 상세보기</h1>
	</div>
</div>
<div>
	<div>
		<div>

			<div>

				<div class="form-group">
					<label>번호</label> <input class="form-control" name='brd_code'
						value=${board.brd_code } readonly="readonly">
				</div>

				<div class="form-group">
					<label>제목</label> <input class="form-control" name='brd_subject'
						value=${board.brd_subject } readonly="readonly">
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name='brd_content'
						readonly="readonly">  ${board.brd_content}</textarea>
				</div>

				<div class="form-group">
					<input type="hidden" class="form-control" name='mb_nick'
						value=${board.mb_email } readonly="readonly">
				</div>

				<div class="form-group">
					<input type="hidden" class="form-control" name='mb_nick'
						value=${board.mb_nick } readonly="readonly">
				</div>



				<button class="btn btn-sm btn-success" data-oper='modify'>수정</button>
				<button class="btn btn-sm btn-primary" data-oper='list'>리스트</button>

				<form id='operForm' action="/board/board_modify" method="get">
					<input type='hidden' id='brd_code' name='brd_code'
						value='${board.brd_code}'> <input type='hidden'
						name='pageNum' value='${cri.pageNum}'> <input
						type='hidden' name='amount' value='${cri.amount}'> <input
						type='hidden' name='keyword' value='${cri.keyword}'> <input
						type='hidden' name='type' value='${cri.type}'>
				</form>

			</div>
		</div>
	</div>
</div>

<!-- Reply Form {s} -->



<!-- Reply Form {e} -->

<!-- Reply List {s}-->

<div class="my-3 p-3 bg-white rounded shadow-sm"
	style="padding-top: 10px">

	<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
	<!-- /.panel-heading -->
	<div class="panel-body">

		<ul class="chat">
			<li class="left clearfix" data-rpl_no='12'>
				<div>
					<div class="header"></div>
				</div>
		</ul>
		<!-- ./ end ul -->
	</div>
	<!-- /.panel .chat-panel -->

</div>

<!-- Reply List {e}-->

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	var brd_codeValue = value="${board.brd_code}";
	var replyUL=$(".chat");
	
	showList(1);
	
	function showList(page){
		replyService.getList({brd_code:brd_codeValue, page:page || 1}, function(list){
			
			var str="";
			
			if(list == null || list.length ==0){
			replyUL.html(""); 
			
			return;
			
			}
			for( var i = 0, len = list.length || 0; i<len; i++){
				str += "<li data-rpl_code=' "+list[i].rpl_code+" '>";
				str += " <div><div class = 'header'><strong>"+ list[i].mb_nick +"</strong>";
				str += "	<small>"+replyService.displayTime(list[i].rpl_regdate) +"</small></div>";
				str += "<p>"+ list[i].rpl_content +"</p></div></li>";
				
			}
			replyUL.html(str);
		});
	}
});
</script>

<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/board/board_modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#brd_code").remove();
			operForm.attr("action", "/board/board_list");
			operForm.submit();
		});
	});
</script>
