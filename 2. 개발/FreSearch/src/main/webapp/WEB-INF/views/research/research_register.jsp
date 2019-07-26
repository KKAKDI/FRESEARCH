<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>research_form</title>
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/research.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>  
</head>
<script>
	$(function() {
		 $( "#testDatepicker1, #testDatepicker2" ).datepicker({
			 changeMonth: true, 
			 dateFormat:'yy-mm-dd',
	         dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	         dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	         monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		    });
		$(document).on("click","#qst_btn",
						function() {
							$("#content #form_area .research_content").removeClass("active");
							$("#content #form_area .research_content .bottom_box").removeClass("active_btn");
							$("#content #form_area .research_content .item_box").removeClass("active_item");
							$("#content #form_area .research_content hr").removeClass("active_btn");
							$("#content #form_area .research_content .item_box .item_individual").removeClass("active_individual");
							$("#research_form").append("<div class='research_content clearflx active'><input type='text'placeholder='질문' autocomplete='off'><div class='item_box clearflx active_item'><div class='item_individual'><input type='radio' class='item' value=''><input type='text' id='item_txt' placeholder='보기' autocomplete='off'><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></div>	</div></div>");
							$("#content #form_area .active").append("<hr class='active_btn'><div class='bottom_box active_btn'><div class='bottom_button_box'><button id=qst_add>+</button></div><div class='bottom_button_box'><button id=qst_etc>etc</button></div><div class='bottom_button_box'><button id=qst_del>X</button></div></div>");						
							var offset = $(".active").offset().top;
							$("#remote").css("top", offset - 210);							
							return false;
		});
		//추가된 태그 함수 실행
		$(document).on("click", ".research_content", function() {
			$("#content #form_area .research_content").removeClass("active");
			$("#content #form_area .research_content .bottom_box").removeClass("active_btn");
			$("#content #form_area .research_content .item_box").removeClass("active_item");
			$("#content #form_area .research_content hr").removeClass("active_btn");
			$("#content #form_area .research_content .item_box .item_individual").removeClass("active_individual");
			$(this).addClass("active");			
			$(this).children("hr").addClass("active_btn");
			$(this).children(".bottom_box").addClass("active_btn");
			$(this).children(".item_box").addClass("active_item");
			$(this).children().children(".item_individual").addClass("active_individual");
			var offset = $(".active").offset().top;
			$("#remote").css("top", offset - 210);			
		});	
		$(document).on("click","#qst_add",function(){
				$("#content #form_area .active_item").append("<div class='item_individual'><input type='radio' id='item' value=''><input type='text' id='item_txt' placeholder='보기' autocomplete='off'><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></div>");
				return false;
			}	
		);
		$(document).on("click","#qst_etc",function(){
			var flag = $(".active_individual").children("label").html();
			console.log(flag);
			if(flag==null){
				$("#content #form_area .active_item").append("<div class='item_individual active_individual'><input type='radio' id='item' value=''><label>기타</label><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></div>");
				return false;
			}else{
				$("#qst_etc").attr("disable");
				return false;
			}			
		});
		
		$(document).on("click","#qst_del",function(){
			$(this).parents().find(".active").remove();
			return false;
		});
		
		$(document).on("click","#item_del",function(){
			$(this).parent().parent(".item_individual").remove();
			return false;
		});
		
		$(document).on("click","#send_form",function(){
			// 구분자 (/ | ,)
			var data = '';
			data += $("#subj_nm").val()+"#header";
			data += $("#category_box input[type=radio]:checked").val()+"#header";
			data += $("#testDatepicker1").val()+"#header";
			data += $("#testDatepicker2").val();
			data += "/";
			var index = $(".research_content").length;
			var qst_data = '';
			//for(var i =1;i<index;i++){
				qst_data += $("#qst_content")[1].val()+"|";
			//}
			console.log(data);
			console.log(qst_data);
			console.log(index);
		});
	});
</script>
<body>
	<div class='container'>
		<div class='research_header'>
			<div id='top_box'>
				<div id='left_top_box'>
					<a id='prev' href=''>목록으로 돌아가기</a> <input type='text' id='top_title' autocomplete='off'>
				</div>
				<div id='right_top_box'>
					<a href='palette'>팔렛</a>
					<button id='send_form'>보내기</button>
					<a href='delete_form'>삭제</a>
				</div>
			</div>
			<div class='logo'>
				<a href=""><img src="/resources/img/logo.png" alt="logo"></a>
			</div>
		</div>
		<section id='content' class='clearflx'>
			<div id='form_area' class='clearflx'>
				<form name='research_form' id='research_form' action='' method='post'>
					<!-- 여기 리모컨 -->
					<div id='remote'>
						<div class='remote_btn'>
							<button id='qst_btn'>+</button>
						</div>
						<div class='remote_btn'>
							<button id='txt_btn'>T</button>
						</div>
						<div class='remote_btn'>
							<button id='img_btn'>IM</button>
						</div>
						<div class='remote_btn'>by.jsh</div>
					</div>
					<div class='research_content clearflx'>
						<input type='text' id='subj_nm' placeholder='제목없는 설문지' autocomplete='off'>
						<div id='category_box'>		
							<div id='cate_title'>카테고리 선택(1개만 선택가능)</div>				
							<input type='radio' class='mb_att_category' name='category' value='A0000001'><label>교육,학문</label>
							<input type='radio' class='mb_att_category' name='category' value='B0000001'><label>컴퓨터통신</label>
							<input type='radio' class='mb_att_category' name='category' value='C0000001'><label>게임</label>
							<input type='radio' class='mb_att_category' name='category' value='D0000001'><label>엔터테이먼트,예술</label>
							<input type='radio' class='mb_att_category' name='category' value='E0000001'><label>생활</label>
							<input type='radio' class='mb_att_category' name='category' value='F0000001'><label>건강</label>
							<input type='radio' class='mb_att_category' name='category' value='G0000001'><label>사회,정치</label>														
							<input type='radio' class='mb_att_category' name='category' value='H0000001'><label>경제</label>						
							<input type='radio' class='mb_att_category' name='category' value='I0000001'><label>여행</label>
							<input type='radio' class='mb_att_category' name='category' value='J0000001'><label>스포츠,레저</label>
							<input type='radio' class='mb_att_category' name='category' value='K0000001'><label>쇼핑</label>
							<input type='radio' class='mb_att_category' name='category' value='L0000001'><label>지역</label>
							<input type='radio' class='mb_att_category' name='category' value='M0000001'><label>결혼</label>
						</div>	
						<div id='research_term'>
							<div id='term_title'>조사 기간</div>
							<input type='text' id='testDatepicker1' name='start' autocomplete='off'>~<input type='text' id='testDatepicker2' name='end' autocomplete='off'>
						</div>							
					</div>
					<div class='research_content clearflx'>
						<input type='text' name='qst_content' id='qst_content'
							placeholder='내용없는 질문' autocomplete='off'>
						<div class='item_box clearflx'>
							<div class='item_individual'><input type='radio' class='item' value=''><input type='text' id='item_txt' placeholder='보기' autocomplete='off'><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></div>						
						</div>
						<div class='etc_box'>
						</div>
						<hr>
						<div class='bottom_box'>														
							<div class='bottom_button_box'><button id=qst_add>+</button></div><div class='bottom_button_box'><button id=qst_etc>etc</button></div><div class='bottom_button_box'><button id=qst_del>X</button></div>	
						</div>	
					</div>
				</form>
			</div>
			<div class='bottom'></div>
		</section>
	</div>
</body>
</html>