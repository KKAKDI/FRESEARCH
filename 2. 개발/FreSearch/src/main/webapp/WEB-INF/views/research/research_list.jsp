<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>research_form</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<style>
body {
	min-width: 850px;
	font-family: 'Pragati Narrow', sans-serif;
	font-family: 'AppleSDGothicNeo';
	font-weight: 500;
	font-size: 16px;
	vertical-align: top;
	background-color: #f4f4f4;
}

.research_header {
	width: 100%;
	background-color: #0C4DA2;
	height: 150px;
}

#content {
	clear: both;
	float: none;
	background-color: #f4f4f4;
}

#content .form_area {
	width: 850px;
	margin: 0 auto;	
}

#content .research_content {	
	margin: 0 auto;
	background-color: #fff;
	height: 300px;
	margin-top: 10px;
	border-left:3px solid #fff;
	-webkit-box-shadow: 0 10px 6px -6px #777;
	   -moz-box-shadow: 0 10px 6px -6px #777;
	        box-shadow: 0 10px 6px -6px #777;
}

#content .research_content.active{
	border-left:3px solid #0C4DA2;
}

#content .bottom {
	padding: 50px;
}

#content input[type=text] {
	width: 800px;
	box-sizing: border-box;
	padding: 20px;
	margin-left: 20px;
	border: none;
	border-bottom: 1px solid #000;
	font-size: 25px;
	transition: all 0.5s;
}

#content input[type=text]:focus {
	border-bottom: 2px solid #0C4DA2;
	outline: none;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function () {	
    $("#content .research_content").click(
        function () {        	
        	$("#content .research_content").removeClass("active");
            $(this).addClass("active");
        }
    );
});
</script>
<body>
	<div class='container'>
		<div class='research_header'></div>
		<section id='content' class='clearflx'>
			<div class='form_area' class='clearflx'>
				<form name='research_form' action=''>
					<div class='research_content'>
						<input type='text' name='title' id='title' placeholder='제목없는 설문지1'>
					</div>
					<div class='research_content'>
						<input type='text' name='ask' id='ask' placeholder='질문'>
					</div>
				</form>
			</div>
			<div class='bottom'></div>
		</section>
	</div>
</body>
</html>