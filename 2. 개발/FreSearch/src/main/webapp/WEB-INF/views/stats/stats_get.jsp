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
			<div class="start"></div>
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
			json.asw_count = "${info.asw_count}";
			result.push(json);
		</c:forEach>
		
		var resultS = new Array();
		<c:forEach items="${listS}" var="info">
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
			json.asw_count = "${info.asw_count}";
			resultS.push(json);
		</c:forEach>
		var count = 0;
		var html = '';
		
		for (var i = 0, len = result.length || 0; i < len; i++) {
		
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
					
					html += '<div class="first-text-text">';
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
					html += '<td class="Cell-Top">'+result[i].asw_count+'</td>';
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
				for(var j =0; j<resultS.length; j++){
					if((result[i].qst_content==resultS[j].qst_content)&&(j%2==0)){
						console.log("4-1");
						html += '<tr class="Row Top" role="row">';
						html += '<td class="Cell-Oven ChampionName"><span>'+resultS[j].asw_content+'</span></td>';
						html += '</tr>';
					}else if((result[i].qst_content==resultS[j].qst_content)&&(j%2==1)){
						console.log("4-2");
						html += '<tr class="Row Top" role="row">';
						html += '<td class="Cell ChampionName"><span>'+resultS[j].asw_content+'</span></td>';
						html += '</tr>';
					}
				}
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
		} 
		console.log("5"); 
			
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		$('.start').html(html);
		count = result[0].subj_nm;
		$("#hi").html(count);
		var what = result[0].ctgr_nm+"                ("+<c:out value="${count}"/>+"명 응답)"; //+ "  "+result[0].subj_startdate+"              "+tableService.displayTime(result[0].subj_startdate)+"~"+tableService.displayTime(result[0].subj_enddate);
		$("#what").html(what);
	});
</script>

<%@include file="../includes/footer.jsp"%>