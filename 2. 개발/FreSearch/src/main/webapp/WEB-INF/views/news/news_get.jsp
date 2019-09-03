<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<%-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"> --%>

<link rel="stylesheet" href="/resources/css/reset.css">
<%@include file="../includes/header.jsp" %>

<style>

table {
	width: 850px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin: auto;
	table-layout: fixed;
}


.button {
	text-align: center;
	padding: 20 0;
}

.button #modify,
.button #list {
	height: 30px;
    border: none;
    width: 80px;
    cursor: pointer;
    background: #1428a0;
    color: white;
}

.container_new {
	padding-top: 150px;
	min-height: 872px;
}

td.column {
	background-color: #f0f0f0;
	color: #505050;
	padding: 23;
	font-weight: bold;
}

th, td {
	font-size: 16px;
}

td.column-data {
	padding: 23 19;
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

hr {
	margin: 8 auto;
	background-color: blue;
	width: 5%;
}

.uploadResult {

   width:100%;

}

.uploadResult ul {
   flex-flow:row;
   justify-content:center;
   align-items:center;
   <%-- height : 100px; --%>
   padding : 10px;
   text-align:center;
   <%-- background-color: #e9ecef; --%>
   margin: 0;
   width: 340px; // 첨부파일 부분 가로길이
   }

.uploadResult ul li {
   list-style: none;
   padding: 10px;
   align-content: center;
   text-align: center;
   display: inline;
}

.uploadResult ul li img { // 섬네일 이미지 크기 조정
   width: 10px;
   
}

.uploadResult ul li span {
   color:black;
}

.bigPictureWrapper {
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

.bigPicture {
   display:flex;
   position: relative;
   justify-content: center;
   align-items: center;

}

.bigPicture img {
   width: 600px;
   
}

#content{
   height : auto;
}

.Header {
    margin-top: 0px;
}

.news-head h2 {
	position: relative;
    font-size: 30px;
    padding: 3px 0 7px;
    margin: auto;
    width: 850px;
}

.news-head h2::after {
	background: #1428a0;
    width: 99.9%;
    height: 2px;
    content: "";
    position: absolute;
    top: 100%;
    left: 0px;
}
</style>

<div class="container_new">
	<div>
		<div>
			<div>

				<form id='operForm' action="/news/news_modify" method="get">
					<input type='hidden' id='news_code' name='news_code' value=${news.news_code}> 
						<input type='hidden' name='pageNum' value=${cri.pageNum}> 
						<input type='hidden' name='amount' value=${cri.amount}> 
						<input type='hidden' name='keyword' value=${cri.keyword}> 
						<input type='hidden' name='type' value=${cri.type}>
				</form>

				<div>
					<div class="news-head">
					<h2>새소식</h2>
					</div>	
				
				<!-- 
					<h2>공지사항 / 이벤트</h2>
					<hr/>
					<p>FreSearch 새소식을 제공합니다.</p>
				 -->
					<table style="text-align: center;">
						<tr style="border-bottom: 1px solid #dcdcdc; border-top: 1px solid blue;">
							<td class="column" style="width: 20%;">작성자</td>
							<td class="column-data" colspan="2">FreSearch</td>
							<td class="column" style="width: 20%;">날짜</td>
							<td class="column-data" colspan="2"><fmt:formatDate pattern="yyyy-MM-dd"
									value="${news.news_regdate}" /></td>
						</tr>
						<tr style="border-bottom: 1px solid #dcdcdc;">
							<td class="column" style="width: 15%">제목</td>
							<td id= "column-subject" class="column-data" style="text-align: left;" colspan="5">${news.news_subject}</td>
							
							<!-- 
							<td class="column" style="width: 15%">첨부파일</td>
							<td style="width:*">
								<div class='bigPictureWrapper'>
									<div class='bigPicture'></div>
								</div>
								<div class='uploadResult'>
									<ul>
									
									</ul>
								</div>
							</td>
							 -->
						</tr>
						<tr style="border-bottom: 1px solid gray; text-align: left; height: auto;">
							<td class="column-content" colspan="6" style="background-color: #e5e5e5;  text-align: left; padding: 40 40;">${news.news_content}</td>
						</tr>
						

						
					</table>
				</div>
				
				
<%--
			<table>
				<tr>
					<div class="form-group">
						<th>번호</th><td colspan="2"><input id="news_code" class="form-control"
							name='news_code' value=${news.news_code} readonly="readonly"></td>
					</div>
					<div class="form-group">
						<th>구분</th><td colspan="2"><input id="news_division" class="form-control" colspan="2"
							name='news_division' value=${news.news_division} readonly="readonly"></td>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<th>제목</th><td colspan="4"><input id="news_subject" class="form-control"
							name='news_subject' value=${news.news_subject} readonly="readonly"></td>
					</div>
				</tr>
				<tr>
					<div class="form-group">
						<th>내용</th>
						<td colspan="6"><textarea id="news_content" class="form-control" rows="6"
							name='news_content' readonly="readonly">${news.news_content}</textarea></td>
					</div>
				</tr>
				<tr>
				<div class='bigPictureWrapper'>
					<div class='bigPicture'></div>
				</div>
					<th><label>첨부파일</label></th>
					<td>
						<div>
							<div class='uploadResult'>
								<ul>
								</ul>
							</div>
						</div>
					</td>
				</tr>
			</table>
--%>
			<div class="button">
			<sec:authentication property="principal" var="pinfo"/>
			<sec:authorize access="isAuthenticated()">
				<c:if test="${pinfo.member.authList[0].auth eq 'ROLE_ADMIN'}">
					<button data-oper='modify' class="btn btn-default" id="modify">수정</button>
				</c:if>
			</sec:authorize>
				<button data-oper='list' class="btn btn-info" id="list">목록</button>
			</div>

			</div>
		</div>
	</div>
</div>


<script type="text/javascript"> // 첨부파일 관련 스크립트
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
								str += "<li data-path='"+attach.news_attach_path+"' data-uuid='"+attach.news_attach_uuid+"' data-filename='"+attach.news_attach_name+"' data-type='"+attach.news_attach_type+"' >";
								<%-- str += "<img src='/display?fileName="+ fileCallPath+ "'>"; --%>
								str += "<img src='/resources/img/downimg.png'></a>";
								str + "</li>";
							} else {
								str += "<li data-path='"+attach.news_attach_path+"' data-uuid='"+attach.news_attach_uuid+"' data-filename='"+attach.news_attach_name+"' data-type='"+attach.news_attach_type+"' >";
								str += "<span> "+ attach.news_attach_name+ "</span><br/>";
								str += "<img src='/resources/img/downimg.png'></a>";
								str + "</li>";
							}
						});

						$(".uploadResult ul").html(str);
	
					});//end getjson
	
				})();//end function

						$(".uploadResult").on("click", "li", function(e) {
									console.log("view image");
									var liObj = $(this);
									var path = encodeURIComponent(liObj.data("path")
											+ "/"
											+ liObj.data("uuid")
											+ "_"
											+ liObj.data("filename"));

									if (liObj.data("type")) {
										showImage(path.replace(
												new RegExp(/\\/g), "/"));
									} else {
										//download
										self.location = "/download?fileName=" + path
									}
								});

						function showImage(fileCallPath) { // 이미지파일 보여주기

							// alert(fileCallPath);

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

<script type="text/javascript">
	// 수정 페이지
	$(document).ready(function() {
		var operForm = $("#operForm");

	    var result = '<c:out value='${news.news_division}'/>';
	      
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/news/news_modify").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e) { // 구분 하여 목록으로 이동
			operForm.find("#news_code").remove();
			if(result == "공지"){
				operForm.attr("action", "/news/news_list");
			} else {
				operForm.attr("action", "/news/news_list_event");
			}
			operForm.submit();
		});
	});
</script>

<script> // 조회수 스크립트
	var news_code = $("#news_code").val();
	var news_codes = [];
	console.log(Cookies.get("ck_news_codes"));
	if (Cookies.get("ck_news_codes") == undefined) {
		news_codes.push(news_code);
		Cookies.set('ck_news_codes', news_codes);
		$.ajax({
			url : "newsViewCnt",
			type : "post",
			dataType : "json",
			data : {
				"news_code" : news_code
			},
			success : function(d) {
				console.log(d);
			},
			error : function(e) {
				console.log(e);
			}
		})
	} else {
		var ck_news_codes = JSON.parse(Cookies.get("ck_news_codes"));
		var is_equal = 0;
		
		for (var i = 0; i < ck_news_codes.length; i++) {
			if (news_code == ck_news_codes[i]) {
				is_equal = 1;
				break;
			}
		}
		if (is_equal == 0) {
			//ck_news_codes.push(news_code);
			$.ajax({
				url : "newsViewCnt",
				type : "post",
				dataType : "json",
				data : {
					"news_code" : news_code
				},
				success : function(d) {
					console.log(d);
				},
				error : function(e) {
					console.log(e);
				}
			});
			ck_news_codes.push(news_code);
			Cookies.set('ck_news_codes', ck_news_codes);
		}
	};
</script>

<%@include file="../includes/footer.jsp" %>
