<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" href="/resources/css/reset.css">
<%@include file="../includes/header.jsp" %>

<style>
body {
   font-family: "Open Sans", sans-serif;
   min-width: 850px;
   font-weight: 500;
   font-size: 16px;
}

.container_new{
	padding-top: 125px;
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
	padding: 15 19;
	font-weight: bold;
	text-align: center;
}

td.column-data {
	padding: 15 19;
}

div.button {
	text-align: right;
	margin: auto;
	width: 850px;
}

hr {
	margin: 8 auto;
	background-color: blue;
	width: 5%;
}

.radio-division{
    margin: 4px 5px;
}

input[type="radio"] { 
   display: none;  
}
input[type="radio"] + label { 
   display: inline-block; 
   position: relative; 
   padding-left: 30px; 
   cursor: pointer; 
    margin-right: 15px;
    font-size: 14px;
} 
input[type="radio"] + label:before { 
   content: ''; 
   position: absolute; 
   left: 0; 
   bottom: -1px; 
   width: 20px; 
   height: 20px; 
   background: #ccc; 
   border: 1px solid #cacece; 
   border-radius: 100%; 
   box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);  
} 
input[type="radio"]:checked + label:before { 
   background: #fafafa; 
} 
input[type="radio"]:checked + label:after { 
   content: ''; 
   position: absolute; 
   top: 3px; 
   left: 4.7px; 
   width: 13px; 
   height: 13px; 
   background: #1428a0; 
   border-radius: 100%; 
}

</style>


<div class="container_new">
	<div>
		<div>
			<div style="text-align: center;">
				<h2>공지사항 / 이벤트</h2>
					<hr/>
					<p>FreSearch 새소식을 제공합니다.</p>
				<table style="text-align: center;">
					<form name="f" role="form" action="/news/news_register" method="post">
						
						<tr style="border-bottom: 1px solid #dcdcdc; border-top: 1px solid blue;">
							<td class="column" style="width: 15%;">구분</td>
							<td class="column-data" colspan="2">
							<input id="radio-notice" class="radio-division" type="radio" name='news_division' value="공지" checked="checked"><label for="radio-notice">공지</label>
							<input id="radio-event" class="radio-division" type="radio" name='news_division' value="이벤트"><label for="radio-event">이벤트</label>
							<!-- 
							<select name='news_division'>
								<option value="공지">공지</option>
								<option value="이벤트">이벤트</option>
							</select>
							 -->
							</td>
							<td class="column" style="width: 15%;">작성자</td>
							<td class="column-data" colspan="2">FreSearch</td>
						</tr>
						
						<tr style="border-bottom: 1px solid #dcdcdc; border-top: 1px solid blue;">
							<td class="column" style="width: 15%;">제목</td>
							<td class="column-data" colspan="5" style="padding: 0px;"><input class="form-control" name='news_subject' style="width: 100%; height: 52px; border: none; padding: 0px;"></td>
						</tr>
						
						<tr style="border-bottom: 1px solid gray; text-align: left; height: auto;">
						<td colspan="6">
							<textarea class="form-control" rows="6" name='news_content'
								style="display: block; width: 850px; height: 300px;"></textarea>
						</td>
						</tr>
						<!-- 
						<tr style="border-bottom: 1px solid gray; text-align: left; height: auto;">
						<td class="column" colspan="6">첨부파일</td>
						</tr>
						 -->
						
						
					</form>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- 파일첨부 부분 -->
<!-- 
<div style="padding-top: 20px; width: 850px; text-align: left; margin: auto;">
	<div>
		<div>
			<%-- <div>첨부파일</div> --%>
			<div>
				<div class='uploadDiv'>
					<input type="file" name='uploadFile' multiple>
				</div>
				<div class='uploadResult'>
					<ul>

					</ul>
				</div>
			</div>
		</div>

	</div>

</div>

 -->

<div class="button">
	<button type="button" onclick="check()">등록</button>
	<%-- <input type="button" value="등록" onclick="check()"/> --%>
	<button type="reset">다시쓰기</button>
	<button type="button" onclick="location.href='news_list'">목록</button>
</div>

<script>
	$(document).ready(function(e) {
		
		var formObj = $("form[role='form']"); // 등록 버튼 클릭 시 첨부파일 관련 처리
		
		$("button[type='submit']").on("click",
			function(e) {
				e.preventDefault();

				console.log("submit clicked");

				var str = "";

				$(".uploadResult ul li").each(
					function(i, obj) {
						var jobj = $(obj);
						console.dir(jobj);

						str += "<input type='hidden' name='attachList["+ i + "].news_attach_name' value='"
								+ jobj.data("filename")+ "'>";
						str += "<input type='hidden' name='attachList["+ i + "].news_attach_uuid' value='"
								+ jobj.data("uuid")+ "'>";
						str += "<input type='hidden' name='attachList["+ i + "].news_attach_path' value='"
								+ jobj.data("path")+ "'>";
						str += "<input type='hidden' name='attachList["+ i + "].news_attach_type' value='"
								+ jobj.data("type")+ "'>";
					});
				
					console.log("파일첨부",str);
				formObj.append(str).submit();
			});

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); // 업로드 버튼이 따로 없고 첨부파일 등록 시 자동 감지
		var maxSize = 5242880; // 5MB

		function checkExtension(fileName, fileSize) {
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}

		$("input[type='file']").change(
			function(e) {
	
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
	
				for (var i = 0; i < files.length; i++) {
					if (!checkExtension(
							files[i].name,
							files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);
				}
	
				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						showUploadResult(result); // 업로드 결과 처리 함수
					}
				});
			});

		function showUploadResult(uploadResultArr) {
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return;
			}

			var uploadUL = $(".uploadResult ul");

			var str = "";

			$(uploadResultArr).each(
				function(i, obj) {
					//image type
					if (obj.image) {
						var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+ obj.uuid+ "_"+ obj.fileName);
						str += "<li data-path='"+obj.uploadPath+"'";
						str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
						str +" ><div>";
						str += "<span> "+obj.fileName+ "</span>";
						str += "<button type='button' data-file=\'"+ fileCallPath +"\' "
						str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName="+fileCallPath+ "'>";
						str += "</div>";
						str + "</li>";
					} else {
						var fileCallPath = encodeURIComponent(obj.uploadPath
								+ "/"+ obj.uuid+ "_"+ obj.fileName);
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

						str += "<li "
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<span> "+obj.fileName+ "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/resources/img/attach.png'></a>";
						str += "</div>";
						str + "</li>";
					}

				});

			uploadUL.append(str);
		}

		$(".uploadResult").on("click", "button", function(e) { // 업로드 파일 삭제 이벤트
			console.log("delete file");

			var targetFile = $(this).data("file");
			var type = $(this).data("type");

			var targetLi = $(this).closest("li");

			$.ajax({
				url : '/deleteFile',
				data : {
					fileName : targetFile,
					type : type
				},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					alert(result);
					targetLi.remove();
				}
			});
		});
	});
</script>

<script language="javascript">
   function check(){
   	   var subval = f.news_subject.value;
   	subval = trim(subval);
   	   if(subval.length == 0){
   		swal({
			title:"제목을 입력해 주세요.",
			text:"제목입력이 안되어 있습니다. 확인해주세요!",
			icon:"warning",
			button:"확인",
			});
   		   f.news_subject.value = "";
   		   f.news_subject.focus();
   		   return false;
   	   }else{
   		   isOver = checkByteLen(subval, 240);
   		   if(isOver){
   			swal({
   				title:"제목의 길이를 줄여주세요!",
   				text:"제목이 너무 길어요! 조금 더 짧게 입력해 주세요.",
   				icon:"warning",
   				button:"확인",
   				});
   			   f.news_subject.focus();
    		   return false;
   		   }
   	   }
   	   
   	   var contentrval = f.news_content.value;
   	contentrval = trim(contentrval);
	   if(contentrval.length == 0){
		   swal({
  				title:"내용을 입력해 주세요!",
  				text:"내용이 입력되어 있지 않습니다.",
  				icon:"warning",
  				button:"확인",
  				});
		   f.news_content.value = "";
		   f.news_content.focus();
		   return false;
	   }else{
		   isOver = checkByteLen(contentrval, 3000);
		   if(isOver){
			   swal({
	  				title:"내용의 길이를 줄여주세요!",
	  				text:"내용의 길이가 너무 길어요! 조금 더 짧게 입력해 주세요.",
	  				icon:"warning",
	  				button:"확인",
	  				});
			   f.news_content.focus();
 		   	   return false;
		   }
	   }
   	   
   	   f.submit();
   }
   function checkByteLen(str, size){  
	   var byteLen = getByteLen(str);
	   if(byteLen <= size){
		   return false;
	   }else{
		   return true;
	   }
   }
   function getByteLen(str){
	   return str.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
   }
   
   function trim(str)
   {
   	while(str && str.indexOf(" ") == 0)
   		str = str.substring(1);
   	while(str &&str.lastIndexOf(" ") == str.length-1)
   		str = str.substring(0, str.length-1);
   	return str;
   }
</script>

<%@include file="../includes/footer.jsp" %>                        	
                        	