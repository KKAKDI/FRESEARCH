<%@ page language="java" contentType="text/html; charset=utf-8"%>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<script>
	$(function() {		
		$.datetimepicker.setLocale('ko');
		$('#date_timepicker_start').datetimepicker({
			  format:'Y/m/d',
			  onShow:function( ct ){
			   this.setOptions({
				minDate:'',
			    maxDate:jQuery('#date_timepicker_end').val()?jQuery('#date_timepicker_end').val():false
			   })
			  },
			  timepicker:false
		 });
			
		$('#date_timepicker_end').datetimepicker({
			  format:'Y/m/d',
			  onShow:function( ct ){
			   this.setOptions({
			    minDate:jQuery('#date_timepicker_start').val()?jQuery('#date_timepicker_start').val():false
			   })
			  },
			  timepicker:false
		 });
		
		$.emptyCheck = function(){
				swal({
					title:"Oops",
					text:"작성되지 않은 공간이 있습니다.",
					icon:"error",
					button:"확인",
				});			
				return false;
		};	 
		
		$(document).on("click","#qst_btn",
						function() {
							$("#content #form_area .research_content").removeClass("active");
							$("#content #form_area .research_content .bottom_box").removeClass("active_btn");
							$("#content #form_area .research_content #item_box").removeClass("active_item");
							$("#content #form_area .research_content hr").removeClass("active_btn");
							$("#content #form_area .research_content #item_box .item_individual").removeClass("active_individual");
							$("#research_form").append("<div class='research_content clearflx active'><input type='text'id='qst_content' autocomplete='off' placeholder='내용없는 질문'><ul id='item_box' class='clearflx active_item'><li class='item_individual active_individual'><input type='radio' class='item' value=''><input type='text' class='item_txt' autocomplete='off' placeholder='보기'><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></li></ul></div>");
							$("#content #form_area .active").append("<hr class='active_btn'><div class='bottom_box active_btn'><div class='bottom_button_box'><button id=qst_add>+</button></div><div class='bottom_button_box'><button id=qst_etc>etc</button></div><div class='bottom_button_box'><button id=qst_del>X</button></div></div>");						
							var offset = $(".active").offset().top;
							$("#remote").css("top", offset - 210);							
							return false;
		});
		//추가된 태그 함수 실행
		$(document).on("click", ".research_content", function() {
			$("#content #form_area .research_content").removeClass("active");
			$("#content #form_area .research_content .bottom_box").removeClass("active_btn");
			$("#content #form_area .research_content #item_box").removeClass("active_item");
			$("#content #form_area .research_content hr").removeClass("active_btn");
			$("#content #form_area .research_content #item_box .item_individual").removeClass("active_individual");
			$(this).addClass("active");			
			$(this).children("hr").addClass("active_btn");
			$(this).children(".bottom_box").addClass("active_btn");
			$(this).children("#item_box").addClass("active_item");
			$(this).children().children(".item_individual").addClass("active_individual");
			var offset = $(".active").offset().top;
			$("#remote").css("top", offset - 210);			
		});	
		$(document).on("click","#qst_add",function(){
				$("#content #form_area .active_item").append("<li class='item_individual active_individual'><input type='radio' id='item' value=''><input type='text' class='item_txt' autocomplete='off' value='보기'><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></li>");
				return false;
			}
		);
		$(document).on("click","#qst_etc",function(){
			var flag = $(".active_individual").children(".disabled").val();			
			if(flag==null){
				$("#content #form_area .active_item").append("<li class='item_individual active_individual'><input type='radio' id='item' value=''><input type='text' class='item_txt disabled' autocomplete='off' value='기타' disabled><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></li>");				
				return false;
			}else{
				$("#qst_etc").attr("disable");		
				return false;
			}				
		});
		
		$(document).on("click","#qst_del",function(){
			var index = $(this).parents().find(".research_content").length;
			if(index>2){
				$(this).parents().find(".active").remove();
				$("#remote").css("top", 0);
				return false;
			}else{
				$("#qst_del").attr("disable");	
				return false;
			}
		});
		
		$(document).on("click","#item_del",function(){
			var index = $(this).parents().find(".active_item .item_individual").length;			
			if(index>1){
				$(this).parent().parent(".active_item .item_individual").remove();
				return false;
			}else{
				$("#item_del").attr("disable");	
				return false;
			}				
		});
		
		$(document).on("click","#send_form",function(){
			var subjectname = $("#subj_nm").val();
			var startdate = $("#date_timepicker_start").val();
			var enddate = $("#date_timepicker_end").val();
			var category = $("#category_box input[type=radio]:checked");
			
			if(subjectname!=''&&startdate!=''&&enddate!=''&&category.length>0){
				// 구분자 (|, #h#, #s#, #i#)
				var data = '';
				var item_index = 0;
				var qst_index =  $(".research_content #qst_content").length;
				var form = $("#research_form");
				var checkCnt= 0;
				
				data += $("#subj_nm").val()+"#h#";
				data += $("#category_box input[type=radio]:checked").val()+"#h#";
				data += $("#date_timepicker_start").val()+"#h#";
				data += $("#date_timepicker_end").val()+"#h#";
				data += "/block";
				
				for(var i = 0;i<qst_index;i++){
					if($(".research_content #qst_content")[i].value==''){
						$.emptyCheck();
						checkCnt++;
						break;
					}else{
						data += $(".research_content #qst_content")[i].value+"#t#";
						item_index = $(".research_content #item_box")[i].childElementCount;
						for(var j=0;j<item_index;j++){					
							if($(".research_content #item_box")[i].querySelectorAll('.item_txt')[j].value==''){
								$.emptyCheck();
								checkCnt++;
								break;
							}else{
								data += $(".research_content #item_box")[i].querySelectorAll('.item_txt')[j].value+"#t#";
							}							
						}
						data+="/block";
					}					
				}
				if(checkCnt>0){
					return false;
				}else{
					console.log("data: "+data);		
					$("#research_values").val(data);
					form.attr("action","/research/research_register");
					swal({
						title:"등록되었습니다!",
						text:"리서치가 성공적으로 등록되었습니다!",
						icon:"success",
						button:"확인",
					})
					.then((willDelete) => {
						form.submit();								
					});							
				}					
			}else{
				$.emptyCheck();
			}
		});
		
		$("#subj_nm").focusout(function(){
			$("#top_title").val($("#subj_nm").val());
		});
		$("#top_title").focusout(function(){
			$("#subj_nm").val($("#top_title").val());
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
					location.replace("/research/research_register");
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
					<button id='prev_btn'>목록으로 돌아가기</button> <input type='text' id='top_title' autocomplete='off' value=''>
				</div>
				<div id='right_top_box'>
					<button id='palette'>팔렛</button>
					<button id='send_form'>보내기</button>
					<button id='delete_form'>삭제</button>
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
						<div class='remote_btn'>
							<button id='img_btn'>...</button>
						</div>
					</div>
					<div class='research_content clearflx'>
						<input type='text' id='subj_nm' placeholder='제목없는 설문지' autocomplete='off'>
						<div id='research_term'>
							<div id='term_title'>조사 기간</div>
							<input type='text' id='date_timepicker_start' name='start' autocomplete='off'> ~ <input type='text' id='date_timepicker_end' name='end' autocomplete='off'>
						</div>	
						<div id='category'>
							<div id='cate_title'>카테고리 선택</div>	
							<div id='category_box'>												
								<input type='radio' class='mb_att_category' name='category' value='A0000001' id='A'><label for='A'>교육,학문</label>
								<input type='radio' class='mb_att_category' name='category' value='B0000001' id='B'><label for='B'>컴퓨터통신</label>
								<input type='radio' class='mb_att_category' name='category' value='C0000001' id='C'><label for='C'>게임</label>
								<input type='radio' class='mb_att_category' name='category' value='D0000001' id='D'><label for='D'>엔터테이먼트,예술</label>
								<input type='radio' class='mb_att_category' name='category' value='E0000001' id='E'><label for='E'>생활</label>
								<input type='radio' class='mb_att_category' name='category' value='F0000001' id='F'><label for='F'>건강</label>
								<input type='radio' class='mb_att_category' name='category' value='G0000001' id='G'><label for='G'>사회,정치</label>														
								<input type='radio' class='mb_att_category' name='category' value='H0000001' id='H'><label for='H'>경제</label>						
								<input type='radio' class='mb_att_category' name='category' value='I0000001' id='I'><label for='I'>여행</label>
								<input type='radio' class='mb_att_category' name='category' value='J0000001' id='J'><label for='J'>스포츠,레저</label>
								<input type='radio' class='mb_att_category' name='category' value='K0000001' id='K'><label for='K'>쇼핑</label>
								<input type='radio' class='mb_att_category' name='category' value='L0000001' id='L'><label for='L'>지역</label>
								<input type='radio' class='mb_att_category' name='category' value='M0000001' id='M'><label for='M'>결혼</label>
							</div>	
						</div>												
					</div>
					<div class='research_content clearflx'>
						<input type='text' id='qst_content' placeholder='내용없는 질문' autocomplete='off'>
						<ul id='item_box' class='clearflx'>
							<li class='item_individual'><input type='radio' class='item' value=''><input type='text' class='item_txt' autocomplete='off' placeholder='보기'><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></li>						
						</ul>
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