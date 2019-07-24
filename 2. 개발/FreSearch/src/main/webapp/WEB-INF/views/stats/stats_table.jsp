<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="../includes/header.jsp"%>
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
						<label> <select name="target"
							class="sub-header-search__select">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="title+writer">제목 + 작성자</option>
						</select>
						</label> <input type="text" name="q" class="sub-header-search__input"
							placeholder="검색">
					</form>
					<button class="sub-header-search__button">
						<img src="https://talk.op.gg/images/icon-search@2x.png" width="24"
							alt="검색">
					</button>
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
									<td class="HeaderCell">지역</td>
									<td class="HeaderCell">성별</td>
									<td class="HeaderCell">나이</td>
									<td class="HeaderCell">결혼</td>
									<td class="HeaderCell">상태</td>
								</tr>
							</thead>
							<tbody class="Content"></tbody>
							<tr class="Row">
								<td class="Cell">
									<div class="ButtonWrap">
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-checked" name="1"> <input
												type="radio" name="type" id="seoul" value="전체" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label jcf-label-active">전체</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" id="seoul" value="서울" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">서울</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="부산" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">부산</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="대구" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">대구</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="인천" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">인천</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="광주" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">광주</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="대전" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">대전</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="울산" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">울산</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="세종" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">세종</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="경기" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">경기</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="강원" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">강원</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="충북" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">충북</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="충남" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">충남</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="전북" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">전북</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="전남" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label for="win" class="Label">전남</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="경북" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">경북</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="경남" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">경남</label>
										</div>
										<div id="rate_win" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" value="제주" class="Radio"
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label class="Label">제주</label>
										</div>
										<!-- <div id="rate_win_asc" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" id="lose" value="lose"
												class="Radio" style="position: absolute; opacity: 0;">
												<span></span>
											</span> <label for="lose" class="Label">낮은 승률</label>
										</div>
										<div id="rate_pick" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="type" id="picked" value="piced"
												class="Radio" checked
												style="position: absolute; opacity: 0;"> <span></span>
											</span> <label for="picked" class="Label">게임당 픽률</label>
										</div>
										<div id="rate_ban" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
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
											<span class="jcf-radio jcf-checked" name="1"> <input
												type="radio" name="league" id="all" value="전체" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label jcf-label-active">전체</label>
										</div>

										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="league" id="all" value="남자" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">남자</label>
										</div>
										<div id="tier_iron" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="league" id="iron" value="여자"
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
											<span class="jcf-radio jcf-checked" name="1"> <input
												type="radio" name="league" id="all" value="전체" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label jcf-label-active">전체</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="league" id="all" value="10" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">10대</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="league" id="all" value="20" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">20대</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="league" id="all" value="30" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">30대</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="league" id="all" value="40" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">40대</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="league" id="all" value="50" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">50대</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
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
											<span class="jcf-radio jcf-checked" name="1"> <input
												type="radio" name="league" id="all" value="전체" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label jcf-label-active">전체</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="league" id="all" value="기혼" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">기혼</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="league" id="all" value="미혼" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">미혼</label>
										</div>
									</div>
								</td>


								<td class="Cell">
									<div class="ButtonWrap">
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-checked" name="1"> <input
												type="radio" name="league" id="all" value="전체" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label jcf-label-active">전체</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="league" id="all" value="대기" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">대기</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
												type="radio" name="league" id="all" value="진행중" class="Radio"
												style="position: absolute; opacity: 0;"><span></span>
											</span><label class="Label">진행중</label>
										</div>
										<div id="tier_all" class="RadioButton">
											<span class="jcf-radio jcf-unchecked" name="1"> <input
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

						<!-- 여기서부터  -->
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
						<!-- 여기까지가 한 블럭  -->




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


						<section class="article-list-paging">
							<div class="article-list-paging-content">
								<ul class="article-list-paging-list">
									<li
										class="article-list-paging__item article-list-paging__item--prev">
										<a href="" class="article-list-paging__button button"> <img
											src="https://talk.op.gg/images/icon-arrow-left@2x.png"
											width="24"> <span>이전</span>
									</a>
									</li>
									<li
										class="article-list-paging__item article-list-paging__item--next">
										<a href="" class="article-list-paging__button button"> <span>다음</span>
											<img src="https://talk.op.gg/images/icon-arrow-right@2x.png"
											width="24">
									</a>
									</li>
								</ul>
							</div>
						</section>








					</section>

				</div>
			</div>

		</div>
	</div>
</div>





<script type="text/javascript">
	$(document)
			.scroll(
					function() {
						/*setInterval(function() {
							console.log("현재 스크롤 위치는 : " + $(document).scrollTop());

						}, 1);*/

						if ($(document).scrollTop() >= 69) {

							$('.sub-link').attr('class',
									'sub-link scroll-to-fixed-fixed');
							$('.sub-link')
									.attr(
											'style',
											'z-index: 1000; position: fixed; top: 109px; margin-left: 0px; width: 719px; left: 400.6px;');
							$('.sub-link')
									.next()
									.first()
									.attr('style',
											'display: block; width: 728px; height: 48px; float: none;');
						} else {
							$('.sub-link').attr('class', 'sub-link');
							$('.sub-link')
									.attr('style',
											'z-index: auto; position: static; top: autol');
							$('.sub-link')
									.next()
									.first()
									.attr('style',
											'display: none; width: 728px; height: 48px; float: none;');
						}

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

	$('.RadioButton').click(
			function(e) {
				var st = $(this).children().children('input').val();
				console.log("이거 나와봐" + st);
				var str = $(this).attr('class');
				console.log("현재 누른 버튼" + str);

				$(this).prevAll('.RadioButton').children('span').attr('class',
						'jcf-radio jcf-unchecked');
				$(this).nextAll('.RadioButton').children('span').attr('class',
						'jcf-radio jcf-unchecked');

				//$("span[name=1]").attr('class', 'jcf-radio jcf-unchecked');
				$(this).prevAll('.RadioButton').children('label').attr('class',
						'Label');
				$(this).nextAll('.RadioButton').children('label').attr('class',
						'Label');
				//$(this).children('label').attr('class', 'Label');   ㅎㅎ 이거 알지?
				//$('.RadioButton').children('label').attr('class', 'Label');
				$(this).children().eq(1)
						.attr('class', 'Label jcf-label-active');
				$(this).children().first().attr('class',
						'jcf-radio jcf-checked');
			});
	/*$(document).ready(function() {
		$("input[name=type]").click(function(e) {
			console.log("버튼 눌렸다.");
			area = $(this).val();
			console.log(area);
		
		});
		$("#win.Radio").click(function(){
			console.log("버튼 연습 ㅜㅜ");
			var st = $(this).val();
			console.log(st);
		});
		
	});
	 $(document).ready(function(){
	 $("input[name=type]").click(function(){
	 var st = $(this).val();
	 console.log("벨류 값 나와라!! : "+st);
	 });
	 var st = $(":input:radio[name=type]:checked").val();
	 console.log("벨류 값 나와라 : "+st);
	 });
	 */
</script>