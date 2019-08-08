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
					<a id='prev' href='/research/research_list'>목록으로 돌아가기</a> <input type='text' id='top_title' autocomplete='off'>
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
					<div class='research_content active clearflx'>
						<div class='content_box clearflx'>
							<div id='research_subject'>${content[0].subj_nm}</div>
							<input type='hidden' name='research_code' id='research_code' value='${content[0].subj_code}'>
							<div id='research_info'>
								<div id='research_ctegory'>${content[0].ctgr_nm}</div>
								<div class='research_turm'>
								<fmt:formatDate pattern="yy-MM-dd" value="${content[0].subj_startdate}" />
								</div>
								~
								<div class='research_turm'>
								<fmt:formatDate pattern="yy-MM-dd" value="${content[0].subj_enddate}" />
								</div>
							</div>
						<c:set var="qst_code" value="code"/>
						<c:set var="itemBN" value="0"/>
						<c:set var="itemValue" value="0"/>
						<c:forEach items="${content}" var="research">	
							<c:if test="${research.qst_code ne qst_code}">	
								<input type='hidden' name='qst_code' id='qst_code' value='${research.qst_code}'>
								<div class='research_qst'>${research.qst_content}</div>	
								<input type='hidden' name='qst_type' id='qst_type' value='${research.qst_type}'>
								<div class='research_qst_img'>${research.qst_img}</div>
								<div class='research_qst_url'>${research.qst_url}</div>
								<c:set var="qst_code" value="${research.qst_code}"/>	
								<c:set var="itemBN" value='${itemBN+1}'/>
							</c:if>			
								<input type='hidden' name='item_code' id='item_code' value='${research.item_code}'>
								<div class='research_item_img'>${research.item_img}</div>		
								<div class='research_item'>
									<input type='radio' class='item_choice' id='btn${itemValue}'name='item${itemBN}' value='${research.item_content}'>
									<label for='btn${itemValue}'>${research.item_content}</label>
								</div>					
								<c:set var="itemValue" value="${itemValue+1}"/>			
						</c:forEach>
						</div>	
						<div id='submit_box'>
							<div class='answer_box'>
							<button id='research_answer'>제출하기</button>
							</div>
						</div>												
					</div>
				</form>
			</div>
			<div class='bottom'></div>
		</section>
	</div>	
</body>
</html>