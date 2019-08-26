console.log("Reply Module.....");

var replyService = (function(){
	
	function add(reply, callback, error){			//댓글 집어넣는 AJAX
		console.log("add reply......................");
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; chatset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error :function(xhr, status,er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	function getList(param, callback, error){		//댓글 리스트 뽑아내는 getJSON
	
		var brd_code = param.brd_code;
		
		var page = param.page || 1;
		
		
		$.getJSON("/replies/pages/" + brd_code + "/" + page + ".json", 
				function(data){
			if (callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function remove(rpl_code, callback, error){				//댓글 삭제하는 AJAX
		$.ajax({	
			type : 'delete',
			url : '/replies/' + rpl_code,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function update(reply, callback, error){					//댓글 수정하는 AJAX
		console.log("rpl_code : " + reply.rpl_code);
		
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rpl_code,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
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
	
	function get(rpl_code, callback, error){					//댓글 조회처리 
		$.get("/replies/" + rpl_code + ".json", function(result){
			
			if(callback){
				callback(result);
			}
			
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	function displayTime(timeValue) {
		var today = new Date();

		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? ' ':'0') + hh, ':', (mi > 9 ? ' ':'0') + mi,
					':', (ss > 9 ? ' ':'0') + ss ].join(' ');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? ' ' : '0') + mm,'/',
					(dd > 9 ? ' ': '0')+ dd].join('');
		}
	};
	
	
	return{
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};
	
})();