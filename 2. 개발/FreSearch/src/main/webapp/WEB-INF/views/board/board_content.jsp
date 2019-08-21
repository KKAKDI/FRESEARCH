<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<style>
h1 {
	text-align: center;
}

div {
	text-align: left;
	width: 1100px;
	margin: auto;
}

body {
	padding-top: 70px;
	padding-bottom: 30px;
}

#content{
	height : auto;
}


.uploadResult {

	width:100%;

}

.uploadResult ul{
	flex-flow:row;
	justify-content:center;
	align-items:center;
	height : 100px;
	padding : 10px;
	text-align:center;
	background-color: #e9ecef;
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
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top:0%;
	height:100%;
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
	width: 600px;
	
}


</style>


<div>
	<div>
		<h1>글 상세보기</h1>
	</div>
</div>
<div>
	<div>
		<div>

			<div>

				<div class="form-group">
					<label>번호</label> <input class="form-control" name='brd_code'
						value=${board.brd_code } readonly="readonly">
				</div>
				
				<div class="form-group">
					<input type="hidden" class="form-control" name='mb_nick'
						value=${board.mb_email } readonly="readonly">
				</div>

				<div class="form-group">
					<input type="hidden" class="form-control" name='mb_nick'
						value=${board.mb_nick } readonly="readonly">
				</div>

				<div class="form-group">
					<label>제목</label> <input class="form-control" name='brd_subject'
						value=${board.brd_subject } readonly="readonly">
				</div>

				<div class="form-group">
					<label>내용</label>
			
					<div id= content class="form-control" readonly="readonly" >
						${board.brd_content}
					</div>


					<div>
						<div>
							<div>

								<div>첨부파일</div>
								<div>

									<div class='uploadResult'>
										<ul>
										
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class='bigPictureWrapper'>
						<span class='bigPicture'></span>
					</div>


				</div>

				<button class="btn btn-sm btn-success" data-oper='modify'>수정</button>
				<button class="btn btn-sm btn-primary" data-oper='list'>리스트</button>

				<form id='operForm' action="/board/board_modify" method="get">
					<input type='hidden' id='brd_code' name='brd_code'
						value='${board.brd_code}'> <input type='hidden'
						name='pageNum' value='${cri.pageNum}'> <input
						type='hidden' name='amount' value='${cri.amount}'> <input
						type='hidden' name='keyword' value='${cri.keyword}'> <input
						type='hidden' name='type' value='${cri.type}'>
				</form>

			</div>
		</div>
	</div>
</div>

<!-- Reply Form {s} -->
 
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<form name="form" id="form" role="form" modelAttribute="ReplyVO" method="post">

				<hidden path="brd_code" id="brd_code"/>

				<div class="row">

					<div class="col-sm-10">

						<textarea path="rpl_content" id="rpl_content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>

					</div>

					<div class="col-sm-2">

						<input path="brd_nick" class="form-control" id="brd_nick" placeholder="댓글 작성자"></input>

						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>

					</div>

				</div>

				</form>

			</div>

			<!-- Reply Form {e} -->


<!-- Reply List {s}-->

<div class="my-3 p-3 bg-white rounded shadow-sm"
	style="padding-top: 10px">

	<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
	<!-- /.panel-heading -->
	<div class="panel-body">

		<ul class="chat">
			<li class="left clearfix" data-rpl_no='12'>
				<div>
					<div class="header"></div>
				</div>
		</ul>
		
		<!-- ./ end ul -->
	</div>
	<!-- /.panel .chat-panel -->

</div>

<!-- Reply List {e}-->

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	var brd_codeValue = value="${board.brd_code}";
	var replyUL=$(".chat");
	
	showList(1);
	
	function showList(page){
		replyService.getList({brd_code:brd_codeValue, page:page || 1}, function(list){
			
			var str="";
			
			if(list == null || list.length ==0){
			replyUL.html(""); 
			
			return;
			
			}
			for( var i = 0, len = list.length || 0; i<len; i++){
				str += "<li data-rpl_code=' "+list[i].rpl_code+" '>";
				str += " <div><div class = 'header'><strong>"+ list[i].mb_nick +"</strong>";
				str += "	<small>"+replyService.displayTime(list[i].rpl_regdate) +"</small></div>";
				str += "<p>"+ list[i].rpl_content +"</p></div></li>";
				
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

