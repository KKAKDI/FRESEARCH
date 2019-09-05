var email ='';

$(document).ready(function(){
	
	var regNick = /^[a-zA-Z가-힣0-9]{2,6}$/;
	var regYear = /^[0-9]{4}$/;
	var regDay = /^[0-9]{1,2}$/;
	var regPhone = /^[0-9]{11}$/;
	
	var check = false;
	
	$("#mb_nick").focus();
	$("#mb_email").focus();
	$("#mb_pwd").focus();
	
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
	
	function pwdCheck(){
		if(check == true){
			if($("#mb_pwd").val() != "" && $("#mb_pwd2").val() != "") {

				$("#pwdChange").css("opacity", "initial");
				$("#pwdChange").css("cursor", "pointer");
				$("#pwdChange").attr("disabled", false);
			}
		}else if(check == false){
			if($("#mb_pwd").val() || "" || $("#mb_pwd2").val() == "") {
		
				$("#pwdChange").css("opacity", 0.5);
				$("#pwdChange").css("cursor", "initial");
				$("#pwdChange").attr("disabled", true);
			}
		}
	}
	
	/*function emailCheck(){
		if(check == true){
			if($("#mb_email").val() != "") {
				$("#pwdFind").css("opacity", "initial");
				$("#pwdFind").css("cursor", "pointer");
				$("#pwdFind").attr("disabled", false);
			}
		}else if(check == false){
			if($("#mb_email").val() == "") {
				$("#pwdFind").css("opacity", 0.5);
				$("#pwdFind").css("cursor", "initial");
				$("#pwdFind").attr("disabled", true);
			}
		}
	}*/
	
	$("#mb_email").keyup(function(){
		
		var mb_email = $('#mb_email').val();
				
		if(mb_email == ""){
			$("#email_check").text("이메일을 입력해주세요.");
			$("#email_check").css("color", "#d0021b");
			$("#mb_email").css("border-bottom", "2px solid #d0021b");
		}else {
			$("#email_check").text("");
			$("#mb_email").css("border-bottom", "1px solid #ddd");
		}
	});
	
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
		var mb_birthdate = $("#mb_birth_yy").val() + $("#mb_birth_mm").val() + addZero($("#mb_birth_dd").val(), 2);
		var mb_phone = $("#mb_phone").val();
		
		var data = {
				mb_nick : mb_nick,
				mb_birthdate : mb_birthdate,
				mb_phone : mb_phone
		}
		
		$.ajax({
			url : "/member/findCheck",
			type : "get",
			data : data,
			dataTyep : "json",
			success : function(data){
				if(data == 1){
					$("#find_check").text("");
					$('#myModal').show();
					$('body').css('overflow', 'hidden');
				}else {
					$("#find_check").text("개인정보가 일치하지 않습니다.");
					$("#find_check").css("color", "#d0021b");
				}
				//email = $(".modal-user-email").children('span').html();
				/*
				if(mb_nick != data[0].mb_nick || mb_birthdate != data[0].mb_birthdate || mb_phone != data[0].mb_phone){
					$("#find_check").text("개인정보가 일치하지 않습니다.");
					$("#find_check").css("color", "#d0021b");
				}else {
					$("#find_check").text("");
					$('#myModal').show();
					$('.modal-user-email').append($("<span>"+data[0].mb_email+"</span>"));
					$('.modal-user-regdate').append($("<span>가입일 "+displayTime(data[0].mb_joindate)+"</span>"));
					console.log("이메일  : " + data[0].mb_email);
					console.log("가입일  : " + data[0].mb_joindate);
					$('body').css('overflow', 'hidden');
				}
				email = $(".modal-user-email").children('span').html();*/
			}
		});
		
		$.ajax({
			url : "/member/findCheck2",
			type : "POST",
			data : JSON.stringify(data),
			dataTyep : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				console.log("성공");
				var str1 ='';
				var str2 ='';
				if(data[0]){
					str1 += '<span>'+data[0].mb_email+'</span>';
					str2 += '<span>가입일 '+displayTime(data[0].mb_joindate)+'</span>'
				}
				$(".modal-user-email").html(str1);
				$(".modal-user-regdate").html(str2);
				
				/*$('.modal-user-email').append($("<span>"+data[0].mb_email+"</span>"));
				$('.modal-user-regdate').append($("<span>가입일 "+displayTime(data[0].mb_joindate)+"</span>"));*/
				email = $(".modal-user-email").children('span').html();
				console.log("이메일 정보 : " + email);
			}
		});
		
	});
	
	var addZero = function (date, num) {
		 var zero = '';
		 date = date.toString();
		
		 if (date.length < num) {
		  for (i = 0; i < num - date.length; i++)
		   zero += '0';
		 }
		 return zero + date;
	}
	
	$("#pwdFind").click(function(){
		
		var mb_email = $('#mb_email').val();
		
		var data = {
				mb_email : mb_email
		}
		console.log("이메일???111" + mb_email);
		
		$.ajax({
			url : "/member/emailCheck",
			type : "get",
			data : {mb_email : mb_email},
			dataTyep : "json",
			success : function(data){
				
				if(data == 1){
					$("#find_check").text("");
					$('#myModal').show();
					$('body').css('overflow', 'hidden');
					var html = "";
					var html2 = "";
					html += '<input type="hidden" name="mb_email" value='+mb_email+'>';
					html2 += '<span>회원님의 이메일은 </span>'
					html2 += '<span>'+mb_email+'</span><span> 입니다.</span>'
					$(".modal-form-submit").append(html);
					$(".email-msg-first").html(html2);
				}else {
					$("#find_check").text("이메일을 정확히 입력해주세요.");
					$("#find_check").css("color", "#d0021b");
					if(mb_email == ""){
						$("#email_check").text("이메일을 입력해주세요.");
						$("#phone_check").css("color", "#d0021b");
						$("#mb_phone").css("border-bottom", "2px solid #d0021b");
					}else if(mb_email != "") {
						$("#email_check").text("");
						$("#mb_email").css("border-bottom", "1px solid #ddd");
					}
				}
			}
		});	
	});
	
	$(".close").on("click", function(){
		$('#myModal').hide();
		$('body').css('overflow', 'unset');
	});
	
	$("#mb_pwd").keyup(function(){
		
		var mb_pwd = $("#mb_pwd").val();
		var mb_pwd2 = $("#mb_pwd2").val();
		
		if(mb_pwd == "") {   
			$("#pwd_check").text("새 비밀번호를 입력해주세요.");
			$("#pwd_check").css("color", "#d0021b");
			$("#mb_pwd").css("border-bottom", "2px solid #d0021b");
			check = false;
			pwdCheck();
		}else if(mb_pwd != ""){
			$("#pwd_check").text("");
			$("#mb_pwd").css("border-bottom", "1px solid #ddd");
			check = true;
			pwdCheck();
		}
		
		if(mb_pwd != "" && mb_pwd2 != ""){
			if(mb_pwd != mb_pwd2){
				$("#pwd_check").text("비밀번호가 다릅니다.");
				$("#pwd_check").css("color", "#d0021b");
				$("#mb_pwd").css("border-bottom", "2px solid #d0021b");
				check = false;
				pwdCheck();
			}else{
				$("#pwd_check").text("");
				$("#mb_pwd").css("border-bottom", "1px solid #ddd");
				$("#pwd2_check").text("");
				$("#mb_pwd2").css("border-bottom", "1px solid #ddd");
			}
		}
	});
	
	$("#mb_pwd2").keyup(function(){
		var mb_pwd = $("#mb_pwd").val();
		var mb_pwd2 = $("#mb_pwd2").val();
		
		if(mb_pwd2 == "") {   
			$("#pwd2_check").text("새 비밀번호를 입력해주세요.");
			$("#pwd2_check").css("color", "#d0021b");
			$("#mb_pwd2").css("border-bottom", "2px solid #d0021b");
			check = false;
			pwdCheck();
		}else if(mb_pwd2 != ""){
			$("#pwd2_check").text("");
			$("#mb_pwd2").css("border-bottom", "1px solid #ddd");
			check = true;
			pwdCheck();
		}
		
		if(mb_pwd != "" && mb_pwd2 != ""){
			if(mb_pwd != mb_pwd2){
				$("#pwd2_check").text("비밀번호가 다릅니다.");
				$("#pwd2_check").css("color", "#d0021b");
				$("#mb_pwd2").css("border-bottom", "2px solid #d0021b");
				check = false;
				pwdCheck();
			}else{
				$("#pwd_check").text("");
				$("#mb_pwd").css("border-bottom", "1px solid #ddd");
				$("#pwd2_check").text("");
				$("#mb_pwd2").css("border-bottom", "1px solid #ddd");
			}
		}
	});
});

function login_button(flag) {
	$('#myModal').hide();
	var html ='';
	html += '<input type="hidden" name="email" value='+email+'>';
	$("#test").attr('action','/member/signin');
	$("#test").html(html);
	$("#test").submit();
};

function password_button(flag) {
	$('#myModal').hide();
	var html ='';
	html += '<input type="hidden" name="email" value='+email+'>';
	$("#test").attr('action','/member/password_find');
	$("#test").html(html);
	$("#test").submit();
};

function confirm_button(flag) {
	$('#myModal').hide();
	location.href="/member/signin";
};

function displayTime(timeValue){
	var today = new Date();
	var gap = today.getTime() - timeValue;
	var dateObj = new Date(timeValue);
	var str = "";
	
	var yy = dateObj.getFullYear().toString().substring(0,4);
	var mm = dateObj.getMonth() + 1;
	var dd = dateObj.getDate();
	
	return [ yy, '.', (mm > 9 ? '' : '0') + mm, '.', (dd > 9 ? '' : '0') + dd ].join('');
};
