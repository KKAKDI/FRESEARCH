$(document).ready(function(){
	
	var regNick = /^[a-zA-Z가-힣0-9]{2,6}$/;
	var regYear = /^[0-9]{4}$/;
	var regDay = /^[0-9]{1,2}$/;
	var regPhone = /^[0-9]{11}$/;
	
	var check = false;
	
	function findCheck(){
		if(check == true){
			if($("#mb_nick").val() != "" && $("#mb_birth_yy").val() != "" 
				&& $("select[name=mb_birth_mm] option:selected").val() != "월"
				&& $("#mb_birth_dd").val() != "" && $("#mb_phone").val() != "") {

				$("#emailFind").css("opacity", "initial");
				$("#emailFind").css("cursor", "pointer");
				$("#emailFind").attr("disabled", false);
			}
		}else if(check == false){
			if($("#mb_nick").val() == "" || $("#mb_birth_yy").val() == "" 
				|| $("select[name=mb_birth_mm] option:selected").val() == "월"
				|| $("#mb_birth_dd").val() == "" || $("#mb_phone").val() == "") {
		
				$("#emailFind").css("opacity", 0.5);
				$("#emailFind").css("cursor", "initial");
				$("#emailFind").attr("disabled", true);
			}
		}
	}
	
	$("#mb_nick").keyup(function(){
		
		var mb_nick = $('#mb_nick').val();
		
		if(mb_nick == ""){
			$("#nick_check").text("닉네임을 입력해주세요.");
			$("#nick_check").css("color", "#d0021b");
			$("#mb_nick").css("border-bottom", "2px solid #d0021b");
			check = false;
			findCheck();
		}else {
			$("#nick_check").text("");
			$("#mb_nick").css("border-bottom", "1px solid #ddd");
			check = true;
			findCheck();
		}
	});
	
	$("#mb_birth_yy").keyup(function(){

		var mb_birth_yy = $("#mb_birth_yy").val();
		var mb_birth_mm = $("select[name=mb_birth_mm] option:selected").val();
		var mb_birth_dd = $("#mb_birth_dd").val();
		
		if(mb_birth_yy == ""){
			$("#birth_check").text("생년월일을 입력해주세요.");
			$("#birth_check").css("color", "#d0021b");
			$("#mb_birth_yy").css("border-bottom", "2px solid #d0021b");
			$("#mb_birth_mm").css("border-bottom", "2px solid #d0021b");
			$("#mb_birth_dd").css("border-bottom", "2px solid #d0021b");
			check = false;
			findCheck();
		}else if(mb_birth_yy != "" && mb_birth_mm != "월" && mb_birth_dd != ""){
			$("#birth_check").text("");
			$("#mb_birth_yy").css("border-bottom", "1px solid #ddd");
			$("#mb_birth_mm").css("border-bottom", "1px solid #ddd");
			$("#mb_birth_dd").css("border-bottom", "1px solid #ddd");
			check = true;
			findCheck();
		}
	});
	
	$('#mb_birth_mm').blur(function(){
		var mb_birth_yy = $("#mb_birth_yy").val();
		var mb_birth_mm = $("select[name=mb_birth_mm] option:selected").val();
		var mb_birth_dd = $("#mb_birth_dd").val();
		
		if(mb_birth_mm == "월") {   
			$("#birth_check").text("생년월일을 입력해주세요.");
			$("#birth_check").css("color", "#d0021b");
			$("#mb_birth_yy").css("border-bottom", "2px solid #d0021b");
			$("#mb_birth_mm").css("border-bottom", "2px solid #d0021b");
			$("#mb_birth_dd").css("border-bottom", "2px solid #d0021b");
			check = false;
			findCheck();
		}else if(mb_birth_yy != "" && mb_birth_mm != "월" && mb_birth_dd != ""){
			$("#birth_check").text("");
			$("#mb_birth_yy").css("border-bottom", "1px solid #ddd");
			$("#mb_birth_mm").css("border-bottom", "1px solid #ddd");
			$("#mb_birth_dd").css("border-bottom", "1px solid #ddd");
			check = true;
			findCheck();
		}
	});
	
	$("#mb_birth_dd").keyup(function(){
		var mb_birth_yy = $("#mb_birth_yy").val();
		var mb_birth_mm = $("select[name=mb_birth_mm] option:selected").val();
		var mb_birth_dd = $("#mb_birth_dd").val();
		
		if(mb_birth_dd == "") {   
			$("#birth_check").text("생년월일을 입력해주세요.");
			$("#birth_check").css("color", "#d0021b");
			$("#mb_birth_yy").css("border-bottom", "2px solid #d0021b");
			$("#mb_birth_mm").css("border-bottom", "2px solid #d0021b");
			$("#mb_birth_dd").css("border-bottom", "2px solid #d0021b");
			check = false;
			findCheck();
		}else if(mb_birth_yy != "" && mb_birth_mm != "월" && mb_birth_dd != ""){
			$("#birth_check").text("");
			$("#mb_birth_yy").css("border-bottom", "1px solid #ddd");
			$("#mb_birth_mm").css("border-bottom", "1px solid #ddd");
			$("#mb_birth_dd").css("border-bottom", "1px solid #ddd");
			check = true;
			findCheck();
		}
	});
	
	$("#mb_phone").keyup(function(){
		
		var mb_phone = $("#mb_phone").val();
		
		if(mb_phone == "") {   
			$("#phone_check").text("전화번호를 입력해주세요.");
			$("#phone_check").css("color", "#d0021b");
			$("#mb_phone").css("border-bottom", "2px solid #d0021b");
			check = false;
			findCheck();
		}else if(mb_phone != ""){
			$("#phone_check").text("");
			$("#mb_phone").css("border-bottom", "1px solid #ddd");
			check = true;
			findCheck();
		}
	});
	
	$("#emailFind").click(function(){
		
		var mb_nick = $('#mb_nick').val();
		var mb_birthdate = $("#mb_birth_yy").val() + $("#mb_birth_mm").val() + $("#mb_birth_dd").val();
		var mb_phone = $("#mb_phone").val();
		
		var data = {
				mb_nick : mb_nick,
				mb_birthdate : mb_birthdate,
				mb_phone : mb_phone
		}
		
		$.ajax({
			url : "/member/findCheck",
			type : "POST",
			data : JSON.stringify(data),
			dataTyep : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(mb_nick != data[0].mb_nick){
					$("#nick_check").text("닉네임이 일치하지 않습니다.");
					$("#nick_check").css("color", "#d0021b");
					$("#mb_nick").css("border-bottom", "2px solid #d0021b");
				}else if(mb_birthdate != data[0].mb_birthdate){
					$("#birth_check").text("생년월일이 일치하지 않습니다.");
					$("#birth_check").css("color", "#d0021b");
					$("#mb_birth_yy").css("border-bottom", "2px solid #d0021b");
					$("#mb_birth_mm").css("border-bottom", "2px solid #d0021b");
					$("#mb_birth_dd").css("border-bottom", "2px solid #d0021b");
				}else if(mb_phone != data[0].mb_phone){
					$("#phone_check").text("전화번호가 일치하지 않습니다.");
					$("#phone_check").css("color", "#d0021b");
					$("#mb_phone").css("border-bottom", "2px solid #d0021b");
				}else {
					$('#myModal').show();
				}
			}
		});
	});
});


