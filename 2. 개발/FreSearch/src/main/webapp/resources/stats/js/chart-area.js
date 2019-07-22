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
var timerID;
var html = '';
var area ='';
$(document).ready(function () {
	$("input[name=1]").click(function(e) {
		console.log("버튼 눌렸다.");
		
		
		area = $(this).val();
		html = area;
		html += '<code>지역</code>';
		$("#area").html(html);
		console.log(html);
		console.log(area);
		updateData();
	});
});
		function updateData(){
			$.getJSON('/stats/get/' + area, function(data) {
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
			//timerID = setTimeout("updateData()", 2000);
		}
	


