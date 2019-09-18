var researchService = (function(){
	
	function list(param, callback, error){
		var research = param.data;
		var page = param.page || 1;
		
		$.getJSON("/research/pages/" + research + "/" + page + ".json",
			function(data){
				if(callback){
					callback(data.researchCnt, data.list);
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
		
		var yy = dateObj.getFullYear().toString().substring(2,4);
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();
		
		return [ yy, '.', (mm > 9 ? '' : '0') + mm, '.', (dd > 9 ? '' : '0') + dd ].join('');
	};
	
	return {
		list:list,
		displayTime:displayTime
	};
})();