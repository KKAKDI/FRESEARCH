<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<style>

h1{
text-align:center;
}

div{
text-align: left;

 }

form {
	width: 850px;
	margin : auto;
}
body {

  padding-top: 70px;

  padding-bottom: 30px;
  

}

</style>

<div>
	<div>
		<h1>새글 등록</h1>
	</div>

</div>
<div>
	<div>
		<div>

			<div>

				<form role="form" action="/board/board_register" method="post">

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='brd_subject'>
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="5" name='brd_content'></textarea>
					</div>
					<div class="form-group">
						 <label>이메일</label><input class="form-control" name='mb_email'>
					</div>

					<div class="form-group">
						<label>닉네임</label> <input class="form-control" name='mb_nick'>
					</div>

					<button class="btn btn-sm btn-success" type="submit" >등록</button>
					<button class="btn btn-sm btn-warning" type="reset" >리셋</button>
					<button class="btn btn-sm btn-primary" type="button" onclick="location.href='board_list'">목록</button>
					
				</form>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

$(document).ready(function(){
	var result = ${result};
});

</script>