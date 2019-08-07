<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>research_form</title>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/research.css">

<link rel="stylesheet" type="text/css" href="/resources/datepicker/jquery.datetimepicker.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="/resources/datepicker/jquery.js"></script>
<script src="/resources/datepicker/jquery.datetimepicker.full.min.js"></script>
</head>
<script>

</script>
<body>
	<div class='container'>
		<div class='research_header'>
			<div id='top_box'>
				<div id='left_top_box'>
					<a id='prev' href=''>목록으로 돌아가기</a> <input type='text' id='top_title' autocomplete='off'>
				</div>
			</div>
			<div class='logo'>
				<a href=""><img src="/resources/img/logo.png" alt="logo"></a>
			</div>
		</div>
		<section id='content' class='clearflx'>
			<div id='form_area' class='clearflx'>
				<form name='research_form' id='research_form' action='' method='post'>
				<input type='hidden' name='research_values' id='research_values' value=''>
					<div class='research_content clearflx'>
						<div>${content[0].subj_nm}</div>
						<div>${content[0].subj_code}</div>
						<div>${content[0].ctgr_code}</div>
						<div><fmt:formatDate pattern="yy-MM-dd" value="${content[0].subj_startdate}" /></div>
						<div><fmt:formatDate pattern="yy-MM-dd" value="${content[0].subj_enddate}" /></div>
					<c:set var="qst_code" value="code"/>
					<c:forEach items="${content}" var="research">	
						<c:if test="${research.qst_code ne qst_code}">	
							<div>${research.qst_code}</div>
							<div>${research.qst_content}</div>	
							<div>${research.qst_type}</div>
							<div>${research.qst_img}</div>
							<div>${research.qst_url}</div>
							<c:set var="qst_code" value="${research.qst_code}"/>	
						</c:if>			
							<div>${research.item_code}</div>
							<div>${research.item_content}</div>
							<div>${research.item_img}</div>		
					</c:forEach>
						<div id='research_term'>
							<div id='term_title'>조사 기간</div>
							<input type='text' id='date_timepicker_start' name='start' autocomplete='off'> ~ <input type='text' id='date_timepicker_end' name='end' autocomplete='off'>
							카테고리
						</div>													
					</div>
					<div class='research_content clearflx'>
						<input type='text' id='qst_content' placeholder='내용없는 질문' autocomplete='off' value=''>
						<ul id='item_box' class='clearflx'>
							<li class='item_individual'><input type='radio' class='item' value=''><input type='text' class='item_txt' placeholder='보기' autocomplete='off' value=''></li>						
						</ul>
					</div>
				</form>
			</div>
			<div class='bottom'></div>
		</section>
	</div>	
</body>
</html>