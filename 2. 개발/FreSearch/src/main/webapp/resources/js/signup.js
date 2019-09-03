function execPostCode() {
	daum.postcode.load(function(){
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
                
                $("[id=mb_addr1]").val(data.zonecode);
                $("[id=mb_addr2]").val(fullRoadAddr);
            }
         }).open();
	});
}

$(document).ready(function(){
	
	/*var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
		
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});*/
	
	var regEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$/i;
	var regNick = /^[a-zA-Z가-힣0-9]{2,6}$/;
	var regPwd = /^[A-Za-z0-9]{4,12}$/;
	var regYear = /^[0-9]{4}$/;
	var regDay = /^[0-9]{1,2}$/;
	var regPhone = /^[0-9]{11}$/;
	
	var check = false;
	
	$("#mb_email").focus();
	
	function signupCheck(){
		if(check == true){
			if($("#mb_email").val() != "" && $("#mb_pwd").val() != "" && $("#mb_pwd2").val() != ""
				&& $("#mb_nick").val() != "" && $("#mb_birth_yy").val() != "" 
				&& $("select[name=mb_birth_mm] option:selected").val() != "월"
				&& $("#mb_birth_dd").val() != "" && $("#mb_phone").val() != "" && $("#mb_addr1").val() != ""
				&& $("#mb_addr2").val() != "" && $("#mb_addr3").val() != "" 
				&& $("input:checked[class='mb_att_category']").size() > 0
				&& $("input:checked[class='mb_agree']").size() == 2) {

				$("#signup_fin").css("opacity", "initial");
				$("#signup_fin").css("cursor", "pointer");
				$("#signup_fin").attr("disabled", false);
				$(".signup_fin").hover(function(){
					$(this).css("background", "#1428a0");
				}, function(){
					$(this).css("background", "#3450ED");
				});
			}
		}else if(check == false){
			if($("#mb_email").val() == "" || $("#mb_pwd").val() || "" || $("#mb_pwd2").val() == ""
				|| $("#mb_nick").val() == "" || $("#mb_birth_yy").val() == "" 
				|| $("select[name=mb_birth_mm] option:selected").val() == "월"
				|| $("#mb_birth_dd").val() == "" || $("#mb_phone").val() == "" || $("#mb_addr1").val() == ""
				|| $("#mb_addr2").val() == "" || $("#mb_addr3").val() == "" 
				|| $("input:checked[class='mb_att_category']").size() == 0
				|| $("input:checked[class='mb_agree']").size() < 2) {
		
				$("#signup_fin").css("opacity", 0.5);
				$("#signup_fin").css("cursor", "initial");
				$("#signup_fin").attr("disabled", true);
			}
		}
	}
	
	$("#mb_email").keyup(function(){
		
		var mb_email = $('#mb_email').val();
		
		$.ajax({
			url : "/member/emailCheck",
			type : "get",
			data : {mb_email : mb_email},
			dataTyep : "json",
			success : function(data){
				
				if(data == 1){
					$("#email_check").text("이미 사용중인 이메일입니다.");
					$("#email_check").css("color", "#d0021b");
					$("#mb_email").css("border-bottom", "2px solid #d0021b");
					check = false;
					signupCheck();
				}else {
					if(regEmail.test(mb_email)){
						$("#email_check").text("");
						$("#mb_email").css("border-bottom", "1px solid #ddd");
						check = true;
						signupCheck();
					}else if(!regEmail.test(mb_email) && mb_email != ""){
						$("#email_check").text("이메일 형식에 맞지 않습니다.");
						$("#email_check").css("color", "#d0021b");
						$("#mb_email").css("border-bottom", "2px solid #d0021b");
						check = false;
						signupCheck();
					}else if(mb_email == ""){
						$("#email_check").text("이메일을 입력해주세요.");
						$("#email_check").css("color", "#d0021b");
						$("#mb_email").css("border-bottom", "2px solid #d0021b");
						check = false;
						signupCheck();
					}else{
						$("#email_check").text("이메일 형식에 맞지 않습니다.");
						$("#email_check").css("color", "#d0021b");
						$("#mb_email").css("border-bottom", "2px solid #d0021b");
						check = false;
						signupCheck();
					}
				}
			}
		});	
	});
	
	$("#mb_nick").keyup(function(){
		
		var mb_nick = $('#mb_nick').val();
		
		$.ajax({
			url : "/member/nickCheck",
			type : "get",
			data : {mb_nick : mb_nick},
			dataTyep : "json",
			success : function(data){
				if(data == 1){
					$("#nick_check").text("이미 사용중인 닉네임입니다.");
					$("#nick_check").css("color", "#d0021b");
					$("#mb_nick").css("border-bottom", "2px solid #d0021b");
					check = false;
					signupCheck();
				}else {
					if(regNick.test(mb_nick)){
						$("#nick_check").text("");
						$("#mb_nick").css("border-bottom", "1px solid #ddd");
						check = true;
						signupCheck();
					}else if(!regNick.test(mb_nick) && mb_nick != ""){
						$("#nick_check").text("2~6자 한글, 영문, 숫자를 입력해주세요.");
						$("#nick_check").css("color", "#d0021b");
						$("#mb_nick").css("border-bottom", "2px solid #d0021b");
						check = false;
						signupCheck();
					}else if(mb_nick == ""){
						$("#nick_check").text("닉네임을 입력해주세요.");
						$("#nick_check").css("color", "#d0021b");
						$("#mb_nick").css("border-bottom", "2px solid #d0021b");
						check = false;
						signupCheck();
					}else{
						$("#nick_check").text("2~6자 한글, 영문, 숫자를 입력해주세요.");
						$("#nick_check").css("color", "#d0021b");
						$("#mb_nick").css("border-bottom", "2px solid #d0021b");
						check = false;
						signupCheck();
					}
				}
			}
		});	
	});
	
	$("#mb_pwd").keyup(function(){
		
		var mb_pwd = $("#mb_pwd").val();
		var mb_pwd2 = $("#mb_pwd2").val();
		
		if(regPwd.test(mb_pwd)){
			$("#pwd_check").text("");
			$("#mb_pwd").css("border-bottom", "1px solid #ddd");
			check = true;
			signupCheck();
		}else if(!regPwd.test(mb_pwd) && mb_pwd != ""){
			$("#pwd_check").text("4~12자 영문 대 소문자, 숫자를 입력해주세요.");
			$("#pwd_check").css("color", "#d0021b");
			$("#mb_pwd").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}else if(mb_pwd == ""){
			$("#pwd_check").text("비밀번호를 입력해주세요.");
			$("#pwd_check").css("color", "#d0021b");
			$("#mb_pwd").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}else{
			$("#pwd_check").text("비밀번호 형식에 맞지 않습니다.");
			$("#pwd_check").css("color", "#d0021b");
			$("#mb_pwd").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}
		
		if(mb_pwd != "" && mb_pwd2 != ""){
			if(mb_pwd != mb_pwd2){
				$("#pwd_check").text("비밀번호가 다릅니다.");
				$("#pwd_check").css("color", "#d0021b");
				$("#mb_pwd").css("border-bottom", "2px solid #d0021b");
				check = false;
				signupCheck();
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
		
		if(regPwd.test(mb_pwd2)){
			$("#pwd2_check").text("");
			$("#mb_pwd2").css("border-bottom", "1px solid #ddd");
			check = true;
			signupCheck();
		}else if(!regPwd.test(mb_pwd2) && mb_pwd2 != ""){
			$("#pwd2_check").text("4~12자 영문 대 소문자, 숫자를 입력해주세요.");
			$("#pwd2_check").css("color", "#d0021b");
			$("#mb_pwd2").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}else if(mb_pwd2 == ""){
			$("#pwd2_check").text("비밀번호를 입력해주세요.");
			$("#pwd2_check").css("color", "#d0021b");
			$("#mb_pwd2").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}else{
			$("#pwd2_check").text("비밀번호 형식에 맞지 않습니다.");
			$("#pwd2_check").css("color", "#d0021b");
			$("#mb_pwd2").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}
		
		if(mb_pwd != "" && mb_pwd2 != ""){
			if(mb_pwd != mb_pwd2){
				$("#pwd2_check").text("비밀번호가 다릅니다.");
				$("#pwd2_check").css("color", "#d0021b");
				$("#mb_pwd2").css("border-bottom", "2px solid #d0021b");
				check = false;
				signupCheck();
			}else{
				$("#pwd_check").text("");
				$("#mb_pwd").css("border-bottom", "1px solid #ddd");
				$("#pwd2_check").text("");
				$("#mb_pwd2").css("border-bottom", "1px solid #ddd");
			}
		}
	});
	
	$("#mb_birth_yy").keyup(function(){

		var mb_birth_yy = $("#mb_birth_yy").val();
		var today = new Date();
		var yearNow = today.getFullYear();
		
		if(regYear.test(mb_birth_yy) && mb_birth_yy >= 1900 && mb_birth_yy <= yearNow){
			$("#birth_check").text("");
			$("#mb_birth_yy").css("border-bottom", "1px solid #ddd");
			$("#mb_birth_mm").css("border-bottom", "1px solid #ddd");
			$("#mb_birth_dd").css("border-bottom", "1px solid #ddd");
			check = true;
			signupCheck();
		}else if(!regYear.test(mb_birth_yy) && mb_birth_yy != ""){
			$("#birth_check").text("년도에 4자리 숫자를 입력해주세요.");
			$("#birth_check").css("color", "#d0021b");
			$("#mb_birth_yy").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}else if(mb_birth_yy == ""){
			$("#birth_check").text("년도를 입력해주세요.");
			$("#birth_check").css("color", "#d0021b");
			$("#mb_birth_yy").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}else{
			$("#birth_check").text("1900년도부터 현재년도까지 입력 가능합니다.");
			$("#birth_check").css("color", "#d0021b");
			$("#mb_birth_yy").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}
	});
	
	$('#mb_birth_mm').blur(function(){
		var mb_birth_yy = $("#mb_birth_yy").val();
		var mb_birth_mm = $("select[name=mb_birth_mm] option:selected").val();
		var mb_birth_dd = $("#mb_birth_dd").val();
		var today = new Date();
		var yearNow = today.getFullYear();
		
		if((regYear.test(mb_birth_yy) && mb_birth_yy >= 1900 && mb_birth_yy <= yearNow) 
				&& mb_birth_mm == "월") {   
			$("#birth_check").text("월을 선택해주세요.");
			$("#birth_check").css("color", "#d0021b");
			$("#mb_birth_mm").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}else if(mb_birth_mm == "월" 
			|| mb_birth_mm > 0){
			if(!regYear.test(mb_birth_yy)){
				$("#birth_check").text("년도에 4자리 숫자를 입력해주세요.");
				$("#birth_check").css("color", "#d0021b");
				$("#mb_birth_yy").css("border-bottom", "2px solid #d0021b");
				check = false;
				signupCheck();
			}else if(mb_birth_yy < 1900 || mb_birth_yy > yearNow){
				$("#birth_check").text("1900년도부터 현재년도까지 입력 가능합니다.");
				$("#birth_check").css("color", "#d0021b");
				$("#mb_birth_yy").css("border-bottom", "2px solid #d0021b");
				check = false;
				signupCheck();
			}else {
				$("#birth_check").text("");
				$("#mb_birth_yy").css("border-bottom", "1px solid #ddd");
				$("#mb_birth_mm").css("border-bottom", "1px solid #ddd");
				check = true;
				signupCheck();
			}
		}else {
			$("#birth_check").text("");
			$("#mb_birth_yy").css("border-bottom", "1px solid #ddd");
			$("#mb_birth_mm").css("border-bottom", "1px solid #ddd");
			check = true;
			signupCheck();
		}
	});
	
	$("#mb_birth_dd").keyup(function(){
		var mb_birth_yy = $("#mb_birth_yy").val();
		var mb_birth_mm = $("select[name=mb_birth_mm] option:selected").val();
		var mb_birth_dd = $("#mb_birth_dd").val();
		var today = new Date();
		var yearNow = today.getFullYear();
		var mb_birthdate = $("#mb_birth_yy").val() + $("#mb_birth_mm").val() + $("#mb_birth_dd").val();
		
		
		if(regYear.test(mb_birth_yy) && regDay.test(mb_birth_dd) 
				&& (mb_birth_yy >= 1900 && mb_birth_yy <= yearNow )
				&& (mb_birth_mm > 0)
				&& (mb_birth_dd >= 1 && mb_birth_dd <= 31)){
			$("#birth_check").text("");
			$("#mb_birth_yy").css("border-bottom", "1px solid #ddd");
			$("#mb_birth_mm").css("border-bottom", "1px solid #ddd");
			$("#mb_birth_dd").css("border-bottom", "1px solid #ddd");
			check = true;
			signupCheck();
		}else if((mb_birth_yy >= 1900 && mb_birth_yy <= yearNow ) && regYear.test(mb_birth_yy) 
				&& mb_birth_yy != "월" && mb_birth_dd == ""){
			if(mb_birth_mm > 0){
				$("#birth_check").text("일을 입력해주세요.");
				$("#birth_check").css("color", "#d0021b");
				$("#mb_birth_dd").css("border-bottom", "2px solid #d0021b");
				check = false;
				signupCheck();
			}else if(mb_birth_mm == "월"){
				$("#birth_check").text("월을 선택해주세요.");
				$("#birth_check").css("color", "#d0021b");
				$("#mb_birth_mm").css("border-bottom", "2px solid #d0021b");
				check = false;
				signupCheck();
			}
		}
		
		if(mb_birth_mm == 2 && mb_birth_dd > 29){
			$("#birth_check").text("2월은 29일까지 입력 가능합니다.");
			$("#birth_check").css("color", "#d0021b");
			$("#mb_birth_dd").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}else if(mb_birth_mm != 2
				&& mb_birth_mm != "월"
				&& mb_birth_dd < 1 || mb_birth_dd > 31){
			$("#birth_check").text("1일부터 31일까지 입력 가능합니다.");
			$("#birth_check").css("color", "#d0021b");
			$("#mb_birth_dd").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}
		
		
		/*
		$.ajax({
			url : "/member/birthCheck",
			type : "get",
			data : {mb_birthdate : mb_birthdate},
			dataTyep : "json",
			success : function(data){
				
				console.log(data);
				if(data == 1){
					$("#birth_check").text("이미 사용중인 생년월일입니다.");
					$("#birth_check").css("color", "#d0021b");
					$("#mb_birth_yy").css("border-bottom", "2px solid #d0021b");
					$("#mb_birth_mm").css("border-bottom", "2px solid #d0021b");
					$("#mb_birth_dd").css("border-bottom", "2px solid #d0021b");
					check = false;
					signupCheck();
				}else {
					if(regYear.test(mb_birth_yy) && regDay.test(mb_birth_dd) 
							&& (mb_birth_yy >= 1900 && mb_birth_yy <= yearNow )
							&& (mb_birth_mm > 0)
							&& (mb_birth_dd >= 1 && mb_birth_dd <= 31)){
						$("#birth_check").text("");
						$("#mb_birth_yy").css("border-bottom", "1px solid #ddd");
						$("#mb_birth_mm").css("border-bottom", "1px solid #ddd");
						$("#mb_birth_dd").css("border-bottom", "1px solid #ddd");
						check = true;
						signupCheck();
					}else if((mb_birth_yy >= 1900 && mb_birth_yy <= yearNow ) && regYear.test(mb_birth_yy) 
							&& mb_birth_yy != "월" && mb_birth_dd == ""){
						if(mb_birth_mm > 0){
							$("#birth_check").text("일을 입력해주세요.");
							$("#birth_check").css("color", "#d0021b");
							$("#mb_birth_dd").css("border-bottom", "2px solid #d0021b");
							check = false;
							signupCheck();
						}else if(mb_birth_mm == "월"){
							$("#birth_check").text("월을 선택해주세요.");
							$("#birth_check").css("color", "#d0021b");
							$("#mb_birth_mm").css("border-bottom", "2px solid #d0021b");
							check = false;
							signupCheck();
						}
					}
					
					if(mb_birth_mm == 2 && mb_birth_dd > 29){
						$("#birth_check").text("2월은 29일까지 입력 가능합니다.");
						$("#birth_check").css("color", "#d0021b");
						$("#mb_birth_dd").css("border-bottom", "2px solid #d0021b");
						check = false;
						signupCheck();
					}else if(mb_birth_mm != 2
							&& mb_birth_mm != "월"
							&& mb_birth_dd < 1 || mb_birth_dd > 31){
						$("#birth_check").text("1일부터 31일까지 입력 가능합니다.");
						$("#birth_check").css("color", "#d0021b");
						$("#mb_birth_dd").css("border-bottom", "2px solid #d0021b");
						check = false;
						signupCheck();
					}
				}
			}
		});	*/
		
	});
	
	$("#mb_phone").keyup(function(){
		
		var mb_phone = $("#mb_phone").val();
		
		$.ajax({
			url : "/member/phoneCheck",
			type : "get",
			data : {mb_phone : mb_phone},
			dataTyep : "json",
			success : function(data){
				console.log(data);
				if(data == 1){
					$("#phone_check").text("이미 사용중인 전화번호입니다.");
					$("#phone_check").css("color", "#d0021b");
					$("#mb_phone").css("border-bottom", "2px solid #d0021b");
					check = false;
					signupCheck();
				}else {
					if(regPhone.test(mb_phone)){
						$("#phone_check").text("");
						$("#mb_phone").css("border-bottom", "1px solid #ddd");
						check = true;
						signupCheck();
					}else if(!regPhone.test(mb_phone) && mb_phone != ""){
						$("#phone_check").text("-제외하고 11자리 숫자를 입력해주세요.");
						$("#phone_check").css("color", "#d0021b");
						$("#mb_phone").css("border-bottom", "2px solid #d0021b");
						check = false;
						signupCheck();
					}else if(mb_phone == ""){
						$("#phone_check").text("전화번호를 입력해주세요.");
						$("#phone_check").css("color", "#d0021b");
						$("#mb_phone").css("border-bottom", "2px solid #d0021b");
						check = false;
						signupCheck();
					}else{
						$("#phone_check").text("전화번호 형식에 맞지 않습니다.");
						$("#phone_check").css("color", "#d0021b");
						$("#mb_phone").css("border-bottom", "2px solid #d0021b");
						check = false;
						signupCheck();
					}
				}
			}
		});
	});
	
	$("#mb_addr3").keyup(function(){
		
		var mb_addr3 = $("#mb_addr3").val();
		
		if(mb_addr3 == ""){
			$("#addr_check").text("상세주소를 입력해주세요.");
			$("#addr_check").css("color", "#d0021b");
			$("#mb_addr3").css("border-bottom", "2px solid #d0021b");
			check = false;
			signupCheck();
		}else{
			$("#addr_check").text("");
			$("#mb_addr3").css("border-bottom", "1px solid #ddd");
			check = true;
			signupCheck();
		}
	});
	
	$(".mb_att_category").on("click" , function(){
		
		var cnt = $("input:checked[class='mb_att_category']").size();
		var cnt2 = $("input:checked[class='mb_agree']").size();
		
		if(cnt > 5){
			$(this).attr("checked" , false);
		}
		if(cnt == 0){
			$("#cate_check").text("관심카테고리를 체크해주세요.");
			$("#cate_check").css("color", "#d0021b");
			$("#agree_check").text("");
			check = false;
			signupCheck();
		}else if(cnt > 0 && cnt2 < 2){
			$("#cate_check").text("");
			$("#agree_check").text("약관에 동의해주세요.");
			$("#agree_check").css("color", "#d0021b");
			check = false;
			signupCheck();
		}else if(cnt > 0 && cnt2 == 2){
			$("#cate_check").text("");
			$("#agree_check").text("");
			check = true;
			signupCheck();
		}

		for(var i=0; i<cnt; i++){
			
			if(i==0){
				ctgr_code1 = $(this).val();
				console.log("ctgr_code1 : " + ctgr_code1);
			}else if(i==1){
				ctgr_code2 = $(this).val();
				console.log("ctgr_code2 : " + ctgr_code2);
			}else if(i==2){
				ctgr_code3 = $(this).val();
				console.log("ctgr_code3 : " + ctgr_code3);
			}else if(i==3){
				ctgr_code4 = $(this).val();
				console.log("ctgr_code4 : " + ctgr_code4);
			}else if(i==4){
				ctgr_code5 = $(this).val();
				console.log("ctgr_code5 : " + ctgr_code5);
			}else{
				ctgr_code1 = "";
				ctgr_code2 = "";
				ctgr_code3 = "";
				ctgr_code4 = "";
				ctgr_code5 = "";
			}
		}
	});
	
	$(".mb_agree").on("click" , function(){
		
		var cnt = $("input:checked[class='mb_att_category']").size();
		var cnt2 = $("input:checked[class='mb_agree']").size();
		
		if(cnt == 0){
			$("#cate_check").text("관심카테고리를 체크해주세요.");
			$("#cate_check").css("color", "#d0021b");
		}
		if(cnt > 0 && cnt2 == 2){
			$("#agree_check").text("");
			check = true;
			signupCheck();
		}else if(cnt == 0 && cnt2 < 2){
			$("#agree_check").text("");
			check = true;
			signupCheck();
		}else if(cnt2 < 2){
			$("#agree_check").text("약관에 동의해주세요.");
			$("#agree_check").css("color", "#d0021b");
			check = false;
			signupCheck();
		}
	});
	
	$("#signup_fin").click(function(){
		
		var mb_birthdate = $("#mb_birth_yy").val() + $("#mb_birth_mm").val() + addZero($("#mb_birth_dd").val(), 2);
		var mb_addr = $("#mb_addr1").val() + " " + $("#mb_addr2").val() + " " + $("#mb_addr3").val();
		
		console.log("날짜 : " + addZero($("#mb_birth_dd").val(), 2));
		
		
		
		$("#mb_birthdate").val(mb_birthdate);
		$("#mb_addr").val(mb_addr);
		
		var cate_val = [];
		$("input:checked[class='mb_att_category']").each(function(i){
			cate_val.push($(this).val());
		});
		$("#mb_att_category").val(cate_val);

		/*
		var form = $("#signup");
		swal({
			title:"회원가입 인증 메일을 전송하시겠습니까?",
			text:"이메일 인증 후 서비스를 이용해주세요.",
			icon:"success",
			buttons:["취소","전송"],
		})
		.then((전송) => {		
			if(전송){
				form.attr("action","/member/signup");
				form.submit();
			}
		});	*/
		
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
	$(".emailReSend").on("click", function(){
		$('#dialog').show();
		$('body').css('overflow', 'hidden');
		//var form = $("#confirm");
		//form.attr("action","/member/email_confirm");
		//form.submit();
		//alert("받은 메일함을 확인해주세요.");
		
		/*
		$('.swal-overlay').css('pointer-events', 'none');
		var form = $("#confirm");
		swal({
			title:"받은 메일함을 확인해주세요.",
			//text:"이메일 인증 후 서비스를 이용해주세요.",
			icon:"success",
			button:"확인",
		})
		.then((확인) => {	
			if(확인){
				form.attr("action","/member/email_confirm");
				form.submit();
			}
		});*/
	});
});
