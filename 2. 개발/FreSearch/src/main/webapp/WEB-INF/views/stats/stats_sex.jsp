<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<%@include file="../includes/header.jsp"%>

<div class="main-panel">
	<div class="content-wrapper">
		<div class="row-top">
			<div class="grid-margin">
				<div class="stretch-card width">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Area</h4>
							<p class="card-description" id="area">
								변해라
								<code>.All</code>
							</p>
							<div class="btn-group" role="group" aria-label="Basic example">
							<input type='button' class="btn btn-outline-secondary" name="1" value="전체">
							<input type='button' class="btn btn-outline-secondary" name="1" value="서울">
							<input type='button' class="btn btn-outline-secondary" name="1" value="인천">
							<input type='button' class="btn btn-outline-secondary" name="1" value="부산">
							<input type='button' class="btn btn-outline-secondary" name="1" value="경기">
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
<script type="text/javascript" src="/resources/stats/js/chart-area.js"></script>
</html>


