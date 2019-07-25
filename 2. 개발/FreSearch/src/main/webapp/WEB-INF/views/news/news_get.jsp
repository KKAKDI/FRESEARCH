<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<style>

div{
text-align: left;
width: 850px;
margin : auto;
}

body {
  padding-top: 70px;

  padding-bottom: 30px;
}

</style>

<div>
	<div>
		<h2>게시글</h1>
	</div>
</div>
<div>
	<div>
		<div>
			<div>

				<form id='operForm' action="/news/news_modify" method="get">
					<input type='hidden' id='news_code' name='news_code'
						value=${news.news_code}> <input type='hidden'
						name='pageNum' value=${cri.pageNum}> <input type='hidden'
						name='amount' value=${cri.amount}> <input type='hidden'
						name='keyword' value=${cri.keyword}> <input type='hidden'
						name='type' value=${cri.type}>

				</form>

				<div class="form-group">
					<label>글번호</label><input id="news_code" class="form-control"
						name='news_code' value=${news.news_code } readonly="readonly">
				</div>
				<div class="form-group">
					<label>구분</label><input id="news_division" class="form-control"
						name='news_division' value=${news.news_division
						} readonly="readonly">
				</div>
				<div class="form-group">
					<label>제목</label><input id="news_subject" class="form-control"
						name='news_subject' value=${news.news_subject
						} readonly="readonly">
				</div>
				<div class="form-group">
					<label>글 내용</label>
					<textarea id="news_content" class="form-control" rows="6"
						name='news_content' readonly="readonly">${news.news_content}</textarea>
				</div>

				<div class='bigPictureWrapper'>
					<div class='bigPicture'></div>
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

				<button data-oper='modify' class="btn btn-default">수정</button>
				<button data-oper='list' class="btn btn-info">목록</button>


			</div>
		</div>
	</div>
</div>
<!-- /.row -->


<script type="text/javascript">
	$(document).ready(function() {
		(function() {
			var news_code = ${news.news_code};
				$.getJSON("/news/getAttachList", {news_code : news_code},
					function(arr) {
						console.log(arr);
						var str = "";
						$(arr).each(function(i, attach) {

							//image type
							if (attach.news_attach_type) {
								var fileCallPath = encodeURIComponent(attach.news_attach_path+ "/s_"+ attach.news_attach_uuid+ "_"+ attach.news_attach_name);
								str += "<li data-path='"+attach.news_attach_path+"' data-uuid='"+attach.news_attach_uuid+"' data-filename='"+attach.news_attach_name+"' data-type='"+attach.news_attach_type+"' ><div>";
								str += "<img src='/display?fileName="+ fileCallPath+ "'>";
								str += "</div>";
								str + "</li>";
							} else {
								str += "<li data-path='"+attach.news_attach_path+"' data-uuid='"+attach.news_attach_uuid+"' data-filename='"+attach.news_attach_name+"' data-type='"+attach.news_attach_type+"' ><div>";
								str += "<span> "+ attach.news_attach_name+ "</span><br/>";
								str += "<img src='/resources/img/attach.png'></a>";
								str += "</div>";
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

							alert(fileCallPath);

							$(".bigPictureWrapper").css("display", "flex").show();

							$(".bigPicture").html("<img src='/display?fileName="+ fileCallPath + "' >")
							.animate({width : '100%', height : '100%'}, 500);

						}
						$(".bigPictureWrapper").on("click", function(e) { // 이미지 파일 닫기
							$(".bigPicture").animate({width : '0%', height : '0%'}, 500);
							setTimeout(function() {
								$('.bigPictureWrapper').hide();
							}, 500);
						});

					});
</script>

<script type="text/javascript">
	// 수정 페이지
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/news/news_modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#news_code").remove();
			operForm.attr("action", "/news/news_list")
			operForm.submit();

		});
	});
</script>
