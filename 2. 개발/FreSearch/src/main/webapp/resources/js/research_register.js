$(function() {		
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
							$("#research_form").append("<div class='research_content clearflx active'><input type='text'id='qst_content' autocomplete='off' placeholder='내용없는 질문'><select id='selBox'><option value='0' selected>객관식</option><option value='1'>주관식</option>	</select><div class='qst_swap'><ul id='item_box' class='clearflx active_item'><li class='item_individual active_individual'><input type='radio' class='item' value=''><input type='text' class='item_txt' autocomplete='off' placeholder='보기'><div class='button_box'><button id=item_img></button></div><div class='button_box'><button id=item_del></button></div></li></ul></div>");
							$("#content #form_area .active").append("<div id='hr'><hr class='active_btn'></div>	<div class='bottom_box active_btn'><div class='bottom_button_box'><button id=qst_add></button></div><div class='bottom_button_box'><button id=qst_etc>etc</button></div></div>");						
							var offset = $(".active").offset().top;
							$("#remote").css("top", offset - 160);							
							return false;
		});
		//추가된 태그 함수 실행
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
				$("#content #form_area .active_item").append("<li class='item_individual active_individual'><input type='radio' id='item' value=''><input type='text' class='item_txt' autocomplete='off' placeholder='보기'><div class='button_box'><button id=item_img></button></div><div class='button_box'><button id=item_del></button></div></li>");
				return false;
			}
		);
		$(document).on("click","#qst_etc",function(){
			var flag = $(".active_individual").children(".disabled").val();			
			if(flag==null){
				$("#content #form_area .active_item").append("<li class='item_individual active_individual'><input type='radio' id='item' value=''><input type='text' class='item_txt disabled' autocomplete='off' value='기타' disabled><div class='button_box'><button id=item_img></button></div><div class='button_box'><button id=item_del></button></div></li>");				
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
				$(this).parent().parent(".active_item .item_individual").remove();//parens().find() 로 검색시 모두 삭제됨
				return false;
			}else{
				$("#item_del").attr("disable");	
				return false;
			}	
			return false;
		});
		
		$(document).on("change","#selBox",function(){
			var value = $(this).val();
			console.log(value);
			if(value=='1'){
				$(this).parents().find(".active_item").remove();
				$(this).next().append("<ul id='item_box' class='clearflx active_item'><li class='item_individual'><input type='text' class='item_txt' id='disabled_sel' autocomplete='off' value='단답형 텍스트' readonly></li></ul>");
			}else{
				$(this).parents().find(".active_item").remove();
				$(this).next().append("<ul id='item_box' class='clearflx active_item'><li class='item_individual'><input type='radio' class='item' value=''><input type='text' class='item_txt' autocomplete='off' placeholder='보기'><div class='button_box'><button id=item_img></button></div><div class='button_box'><button id=item_del></button></div></li></ul>");
			}
		});
		
		$(document).on("click","#send_form",function(){
			var subjectname = $("#subj_nm").val();
			var startdate = $("#date_timepicker_start").val();
			var enddate = $("#date_timepicker_end").val();
			var category = $("#category_box input[type=radio]:checked");
			
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
				data += "/block";
				
				for(var i = 0;i<qst_index;i++){
					if($(".research_content #qst_content")[i].value==''){
						$.emptyCheck();
						checkCnt++;
						break;
					}else{
						data += $(".research_content #qst_content")[i].value+"#t#";
						data += $(".research_content #selBox option:selected")[i].value+"#t#";
						item_index = $(".research_content #item_box")[i].childElementCount;
						for(var j=0;j<item_index;j++){					
							if($(".research_content #item_box")[i].querySelectorAll('.item_txt')[j].value==''){
								$.emptyCheck();
								checkCnt++;
								break;
							}else{
								data += $(".research_content #item_box")[i].querySelectorAll('.item_txt')[j].value+"#t#";
							}							
						}
						data+="/block";
					}					
				}
				if(checkCnt>0){
					return false;
				}else{
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
	});