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
		$("#qst_btn")
				.click(
						function() {
							$("#content #form_area .research_content").removeClass("active");
							$("#form_area").append("<div class='research_content active'><input type='text'placeholder='질문'autocomplete='off'></div>");
							var offset = $(".active").offset().top;
							$("#remote").css("top", offset - 210);
							return false;
						});
		//추가된 태그 함수 실행
		$(document).on("click", ".research_content", function() {
			$("#content #form_area .research_content").removeClass("active");
			$(this).addClass("active");
			var offset = $(".active").offset().top;
			$("#remote").css("top", offset - 210);
		});
		$(".mb_att_category").click(
			function(){				
				var ct1,ct2,ct3;
				var in1 = $(".mb_att_category").index(this);
				var in2 = $(".mb_att_category").index(this);
				var in3 = $(".mb_att_category").index(this);
				ct1 = document.getElementsByClassName('mb_att_category')[in1].value;
				ct2	= document.getElementsByClassName('mb_att_category')[in2].value;
				ct3	= document.getElementsByClassName('mb_att_category')[in3].value;
				console.log(in1+"/"+in2+"/"+in3);
				console.log(ct1+"/"+ct2+"/"+ct3);
			}	
		);	
		$("#qst_add").click(
			function(){
				$(".item_box").append("<div class='item_individual'><input type='radio' class='item' name='item' value=''><input type='text' name='item_txt' id='item_txt' placeholder='아이템 1' autocomplete='off'><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></div>");
				return false;
			}	
		);
	});
</script>
<body>
	<div class='container'>
		<div class='research_header'>
			<div id='top_box'>
				<div id='left_top_box'>
					<a id='prev' href=''>목록으로 돌아가기</a> <input type='text'
						name='top_title' id='top_title' autocomplete='off'>
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
				<form name='research_form' action=''>
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
						<input type='text' name='subj_nm' id='subj_nm' placeholder='제목없는 설문지' autocomplete='off'>
						<div id='cate_title'>카테고리 선택(1개만 선택가능)</div>
						<div id='category_box'>						
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
					</div>
					<div class='research_content clearflx'>
						<input type='text' name='qst_content' id='qst_content'
							placeholder='내용없는 질문' autocomplete='off'>
						<div class='item_box clearflx'>
							<div class='item_individual'><input type='radio' class='item' name='item' value=''><input type='text' name='item_txt' id='item_txt' placeholder='아이템 1' autocomplete='off'><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></div>						
							<div class='bottom_box'>								
								<div class='bottom_button_box'><button id=qst_add>+</button></div><div class='bottom_button_box'><button id=qst_del>X</button></div><div class='bottom_button_box'><button id=qst_necessary>V</button></div>	
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