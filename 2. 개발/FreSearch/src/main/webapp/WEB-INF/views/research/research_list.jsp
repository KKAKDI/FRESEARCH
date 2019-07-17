<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>research_form</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/research.css">
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">	
	$(function() {
		$("#content .research_content").click(function() {
			$("#content .research_content").removeClass("active");
			$(this).addClass("active");
		});
	});
</script>
<body>
	<div class='container'>
		<div class='research_header'>
		<div id='top_box'>
			<div id='left_top_box'>
				<a id='prev' href=''>������� ���ư���</a>				
					<input type='text' name='top_title' id='top_title' autocomplete='off'>				
			</div>
			<div id='right_top_box'>
				<a href='palette'>�ȷ�</a>
				<button id='send_form'>������</button>
				<a href='delete_form'>����</a>
			</div>					
		</div>			
			<div class='logo'>
				<a href=""><img src="/resources/img/logo.png" alt="logo"></a>
			</div>
		</div>
		<section id='content' class='clearflx'>
			<div class='form_area' class='clearflx'>
				<form name='research_form' action=''>
					<div class='research_content' class='clearflx'>
						<input type='text' name='title' id='title' placeholder='������� ������'
							autocomplete='off'>
					</div>
					<div class='research_content'>
						<input type='text' name='ask' id='ask' placeholder='����'
							autocomplete='off'>
					</div>
				</form>
			</div>
			<div class='bottom'></div>
		</section>
	</div>
</body>
</html>