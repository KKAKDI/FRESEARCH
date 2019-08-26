<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/reset.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
	.content_title{
		font-size: 25px;
	    padding-bottom: 10px;
	    border-bottom: 2px solid #1428a0;
	    margin-bottom: 5px;
	}
	.mycontent{
		padding-top: 106px;
		min-height: 730px;
		width:1100px;
		margin: 0 auto;
	}
	.mycontent .info_area{
		width: 200px;
		height: 301px;
   		background-color: #fff;
	    margin-top: 40px;
	    display: inline-block;
	    border: 1px solid #dcdcdc;
	}	
	.mycontent .info_area .info_inner{
		padding: 15px;
   		height: 50px;
   		border: 1px solid #fff;   		
	}
	.mycontent .info_area .info_inner p{
		cursor: pointer;
		display: inline-block;
	}
	.mycontent .info_area .info_inner .profile_name{
		margin:0 auto;
		text-align:center;		
	}
	.mycontent .info_area .info_inner .profile_name .mem_grade{
		width: 75px;
  		display: inline-block;
	}
	.mycontent .content_box{
		width: 870px;
	    min-height: 730px;
	    background-color: transparent;
	    display: inline-block;
	    margin: 40px 0 0 20px;
	}	
	.mycontent .content_box .make_list_content{
		display:none;
		min-height: 730px;		
	}
	.mycontent .content_box .take_list_content{
		display:none;
		min-height: 730px;		
	}
	.mycontent .content_box .mem_modi_content{
		display:none;
		min-height: 730px;	
	}
	.mycontent .content_box .mem_modi_content .mem_modi_box{
		padding:30px;	
		width:650px;
		background-color: #fff;
		min-height: 650px;
		margin:0 auto;
		margin-top:15px;
	}
	.mycontent .content_box .mem_modi_content .mem_modi_box label{
		display:block;
		padding: 10px 0 10px 0;
		font-size: 17px;
  		font-weight: 500;
	}
	.mycontent .content_box .mem_modi_content .mem_modi_box input[type=text],input[type=password]{
	    width: 100%;	   
	    padding: 10px 0 10px 0;
	    border: none;
	    border-bottom: 1px solid #ddd;
	    font-size: 16px;
	    transition: all 0.1s;
	    margin-bottom: 5px;
	}
	.mycontent .content_box .mem_modi_content .mem_modi_box input[type=radio]{
	    -webkit-appearance: none;
	    border-radius: 50%;
	    width: 18px;
	    height: 18px;
	    border: 2px solid #999;
	    transition: 0.2s all linear;
	    outline: none;
	    margin-top: 2px;
	    margin-right: 5px;
	    margin-right: 5px;
	    position: relative;
	}
	.mycontent .content_box .mem_modi_content .mem_modi_box input[type=radio]:checked{
		border: 9px solid #1428a0;
	}
	.mycontent .content_box .mem_modi_content .mem_modi_box input[type=text]:focus,input[type=password]:focus{
		border-bottom: 2px solid #1428a0;
		outline: none;
	}
	.mycontent .content_box .mem_modi_content .mem_modi_box input[type=button]{
		display: block;
	    margin: 0 auto;
	    margin-top: 10px;
	    width: 200px;
	    background-color: #1428a0;
	    border: none;
	    color: #fff;	   
	    height: 33px;
	}
	.mycontent .content_box .main_content .content_title{
	    font-size: 25px;
	    padding-bottom: 10px;
	    border-bottom: 2px solid #1428a0;
	    margin-bottom: 5px;
	}
	.mycontent .content_box .main_content .content_title p{
		cursor: pointer;
		display: inline-block;	
	}
	.mycontent .content_box .main_content .research_list_top{
	    margin-top: 15px;
		min-height: 300px;
	}
	.mycontent .content_box .main_content .research_list_top .top_content{
		height: 50px;
	}
	li{
		height: 38px;
		border-bottom: 1px solid #dcdcdc;
	}
	li dt{
		display:inline-block;		
		padding: 8px;
	}
	li >dt:nth-child(1){
	    font-weight: bold;	
		text-align: center;
		width:150px;
	}
	li >dt:nth-child(2){
		width:390px;
	}
	li >dt:nth-child(3){
		text-align: center;
		width:120px;
	}
	li >dt:nth-child(4){
		text-align: center;
		width:200px;
	}
	#grade_box{
		padding-top: 5px;
	}
	#mem_info{
		height: 150px;
		border-bottom: 1px solid #dcdcdc;
	}
	#mem_profile{
	    width: 50px;
	    height: 50px;
	    background: url(/resources/img/bicon15_4.png) no-repeat 50% 50%;
	    margin: 0 auto;
	}
	#mb_addr_find{
	    background-color: #fff;
	    border: 1px solid #e5e5e5;
	    border-radius: 4px;
	    padding: 7.2px 15px 10px 15px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px;
	    cursor: pointer;
	    outline-color: #1428a0;
	    color: #000;
	    height: 40.10px;
	    width: 132.45px;
	}
	#mb_addr1{
		width: 40%;
	}
	.research_list{
		margin-top: 15px;
		width: 100%;
		height: 650px;
		overflow: auto;
		overflow-x:hidden
	}
	.research_list::-webkit-scrollbar-track
	{
	 -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	 border-radius: 10px;
	 background-color: #F5F5F5;
	}
	
	.research_list::-webkit-scrollbar
	{
	 width: 8px;
	 background-color: #F5F5F5;
	}
	
	.research_list::-webkit-scrollbar-thumb
	{
	 border-radius: 5px;
	 -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
	 background-color: #1428a0;
	}
</style>
<script>
	$(function() {	
		$("#research_list_take > p").click(function(){
			$(".main_content").hide();
			$(".make_list_content").hide();
			$(".mem_modi_content").hide();
			$(".take_list_content").show();
			console.log("참여 리스트");
		});
		$("#research_list_make > p").click(function(){
			$(".main_content").hide();
			$(".take_list_content").hide();
			$(".mem_modi_content").hide();
			$(".make_list_content").show();
			console.log("만든 리스트");
		});
		$("#mem_modi > p").click(function(){
			$(".main_content").hide();
			$(".take_list_content").hide();
			$(".make_list_content").hide();
			$(".mem_modi_content").show();
			console.log("만든 리스트");
		});
		$(".info_inner p").hover(
			function(){
				$(this).parent().css("border","1px solid #1428a0");
			},
			function(){
				$(this).parent().css("border","1px solid #fff");
			}
		);
		$("#research_list_take_scroll").on('scroll',function(){	        
		});
	});
</script>
<div class='mycontent'>
	<div class='info_area'>
		<div class='info_inner' id='mem_info'>
			<div id='mem_profile'></div>
			<div class='profile_name'>관리자</div>
			<div class='profile_name'>(admin@admin.com)</div>
			<div class='profile_name' id='grade_box'><label>일반회원</label></div>
		</div>
		<div class='info_inner' id='research_list_take'><p>참여한 리서치</p></div>
		<div class='info_inner' id='research_list_make'><p>작성한 리서치</p></div>
		<div class='info_inner' id='mem_modi'><p>회원정보 수정</p></div>
	</div>
	<div class='content_box'>
		<div class='take_list_content'>
			<div class='content_title'>참여한 리서치 목록</div>
			<div class='research_list' id='research_list_take_scroll'>
<ul class='list_content'>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>	
				</ul>
			</div>
		</div>
		<div class='make_list_content'>
			<div class='content_title'>작성한 리서치 목록</div>
			<div class='research_list' id='research_list_make_scroll'>
				<ul class='list_content'>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>	
				</ul>
			</div>
		</div>		
		<div class='mem_modi_content'>
			<div class='content_title'>회원 정보 수정</div>
			<div class='mem_modi_box'>	
			<form name='modi_form' id='modi_form' action='' method='post'>			
				<label>현재 비밀번호</label>
				<input type='password' name='mb_pwd_now' id='mb_pwd' value='' placeholder='현재 비밀번호'>
				<label>새 비밀번호</label>
				<input type='password' name='mb_pwd_new' id='mb_pwd' value='' placeholder='새 비밀번호'>
				<label>새 비밀번호 확인</label>
				<input type='password' name='mb_pwd_new2' id='mb_pwd2' value='' placeholder='새 비밀번호 확인'>
				<label>주소</label>
				<input type='text' name='mb_addr1' id='mb_addr1' placeholder='우편번호'>
				<input type='button' id='mb_addr_find' value='우편번호 찾기'>
				<input type='text' name='mb_addr2' id='mb_addr2' placeholder='주소'>
				<input type='text' name='mb_addr3' id='mb_addr3' placeholder='상세주소'>
				<label>관심 카테고리 (최대 5개 선택)</label>
				<label>결혼 유무</label>
				<input type='radio' name='mb_marriage' value=''>유
				<input type='radio' name='mb_marriage' value=''>무
				<label>자녀 유무</label>
				<input type='radio' name='mb_child' value=''>유
				<input type='radio' name='mb_child' value=''>무
				<label>자가 유무</label>
				<input type='radio' name='mb_home' value=''>유
				<input type='radio' name='mb_home' value=''>무
				<label>자차 유무</label>
				<input type='radio' name='mb_car' value=''>유
				<input type='radio' name='mb_car' value=''>무
				<input type='button' name='modi' id='modi' value='수정하기'>
			</form>
			</div>
		</div>
		<div class='main_content'>
			<div class='content_title' id='research_list_take'><p>참여한 리서치 목록</p></div>
			<div class='research_list_top' id='research_list_take_top'>
				<ul class='top_content'>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
						<dt>사회,정치</dt><dt><a href='#'>사회,정치 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>생활</dt><dt><a href='#'>생활 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
					   <dt>경제</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
				</ul>
			</div>
			<div class='content_title' id='research_list_make'><p>작성한 리서치 목록</p></div>
			<div class='research_list_top' id='research_list_make_top'>
				<ul class='top_content'>
					<li>
						<dt>컴퓨터 통신</dt><dt><a href='#'>컴퓨터 통신 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
						<dt>사회,정치</dt><dt><a href='#'>사회,정치 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>생활</dt><dt><a href='#'>생활 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
					   <dt>경제</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt><a href='#'>경제 설문지 테스트</a></dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<%@include file="includes/footer.jsp" %>