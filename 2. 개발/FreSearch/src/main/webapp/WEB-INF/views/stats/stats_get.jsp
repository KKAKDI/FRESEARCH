<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/stats/css/chart.css">



<%@include file="../includes/header.jsp"%>





<!--  op.gg 테이블 벤치마킹 -->
<!-- 
	<div class="ContentWrap">
		<div class="Content">
			<div class="Box">
				<div class="Content">
					<div id="ChampionStatsTable">
						<table class="GetTable table" role="grid">
							<colgroup>
								<col width="50">
								<col width="130">
								<col width="173">
								<col width="173">
								<col width="133">
								<col width="133">
								<col width="133">
							</colgroup>
							<thead class="Header">
								<tr class="Row table" role="row">
									<th class="HeaderCell Rank tablesorter-header tablesorter-headerUnSorted" data-column="0" 
									tabindex="0" scope="col" role="columnheader" 
									aria-disabled="false" unselectable="on" aria-sort="none" 
									aria-label="#: No sort applied, activate to apply an ascending sort" style="user-select: none;">
										<div class="tablesorter-header-inner">#
										</div>
									</th>
									
									<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" colspan="1" 
									data-column="1" tabindex="0" scope="col" role="columnheader" aria-disabled="false" 
									unselectable="on" aria-sort="none" aria-label="챔피언: No sort applied, activate to apply a descending sort" 
									style="user-select: none;">
										<div class="tablesorter-header-inner">아이템
										</div>
									</th>
									
									<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="3" tabindex="0" 
									scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
									aria-label="승률: No sort applied, activate to apply a descending sort" style="user-select: none;">
										<div class="tablesorter-header-inner">답변자 백분율
										</div>
									</th>
									
									<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="4" 
									tabindex="0" scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
									aria-label="플레이수: No sort applied, activate to apply a descending sort" style="user-select: none;">
										<div class="tablesorter-header-inner">답변자 수
										</div>
									</th>
									
									<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="5" tabindex="0" 
									scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
									aria-label="평점: No sort applied, activate to apply a descending sort" style="user-select: none;">
										<div class="tablesorter-header-inner">평점
										</div>
									</th>
									
									<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="6" tabindex="0" 
									scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
									aria-label="CS: No sort applied, activate to apply a descending sort" style="user-select: none;">
										<div class="tablesorter-header-inner">CS
										</div>
									</th>
								</tr>
							</thead>
							<tbody class="Content" aria-live="plite" aria-relevant="all">
								<tr class="Row Top" role="row">
									<td class="Cell Rank">1
									</td>
									<td class="Cell ChampionName">
										<span>결혼 하셨습니까?</span>
									</td>
									<td class="Cell" data-value="53.988620395752">
										<div class="Progress Blue" style="width: 39.064719%"></div>
										<span class="Value">53.99%</span>
									</td>
									<td class="Cell">
										43,411
									</td>
									<td class="Cell KDARatio" data-value="1.9">
										<span class="Ratio">1.9:1</span>
									</td>
									<td class="Cell">
										<div class="Progress Green" style="width: 55.397487124358%"></div>
										<span class="Value Green">187.32</span>
									</td>
									<td class="Cell">
										<div class="Progress Orange" style="width: 54.919277080787%"></div>
										<span class="Value Orange">11,380</span>
									</td>
								</tr>
								<tr class="Row Top" role="row">
									<td class="Cell Rank">2</td>
									<td class="Cell ChampionName">
										<a href="/champion/Jinx/" target="_blank">키가 몇 cm 입니까ㅇㄴㄻㄴㅇㄹㄴㄹㄹ</a>
									</td>
									<td class="Cell" data-value="53.295128261014">
										<div class="Progress Blue" style="width: 71.910031003373%"></div>
										<span class="Value">53.30%</span>
									</td>
									<td class="Cell">
										422,108
									</td>
									<td class="Cell KDARatio" data-value="2.58">
													<span class="Ratio">2.58:1</span>
									</td>
									<td class="Cell">
										<div class="Progress Green" style="width: 56.173098868095%"></div>
										<span class="Value Green">189.94</span>
									</td>
									<td class="Cell">
										<div class="Progress Orange" style="width: 58.0665473105%"></div>
										<span class="Value Orange">12,032</span>
									</td>
								</tr>
								
								
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	 -->
	






<!--  여기서 부터는 구글 양식이다-->
<div class="google-content">
	<div class="google">
		<div class="google-shadow"> 
	
		
			<div class="content-top">
				<div class="top-top">
					<span>응답 10명</span>
				</div> 
			</div> 
		
		
		
			<div class="shadow"> 
				<div class="google-1">
					<div class="sumerry">
						<div class="sumerry-google">
							<div class="first-text">
								<div class="first-text-children"> 
									<div class="hoho"> 
										<span>결혼 하셨습니까?</span> 
										<span class="what">응답 5개</span>
									</div>
								</div>
								<div class="opacity">
								</div>
							</div>
							<div class="first-text-text">
							
							
<div class="security">
							
							<!-- 테이블 -->
	<div class="ContentWrap">
		<div class="Content">
			<div class="Box">
				<div class="Content">
					<div id="ChampionStatsTable">
						<table class="GetTable table" role="grid">
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="10%"> 
							</colgroup>
							<thead class="Header"> 
								<tr class="Row table" role="row">
									<th class="HeaderCell Rank tablesorter-header tablesorter-headerUnSorted" data-column="0" 
									tabindex="0" scope="col" role="columnheader" 
									aria-disabled="false" unselectable="on" aria-sort="none" 
									aria-label="#: No sort applied, activate to apply an ascending sort" style="user-select: none;">
										<div class="tablesorter-header-inner">#
										</div>
									</th> 
									
									<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" colspan="1" 
									data-column="1" tabindex="0" scope="col" role="columnheader" aria-disabled="false" 
									unselectable="on" aria-sort="none" aria-label="챔피언: No sort applied, activate to apply a descending sort" 
									style="user-select: none;">
										<div class="tablesorter-header-inner">아이템
										</div>
									</th>
									
									<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="3" tabindex="0" 
									scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
									aria-label="승률: No sort applied, activate to apply a descending sort" style="user-select: none;">
										<div class="tablesorter-header-inner">답변자 백분율
										</div>
									</th>
									
									<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="4" 
									tabindex="0" scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
									aria-label="플레이수: No sort applied, activate to apply a descending sort" style="user-select: none;">
										<div class="tablesorter-header-inner">답변자 수
										</div>
									</th>
									
									<!-- <th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="5" tabindex="0" 
									scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
									aria-label="평점: No sort applied, activate to apply a descending sort" style="user-select: none;">
										<div class="tablesorter-header-inner">평점
										</div>
									</th>
									
									<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="6" tabindex="0" 
									scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
									aria-label="CS: No sort applied, activate to apply a descending sort" style="user-select: none;">
										<div class="tablesorter-header-inner">CS
										</div>
									</th>
									 -->
								</tr>
							</thead>
							<tbody class="Content" aria-live="plite" aria-relevant="all">
								<tr class="Row Top" role="row">
									<td class="Cell Rank">1
									</td>
									<!-- <td class="Cell ChampionImage">
									</td> -->
									<td class="Cell ChampionName">
										<span>결혼 하셨습니까?</span>
									</td>
									<td class="Cell" data-value="53.988620395752">
										<div class="Progress Blue" style="width: 39.064719%"></div>
										<span class="Value">53.99%</span>
									</td>
									<td class="Cell">
										43,411
									</td>

									
								</tr>
								<tr class="Row Top" role="row">
									<td class="Cell Rank">2</td>
									<td class="Cell ChampionName">
										<a href="/champion/Jinx/" target="_blank">키가 몇 cm 입니까ㅇㄴㄻㄴㅇㄹㄴㄹㄹ</a>
									</td>
									<td class="Cell" data-value="53.295128261014">
										<div class="Progress Blue" style="width: 71.910031003373%"></div>
										<span class="Value">53.30%</span>
									</td>
									<td class="Cell">
										422,108
									</td>
			
								</tr>
								
								
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	
	<!-- /테이블  -->
							</div>
						</div> 
					</div>
				</div> 
			</div>
		
			<div class="shadow">
				<div class="google-1">
					<div class="sumerry">
						<div class="sumerry-google">
							<div class="first-text">
								<div class="first-text-children">
									<div class="hoho">
										<span>집은 전세입니까?</span> 
										<span class="what">응답 10개</span>
									</div>
								</div>
								<div class="opacity">
								</div>
							</div>
							<div class="first-text-text">
							</div>
						</div> 
					</div>
				</div> 
			</div>
			
			
			<div class="shadow">
				<div class="google-1">
					<div class="sumerry">
						<div class="sumerry-google">
							<div class="first-text">
								<div class="first-text-children">
									<div class="hoho">
										<span>롤 티어는 어디입니까?</span> 
										<span class="what">응답 15개</span>
									</div>
								</div>
								<div class="opacity">
								</div>
							</div>
							<div class="first-text-text">
							</div>
						</div> 
					</div>
				</div> 
			</div>
			
			
			<div class="shadow">
				<div class="google-1">
					<div class="sumerry">
						<div class="sumerry-google">
							<div class="first-text">
								<div class="first-text-children">
									<div class="hoho">
										<span>강아지를 키우십니까?</span> 
										<span class="what">응답 0개</span>
									</div>
								</div> 
								<div class="opacity">
								</div> 
							</div>
							<div class="first-text-text">
							</div>
						</div> 
					</div>
				</div> 
			</div>

		</div>
	</div>
</div>


<%@include file="../includes/footer.jsp"%>



