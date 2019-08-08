<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/stats/css/chart.css">
<!-- partial -->

<div class="main-panel">
	<div class="content-wrapper">
		<div class="sub-header">
			<div class="sub-header-info"
				style="z-index: 1000; position: static; top: auto;">
				<h2 class="sub-header__title">
					<a href="">통계 목록</a>
				</h2>
				<ul class="sub-header-button">
					<!-- <li class="sub-header-button__item sub-header-button__item--search">
						<button id="search-toggle-button" class="button">검색하기</button> 
					</li>-->
					<li class="sub-header-button__item"><a href=""><img
							src="https://talk.op.gg/images/icon-write@2x.png" alt="글쓰기 "
							width="24"> </a></li>
				</ul>
			</div>
			<div class="sub-link" id="sub-menu"
				style="z-index: auto; position: static; top: autol">
				<ul class="sub-link__list">
					<li class="sub-link__item sub-link__item--active"><a href=""><img
							src="https://talk.op.gg/images/icon-hot-on@2x.png" width="24" alt><span>인기</span></a></li>

					<li class="sub-link__item"><a href=""><img
							src="https://talk.op.gg/images/icon-new@2x.png" width="24"><span>최신</span></a></li>
					<li class="sub-link__item"><a href="" class="top"><img
							src="https://talk.op.gg/images/icon-top@2x.png" width="24"><span>TOP</span></a></li>
					<li class="sub-link__item"><a href=""><img
							src="https://talk.op.gg/images/icon-boost@2x.png" width="24"><span>10추</span></a></li>
				</ul>
				<div class="sub-header-search">
					<form action>
						<label> 
							<select name="target"	class="sub-header-search__select">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
							</select>
						</label> 
						<input type="text" name="q" class="sub-header-search__input"placeholder="검색">
						<button type="submit" class="sub-header-search__button">
						<img src="https://talk.op.gg/images/icon-search@2x.png" width="24"	alt="검색">
					</button>
					</form>
					
				</div>
			</div>
			<div style="display: none; width: 728px; height: 48px; float: none;"></div>
		</div>
		<div class="Header">
			<div class="Box">
				<div class="Content">
					<form id="" action="" method="post" onsubmit="">
						<table class="StatisticsFilter">
							<colgroup>
								<col width="193">
								<col width="193">
								<col width="193">
								<col width="194">
								<col width="194">
							</colgroup>
							<thead class="Header">
								<tr class="Row">
									<td class="HeaderCell">카테고리</td>
									<td class="HeaderCell">지역</td>
									<td class="HeaderCell">성별</td>
									<td class="HeaderCell">나이</td>
									<td class="HeaderCell">상태</td>
								</tr>
							</thead>
							<tbody class="Content"></tbody>
							<tr class="Row">
								<td class="Cell">
									<div class="ButtonWrap">
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-checked" > <input
												type="radio" name="type" id="seoul" value="전체" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label jcf-label-active" id="leftleft">전체</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="교육, 학문" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">교육, 학문</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="컴퓨터 통신" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">컴퓨터 통신</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="게임" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">게임</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="엔터테인먼트, 예술" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">엔터테인먼트, 예술</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="생활" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">생활</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="건강" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">건강</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked"> <input
												type="radio" name="league" id="all" value="사회, 정치" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">사회, 정치</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="경제" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">경제</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="여행" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">여행</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="스포츠, 레저" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">스포츠, 레저</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="쇼핑" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">쇼핑</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="지역" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">지역</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="결혼" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">결혼</label>
										</div>
									</div>
								</td>
							
							
							
							
							
							
							
							
								<td class="Cell">
									<div class="ButtonWrap">
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-checked" > <input
												type="radio" name="type" id="seoul" value="전체" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label jcf-label-active">전체</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" id="seoul" value="서울" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">서울</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="부산" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">부산</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="대구" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">대구</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="인천" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">인천</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="광주" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">광주</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="대전" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">대전</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="울산" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">울산</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="세종" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">세종</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="경기" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">경기</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="강원" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">강원</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="충북" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">충북</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="충남" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">충남</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="전북" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">전북</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="전남" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label for="win" class="Label">전남</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="경북" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">경북</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="경남" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">경남</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" value="제주" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">제주</label>
										</div>
										<!-- <div id="rate_win_asc" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" id="lose" value="lose"
												class="Radio" style="position: absolute; opacity: 0;">
												<span></span>
											</span> <label for="lose" class="Label">낮은 승률</label>
										</div>
										<div id="rate_pick" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" id="picked" value="piced"
												class="Radio" checked
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label for="picked" class="Label">게임당 픽률</label>
										</div>
										<div id="rate_ban" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="type" id="banned" value="banned"
												class="Radio" style="position: absolute; opacity: 0;">
												<span></span>
											</span> <label for="banned" class="Label">게임당 밴률</label>
										</div> -->
									</div>
								</td>


								<!-- 성별   -->
								<td class="Cell">
									<div class="ButtonWrap">
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-checked" > <input
												type="radio" name="league" id="all" value="전체" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label jcf-label-active">전체</label>
										</div>

										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="남" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">남자</label>
										</div>
										<div id="tier_iron" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="iron" value="여"
												class="Radio" style="position: absolute; opacity: 0;">
												<span></span>
											</span><label class="Label">여자</label>
										</div>
									</div>
								</td>


								<!-- 나이 -->
								<td class="Cell">
									<div class="ButtonWrap">
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-checked" > <input
												type="radio" name="league" id="all" value="전체" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label jcf-label-active">전체</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="10" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">10대</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="20" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">20대</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="30" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">30대</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="40" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">40대</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="50" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">50대</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="60" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">60대</label>
										</div>
									</div>
								</td>


								<!-- 결혼 -->
	

								<td class="Cell">
									<div class="ButtonWrap">
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-checked" > <input
												type="radio" name="league" id="all" value="전체" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label jcf-label-active">전체</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="대기" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">대기</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="진행중" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">진행중</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" > <input
												type="radio" name="league" id="all" value="완료" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">완료</label>
										</div>
									</div>
								</td>


							</tr>






						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="grid-margin-table stretch-card">
			<div class="card-table">
				<div class="card-body-table">
					<section class="article-list">

						<!--
						<div class="article-list-item">
							<div class="article-list-item__vote">
								<img src="https:/talk.op.gg/images/icon-vote-up.png" alt>
								<div>376</div>
							</div>
							<div class="article-list-item__content">
								<div class="article-list-item__title">
									<a href=""> <span>통계 목록 페이지는 페이징과 검색과 이미지 띄우는거 셀렉트
											박스 너무 많아.</span> <em>[35]</em>
								
								</div>
								</a>
								<div class="article-list-item-meta">
									<div class="article-list-item-meta__item">교육, 공부</div>
									<div class="article-list-item-meta__item">

										<span>5시간 전 </span>
										<div class="article-list-item-meta__item">
											<a href=""> choss001 </a>
										</div>
									</div>
								</div>
							</div>
							<div class="article-list-item__thumbnail">
								<a href=""> <img
									src="https://opgg-com-image.akamaized.net/attach/images/20190722062608.25761.jpg?image=w_200"
									class="article-list-item__thumbnail" alt>
								</a>
							</div>
						</div>
						 -->

					</section>
					
					
					
	<!-- 				
	<div class="grid-margin-table-p stretch-card p">
		<div class="card-table-p">
			<div class="card-body-table-p">
				<section class="article-list-p">
					<section class="article-list-paging-p">
							<div class="article-list-paging-content">
								<ul class="article-list-paging-list">
								<c:if test="${pageMaker.prev }"	>
									<li	class="article-list-paging__item article-list-paging__item--prev">
										<a href="" class="article-list-paging__button button"> 
										<img	src="https://talk.op.gg/images/icon-arrow-left@2x.png" width="24"> 
										<span>이전</span>
									</a>
									</li>
									</c:if>
									<c:if test="${pageMaker.next}">
									<li	class="article-list-paging__item article-list-paging__item--next">	<a href="" class="article-list-paging__button button"> 
									<span>다음</span>
											<img src="https://talk.op.gg/images/icon-arrow-right@2x.png" width="24">
									</a>
									</li>
									</c:if>
								</ul>
							</div>
						</section>
					</section>
				</div>
			</div>
		</div>
		 -->			<!--  
					<button class="article-list-paging__button button" id="next" value="1">
				    	<img src="https://talk.op.gg/images/icon-arrow-left@2x.png" width="24">
				    	<span>실험</span>
				    	</button>
				    	
				    	-->







				</div>
			</div>

		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>

<script src="/resources/stats/js/chartMy.js"></script>
<script type="text/javascript">
	$(document).scroll(function() {
						/*setInterval(function() {
							console.log("현재 스크롤 위치는 : " + $(document).scrollTop());
						
						}, 1);*/
							//console.log($('.sub-link').offset());
		if ($(document).scrollTop() >= 69) {
			$('.sub-link').attr('class','sub-link scroll-to-fixed-fixed');
			$('.sub-link').attr('style','z-index: 1000; position: fixed; top: 109px; margin-left: 0px; width: 719px;');
			$('.sub-link').next().first().attr('style','display: block; width: 728px; height: 48px; float: none;');
		} else {$('.sub-link').attr('class', 'sub-link');
			$('.sub-link').attr('style','z-index: auto; position: static; top: autol');
			$('.sub-link').next().first().attr('style',	'display: none; width: 728px; height: 48px; float: none;');
		}
	});
	console.log("pageMakerPrev : "+$('#pageMakerPrev').val());
	console.log("pageMakerPrev : "+$('#pageMakerNext').val());
	var next = $('#pageMakerNext').val();

	
	
	
	$('form').on('submit', function(e){
		
		event.preventDefault();
		var input = $(this).find('input').val();
		var option =$(this).find('option:selected').val();
		
		if (input ==""){
			alert("검색어를 입력해주세요.");
		}
		console.log("input : "+input);
		console.log("option : "+option);
		
		
		
		/////////////////////////////////////여기서부터는 검색 ajax!!//////////////////////////////////////////
		var page = page || 1;
			showList(page);
			
			function showList(page){
				
				if(option =="title"){
					console.log("여기 안에 들어왔다 : " +page);
					var data = {
				    		mb_nick : "",
				    		subj_nm : input,
				    		pageNum : (page||1),
					    	amount : 3	
					}
				}else{
					var data = {
				    		mb_nick : input,
				    		subj_nm : "",
				    		pageNum : (page||1),
					    	amount : 3	
					}
				}
				
			    console.log(data);
			    
			    
			    console.log(tableService);
			    console.log("showList 안쪽에 page : "+page)
			    
			    
			    tableService.table(data,function(list, cnt){
			    	//<section class="article-list">

			    	var html = '';
			    	if (list.length == 0){
			    		html += '<div class="article-list-item-no-data">';
						html += '<div class="article-list-item__content">';
						html += '<div class="article-list-item__title">';
						html +=	'<a href=""> <span> 데이터가 없습니다.';
						html +=	'</span>';
						html +=	'</div>';
						html +=	'</a>';

						html += '</div>';
						html += '</div>';
						html +=	'</div>';
						html += '</div>';
			    	}else{
			    		for(var i =0, len = list.length||0; i < len; i++){
			    		
				    		html += '<div class="article-list-item">';
							html += '<div class="article-list-item__vote">';
							html +=	'<img src="https:/talk.op.gg/images/icon-vote-up.png" alt>';
							html +=	'<div>'+list[i].answer_number+'</div>';
							html += '</div>';
							html += '<div class="article-list-item__content">';
							html += '<div class="article-list-item__title">';
							html +=	'<a href=""> <span>'+list[i].subj_nm;
							html +=	'</span> <em>[35]</em>';
							html +=	'</div>';
							html +=	'</a>';
							html +=	'<div class="article-list-item-meta">';
							html +=	'<div class="article-list-item-meta__item">'+list[i].ctgr_nm+'</div>';
							html +=	'<div class="article--list-item-meta__item">';
							html += '<span>'+tableService.displayTime(list[i].subj_regdate)+'</span>';
							html +=	'<div class="article-list-item-meta__item">';
							html +=	'<a href="">'+list[i].mb_nick+'</a>';
							html += '</div>';
							html += '</div>';
							html += '</div>';
							html +=	'</div>';
							html +=	'<div class="article-list-item__thumbnail">';
							html +=	'<a href="">';
							html +=	'<img src="https://opgg-com-image.akamaized.net/attach/images/20190722062608.25761.jpg';
							html += '?image=w_200" class="article-list-item__thumbnail" alt>';
							html +=	'</a>';
							html +=	'</div>';
							html += '</div>';
			    		}
			    		if(page == 1 && page == Math.ceil(cnt/3.0)){
			    			
			    		}else{
				    		html+= '<section class="article-list-paging">';
					    	html+= '<div class="article-list-paging-content">';
					    	html+= '<ul class="article-list-paging-list">';
					    	if (page ==1){
					    	}else{
						    	html+= '<li class="article-list-paging__item article-list-paging__item--prev">';
						    	html+= '<button class="article-list-paging__button button" id="prev" value="'+page+'">';
						    	html+= '<img src="https://talk.op.gg/images/icon-arrow-left@2x.png" width="24">';
						    	html+= '<span>이전</span>'
						    	html+= '</button>'
						    	html+= '</li>';
					    	}
					    	if(page == Math.ceil(cnt/3.0)){
					    		
					    	}else{
						    	html+= '<li class="article-list-paging__item article-list-paging__item--next">';
						    	html+= '<button class="article-list-paging__button button" id="next" value="'+page+'">';
						    	html+= '<span>다음</span>'
						    	html+= '<img src="https://talk.op.gg/images/icon-arrow-right@2x.png" width="24">';
						    	html+= '</button>'
						    	html+= '</li>';
					    	}
					    	html+= '</ul>';
					    	html+= '</div>';
					    	html+= '</section>';
			    		}
			    	}
					$('section.article-list').html(html);
			    });
			};
			
			 $('.article-list').off('click','#next').on('click','#next',function(e){
				 e.preventDefault();
				console.log("다음 눌렸다.");
				//console.log($(this).children().val);
				var page = $(this).val();
				page ++; 
				
				console.log("page : "+$(this).val());
				
				console.log("page++ : "+page);
				showList(page);

			});
			 
			 $('.article-list').off('click','#prev').on('click','#prev',function(e){
				 e.preventDefault();
				console.log("다음 눌렸다.");
				//console.log($(this).children().val);
				var page = $(this).val();
				page --; 
				
				console.log("page : "+$(this).val());
				
				console.log("page++ : "+page);
				showList(page);
			});
		 });

		////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	$(document).ready(function(){
		
		var page = (page || 1);
		showStartList(page);
		function showStartList(page){
		
			var data = {
		    		ctgr_nm : "",
		    		mb_addr : "",
		    		mb_sex : "",
		    		mb_nick : "",
		    		subj_nm : "",
		    		startAge : 0,
		    		endAge : 99,
		    		stats : "전체",
		    		pageNum : page,
			    	amount : 3
			    	
		    		
		    }
			
			
			//console.log("하이 이건 나오냐 : "+JSON.stringify(data));
			
			
			tableService.table(data,function(list, cnt){
		    	var html = '';
		    	
		    	if (list.getTableTest == 0){
		    		html += '<div class="article-list-item-no-data">';
					html += '<div class="article-list-item__content">';
					html += '<div class="article-list-item__title">';
					html +=	'<a href=""> <span> 데이터가 없습니다.';
					html +=	'</span>';
					html +=	'</div>';
					html +=	'</a>';
					html +=	'<div class="article-list-item-meta">';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html +=	'</div>';
					html += '</div>';
		    	}else{

		    		for(var i =0, len = list.length||0; i < len; i++){

		    		
			    		html += '<div class="article-list-item">';
						html += '<div class="article-list-item__vote">';
						html +=	'<img src="https:/talk.op.gg/images/icon-vote-up.png" alt>';
						html +=	'<div>'+list[i].answer_number+'</div>';
						html += '</div>';
						html += '<div class="article-list-item__content">';
						html += '<div class="article-list-item__title">';
						html +=	'<a href=""> <span>'+list[i].subj_nm;
						html +=	'</span> <em>[35]</em>';
						html +=	'</div>';
						html +=	'</a>';
						html +=	'<div class="article-list-item-meta">';
						html +=	'<div class="article-list-item-meta__item">'+list[i].ctgr_nm+'</div>';
						html +=	'<div class="article--list-item-meta__item">';
						html += '<span>'+tableService.displayTime(list[i].subj_regdate)+'</span>';
						html +=	'<div class="article-list-item-meta__item">';
						html +=	'<a href="">'+list[i].mb_nick+'</a>';
						html += '</div>';
						html += '</div>';
						html += '</div>';
						html +=	'</div>';
						html +=	'<div class="article-list-item__thumbnail">';
						html +=	'<a href="">';
						html +=	'<img src="https://opgg-com-image.akamaized.net/attach/images/20190722062608.25761.jpg';
						html += '?image=w_200" class="article-list-item__thumbnail" alt>';
						html +=	'</a>';
						html +=	'</div>';
						html += '</div>';
		    		}
			    	html+= '<section class="article-list-paging">';
			    	html+= '<div class="article-list-paging-content">';
			    	html+= '<ul class="article-list-paging-list">';
			    	if (page ==1){
			    		console.log("이게 왜 안뜨지?");
			    	}else{
			    		console.log("이건 나와야되는데 ");
				    	html+= '<li class="article-list-paging__item article-list-paging__item--prev">';
				    	html+= '<button class="article-list-paging__button button" id="start_prev" value="'+page+'">';
				    	html+= '<img src="https://talk.op.gg/images/icon-arrow-left@2x.png" width="24">';
				    	html+= '<span>이전</span>'
				    	html+= '</button>'
				    	html+= '</li>';
			    	}
			    	if(page == Math.ceil(cnt/3.0)){
			    		
			    	}else{
				    	html+= '<li class="article-list-paging__item article-list-paging__item--next">';
				    	html+= '<button class="article-list-paging__button button" id="start_next" value="'+page+'">';
				    	html+= '<span>다음</span>'
				    	html+= '<img src="https://talk.op.gg/images/icon-arrow-right@2x.png" width="24">';
				    	html+= '</button>'
				    	html+= '</li>';
			    	}
			    	html+= '</ul>';
			    	html+= '</div>';
			    	html+= '</section>';
			    	}
				$('section.article-list').html(html);
		    });
		};
		$('.article-list').off('click','#next').on('click','#start_next',function(e){
			 e.preventDefault();
			var page = $(this).val();
			page ++; 
			
			console.log("page : "+$(this).val());
			
			console.log("page++ : "+page);
			showStartList(page);

		});
		 $('.article-list').off('click','#prev').on('click','#start_prev',function(e){
			 e.preventDefault();
			var page = $(this).val();
			page --; 
			console.log("page : "+$(this).val());
			console.log("page++ : "+page);
			showStartList(page);
		});
	});
	
	
	
	$( '.top' ).click( function() {
        $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
        return false;
      } );
	/*$(window).scroll(function(e){
	 if($(document).scrollTop() >= 0 && $(document).scrollTop() < 768){
	 alert("스크롤의 위치가 0~768")
	 }	
	 });*/
	 


	 
	$('.RadioButton').click(function(e) {
		e.preventDefault();
		
			var st = $(this).children().children('input').val();
			var str = $(this).attr('class');

			$(this).prevAll('.RadioButton').children('span').attr('class','jcf-radio jcf-unchecked');
			$(this).nextAll('.RadioButton').children('span').attr('class','jcf-radio jcf-unchecked');

			//$("span[name=1]").attr('class', 'jcf-radio jcf-unchecked');
			$(this).prevAll('.RadioButton').children('label').attr('class',	'Label');
			$(this).nextAll('.RadioButton').children('label').attr('class',	'Label');
			//$(this).children('label').attr('class', 'Label');   ㅎㅎ 이거 알지?
			//$('.RadioButton').children('label').attr('class', 'Label');
			$(this).children().eq(1).attr('class', 'Label jcf-label-active');
			$(this).children().first().attr('class','jcf-radio jcf-checked');
			
			
			var checkLength = $('.RadioButton').children('span.jcft-radio,.jcf-checked').children('input').length;
		    var checkValues = new Array(checkLength);
		    for(var i=0; i<checkLength; i++){                          
		    	checkValues[i] = $('.RadioButton').children('span.jcft-radio,.jcf-checked').children('input')[i].value;
		    }
			//var map1 = $('.RadioButton').children('span.jcft-radio,.jcf-checked').children('input').val();
			//var map2 = $(this).children('span.jcft-radio,.jcf-checked').children('input').val();
			//var map = $('.RadioButton').children('span.class').children('input').val();
			
			
			console.log("1 :"+checkValues[0]);
			console.log("2 :"+checkValues[1]);
			console.log("3 :"+checkValues[2]);
			console.log("4 :"+checkValues[3]);
			console.log("5 :"+checkValues[4]);
			
			
			
			
			//var page =1;
			var page = page || 1;
			
			showList(page);
			
			function showList(page){
			
			    if(checkValues[0]=="전체"){
			    	checkValues[0] = "";
			    }
			    
			    if(checkValues[1]=="전체"){
			    	checkValues[1] = "";
			    }
			    
			    if(checkValues[2]=="전체"){
			    	checkValues[2] = "";
			    }
			    //////나이쪽
			    if (checkValues[3]=="전체"){
			    	var SA = 0;
			    	var EA = 99;
			    }else if (checkValues[3]=="10"){
			    	var SA = 10;
			    	var EA = 19;
			    }else if (checkValues[3]=="20"){
			    	var SA = 20;
			    	var EA = 29;
			    }else if (checkValues[3]=="30"){
			    	var SA = 30;
			    	var EA = 39;
			    }else if (checkValues[3]=="40"){
			    	var SA = 40;
			    	var EA = 49;
			    }else if (checkValues[3]=="50"){
			    	var SA = 50;
			    	var EA = 59;
			    }else if (checkValues[3]=="60"){
			    	var SA = 60;
			    	var EA = 69;
			    }
			    
			    
			    
			    var data = {
			    		ctgr_nm : checkValues[0],
			    		mb_addr : checkValues[1],
			    		mb_sex : checkValues[2],
			    		startAge : SA,
			    		endAge : EA,
			    		stats : checkValues[4],
			    		pageNum : (page||1),
			    		amount : 3				    		
			    }
			    
			    
			    console.log(data);
			    
			    
			    console.log(tableService);
			    
			    
			    tableService.table(data,function(list, cnt){
			    	//<section class="article-list">

			    	var html = '';
			    	if (list.length == 0){
			    		html += '<div class="article-list-item-no-data">';
						html += '<div class="article-list-item__content">';
						html += '<div class="article-list-item__title">';
						html +=	'<a href=""> <span> 데이터가 없습니다.';
						html +=	'</span>';
						html +=	'</div>';
						html +=	'</a>';

						html += '</div>';
						html += '</div>';
						html +=	'</div>';
						html += '</div>';
			    	}else{
			    		for(var i =0, len = list.length||0; i < len; i++){
			    		
				    		html += '<div class="article-list-item">';
							html += '<div class="article-list-item__vote">';
							html +=	'<img src="https:/talk.op.gg/images/icon-vote-up.png" alt>';
							html +=	'<div>'+list[i].answer_number+'</div>';
							html += '</div>';
							html += '<div class="article-list-item__content">';
							html += '<div class="article-list-item__title">';
							html +=	'<a href=""> <span>'+list[i].subj_nm;
							html +=	'</span> <em>[35]</em>';
							html +=	'</div>';
							html +=	'</a>';
							html +=	'<div class="article-list-item-meta">';
							html +=	'<div class="article-list-item-meta__item">'+list[i].ctgr_nm+'</div>';
							html +=	'<div class="article--list-item-meta__item">';
							html += '<span>'+tableService.displayTime(list[i].subj_regdate)+'</span>';
							html +=	'<div class="article-list-item-meta__item">';
							html +=	'<a href="">'+list[i].mb_nick+'</a>';
							html += '</div>';
							html += '</div>';
							html += '</div>';
							html +=	'</div>';
							html +=	'<div class="article-list-item__thumbnail">';
							html +=	'<a href="">';
							html +=	'<img src="https://opgg-com-image.akamaized.net/attach/images/20190722062608.25761.jpg';
							html += '?image=w_200" class="article-list-item__thumbnail" alt>';
							html +=	'</a>';
							html +=	'</div>';
							html += '</div>';
			    		}
			    		if(page == 1 && page == Math.ceil(cnt/3.0)){
			    			
			    		}else{
			    			console.log("뭐지 여기 들어왔나본데?2");
				    		html+= '<section class="article-list-paging">';
					    	html+= '<div class="article-list-paging-content">';
					    	html+= '<ul class="article-list-paging-list">';
					    	if (page ==1){
					    	}else{
					    		console.log("이건 나와야되는데 ");
						    	html+= '<li class="article-list-paging__item article-list-paging__item--prev">';
						    	html+= '<button class="article-list-paging__button button" id="prev" value="'+page+'">';
						    	html+= '<img src="https://talk.op.gg/images/icon-arrow-left@2x.png" width="24">';
						    	html+= '<span>이전</span>'
						    	html+= '</button>'
						    	html+= '</li>';
					    	}
					    	if(page == Math.ceil(cnt/3.0)){
					    		
					    	}else{
						    	html+= '<li class="article-list-paging__item article-list-paging__item--next">';
						    	html+= '<button class="article-list-paging__button button" id="next" value="'+page+'">';
						    	html+= '<span>다음</span>'
						    	html+= '<img src="https://talk.op.gg/images/icon-arrow-right@2x.png" width="24">';
						    	html+= '</button>'
						    	html+= '</li>';
					    	}
					    	html+= '</ul>';
					    	html+= '</div>';
					    	html+= '</section>';
			    		}
			    	}
					$('section.article-list').html(html);
			    });
			};
			
			 $('.article-list').off('click','#next').on('click','#next',function(e){
				 e.preventDefault();
				console.log("다음 눌렸다.");
				//console.log($(this).children().val);
				var page = $(this).val();
				page ++; 
				
				console.log("page : "+$(this).val());
				
				console.log("page++ : "+page);
				showList(page);

			});
			 
			 $('.article-list').off('click','#prev').on('click','#prev',function(e){
				 e.preventDefault();
				console.log("다음 눌렸다.");
				//console.log($(this).children().val);
				var page = $(this).val();
				page --; 
				
				console.log("page : "+$(this).val());
				
				console.log("page++ : "+page);
				showList(page);
			});
		 });
				    /*두번째 ajax 방법
				    $.ajax({
				        type: "POST",
				        url : '/stats/table',
				        data: JSON.stringify(data),
				        dataType : "json",
				        //async: true,
				        contentType : "application/json; charset=UTF-8",
				        success : function(data, status, xhr) {
				        
					            for(var i =0, len = data.length||0; i < len; i++){
						    		console.log(data[i]);
						    	}
					            console.log(data[0]);

					     
					 
				        },
				        error: function(xhr, status, er) {
								console.log(er);
				           
				        }
				    });*/
</script>

>