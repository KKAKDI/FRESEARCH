
///////////////////stats_list 쪽 모달 창///////////////////////////
function zipJSON(val){
	var url ='';
	var mainTag='';
	var smallTag='';
	if (val=='전체'||val=='서울'||val=='인천'||val=='부산'||val=='경기'){
		url = 'area';
		mainTag='AREA';
		smallTag='지역';
	}else if(val=="10대" || val=="20대" || val=="30대" || val=="40대" || val=="50대"){
		url = 'age';
		mainTag='AGE';
		smallTag='나이';
	}else if(val=="남자" || val=="여자"){
		url = 'sex';
		mainTag='SEX';
		smallTag="성별";
	}else if(val=="기혼" || val=='미혼'){
		url ='marriage';
		mainTag='MARRIAGE';
		smallTag='결혼 유무';
	}
	$.getJSON('/stats/get/'+url+'/'+val, function(data){
		var html ='';
		var total = 0;
		
		html += '<div class="card-body-jss">';
		
		html += '<h4 class="card-title-jss">'+mainTag+'</h4>';
		html += '<p class="card-description-jss" id="change">';
		html += val;
		html += '<code>'+smallTag+'</code>';
		html += '</p>';
		if(mainTag=='AREA'){
			html += '<div class="btn-group" role="group" aria-label="Basic example">';
			html += '<input type="button" class="btn btn-outline-secondary-all button-in" value="전체">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" value="서울">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" value="인천">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" value="부산">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" value="경기">';
			
		}else if(mainTag=='AGE'){
			html += '<div class="btn-group" role="group" style="margin-left: 38px;" aria-label="Basic example">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" name="1" value="10대">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" name="2" value="20대">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" name="3" value="30대">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" name="4" value="40대">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" name="5" value="50대">';
		}else if(mainTag =='SEX'){
			html += '<div class="btn-group" role="group" aria-label="Basic example" style="margin: 0 auto;width: 150px;display: flex;">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" value="남자">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" value="여자">';
		}else if(mainTag =='MARRIAGE'){
			html += '<div class="btn-group" role="group" aria-label="Basic example" style="margin: 0 auto; width: 148px; display: flex;">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" value="기혼">';
			html += '<input type="button" class="btn btn-outline-secondary button-in" value="미혼">';
		}
		html += '</div>';
		html += '<div class="table-responsiv">';
		html += '<table class="table table-hover" id="test">';
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
		html += "<td id='fix1' style='padding-right: unset;'>총합</td>";
		html += '<td id="fix1">' + total + '명</td>';
		html += '<td id="fix1"> 100%</td>';
		html += '</tr>';
		
		html += '</table>';
		html += '</div>';
		html += '</div>';
		$('.modal-content').html(html);
	});
};
$(document).on('click','.button-in',function(){
	var val = $(this).val();
		zipJSON(val)
});
///////////////////지금 작업중인 통합 코드///////////////////////////







var tableService = (function() {
	//첫 stats_table 페이지 and 셀렉트 박스 클릭후 페이지
	function table(data, callback, error) {
		
		$.ajax({
			type : "POST",
			url : '/stats/table/' + data.pageNum +'/'+ data.amount,
			data : JSON.stringify(data),
			dataType : "json",
			//async: true,
			contentType : "application/json; charset=UTF-8",
			success : function(result, status, xhr) {
				if (callback) {
					//callback(data.ctgr_nm, data.mb_nick);
					//callback(result); 리스트만 뽑아올때
					callback(result.getTableTest, result.getTableCount);
					
				}
			},
			error : function(xhr, status, er) {
				if(error){
					error(er);
				}

			}
		});
	};
// 검색 하고난 페이지
		function tableSearch(data, callback, error) {
			
			$.ajax({
				type : "POST",
				url : '/stats/table/' + data.pageNum +'/'+ data.amount,
				data : JSON.stringify(data),
				dataType : "json",
				//async: true,
				contentType : "application/json; charset=UTF-8",
				success : function(result, status, xhr) {
					if (callback) {
						//callback(data.ctgr_nm, data.mb_nick);
						//callback(result); 리스트만 뽑아올때
						callback(result.getTableTest, result.getTableCount);
						
					}
				},
				error : function(xhr, status, er) {
					if(error){
						error(er);
					}

				}
			});
		};
	
	
// 시간 관련 ajax
	function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;
 
		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24) && gap > 0) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear().toString().substring(0,4);
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '년 ', (mm > 9 ? '' : '0') + mm, '월 ',
					(dd > 9 ? '' : '0') + dd,'일' ].join('');
		}
	}; 
	
	function header(data, callback, error) {
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$.ajax({
			type : "POST",
			url : '/stats/header',
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
		       xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		    },
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
					
				}
			},
			error : function(xhr, status, er) {
				if(error){
					error(er);
				}

			}
		});
	};
	
	function headerUpdate(data,callback, error){
		
		$.ajax({
			type : "POST",
			url : '/stats/header',
			data : JSON.stringify(data),
			dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	return{
		tableSearch : tableSearch,
		displayTime : displayTime,
		table : table,
		header : header,
		headerUpdate : headerUpdate
		
		
	}
})();
