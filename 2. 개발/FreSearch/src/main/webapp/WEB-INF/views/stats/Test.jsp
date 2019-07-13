<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">





<style type='text/css'>
a.no-uline {
	text-decoration: none
}
</style>
<style>
.test_btn1 {
	margin-right: -4px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
}
</style>


<table>
	<thead>
		<tr>
			<th>이름</th>
			<th>이메일</th>
			<th>개수</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.subjCode}" /></td>
								<td><c:out value="${board.ctgrCode}"/></td>
							</tr>
		</c:forEach>
		<tr>
		<td> ${education}</td>
		</tr>
	</tbody>
</table>




<script type="text/javascript">
		$(document).ready(function() {

			$("#addReplyBtn").on("click", function(e){
			      $(".modal").modal("show");
			 });
			$("#area").on("click", function(e){
			      location.href='/charts/pages/charts/Area';
			 });
			 
	});
	
</script>






