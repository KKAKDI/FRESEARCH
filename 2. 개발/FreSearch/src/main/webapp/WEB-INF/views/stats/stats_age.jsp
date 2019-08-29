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
							<h4 class="card-title">Age</h4>
							<p class="card-description" id="area">
								변해라
								<code>.All</code>
							</p>
							<div class="btn-group" role="group" style="margin-left: 38px;" aria-label="Basic example">
							<input type='button' class="btn btn-outline-secondary" name="2" value="10대">
							<input type='button' class="btn btn-outline-secondary" name="2" value="20대">
							<input type='button' class="btn btn-outline-secondary" name="2" value="30대">
							<input type='button' class="btn btn-outline-secondary" name="2" value="40대">
							<input type='button' class="btn btn-outline-secondary" name="2" value="50대">
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
var area = '';

$(document).ready(function() {
	html ='10대<code>나이</code>'
		$("#area").html(html);
	$.getJSON('/stats/get/age/10대' , function(data) {
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
		html += "<td id='fix1'>총합</td>";
		html += '<td id="fix1">' + total + '명</td>';
		html += '<td id="fix1"> 100%</td>';
		html += '</tr>';
		$('#test').html(html);
	});
	//timerID = setTimeout("updateDataArea()", 2000);
});
</script>


</html>


