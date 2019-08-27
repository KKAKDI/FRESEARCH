<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<%@include file="../includes/header.jsp" %>

<style>

#content{
	height : auto;
}


.uploadResult {

	width:100%;

}

.uploadResult ul{
	width: 723px;
	flex-flow:row;
	justify-content:center;
	align-items:center;
	height : 100px;
	padding : 10px;
	text-align:center;
	padding-top : 16px;

	}

.uploadResult ul li{
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
	display: inline;
}

.uploadResult ul li img{ // 섬네일 이미지 크기 조정
	width: 100px;
	
}

.uploadResult ul li span{
	color:white;
}

.bigPictureWrapper{

	
	position: fixed;
	display: none;
	justify-content: center;
	align-items: center;
	top:0%;
	height:100%;
	width:44%;
	background-color: gray;
	z-index: 100;
	background:rgba(255,255,255,0.5);

}

.bigPicture{
	display:flex;
	position: relative;
	justify-content: center;
	align-items: center;

}

.bigPicture img {
	width: 420px;
	
}

.container_new {
   padding-top: 125px;
}
.container_reply{
	text-align:left;
	width: 850px;
	margin:auto;
	margin-top: 18px;
}
.replyInfo{

	word-wrap: break-word;
    line-height: 1.2em;
    height: 9em;
    display: unset; 
    }

table {
   width: 850px;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   margin: auto;
   table-layout: fixed;
}

td.column {
   background-color: #f0f0f0;
   color: #505050;
   padding-top: 15px;
   font-weight: bold;
	
}

td.column-data {
   padding: 14 19;
}

td.column-content {
   word-break:break-all; 
   wrap:"hard";
   white-space:pre-line;
}

td#column-subject {
   white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

#rpl_content{
 width:95%; height: 74px; margin:6px; margin-left : 0;

}



</style>


<div class ="container_new">
	<div>
		<div>
			<div>
			
				<form id='operForm' action="/board/board_modify" method="get">
					<input type='hidden' id='brd_code' name='brd_code' value='${board.brd_code}'> 
					<input type='hidden' name='pageNum' value='${cri.pageNum}'> 
					<input type='hidden' name='amount' value='${cri.amount}'> 
					<input type='hidden' name='keyword' value='${cri.keyword}'> 
					<input type='hidden' name='type' value='${cri.type}'>
				</form>
		
				<div style="text-align: center;">
					<h2>글 상세보기</h2>
				</div>
		
			</div>
		</div>
	</div>
</div>
	
	
	<table style="text-align: center;">
                  <tr style="border-bottom: 1px solid #dcdcdc; border-top: 1px solid blue;">
                     <td class="column" style="width: 15%;" >글번호</td>
                     <td class="column-data" colspan="3" >${board.brd_code}</td>
                     <td class="column" style="width: 15%;">닉네임</td>
                     <td class="column-data" colspan="3" >${board.mb_nick}</td>
                     <td class="column" style="width: 15%;">날짜</td>
                     <td class="column-data" colspan="3"><fmt:formatDate pattern="yyyy-MM-dd"
                           value="${board.brd_regdate}" /></td>
                     
                  </tr>
                  
                  <tr style="border-bottom: 1px solid #dcdcdc;">
                     <td class="column" style="width: 50%">제목</td>
                     <td id= "column-subject" class="column-data" style="text-align: left;" colspan="11">${board.brd_subject}</td>
                	
                	
                	
                <div class="form-group">
					<input type="hidden" class="form-control" name='mb_email' value=${board.mb_email } readonly="readonly">
				</div>
                 
                 </tr>
                  
                   <tr style="border-bottom: 1px solid gray; text-align: left; height: auto;">
                     <td class="column-content" colspan="12" style="background-color: #e5e5e5;  text-align: left; padding: 40 40;">${board.brd_content}</td>
                  </tr>
                  
                  <tr style="border-bottom: 1px solid gray; text-align: center; height:auto;">
							<td class="column" style=padding-top:37px;>첨부파일</td>
							<td  colspan="11">
            <div class='bigPictureWrapper'>
               <div class='bigPicture'></div>
            </div>
                  <div>
                     <div class='uploadResult'>
                        <ul>
                        </ul>
                     </div>
                  </div>
               </td>
            </tr> 
		<tr>		
		<td>
		 <div style= "text-align:center; width: 850px;">
				<button  data-oper='modify'>수정</button>
				<button  data-oper='list'>리스트</button>
			</div>	 			
		</td>
		</tr>		
				 
				 
      </table>
      
        	<div style="text-align:center; margin:15px; ">
    <div class="container_reply" style="text-align:left;">
        <label for="rpl_content">댓글</label>
        <form name="ReplyInsertForm">
            <div class="input-group" style="box-sizing: border-box;">
               <input type="hidden" name="brd_code" value="${board.brd_code}"/>
               <textarea class="rpl_content" id="rpl_content" name="rpl_content" placeholder="내용을 입력하세요."></textarea>
                <button  style="margin-top: 6; height: 74px; "type="button" name="replyInsert">등록</button>
               <br />
               <span style="color:#aaa;" id="input-group">(0 / 최대 50자)</span>


				<div>
		<div>
			<div>
				
				<br>
				<div>
					<ul class="chat">
					</ul>
				</div>
				<div></div>
			</div>
		</div>
	</div>
                   
              </div>
        </form>
    </div>

	


	<script type="text/javascript" src="/resources/js/reply.js"></script> 
		
	<script>
	
	$('[name=replyInsert]').on("click", function(e){ //댓글 등록 버튼 클릭시
		
	    var reply = $('[name=ReplyInsertForm]').serialize(); //ReplyInsertForm의 내용을 가져옴
	    
	    replyService.add(reply, function(result){
	    
	    	alert(result);
	    
	    }); //Insert 함수호출(아래)
	
	});


	
	
	$(document).ready(function(){
		
	var brd_codeValue= value = "${board.brd_code}";
	var replyUL =$(".chat");
	
	showList(1);
	
	function showList(page){
		
		replyService.getList({brd_code:brd_codeValue, page: page || 1}, function(list){
			var str=" ";
			if(list == null || list.length == 0){
				replyUL.html("");
				
				return;
			}
			for (var i = 0, len = list.length || 0; i < len; i++) {
				 str += "<li data-rpl_code'"+list[i].rpl_code+"' >";
				 str += " <div><div style='display:inline;'><strong>"+list[i].mb_nick+"</strong>";
				 str += " <small>"+replyService.displayTime(list[i].rpl_regdate)+"</small></div>";
				 str += '<a onclick="replyUpdate('+value.rpl_code+',\''+value.rpl_content+'\');" style=\"color : blue;\"> 수정 </a>';
                 str += '<a onclick="replyDelete('+value.rpl_code+');" style=\"color : blue;\"> 삭제 </a> </div>';
				 str += "<p style=\"border-bottom:1px solid #dcdcdc; padding-bottom:9px; padding-top:9px;\">"+list[i].rpl_content+"</p></div></li>"
				 str += "<hr/>";
				 str +="<br/>";
			 }
			replyUL.html(str);
		});
	}
	
	});
	</script>





<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/board/board_modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#brd_code").remove();
			operForm.attr("action", "/board/board_list");
			operForm.submit();
		});
	});
</script>

<script> // 조회수 스크립트
   var brd_code = $("#brd_code").val();
   var brd_codes = [];
   console.log(Cookies.get("ck_brd_codes"));
   if (Cookies.get("ck_brd_codes") == undefined) {
      brd_codes.push(brd_code);
      Cookies.set('ck_brd_codes', brd_codes);
      $.ajax({
         url : "brdViewCnt",
         type : "post",
         dataType : "json",
         data : {
            "brd_code" : brd_code
         },
         success : function(d) {
            console.log(d);
         },
         error : function(e) {
            console.log(e);
         }
      })
   } else {
      var ck_brd_codes = JSON.parse(Cookies.get("ck_brd_codes"));
      var is_equal = 0;
      
      for (var i = 0; i < ck_brd_codes.length; i++) {
         if (brd_code == ck_brd_codes[i]) {
            is_equal = 1;
            break;
         }
      }
      if (is_equal == 0) {
         //ck_brd_codes.push(brd_code);
         $.ajax({
            url : "brdViewCnt",
            type : "post",
            dataType : "json",
            data : {
               "brd_code" : brd_code
            },
            success : function(d) {
               console.log(d);
            },
            error : function(e) {
               console.log(e);
            }
         });
         ck_brd_codes.push(brd_code);
         Cookies.set('ck_brd_codes', ck_brd_codes);
      }
   };
</script>

 
<script type="text/javascript">
	$(document).ready(function() {
		(function() {
			var brd_code = ${board.brd_code};
				$.getJSON("/board/getAttachList", {brd_code : brd_code},
					function(arr) {
						console.log(arr);
						
						var str = "";
						$(arr).each(function(i, attach) {

							//image type
							if (attach.brd_attach_type) {
								var fileCallPath = encodeURIComponent(attach.brd_attach_path+ "/s_"+ attach.brd_attach_uuid+ "_"+ attach.brd_attach_name);
								str += "<li data-path='"+attach.brd_attach_path+"' data-uuid='"+attach.brd_attach_uuid+"' data-filename='"+attach.brd_attach_name+"' data-type='"+attach.brd_attach_type+"' >";
								str += "<img src='/display?fileName="+ fileCallPath+ "'>";
								str + "</li>";
							} else {
								str += "<li data-path='"+attach.brd_attach_path+"' data-uuid='"+attach.brd_attach_uuid+"' data-filename='"+attach.brd_attach_name+"' data-type='"+attach.brd_attach_type+"' >";
								str += "<span> "+ attach.brd_attach_name+ "</span><br/>";
								str += "<img src='/resources/img/attach.png'></a>";
								str + "</li>";
							}
						});

						$(".uploadResult ul").html(str);
						
				});//end getjson
				
		})();//end function
		
		$(".uploadResult").on(
				"click",
				"li",
				function(e) {
					console.log("view image");
					var liObj = $(this);
					var path = encodeURIComponent(liObj
							.data("path")
							+ "/"
							+ liObj.data("uuid")
							+ "_"
							+ liObj.data("filename"));

					if (liObj.data("type")) {
						showImage(path.replace(
								new RegExp(/\\/g), "/"));
					} else {
						//download
						self.location = "/download?fileName="
								+ path
					}
				});

		function showImage(fileCallPath) { // 이미지파일 보여주기

			//alert(fileCallPath);

			$(".bigPictureWrapper").css("display", "flex").show();

			$(".bigPicture").html("<img src='/display?fileName="+ fileCallPath + "' >")
			.animate({width : '100%', height : '100%'}, 10);

		}
		$(".bigPictureWrapper").on("click", function(e) { // 이미지 파일 닫기
			$(".bigPicture").animate({width : '0%', height : '0%'}, 10);
			setTimeout(function() {
				$('.bigPictureWrapper').hide();
			}, 10);
		});

	});
</script>


<%@include file="../includes/footer.jsp" %>


<%--

	<댓글 테스트 코드>


	<script>//댓글 스트립트
		console.log("===========================");
		console.log("JS TEST");
		
		var brd_codeValue = value="${board.brd_code}";
		
		replyService.get(103, function(data){
			console.log(data);
		})
		
		
		
		//for replyService.add test
		
		replyService.add(
		{rpl_content : "JS TEST", mb_nick : "tester" ,mb_email : " KK@naver.com" , brd_code:brd_codeValue}
		,
		function(result){
			alert("RESULT: " + result);
			}
		);
		
		//for ReplyService.list test
		
		replyService.getList({brd_code:brd_codeValue, page:1}, function(list){
			
			for(var i = 0, len = list.length || 0; i < len; i++){
				console.log(list[i]);
			}
		});
		
		//for replyService.delete test(rpl_code no.126)
		
		replyService.remove(126, function(count){
			
			console.log(count);
			
			if(count ==="success"){
				alert("REMOVED");
			}
		}, function(err){
			alert('ERROR.....');	
		});
		
		//for replyService.update test
		
		replyService.update({
		
			rpl_code : 103,
			brd_code : brd_codeValue,
			rpl_content : "Modified Reply..."
		}, function(result){
			alert("수정 완료.......");	
		});
		
		--%>
