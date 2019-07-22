<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<style>

h1{
text-align:center;
}

div{
text-align: left;

 }

form {
	width:850px;
	margin : auto;
}
body {

  padding-top: 70px;

  padding-bottom: 30px;
  
}
</style>
<div>
	<div>
		<h1>글 수정</h1>
	</div>
</div>
	
	<div>
		<div>
			
		</div>
	</div>
<form role="form" action="/board/board_modify" method="post">
<input type='hidden' name='pageNum' value='${cri.pageNum }'>
<input type='hidden' name='amount' value='${cri.amount }'>
<input type='hidden' name='keyword' value='${cri.keyword }'>
<input type='hidden' name='type' value='${cri.type}'>

<div class="form-group">
  <label>번호</label> 
  <input class="form-control" name='brd_code' 
     value='${board.brd_code}' readonly="readonly">
</div>

<div class="form-group">
  <label>제목</label> 
  <input class="form-control" name='brd_subject' 
    value='${board.brd_subject }' >
</div>

<div class="form-group">
  <label>내용</label>
  <textarea class="form-control" rows="5" name='brd_content' >${board.brd_content}</textarea>
</div>


<div class="form-group">
  
  <input  type="hidden" class="form-control" name='mb_email'
    value='${board.mb_email}
    ' readonly="readonly">            
</div>

<div class="form-group">

  <input  type="hidden" class="form-control" name='mb_nick'
    value='${board.mb_nick}
    ' readonly="readonly">            
</div>

  <button class="btn btn-sm btn-success" type="submit" data-oper='modify'>수정</button>
  <button class="btn btn-sm btn-danger" type="submit" data-oper='delete'>삭제</button>
  <button class="btn btn-sm btn-primary" type="submit" data-oper='list'>리스트</button>

</form>
<script type="text/javascript">

$(document).ready(function() {

	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'delete'){
			formObj.attr("action", "/board/board_delete");
			
		}else if(operation === 'list'){
			formObj.attr("action", "/board/board_list").attr("method", "get");
			var pageNumTag =$("input[name='pageNum']").clone();
			var amountTag =$("input[name='amount']").clone();
			var keywordTag =$("input[name='keyword']").clone();
			var typeTag =$("input[name='type']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		formObj.submit();	
	});
	
});
</script>


