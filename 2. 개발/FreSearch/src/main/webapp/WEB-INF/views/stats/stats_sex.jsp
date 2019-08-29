<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/stats/css/chart.css">

<div class="main-panel">
	<div class="content-wrapper">
		<div class="row-top">
			<div class="grid-margin">
				<div class="stretch-card width">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Sex</h4>
							<p class="card-description" id="area">
								변해라
								<code>.All</code>
							</p>
							<div class="btn-group" role="group" aria-label="Basic example"
							style="margin: 0 auto;width: 150px;display: flex;">
							<input type='button' class="btn btn-outline-secondary" name="3" value="남자">
							<!-- <input type='button' class="btn btn-outline-secondary-all" name="3" value="남자"> -->
							<input type='button' class="btn btn-outline-secondary" name="3" value="여자">
							</div>
							<div class="table-responsiv">
								<table class="table table-hover" id="test">
								
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




	</div>
</div>

</head>
<body>

</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/stats/js/chartMy.js"></script>
<script type="text/javascript">
var timerID;
var html = '';
var age = '';
$(document).ready(function() {
	
	html ='남자<code>성별</code>'
		$("#area").html(html);
	
	$.getJSON('/stats/get/sex/남자', function(data) {
		var html = '';
		var total = 0;

		html += '<thead>';
		html += '<tr>';
		html += '<th>카테고리</th>';
		html += '<th>참여자 수</th>';
		html += '<th>퍼센트</th>';
		html += '</tr>';
		html += '</thead>';
		html += '<tbody>';
		html += '<tr>';
		html += '</tr>';
		$.each(data, function(entryIndex, entry) {
			html += '<tr>';
			html += '<td>' + entry.ctgr_nm + '</td>';
			html += '<td id="fix">' + entry.count + '명</td>';
			html += '<td id="fix">' + entry.percent + '</td>';
			html += '</tr>';
			total += entry.count;

		});
		html += '<tr>';
		html += "<td id='fix1' style='padding-right: unset;'>총합</td>";
		html += '<td id="fix1">' + total + '명</td>';
		html += '<td id="fix1"> 100%</td>';
		html += '</tr>';
		$('#test').html(html);
	});
	
	
	
	$("input[name=3]").click(function(e) {
		console.log("버튼 눌렸다.");

		sex = $(this).val();
		html = sex;
		html += '<code>성별</code>';
		$("#area").html(html);
		console.log(html);
		console.log(sex);
		updateDataAge();
	});
});
</script>
</html>


