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
					<span id="hi">응답 10명 </span> <span class="what" id="what">${list[0].ctgr_nm}</span>

				</div>
			</div>
			<div class="start">
			</div>













<!--   
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
 <!-- 
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
 			</div>
<!-- 테이블 끝 -->   










	</div>
</div>
</div>



<script src="/resources/stats/js/chartMy.js"></script>
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
			json.item_img = "${info.item_img}";
			json.qst_type = "${info.qst_type}"; 
			json.qst_content = "${info.qst_content}";
			json.item_content = "${info.item_content}";
			json.asw_content = "${info.asw_content}";
			json.percent = "${info.percent}";
			json.subj_startdate = "${info.subj_startdate}";
			json.subj_enddate = "${info.subj_enddate}"; 
			json.item_regdate = "${info.item_regdate}";
			result.push(json);
		</c:forEach>
		//var json = JSON.stringify(result);
		var count = 0;
		var html = '';
		for (var i = 0, len = result.length || 0; i < len; i++) {
/*  		if (result[0].qst_code == result[i].qst_code) {
				console.log("result :" + result[i].asw_content);
				count += Number(result[i].asw_content);
			}  */
			if(result[i].qst_type == 0){
				if(((i!=0)&&(result[i].qst_content!=result[i-1].qst_content))||(i==0)){
					console.log("1");
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html += '<div class="shadow">';
					html += '<div class="google-1">';
					html += '<div class="sumerry">';
					html += '<div class="sumerry-google">';
					html += '<div class="first-text">';
					html += '<div class="first-text-children">';
					html += '<div class="hoho">';
					html += '<span>'+result[i].qst_content+'</span>';
					html += '<span class="what">객관식</span>'
					html += '</div>';
					html += '</div>';
					html += '<div class="opacity"></div>';
					html += '</div>';
				}
				console.log("2");
					
					console.log("#result : "+result[0].item_img);
					html += '<div class="first-text-text">';
					console.log("result["+i+"].item_img : "+result[i].item_img);
					
					//html += '<c:out value="${list[0].item_img}"/>';
					
					html += '<img class="img" src="../resources/upload/'+result[i].item_img+'"/>';
					html += '<div class="security">';
					html += '<div class="ContentWrap">';
					html += '<div class="Content">'; 
					html += '<div class="Box">';
					html += '<div class="Content">';
					html += '<div id="ChampionStatsTable">';
					html += '<table class="GetTable-Mp table" role="grid">';
					html += '<colgroup>';
					html += '<col width="30%">';
					html += '<col width="20%">';
					html += '<col width="10%">';
					html += '</colgroup>';
					html += '<thead class="Header">';
					html += '<tr class="Row table" role="row">';
					html += '</tr>';
					html += '</thead>';
					html += '<tbody class="Content" aria-live="plite" aria-relevant="all">';
					html += '<tr class="Row Top" role="row">';
					html += '<td class="Cell-Top ChampionName"><span>'+result[i].item_content+'</span></td>';
					html += '<td class="Cell-Top" data-value="53.988620395752">';
					html += '<div class="Progress Blue" style="width: '+result[i].percent+'"></div>';
					html += ' <span class="Value">'+result[i].percent+'</span>';
					html += '</td>';  
					html += '<td class="Cell-Top">'+result[i].asw_content+'</td>';
					html += '</tr>';
					
					html += '</tbody>';
					html += '</table>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
					html += '</div>';
				
			}else{
				if(((i!=0)&&(result[i].qst_content!=result[i-1].qst_content))||(i==0)){
				console.log("3");
			//////////////////////////////////곧 지워져야된다///////////////////////////////
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '<div class="shadow">';
				html += '<div class="google-1">';
				html += '<div class="sumerry">';
				html += '<div class="sumerry-google">';
				html += '<div class="first-text">';
				html += '<div class="first-text-children">';
				html += '<div class="hoho">';
				html += '<span>'+result[i].qst_content+'</span>';
				html += '<span class="what">주관식</span>' 
				html += '</div>';
				html += '</div>';
				html += '<div class="opacity"></div>';
				html += '</div>';
				
			console.log("4");
				
				html += '<div class="first-text-text">';
				html += '<div class="security">';
				html += '<div class="ContentWrap">';
				html += '<div class="Content">';
				html += '<div class="Box">';
				html += '<div class="Content">';
				html += '<div id="ChampionStatsTable">';
				html += '<table class="GetTable-Mp table" role="grid">';
				html += '<colgroup>';
				html += '<col width="100%">';
				html += '</colgroup>';
				html += '<tbody class="Content" aria-live="plite" aria-relevant="all">';
				}
				//////////////////////////
				html += '<tr class="Row Top" role="row">';
				html += '<td class="Cell-Oven ChampionName"><span>'+result[i].item_content+'</span></td>';
				html += '</tr>';
				//////////////////////////
				html += '</tbody>';
				html += '</table>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
				html += '</div>';
			}
	/////////////////////////////////////////////////////////////////////////////////////////////
		}
		console.log("5");
			
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		$('.start').html(html);
		count = result[0].subj_nm;
		$("#hi").html(count);
		var what = result[0].ctgr_nm; //+ "  "+result[0].subj_startdate+"              "+tableService.displayTime(result[0].subj_startdate)+"~"+tableService.displayTime(result[0].subj_enddate);
		$("#what").html(what);
	});
	
	
	
	
	
	
	
	
	
</script>




<%@include file="../includes/footer.jsp"%>