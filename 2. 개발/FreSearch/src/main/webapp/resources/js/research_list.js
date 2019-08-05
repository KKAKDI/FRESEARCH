/*
var html = '';
$(document).ready(function(){
	
	$.getJSON('/research/research_list/research/진행중설문', function(data) {
		var html = '';

		$.each(data, function(entryIndex, entry) {
			html += '<ul>';
			html += '<li>';
			html += '<a>';
			html += '<span>' + entry.ctgr_nm + '</span>';
			html += '<span>' + entry.subj_nm + '</span>';
			html += '<span>' + entry.subj_regdate + '</span>';
			html += '<span>' + entry.subj_startdate + '</span>';
			html += '</a>';
			html += '</li>';
			html += '</ul>';
		});
		$('#test').html(html);
	});
	
	$("input[name=research]").click(function(e) {
		//console.log("버튼 눌렸다.");
		
		research = $(this).val();
		html = research;
		//html += '<code>성별</code>';
		//$("#area").html(html);
		console.log(html);
		console.log(research);
		
		updateDataResearch();
	});

});

function updateDataResearch() {
	

	$.getJSON('/research/research_list/research/' + research, function(data) {
		var html = '';
		console.log("여긴가");
		$.each(data, function(entryIndex, entry) {
			html += '<ul>';
			html += '<li>';
			html += '<a>';
			html += '<span>' + entry.ctgr_nm + '</span>';
			html += '<span>' + entry.subj_nm + '</span>';
			html += '<span>' + entry.subj_regdate + '</span>';
			html += '<span>' + entry.subj_startdate + '</span>';
			html += '</a>';
			html += '</li>';
			html += '</ul>';
			console.log("여긴가2");
		});
		console.log("여긴가3");
		$('#test').html(html);
		console.log("여긴가4");
	});
}*/
/*
var research = (function() {
   function list(data, callback, error) {
      
      $.ajax({
         type : "POST",
         url : '/research/research_listTab',
         data : JSON.stringify(data),
         dataType : "json",
         //async: true,
         contentType : "application/json; charset=UTF-8",
         success : function(result, status, xhr) {
            if (callback) {
               //callback(data.ctgr_nm, data.mb_nick);
               callback(result);
            }
         },
         error : function(xhr, status, er) {
            if(error){
               error(er);
            }
         }
      });
   }
   
   function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24) && gap >= 0){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss ].join('');
		}else{
			var yy = dateObj.getFullYear().toString().substring(2,4);
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [ yy, '.', (mm > 9 ? '' : '0') + mm, '.',
				(dd > 9 ? '' : '0') + dd ].join('');
		}
	};
   
   return{
	   list : list,
	   displayTime : displayTime
   }
})();
*/

var researchService = (function(){
	
	function list(param, callback, error){
		//var subj_code = param.subj_code;
		var page = param.page || 1;
		
		$.getJSON("/research/pages/" + page + ".json",
			function(data){
				if(callback){
					callback(data.replyCnt, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
	}
	
	function displayTime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24) && gap >= 0){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
				':', (ss > 9 ? '' : '0') + ss ].join('');
		}else{
			var yy = dateObj.getFullYear().toString().substring(2,4);
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [ yy, '.', (mm > 9 ? '' : '0') + mm, '.',
				(dd > 9 ? '' : '0') + dd ].join('');
		}
	};
	
	return {
		list:list,
		displayTime:displayTime
	};
})();
