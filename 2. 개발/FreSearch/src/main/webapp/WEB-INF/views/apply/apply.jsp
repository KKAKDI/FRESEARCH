<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"> --%>

<link rel="stylesheet" href="/resources/css/reset.css">
<%@include file="../includes/header.jsp" %>

<style>

table {
	width: 850px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin: auto;
	table-layout: fixed;
}

.container_new {
	padding-top: 150px;
	min-height: 872px;
}

td.column {
	background-color: #f0f0f0;
	color: #505050;
	padding: 23;
	font-weight: bold;
}

td.column-data {
	padding: 22 19;
}

td.column-content {
	word-break:break-all; 
	wrap:"hard";
	white-space:pre-line;
}

th,td {
	font-size: 16px;
}

hr {
	margin: 8 auto;
	background-color: blue;
	width: 5%;
}

.Header {
    margin-top: 0px;
}


#apply{
    position: absolute;
    margin: 1 -71px;
    background: #1428a0;
    width: 150px;
    height: 45px;
    text-align: center;
    padding-top: 10px;
    cursor: pointer;
    color: white;
}

.news-head h2 {
	position: relative;
    font-size: 30px;
    padding: 3px 0 7px;
    /*margin-bottom: 40px;*/
    margin: auto;
    width: 850px;
}

.news-head h2::after {
	background: #1428a0;
    width: 99.9%;
    height: 2px;
    content: "";
    position: absolute;
    top: 100%;
    left: 0px;
}

.button{
	padding: 20px;
	text-align: center;
}

.apply-agree {
	position: relative;
    width: 850px;
    text-align: right;
    margin: 30 auto;
}

.apply-agree input[type=checkbox] {  
    display: none;  
}

.apply-agree input[type=checkbox] + label{
    cursor: pointer;  
    position: relative;  
    padding-left: 25px;  
    margin-right: 15px;  
    font-size: 14px;
}

.apply-agree input[type=checkbox]+ label:before {     
    content: "";  
    width: 20px;  
    height: 20px;  
    position: absolute;  
    left: 0;  
    bottom: -1px;  
    background-color: #ccc;  
    border-radius: 2px; 
    box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);  
}

.apply-agree input[type=checkbox]:checked + label:before { 
    content: "\2713";
    text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);  
    font-size: 18px; 
    font-weight:800; 
    color: #fff;  
    background:#1428a0;
    text-align: center;  
    line-height: 18px;  
}

.apply_agree_check {
	position: absolute;
}



.apply_fin {
    font-size: 18px;
    color: #fff;
    background: #3450ED;
    border-radius: 5px;
    width: 12%;
    height: 40px;
    box-shadow: 0px 5px 15px 0px rgba(0, 0, 0, 0.2);
    border: none;
    margin: -20px 0 40px;
    cursor: initial;
    opacity: 0.5;
}
</style>

<div class="container_new">
	<div>

		<div>
			<div class="news-head">
				<h2>패널신청</h2>
			</div>
			
			<table style="text-align: center;">
				<tr style="border-bottom: 1px solid #dcdcdc; border-top: 1px solid blue;">
					<td class="column" style="width: 20%;">작성자</td>
					<td class="column-data" colspan="2">FreSearch</td>
					<td class="column" style="width: 20%;">날짜</td>
					<td class="column-data" colspan="2">2019-08-22</td>
				</tr>
				
				<tr style="border-bottom: 1px solid gray; text-align: left; height: auto;">
					<td class="column-content" colspan="6" style="background-color: #e5e5e5;  text-align: left; padding: 40 40;">안녕하세요. FreSearch 입니다.

해당 페이지는 패널 신청페이지로 아래의 절차를 참고하여 동의 후 진행 부탁드립니다.


-----------------------------------------------------------------------------------------

1. 패널 신청페이지에서 [약관 및 설명] 확인 후 패널신청 합니다.

2. 최대 3일 이내 승인이 완료 됩니다.

3. 승인 완료 후 리서치 등록 가능권한이 생성 됩니다.

4. 리서치 등록 후 등록권한이 회수 되오니 참고 부탁드립니다.

-----------------------------------------------------------------------------------------

감사합니다.

- FreSearch -  
					</td>
				</tr>
				

				
			</table>
		</div>
		
		<div class="apply-agree">
				<input type="checkbox" class="apply_agree" id="apply_agree1" value="Y" />
				<label for="apply_agree1">위의 내용을 확인하고 동의합니다.</label>
				<div id="apply_agree_check" class="apply_agree_check"></div>
		</div>
		
		
	<div class="button">
	
			 <input type="button" id="apply_fin" class="apply_fin" value="신청하기" onclick="apply()" disabled>
		<!-- <input type="submit" id="apply_fin" class="apply_fin" value="신청하기" disabled> -->
		<!-- <a id="apply" href="#"  onclick="apply();">신청하기</a> -->
		<!-- <button data-oper='modify' class="btn btn-default">신청하기</button> -->
	</div>

	
	</div>
</div>

<script>
<%-- $("#apply").click(function(){ --%>

function apply(){
	// 체크박스 체크 여부 확인 후 아래 로직 실행
	
	$.ajax({
		url : "apply",
		type : "post",
		dataType : "text",
		success : function(d) {
		
			if(d == "ok") {
				swal({
					title:"신청 되었습니다.",
					text:"신청이 성공적으로 완료 되었습니다.",
					icon:"success",
					button:"확인",
					})
					.then((willDelete) => {
						location.href  = "/";
					});	
			}else if(d == "already apply"){
				swal({
					title:"이미 신청 되었습니다.",
					text:"이미 신청되어 있습니다. 승인을 기다려주세요!",
					icon:"warning",
					button:"확인",
					});
			}else if(d == "already panel"){
					swal({
						title:"이미 패널 입니다.",
						text:"이미 패널입니다. 더 이상 신청하지 않아도 됩니다!",
						icon:"warning",
						button:"확인",
						});
			}
		},
		error : function(request,status,error){ // Ajax error 메세지 보기
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   }

	});
};

</script>



<script type="text/javascript">
$(document).ready(function(){
	
	var check = false;
	
	function signupCheck(){
		if(check == true){
			if($("input:checked[class='apply_agree']").size() != 0) {
	
				$("#apply_fin").css("opacity", "initial");
				$("#apply_fin").css("cursor", "pointer");
				$("#apply_fin").attr("disabled", false);
				$(".apply_fin").hover(function(){
					$(this).css("background", "#1428a0");
				}, function(){
					$(this).css("background", "#3450ED");
				});
			}
		}else if(check == false){
			if($("input:checked[class='apply_agree']").size() == 0) {
		
				$("#apply_fin").css("opacity", 0.5);
				$("#apply_fin").css("cursor", "initial");
				$("#apply_fin").attr("disabled", true);
			}
		}
	}
	
	$(".apply_agree").on("click" , function(){
		
		var cnt2 = $("input:checked[class='apply_agree']").size();
		console.log("체크 사이즈: " + $("input:checked[class='apply_agree']").size());
		if(cnt2 == 1){
			$("#apply_agree_check").text("");
			check = true;
			signupCheck();
		}else if(cnt2 < 1){
			//$("#apply_agree_check").text("약관에 동의해주세요.");
			//$("#apply_agree_check").css("color", "#d0021b");
			check = false;
			signupCheck();
		}
	});

});



</script>

<%@include file="../includes/footer.jsp" %>
