<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/stats/css/chart.css">
<%@include file="../includes/header.jsp"%>











<!--  여기서 부터는 구글 양식이다-->
<div class="google-content">
	<div class="google">
		<div class="google-shadow">


			<div class="content-top">
				<div class="top-top">

					<span id="hi">응답 10명 </span> <span class="what">${list[0].ctgr_nm}</span>

				</div>
			</div>


			<!--         여기부터                                한블럭                                -->

			<c:set var="qst_code" value="0" />

			<!--         여기부터                                한블럭                                -->
			<c:forEach items="${list}" var="result" varStatus="status">
				<c:if test="${result.qst_code ne qst_code}">
					<div class="shadow">
						<div class="google-1">
							<div class="sumerry">

								<div class="sumerry-google">
									<div class="first-text">
										<div class="first-text-children">
											<div class="hoho">
												<span>${result.qst_content}</span>
												<!-- <span class="what">응답 5개</span> -->
											</div>
										</div>
										<div class="opacity"></div>
									</div>
									<c:forEach items="${list}" var="result1" varStatus="status">

										<c:if test="${qst_code == '0'}">
											<c:set var="qst_code" value="${list[0].qst_code}" />
										</c:if>
										<c:if test="${result1.qst_code ne qst_code1}">
											<c:if test="${result1.qst_code eq result.qst_code}">
												<div class="first-text-text">
													<div class="security">
														<div class="ContentWrap">
															<div class="Content">
																<div class="Box">

																	<div class="Content">
																		<div id="ChampionStatsTable">
																			<table class="GetTable-Mp table" role="grid">
																				<colgroup>
																					<col width="30%">
																					<col width="20%">
																					<col width="10%">
																				</colgroup>
																				<thead class="Header">
																					<tr class="Row table" role="row">
																					</tr>
																				</thead>
																				<tbody class="Content" aria-live="plite"
																					aria-relevant="all">
																					<tr class="Row Top" role="row">
																						<td class="Cell-Top ChampionName"><span>${result1.item_content}</span></td>
																						<td class="Cell-Top" data-value="53.988620395752">
																							<div class="Progress Blue"
																								style="width: ${result1.percent}"></div> <span
																							class="Value">${result1.percent}</span>
																						</td>
																						<td class="Cell-Top">${result1.asw_content}</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:if>
										</c:if>




									</c:forEach>
									<c:set var="qst_code1" value="${result1.qst_code}" />


								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:set var="qst_code" value="${result.qst_code}" />
			</c:forEach>





			<!--         여기까지                               한블럭                                -->

















			<div class="shadow">
				<div class="google-1">
					<div class="sumerry">
						<div class="sumerry-google">
							<div class="first-text">
								<div class="first-text-children">
									<div class="hoho">
										<span>집은 전세입니까?</span> <span class="what">응답 10개</span>
									</div>
								</div>
								<div class="opacity"></div>
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
																<col width="100%">
															</colgroup>
															<tbody class="Content" aria-live="plite"
																aria-relevant="all">
																<tr class="Row Top" role="row">
																	<td class="Cell-Oven ChampionName"><span>결혼
																			하셨습니까?</span></td>
																</tr>
																<tr class="Row Top" role="row">
																	<td class="Cell ChampionName"><span>키가 몇 cm
																			입니까ㅇㄴㄻㄴㅇㄹㄴㄴㅇㄹㄴㄹㄹ</span></td>
																</tr>



															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
 							</div>
 						</div>
 					</div>
 				</div>
<!-- 테이블 끝 -->








		</div>
	</div>
</div>
</div>




<script type="text/javascript">
	$(document).ready(function() {
		var result = new Array();
		<c:forEach items="${list}" var="info">
		var json = new Object();
		json.subj_code = "${info.subj_code}";
		json.qst_code = "${info.qst_code}";
		json.item_code = "${info.item_code}";
		json.ctgr_nm = "${info.ctgr_nm}";
		json.subj_nm = "${info.subj_nm}";
		json.qst_content = "${info.qst_content}";
		json.item_content = "${info.item_content}";
		json.asw_content = "${info.asw_content}";
		json.percent = "${info.percent}";
		json.subj_startdate = "${info.subj_startdate}";
		json.subj_enddate = "${info.subj_enddate}";
		json.item_regdate = "${info.item_regdate}";
		result.push(json);
		</c:forEach>

		var json = JSON.stringify(result);
		var count = 0;
		for (var i = 0, len = result.length || 0; i < len; i++) {
			if (result[0].qst_code == result[i].qst_code) {
				console.log("result :" + result[i].asw_content);
				count += Number(result[i].asw_content);
			}
		}
		count += " 명";
		$("#hi").html("응답 " + count);

	});
</script>




<%@include file="../includes/footer.jsp"%>



