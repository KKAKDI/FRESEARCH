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
							$("#form_area").append("<div class='research_content active'><input type='text'placeholder='����'autocomplete='off'></div>");
							var offset = $(".active").offset().top;
							$("#remote").css("top", offset - 210);
							return false;
						});
		//�߰��� �±� �Լ� ����
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
				$(".item_box").append("<div class='item_individual'><input type='radio' class='item' name='item' value=''><input type='text' name='item_txt' id='item_txt' placeholder='������ 1' autocomplete='off'><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></div>");
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
					<a id='prev' href=''>������� ���ư���</a> <input type='text'
						name='top_title' id='top_title' autocomplete='off'>
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
			<div id='form_area' class='clearflx'>
				<form name='research_form' action=''>
					<!-- ���� ������ -->
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
						<input type='text' name='subj_nm' id='subj_nm' placeholder='������� ������' autocomplete='off'>
						<div id='cate_title'>ī�װ� ����(1���� ���ð���)</div>
						<div id='category_box'>						
							<input type='radio' class='mb_att_category' name='category' value='A0000001'><label>����,�й�</label>
							<input type='radio' class='mb_att_category' name='category' value='B0000001'><label>��ǻ�����</label>
							<input type='radio' class='mb_att_category' name='category' value='C0000001'><label>����</label>
							<input type='radio' class='mb_att_category' name='category' value='D0000001'><label>�������̸�Ʈ,����</label>
							<input type='radio' class='mb_att_category' name='category' value='E0000001'><label>��Ȱ</label>
							<input type='radio' class='mb_att_category' name='category' value='F0000001'><label>�ǰ�</label>
							<input type='radio' class='mb_att_category' name='category' value='G0000001'><label>��ȸ,��ġ</label>						
							<input type='radio' class='mb_att_category' name='category' value='H0000001'><label>����</label>
							<input type='radio' class='mb_att_category' name='category' value='I0000001'><label>����</label>
							<input type='radio' class='mb_att_category' name='category' value='J0000001'><label>������,����</label>
							<input type='radio' class='mb_att_category' name='category' value='K0000001'><label>����</label>
							<input type='radio' class='mb_att_category' name='category' value='L0000001'><label>����</label>
							<input type='radio' class='mb_att_category' name='category' value='M0000001'><label>��ȥ</label>
						</div>
					</div>
					<div class='research_content clearflx'>
						<input type='text' name='qst_content' id='qst_content'
							placeholder='������� ����' autocomplete='off'>
						<div class='item_box clearflx'>
							<div class='item_individual'><input type='radio' class='item' name='item' value=''><input type='text' name='item_txt' id='item_txt' placeholder='������ 1' autocomplete='off'><div class='button_box'><button id=item_img>IM</button></div><div class='button_box'><button id=item_del>X</button></div></div>						
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