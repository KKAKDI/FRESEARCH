$(function() {			
		var i=0;
		
		//DATEPICKER
		$.datetimepicker.setLocale('ko');
		$('#date_timepicker_start').datetimepicker({
			  format:'Y/m/d',
			  onShow:function( ct ){
			   this.setOptions({
				minDate:'',
			    maxDate:jQuery('#date_timepicker_end').val()?jQuery('#date_timepicker_end').val():false
			   })
			  },
			  timepicker:false
		 });
			
		$('#date_timepicker_end').datetimepicker({
			  format:'Y/m/d',
			  onShow:function( ct ){
			   this.setOptions({
			    minDate:jQuery('#date_timepicker_start').val()?jQuery('#date_timepicker_start').val():false
			   })
			  },
			  timepicker:false
		 });
		
		$.emptyCheck = function(){
				swal({
					title:"Oops",
					text:"작성되지 않은 공간이 있습니다.",
					icon:"error",
					button:"확인",
				});			
				return false;
		};	 
		
		$(document).on("click","#qst_btn",
						function() {
							$(".research_content").removeClass("active");
							$(".research_content .bottom_box").removeClass("active_btn");
							$(".research_content .qst_swap #item_box").removeClass("active_item");
							$(".research_content hr").removeClass("active_btn");
							$(".research_content .qst_swap #item_box .item_individual").removeClass("active_individual");
							$("#research_form").append("<div class='research_content clearflx active'><input type='text'id='qst_content' autocomplete='off' placeholder='내용없는 질문'><select id='selBox'><option value='0' selected>객관식</option><option value='1'>주관식</option>	</select><div class='qst_swap'><ul id='item_box' class='clearflx active_item'><li class='item_individual active_individual'><input type='radio' class='item' value=''><input type='text' class='item_txt' autocomplete='off' placeholder='보기'><div class='button_box'><div class='img_box'><label for='item_img"+i+"'></label><input type='file' name='item_img' id='item_img"+i+"'/></div></div><div class='button_box'><button id=item_del></button></div><div id='img_box'><img id='list"+i+"'/><button id='img_del'></button></div></li></ul></div>");
							$("#content #form_area .active").append("<div id='hr'><hr class='active_btn'></div>	<div class='bottom_box active_btn'><div class='bottom_button_box'><button id=qst_add></button></div><div class='bottom_button_box'><button id=qst_etc>etc</button></div></div>");						
							var offset = $(".active").offset().top;
							$("#remote").css("top", offset - 160);							
							i++;
							return false;
		});
		// 추가된 태그 함수 실행
		$(document).on("click", ".research_content", function() {
			$(".research_content").removeClass("active");
			$(".research_content .bottom_box").removeClass("active_btn");
			$(".research_content .qst_swap #item_box").removeClass("active_item");
			$(".research_content hr").removeClass("active_btn");
			$(".research_content .qst_swap #item_box .item_individual").removeClass("active_individual");
			$(this).addClass("active");			
			$(this).children().find("hr").addClass("active_btn");
			$(this).children().find("#item_box").addClass("active_item");
			$(this).children().find(".item_individual").addClass("active_individual");
			if($(".active #selBox option:selected").val()==1){
				$(".research_content .bottom_box").removeClass("active_btn");
				$(".research_content hr").removeClass("active_btn");
			}else{
				$(this).children(".bottom_box").addClass("active_btn");
			}			
			var offset = $(".active").offset().top;
			$("#remote").css("top", offset - 160);			
		});	
		$(document).on("click","#qst_add",function(){
				$("#content #form_area .active_item").append("<li class='item_individual active_individual'><input type='radio' id='item' value=''><input type='text' class='item_txt' autocomplete='off' placeholder='보기'><div class='button_box'><div class='img_box'><label for='item_img"+i+"'></label><input type='file' name='item_img' id='item_img"+i+"'/></div></div><div class='button_box'><button id=item_del></button></div><div id='img_box'><img id='list"+i+"'/><button id='img_del'></button></div></li>");
				i++;
				return false;
			}
		);
		$(document).on("click","#qst_etc",function(){
			var flag = $(".active_individual").children(".disabled").val();			
			if(flag==null){
				$("#content #form_area .active_item").append("<li class='item_individual active_individual'><input type='radio' id='item' value=''><input type='text' class='item_txt disabled' autocomplete='off' value='기타' disabled><div class='button_box'><button id=item_del></button></div></li>");				
				return false;
			}else{
				$("#qst_etc").attr("disable");		
				return false;
			}				
		});
		
		$(document).on("click","#qst_del",function(){
			var index = $(this).parents().find(".research_content").length;
			if($(this).parents().find(".research_content")[0]==$(this).parents().find(".active")[0]){
				$("#qst_del").attr("disable");	
				return false;
			}else if(index>2){
				$(this).parents().find(".active").remove();
				$("#remote").css("top", 0);
				return false;
			}else{
				$("#qst_del").attr("disable");	
				return false;
			}
		});
		
		$(document).on("click","#item_del",function(){
			var index = $(this).parents().find(".active_item .item_individual").length;					
			if(index>1){
				$(this).parent().parent(".active_item .item_individual").remove();// parens().find()로 검색시 모두 삭제됨
				return false;
			}else{
				$("#item_del").attr("disable");	
				return false;
			}	
			return false;
		});
		
		$(document).on("change","#selBox",function(){
			var value = $(this).val();
			if(value=='1'){
				$(this).parents().find(".active_item").remove();
				$(this).next().append("<ul id='item_box' class='clearflx active_item'><li class='item_individual'><input type='text' class='item_txt' id='disabled_sel' autocomplete='off' value='단답형 텍스트' readonly><input type='file' name='item_img' id='item_img"+i+"'/></li></ul>");
			}else{
				$(this).parents().find(".active_item").remove();
				$(this).next().append("<ul id='item_box' class='clearflx active_item'><li class='item_individual active_individual'><input type='radio' id='item' value=''><input type='text' class='item_txt' autocomplete='off' placeholder='보기'><div class='button_box'><div class='img_box'><label for='item_img"+i+"'></label><input type='file' name='item_img' id='item_img"+i+"'/></div></div><div class='button_box'><button id=item_del></button></div><div id='img_box'><img id='list"+i+"'/><button id='img_del'></button></div></li></ul>");
			}
		});
		
		$(document).on("click","#send_form",function(){
			var subjectname = $("#subj_nm").val();
			var startdate = $("#date_timepicker_start").val();
			var enddate = $("#date_timepicker_end").val();
			var category = $("#category_box input[type=radio]:checked");
			var email = $("#mem_email").val();
			var nick = $("#mem_nick").val();
			
			if(subjectname!=''&&startdate!=''&&enddate!=''&&category.length>0){
				// 구분자 (|, #h#, #s#, #i#)
				var data = '';
				var item_index = 0;
				var qst_index =  $(".research_content #qst_content").length;
				var form = $("#research_form");
				var checkCnt= 0;
				
				data += $("#subj_nm").val()+"#h#";
				data += $("#category_box input[type=radio]:checked").val()+"#h#";
				data += $("#date_timepicker_start").val()+"#h#";
				data += $("#date_timepicker_end").val()+"#h#";
				data += $("#mem_email").val()+"#h#";
				data += $("#mem_nick").val()+"#h#"
				data += "/block";
				console.log("질문 개수:"+qst_index);
				for(var i = 0;i<qst_index;i++){
					if($(".research_content #qst_content")[i].value==''){
						$.emptyCheck();
						checkCnt++;
						break;
					}else{
						data += $(".research_content #qst_content")[i].value+"#t#";
						data += $(".research_content #selBox option:selected")[i].value+"#t#";
						item_index = $(".research_content #item_box")[i].childElementCount;
						console.log("아이템 개수:"+item_index);
						for(var j=0;j<item_index;j++){							
							if($(".research_content #item_box")[i].querySelectorAll(".item_txt")[j].value==''){
								$.emptyCheck();
								checkCnt++;
								break;
							}else{								
								 var reader = new FileReader();
								 var imgpath = "";
								 //console.log($(".research_content #item_box")[i].querySelectorAll('input[type=file]')[j].files[0]);
								 if($(".research_content #item_box")[i].querySelectorAll('input[type=file]')[j].files[0]){
									 data += $(".research_content #item_box")[i].querySelectorAll(".item_individual")[j].firstChild.nextSibling.value+"#img#";
									 data += $(".research_content #item_box")[i].querySelectorAll('input[type=file]')[j].nextSibling.value+"#t#";
								 }else{
									 data += $(".research_content #item_box")[i].querySelectorAll(".item_txt")[j].value+"#t#";		
								 }					 
							}
							
						}
						data+="/block";
					}					
				}
				if(checkCnt>0){
					return false;
				}else{	
					//동일한 이메일,제목 유무 체크
					
					console.log("data: "+data);		
					$("#research_values").val(data);
					form.attr("action","/research/research_register");
					swal({
						title:"등록되었습니다!",
						text:"리서치가 성공적으로 등록되었습니다!",
						icon:"success",
						button:"확인",
					})
					.then((willDelete) => {
						//return false;
						form.submit();								
					});																	
				}					
			}else{
				$.emptyCheck();
			}
		});
		
		$("#subj_nm").focusout(function(){
			$("#top_title").val($("#subj_nm").val());
		});
		$("#top_title").focusout(function(){
			$("#subj_nm").val($("#top_title").val());
		});		
		$("#prev_btn").click(function(){
			swal({
				title:"돌아가시겠습니까?",
				text:"그동안 작성된 정보를 모두 잃습니다.",
				icon:"warning",
				buttons:["아니오","네"],
				dangerMode:true,
			})
			.then((willDelete) => {
				if(willDelete){
					location.replace("/research/research_list");
				}
				else{
					
				}				
			});
		});
		$("#delete_form").click(function(){
			swal({
				title:"삭제하시겠습니까?",
				text:"그동안 작성된 정보를 모두 잃습니다.",
				icon:"warning",
				buttons:["아니오","네"],
				dangerMode:true,
			})
			.then((willDelete) => {
				if(willDelete){
					location.replace("/research/research_register");
				}
				else{
					
				}				
			});
		});
		$("#remote .remote_btn").hover(
				function () {		
										
					if("qst_btn"==$(this).children().attr("id")){
						$(this).toggleClass("special");	
						$(this).attr('data-before','질문 추가');
					}else if("img_btn"==$(this).children().attr("id")){
						$(this).attr('data-before','이미지 추가');						
					}else{
						$(this).attr('data-before','질문 삭제');
						$(this).toggleClass("special");	
					}
				},
				// 마우스가 떠난다면
				function () {
					 if("img_btn"==$(this).children().attr("id")){
						 
					 }else{
						 $(this).toggleClass("special");		
					 }						
				}
			);
		
		$(document).on('mouseover','label',function(){
			if("button_box"==$(this).parent().parent().attr("class")){				
				$(this).toggleClass("button_info");
				$(this).attr('data-before','이미지 추가');
			}						
		});
		$(document).on('mouseout','label',function(){
			if("button_box"==$(this).parent().parent().attr("class")){
				$(this).toggleClass("button_info");
			}						
		});
		$(document).on('mouseover','.button_box button',function(){
				$(this).toggleClass("button_info");
				$(this).attr('data-before','아이템 삭제');
		});
		$(document).on('mouseout','.button_box button',function(){
			$(this).toggleClass("button_info");	
		});
		
		$(document).on('mouseover','.bottom_button_box button',function(){
			$(this).toggleClass("bottom_button_info");				
			if("qst_add"==$(this).attr("id")){
				$(this).attr('data-before','아이템 추가');
			}else{
				$(this).attr('data-before','기타 추가');
			}
		});
		$(document).on('mouseout','.bottom_button_box button',function(){
			$(this).toggleClass("bottom_button_info");	
		});
		
		
		// 이미지 업로드 미리보기 소스
		
	    function readURL(input,node) {
	    	var filename = input.value;
	    	if(filename !=''){
	    		var ext = filename.slice(filename.lastIndexOf(".") + 1).toLowerCase();	    	
		    	if(!(ext == "gif" || ext == "jpg" || ext == "png")){
		    		swal({
						title:"이미지가 아닙니다.",
						text:"이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.",
						icon:"error",
						button:"확인",
					});		
	                return false;
		    	}else if(input.files && input.files[0]) {
		            var reader = new FileReader();
		            reader.onload = function(e) {
		              node.setAttribute('src', e.target.result);
		          	  $(node).parent().show();  
		            }
		            reader.readAsDataURL(input.files[0]);
		        }
	    	}
	    }
	    $(document).on("change","[id^='item_img']",function() {	    	
	    	var node = this.parentNode.parentNode.nextSibling.nextSibling.firstChild;	    	
	        readURL(this,node);
	        var formData = new FormData();
	        var uploadFile = this.files[0];
	        var pathNode = $(this).parent();
	        formData.append("uploadFile", uploadFile);
	        fileUpload(formData,function(imgpath){				
				console.log(imgpath);
				pathNode.append("<input id='img_path' type='hidden' value='"+imgpath+"'>");
		 	});		
	    });
	    $(document).on("click","#img_btn",function() {	 
	    	return false;
	    });
	    
	    function fileUpload(formData,callback){
	    	 $.ajax({
      			 url: '../uploadAjaxAction',
      			 processData: false,
      			 contentType: false,
      			 data: formData,
      			 type: 'POST',
      			 dataType: 'text',
	       			 success: function(result){
	       				//console.log("resilt: "+result);
	       				if(callback){
	       					callback(result);
	       				}	       				
	       			}
       		})		
	    }
	    
	    $(document).on("click","#img_del",function() {	 
	    	var file = $(this).parent().prev().prev().children().find("#img_path").val();
	    	var type = "image";
	    	var inputNode = $(this).parent().prev().prev().children().children().next().attr("id");
	    	
	    	$(this).prev().attr('src','');	    	
	    	$(this).parent().hide(); 	
	    	
	    	$(this).parent().prev().prev().children().children().next().remove();
	    	$(this).parent().prev().prev().children().append("<input type='file' name='item_img' id='"+inputNode+"'/>");
	    				
			var targetFile = file.split(/\\/ig);
			console.log(targetFile[5]);			
			
			$.ajax({
				url: '/deleteFile',
				data: {fileName: file, type:type},
				dataTpye:'text',
				type: 'POST',
					success: function(result){
						console.log(result);
					}
			});
			
	    	return false;
	    });
	});