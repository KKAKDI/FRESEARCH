<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@include file="includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/reset.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
	.mycontent{
		padding-top: 106px;
		min-height: 733px;
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
   		border-bottom: 1px solid #dcdcdc;
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
	    min-height: 585px;
	    background-color: transparent;
	    display: inline-block;
	    margin: 40px 0 0 20px;
	}	
	.mycontent .content_box .main_content .content_title{
	    font-size: 25px;
	    padding-bottom: 10px;
	    border-bottom: 2px solid #1428a0;
	    margin-bottom: 5px;
	}
	.mycontent .content_box .main_content .research_list_top{
		min-height: 250px;
	}
	.mycontent .content_box .main_content .research_list_top .top_content{
		height: 50px;
	}
	.mycontent .content_box .main_content .research_list_top .top_content li{
		height: 38px;
		border-bottom: 1px solid #dcdcdc;
	}
	.mycontent .content_box .main_content .research_list_top .top_content li dt{
		display:inline-block;		
		padding: 5px;
	}
	.mycontent .content_box .main_content .research_list_top .top_content li >dt:nth-child(1){
	    font-weight: bold;	
		text-align: center;
		width:150px;
	}
	.mycontent .content_box .main_content .research_list_top .top_content li >dt:nth-child(2){
		width:400px;
	}
	.mycontent .content_box .main_content .research_list_top .top_content li >dt:nth-child(3){
		text-align: center;
		width:120px;
	}
	.mycontent .content_box .main_content .research_list_top .top_content li >dt:nth-child(4){
		text-align: center;
		width:200px;
	}
	#research_list_take_top{
		
	}
	#research_list_make_top{
	
	}
	#mem_info{
		height: 150px
	}
	#mem_profile{
	    width: 50px;
	    height: 50px;
	    background: url(/resources/img/bicon15_4.png) no-repeat 50% 50%;
	    margin: 0 auto;
	}
</style>
<div class='mycontent clearflx'>
	<div class='info_area clearflx'>
		<div class='info_inner' id='mem_info'>
			<div id='mem_profile'></div>
			<div class='profile_name'>관리자</div>
			<div class='profile_name'>(admin@admin.com)</div>
			<div class='profile_name'>
			<div class='mem_grade'>회원등급</div><label>일반회원</label>
			</div>
		</div>
		<div class='info_inner' id='research_list_take'>
			<a href='#'>참여한 리서치</a>
		</div>
		<div class='info_inner' id='research_list_make'>
			<a href='#'>작성한 리서치</a>
		</div>
		<div class='info_inner' id='mem_modi'>
			<a href='#'>회원정보 수정</a>
		</div>
	</div>
	<div class='content_box clearflx'>
		<div class='main_content'>
			<div class='content_title'>
				참여한 리서치 목록
			</div>
			<div class='research_list_top' id='research_list_take_top'>
				<ul class='top_content'>
					<li>
						<dt>컴퓨터 통신</dt><dt>컴퓨터 통신 설문지 테스트</dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
						<dt>사회,정치</dt><dt>사회,정치 설문지 테스트</dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>생활</dt><dt>생활 설문지 테스트</dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
					   <dt>경제</dt><dt>경제 설문지 테스트</dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt>경제 설문지 테스트</dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
				</ul>
			</div>
			<div class='content_title'>
				작성한 리서치 목록
			</div>
			<div class='research_list_top' id='research_list_make_top'>
				<ul class='top_content'>
					<li>
						<dt>컴퓨터 통신</dt><dt>컴퓨터 통신 설문지 테스트</dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>						
					</li>
					<li>
						<dt>사회,정치</dt><dt>사회,정치 설문지 테스트</dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
						<dt>생활</dt><dt>생활 설문지 테스트</dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
					   <dt>경제</dt><dt>경제 설문지 테스트</dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
					<li>
					   <dt>엔터테인먼트,예술</dt><dt>경제 설문지 테스트</dt><dt>진행중</dt><dt>	0000.00.00~0000.00.00</dt>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<%@include file="includes/footer.jsp" %>