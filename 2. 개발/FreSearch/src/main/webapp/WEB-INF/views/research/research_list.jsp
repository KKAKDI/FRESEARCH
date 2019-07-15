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
}

.research_body {
	margin: 0 auto;
	width: 100%;
	height: 1000px;
	background-color: gray;	
}

.research_header {
	margin: 0 auto;
	width: 100%;
	background-color: orange;
	height: 150px;
}

#content {
    clear: both;
    float: none;    
    margin: 0 auto;
}
#content .research_content {
    width: 850px;
    margin: 0 auto;    
    background-color: #f2f2f2;
    height: 400px;
}
input[type=text]{
	width:800px;
}
</style>
</head>
<body>
	<div class='research_body'>
		<div class='research_header'></div>
		<section id='content' class='clearflx'>
			<form name='research_form' action=''>
			<div class='research_content'>
				
				<input type='text' name='title' id='title'>
			</div>
			</form>		
		</section>
	</div>
</body>
</html>