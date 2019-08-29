$(document).ready(function(){
	
	$("#mb_email").focus();
	
	var regEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/i;
	var regPwd = /^[A-Za-z0-9]{4,12}$/;
	
	$("#mb_email").keyup(function(){
		
		var mb_email = $('#mb_email').val();
		
		$.ajax({
			url : "/member/emailCheck",
			type : "get",
			data : {mb_email : mb_email},
			dataTyep : "json",
			success : function(data){
				
				console.log(data);
				if(regEmail.test(mb_email)){
					$("#email_check").text("");
					$("#mb_email").css("border-bottom", "1px solid #ddd");
				}else if(!regEmail.test(mb_email) && mb_email != ""){
					$("#email_check").text("이메일 형식에 맞지 않습니다.");
					$("#email_check").css("color", "#d0021b");
					$("#mb_email").css("border-bottom", "2px solid #d0021b");
				}else if(mb_email == ""){
					$("#email_check").text("이메일을 입력해주세요.");
					$("#email_check").css("color", "#d0021b");
					$("#mb_email").css("border-bottom", "2px solid #d0021b");
				}
			}
		});	
	});

	$("#mb_pwd").keyup(function(){
		
		var mb_pwd = $('#mb_pwd').val();
		
		if(regPwd.test(mb_pwd)){
			$("#pwd_check").text("");
			$("#mb_pwd").css("border-bottom", "1px solid #ddd");
		}else if(!regPwd.test(mb_pwd) && mb_pwd != ""){
			$("#pwd_check").text("4~12자 영문 대 소문자, 숫자를 입력해주세요.");
			$("#pwd_check").css("color", "#d0021b");
			$("#mb_pwd").css("border-bottom", "2px solid #d0021b");
		}else if(mb_pwd == ""){
			$("#pwd_check").text("비밀번호를 입력해주세요.");
			$("#pwd_check").css("color", "#d0021b");
			$("#mb_pwd").css("border-bottom", "2px solid #d0021b");
		}
		/*
		$.ajax({
			url : "/member/pwdCheck",
			type : "get",
			data : {mb_pwd : mb_pwd},
			dataTyep : "json",
			success : function(data){
				
				console.log(data);
				if(data == 1){
					$("#pwd_check").text("이미 사용중인 비밀번호입니다.");
					$("#pwd_check").css("color", "#d0021b");
					$("#mb_pwd").css("border-bottom", "2px solid #d0021b");
				}else {
					if(mb_pwd == ""){
						$("#pwd_check").text("비밀번호를 입력해주세요.");
						$("#pwd_check").css("color", "#d0021b");
						$("#mb_pwd").css("border-bottom", "2px solid #d0021b");
					}
				}
			}
		});	*/
	});
});


