/*$(document).ready(function () {
	$("input[name=1]").click( function(){
		console.log("버튼 눌렸다.");
		var html='';
		var area = $(this).val();
		html = area;
		html += '<code>지역</code>';
		$("#area").html(html);
		console.log(html);
		console.log(area);
 */

// 지역별 카테고리 갯수 구하는 리스트
var timerID;
var html = '';
var area = '';
$(document).ready(function() {
	$("input[name=1]").click(function(e) {
		console.log("버튼 눌렸다.");

		area = $(this).val();
		html = area;
		html += '<code>지역</code>';
		$("#area").html(html);
		console.log(html);
		console.log(area);
		updateDataArea();
	});
});
function updateDataArea() {
	$.getJSON('/stats/get/area/' + area, function(data) {
		var html = '';
		var total = 0;

		html += '<thead>';
		html += '<tr>';
		html += '<th>카테고리</th>';
		html += '<th>참여자 수</th>';
		html += '<th>퍼센트</th>';
		html += '</tr>';
		html += '</thead>';
		html += '<tbody>';
		html += '<tr>';
		html += '</tr>';
		$.each(data, function(entryIndex, entry) {
			html += '<tr>';
			html += '<td>' + entry.ctgr_nm + '</td>';
			html += '<td id="fix">' + entry.count + '명</td>';
			html += '<td id="fix">' + entry.percent + '</td>';
			html += '</tr>';
			total += entry.count;

		});
		html += '<tr>';
		html += "<td id='fix1'>총합</td>";
		html += '<td id="fix1">' + total + '명</td>';
		html += '<td id="fix1"> 100%</td>';
		html += '</tr>';
		$('#test').html(html);
	});
	//timerID = setTimeout("updateDataArea()", 2000);
}


//나이별 카테고리 갯수 구하는 리스트
var timerID;
var html = '';
var age = '';
$(document).ready(function() {
	
	$("input[name=2]").click(function(e) {
		console.log("버튼 눌렸다.");

		age = $(this).val();
		html = age;
		html += '<code>나이</code>';
		$("#area").html(html);
		console.log(html);
		console.log(age);
		updateDataAge();
	});
});
function updateDataAge() {
	$.getJSON('/stats/get/age/' + age, function(data) {
		var html = '';
		var total = 0;

		html += '<thead>';
		html += '<tr>';
		html += '<th>카테고리</th>';
		html += '<th>참여자 수</th>';
		html += '<th>퍼센트</th>';
		html += '</tr>';
		html += '</thead>';
		html += '<tbody>';
		html += '<tr>';
		html += '</tr>';
		$.each(data, function(entryIndex, entry) {
			html += '<tr>';
			html += '<td>' + entry.ctgr_nm + '</td>';
			html += '<td id="fix">' + entry.count + '명</td>';
			html += '<td id="fix">' + entry.percent + '</td>';
			html += '</tr>';
			total += entry.count;

		});
		html += '<tr>';
		html += "<td id='fix1'>총합</td>";
		html += '<td id="fix1">' + total + '명</td>';
		html += '<td id="fix1"> 100%</td>';
		html += '</tr>';
		$('#test').html(html);
	});
	//timerID = setTimeout("updateDataAge()", 2000);
}


/////////////////성별  카테고리 갯수 구하는 리스트
var timerID;
var html = '';
var age = '';
$(document).ready(function() {
	
	$("input[name=3]").click(function(e) {
		console.log("버튼 눌렸다.");

		sex = $(this).val();
		html = sex;
		html += '<code>성별</code>';
		$("#area").html(html);
		console.log(html);
		console.log(sex);
		updateDataSex();
	});
});
function updateDataSex() {
	$.getJSON('/stats/get/sex/' + sex, function(data) {
		var html = '';
		var total = 0;

		html += '<thead>';
		html += '<tr>';
		html += '<th>카테고리</th>';
		html += '<th>참여자 수</th>';
		html += '<th>퍼센트</th>';
		html += '</tr>';
		html += '</thead>';
		html += '<tbody>';
		html += '<tr>';
		html += '</tr>';
		$.each(data, function(entryIndex, entry) {
			html += '<tr>';
			html += '<td>' + entry.ctgr_nm + '</td>';
			html += '<td id="fix">' + entry.count + '명</td>';
			html += '<td id="fix">' + entry.percent + '</td>';
			html += '</tr>';
			total += entry.count;

		});
		html += '<tr>';
		html += "<td id='fix1'>총합</td>";
		html += '<td id="fix1">' + total + '명</td>';
		html += '<td id="fix1"> 100%</td>';
		html += '</tr>';
		$('#test').html(html);
	});
	//timerID = setTimeout("updateDataAge()", 2000);
}


/////////////////결혼 유무 카테고리 갯수 구하는 리스트
var timerID;
var html = '';
var marriage = '';
$(document).ready(function() {

	$("input[name=4]").click(function(e) {
		console.log("버튼 눌렸다.");

		marriage = $(this).val();
		html = marriage;
		html += '<code>결혼 유무</code>';
		$("#area").html(html);
		console.log(html);
		console.log(marriage);
		updateDataMarriage();
	});
});
function updateDataMarriage() {
	$.getJSON('/stats/get/marriage/' + marriage, function(data) {
		var html = '';
		var total = 0;

		html += '<thead>';
		html += '<tr>';
		html += '<th>카테고리</th>';
		html += '<th>참여자 수</th>';
		html += '<th>퍼센트</th>';
		html += '</tr>';
		html += '</thead>';
		html += '<tbody>';
		html += '<tr>';
		html += '</tr>';
		$.each(data, function(entryIndex, entry) {
			html += '<tr>';
			html += '<td>' + entry.ctgr_nm + '</td>';
			html += '<td id="fix">' + entry.count + '명</td>';
			html += '<td id="fix">' + entry.percent + '</td>';
			html += '</tr>';
			total += entry.count;

		});
		html += '<tr>';
		html += "<td id='fix1'>총합</td>";
		html += '<td id="fix1">' + total + '명</td>';
		html += '<td id="fix1"> 100%</td>';
		html += '</tr>';
		$('#test').html(html);
	});
	//timerID = setTimeout("updateDataAge()", 2000);
}



