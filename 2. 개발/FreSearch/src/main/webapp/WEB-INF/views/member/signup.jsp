<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 : FRESEARCH</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/signup.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">   <!-- 파비콘 오류 관련 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="/resources/js/signup.js"></script>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
<div class="page-content">
	<h2><a href="/"><img src="/resources/img/logo.png" alt="logo"></a></h2>
	<div class="form-content">
		<form class="form-detail" name="signup" action="/member/signup" method="post">
		<input type="hidden" name="mb_birthdate" id="mb_birthdate" value="">
		<input type="hidden" name="mb_addr" id="mb_addr" value="">
		<input type="hidden" name="mb_att_category" id="mb_att_category" value="">
			<h2>회원가입</h2>
			<div class="form-row">
				<label for="mb_email">이메일</label>
				<input type="text" name="mb_email" id="mb_email" placeholder="이메일" autocomplete="off" maxlength="30">
				<div id="email_check" class="check"></div>
			</div>
			<div class="form-row">
				<label for="mb_pwd">비밀번호</label>
				<input type="password" name="mb_pwd" id="mb_pwd" placeholder="비밀번호" maxlength="20">
				<div id="pwd_check" class="check"></div>
			</div>
			<div class="form-row">
				<label for="mb_pwd2">비밀번호 확인</label>
				<input type="password" name="mb_pwd2" id="mb_pwd2" placeholder="비밀번호 확인" maxlength="20">
				<div id="pwd2_check" class="check"></div>
			</div>
			<div class="form-row">
				<label for="mb_nick">닉네임</label>
				<input type="text" name="mb_nick" id="mb_nick" placeholder="닉네임" autocomplete="off" maxlength="10">
				<div id="nick_check" class="check"></div>
			</div>
			<div class="form-row-birth">
				<label for="mb_birth">생년월일</label>
				<div class="mb_birth_yy">
					<input type="text" id="mb_birth_yy" placeholder="년(4자)" autocomplete="off" maxlength="4">
				</div>
				<div class="mb_birth_mm">
					<!--  <label for="mb_birth_mm1">월</label>-->
					<select id="mb_birth_mm" name="mb_birth_mm">
						<option value="월" selected>월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
				<div class="mb_birth_dd">
				<input type="text" id="mb_birth_dd" placeholder="일" autocomplete="off" maxlength="2">
				<div id="birth_check" class="check"></div>
				</div>
			</div>
			<div class="form-row-sex">
				<label for="mb_sex">성별</label>
				<input type="radio" class="mb_sex" name="mb_sex" id="mb_man" value="남자" checked="checked">
				<label for="mb_man">남자</label>
				<input type="radio" class="mb_sex" name="mb_sex" id="mb_woman" value="여자">
				<label for="mb_woman">여자</label>
			</div>
			<div class="form-row">
				<label for="mb_phone">전화번호</label>
					<input type="text" name="mb_phone" id="mb_phone" placeholder="전화번호 (-없이 숫자만 입력)" autocomplete="off" maxlength="11">
					<div id="phone_check" class="check"></div>
			</div>
			<!--  
			<div class="form-group">
				<label for="mb_nick">거주지</label>
				<input type="text" class="form-control" name="mb_nick" id="mb_nick" placeholder="닉네임" required>
				<div id="nick_check"></div>
			</div>
			-->
			<div class="form-row-addr1">
				<label for="mb_addr">주소</label>   
				<input type="text" id="mb_addr1" placeholder="우편번호" readonly="readonly">
				<button type="button" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
			</div>
			<div class="form-row-addr2">
				<input type="text" id="mb_addr2" placeholder="주소" readonly="readonly" />
			</div>
				<div class="form-row-addr3">
				<input type="text" id="mb_addr3" placeholder="상세주소" autocomplete="off" maxlength="40"/>
				<div id="addr_check" class="check"></div>
			</div>
			<div class="form-row-category">
				<label for="mb_att_category">관심 카테고리 (최대 5개 선택)</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category1" value="A0000001" />
					<label for="mb_att_category1">교육,학문</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category2" value="B0000001" />
					<label for="mb_att_category2">컴퓨터 통신</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category3" value="C0000001" />
					<label for="mb_att_category3">게임</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category4" value="D0000001" />
					<label for="mb_att_category4">엔터테인먼트,예술</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category5" value="E0000001" />
					<label for="mb_att_category5">생활</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category6" value="F0000001" />
					<label for="mb_att_category6">건강</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category7" value="G0000001" />
					<label for="mb_att_category7">사회,정치</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category8" value="H0000001" />
					<label for="mb_att_category8">경제</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category9" value="I0000001" />
					<label for="mb_att_category9">여행</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category10" value="J0000001" />
					<label for="mb_att_category10">스포츠,레저</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category11" value="K0000001" />
					<label for="mb_att_category11">쇼핑</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category12" value="L0000001" />
					<label for="mb_att_category12">지역</label>
					<input type="checkbox" class="mb_att_category" id="mb_att_category13" value="M0000001" />
					<label for="mb_att_category13">결혼</label>
					<div id="cate_check" class="cate_check"></div>
			</div>
			<div class="form-row-yn">
				<label for="mb_marriage">결혼유무</label>
				<input type="radio" class="mb_marriage_yn" name="mb_marriage_yn" id="mb_marriage_y" value="기혼">
				<label for="mb_marriage_y">기혼</label>
				<input type="radio" class="mb_marriage_yn" name="mb_marriage_yn" id="mb_marriage_n" value="미혼" checked="checked">
				<label for="mb_marriage_n">미혼</label>
			</div>
			<div class="form-row-yn">
				<label for="mb_child">자녀유무</label>
				<input type="radio" class="mb_child_yn" name="mb_child_yn" id="mb_child_y" value="유">
				<label for="mb_child_y">유</label>
				<input type="radio" class="mb_child_yn" name="mb_child_yn" id="mb_child_n" value="무" checked="checked">
				<label for="mb_child_n">무</label>
			</div>
			<div class="form-row-yn">
				<label for="mb_home">자가유무</label>
				<input type="radio" class="mb_home_yn" name="mb_home_yn" id="mb_home_y" value="유">
				<label for="mb_home_y">유</label>
				<input type="radio" class="mb_home_yn" name="mb_home_yn" id="mb_home_n" value="무" checked="checked">
				<label for="mb_home_n">무</label>
			</div>
			<div class="form-row-yn">
				<label for="mb_car">자차유무</label>
				<input type="radio" class="mb_car_yn" name="mb_car_yn" id="mb_car_y" value="유">
				<label for="mb_car_y">유</label>
				<input type="radio" class="mb_car_yn" name="mb_car_yn" id="mb_car_n" value="무" checked="checked">
				<label for="mb_car_n">무</label>
			</div>
			<div class="form-row-agree">
				<input type="checkbox" class="mb_agree" id="mb_agree1" value="동의1" />
				<label for="mb_agree1">개인정보 수집 및 이용에 동의합니다.</label>
				<input type="checkbox" class="mb_agree" id="mb_agree2" value="동의2" />
				<label for="mb_agree2">이용약관에 동의합니다.</label>
				<div id="agree_check" class="agree_check"></div>
			</div>
         	<input type="submit" id="signup_fin" class="signup_fin" value="가입하기" disabled>
         	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</div>
</body>
</html>