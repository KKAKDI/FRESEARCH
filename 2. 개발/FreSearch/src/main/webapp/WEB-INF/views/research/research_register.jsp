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
<script src="/resources/js/research_register.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div class='container'>
		<div class='research_header'>
			<div id='top_box'>
				<div id='left_top_box'>
					<button id='prev_btn'> </button> <input type='text' id='top_title' autocomplete='off' value=''>
				</div>				
				<div id='right_top_box'>
					<button  id='palette'>팔레트</button>
					<button onclick="send();" id='send_form'>작성</button>
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
					<!-- 여기 리모컨 -->
					<div id='remote'>
						<div class='remote_btn'>
							<button id='qst_btn'></button>
						</div>
						<div class='remote_btn'>
							<button id='img_btn'></button>
						</div>
						<div class='remote_btn'>
							<button id='qst_del'></button>
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
						<input type='text' id='qst_content' placeholder='내용없는 질문' autocomplete='off'><select id='selBox'><option value='0' selected>객관식</option><option value='1'>주관식</option></select>
						<div class='qst_swap'>
							<ul id='item_box' class='clearflx'>
								<li class='item_individual'><input type='radio' class='item' value=''><input type='text' class='item_txt' autocomplete='off' placeholder='보기'><div class='button_box'><button id=item_img></button></div><div class='button_box'><button id=item_del></button></div></li>
							</ul>
						</div>
						<div class='etc_box'>
						</div>
						<div id="hr"><hr></div>						
						<div class='bottom_box'>														
							<div class='bottom_button_box'><button id=qst_add></button></div><div class='bottom_button_box'><button id=qst_etc>etc</button></div>	
						</div>	
					</div>
				</form>
			</div>
			<div class='bottom'></div>
		</section>
	</div>	
</body>
<script>
        var ws;
        var messages = document.getElementById("message");
        
        $(document).ready(function(){
        	


        	console.log("들어왔다")
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED)
            {
                writeResponse("WebSocket is already opend.");

                
                return;
            } 
            
            //웹소켓 객체 만드는 코드
            ws = new WebSocket('ws://localhost:8080/echo');

            
            ws.onopen=function(event){
                if(event.data===undefined) return;
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("Connection closed");
            }

            
/*           send()
            function send(){
            	console.log("send 들어왔다")
                var text = document.getElementById("messageinput").value;
            	var text = "갱신";
                ws.send(text);
                text=""; 
           } */
            
             
            
        });
        function send(){
            //var text = document.getElementById("messageinput").value;
        	console.log("뭐하냐");
            var text = "갱신";
            ws.send(text);
            text="";
            
        }
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
        	console.log(text);
            //message.innerHTML+="<br/>"+text;
        }
    </script>
</html>