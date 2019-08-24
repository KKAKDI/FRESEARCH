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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/datepicker/jquery.js"></script>
<script src="/resources/datepicker/jquery.datetimepicker.full.min.js"></script>
</head>
<script>
	$(function() {
		$(document).on("click","#research_answer",function(){
			var research_values = "";
			var values_index= $(".research_qst").length;
			var user_email ="admin@fresearch.com";
			var user_nick ="admin";
			var form = $("#research_form");
			
			research_values += user_email+"#email#";
			research_values += user_nick +"#nick#";
			

			for(var i=1;i<=values_index;i++){
				var type = $(".research_qst .qst_type")[i-1].value;
				if(type==0){
					research_values += $("input:radio[name='item"+i+"']:checked").prev().val()+"#code#";					
					if($("input:radio[name='item"+i+"']:checked").val()=='기타'){
						research_values += $("input:radio[name='item"+i+"']:checked").next().val()+"#value#";			
					}else{
						research_values += $("input:radio[name='item"+i+"']:checked").val()+"#value#";	
					}
				}else{
					console.log($("input:text[name='item"+i+"']").val());
					research_values += $("input:text[name='item"+i+"']").prev().val()+"#code#";
					research_values += $("input:text[name='item"+i+"']").val()+"#value#";
				}				
			}
			$("#research_values").val(research_values);
			form.attr("action","/research/research_content");
			console.log(research_values);
			form.submit();
		});
		$("#prev_btn").click(function(){
			swal({
				title:"돌아가시겠습니까?",
				text:"그동안 작성된 정보를 모두 잃습니다.",
				icon:"warning",
				buttons:["아니오","네"],
				dangerMode:true,
			})
			.then((willDelete) => {
				if(willDelete){
					location.replace("/research/research_list");
				}
				else{
					
				}				
			});
		});
		$("#delete_form").click(function(){
			swal({
				title:"삭제하시겠습니까?",
				text:"그동안 작성된 정보를 모두 잃습니다.",
				icon:"warning",
				buttons:["아니오","네"],
				dangerMode:true,
			})
			.then((willDelete) => {
				if(willDelete){
					//controler 연결 필요
				}
				else{
					
				}				
			});
		});
	});
</script>
<body>
	<div class='container'>
		<div class='research_header'>
			<div id='top_box'>
				<div id='left_top_box'>
					<button id='prev_btn'></button> <input type='text' id='top_title' autocomplete='off'>
				</div>				
				<div id='right_top_box'>
					<!-- session 채크 -->
					<button id='delete_form'></button>
				</div>
			</div>
			<div class='logo'>
				<img src="/resources/img/logo.png" alt="logo">
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
						<c:set var="itemValue" value="1"/>
						<div class='qst_content'>
						<c:forEach items="${content}" var="research">							
							<c:if test="${research.qst_code ne qst_code}">							
								<input type='hidden' name='qst_code' id='qst_code' value='${research.qst_code}'>
								<div class='research_qst'>${research.qst_content}	
								<input type='hidden' name='qst_type' class='qst_type' value='${research.qst_type}'>
								</div>
								<div class='research_qst_img'><img src="${research.qst_img}"/></div>
								<div class='research_qst_url'>${research.qst_url}</div>								
								<c:set var="qst_code" value="${research.qst_code}"/>	
								<c:set var="itemBN" value='${itemBN+1}'/>								
							</c:if>
							<c:choose>
								<c:when test="${research.qst_type eq 0}">
								<div class='research_item'>								
									<input type='hidden' class='item_code${itemBN}' name='item_code' id='item_code${itemValue}' value='${research.item_code}'>
									<input type='radio' class='item_choice' id='btn${itemValue}'name='item${itemBN}' value='${research.item_content}'>
									<c:choose>
									<c:when test="${research.item_content eq '기타'}">									
									<input type='text' placeholder='기타' autocomplete='off'>
									</c:when>
									<c:when test="${research.item_content ne '기타'}">	
									<label for='btn${itemValue}'>${research.item_content}</label>
									</c:when>
									</c:choose>
									<div class='research_item_img'><img src="../resources/upload/${research.item_img}"/></div>
								</div>					
								<c:set var="itemValue" value="${itemValue+1}"/>		
								</c:when>
								<c:when test="${research.qst_type eq 1}">
								<div class='research_item'>
									<input type='hidden' class='item_code${itemBN}' name='item_code' id='item_code${itemValue}' value='${research.item_code}'>
									<input type='text' class='item_choice' id='btn${itemValue}'name='item${itemBN}' placeholder='나의 답변' autocomplete='off'>
								</div>	
								<c:set var="itemValue" value="${itemValue+1}"/>			
								</c:when>
							</c:choose>										
						</c:forEach>
						</div>	
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