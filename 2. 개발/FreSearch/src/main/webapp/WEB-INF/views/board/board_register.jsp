<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
String ctx = request.getContextPath(); //콘텍스트 명 얻어오기
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript" src="<%=ctx %>/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<%@include file="../includes/header.jsp" %>




<style>

div{
text-align: left;

 }

div.fileupload{
	width: 850px;
	margin : auto;

}
div.button{
	width: 850px;
	margin : auto;
}

form {
	width: 850px;
	margin : auto;
}

textarea{
	width:847px;
}


.uploadResult {

	width:100%;
	background-color: white;
}

.uploadResult ul{
	display:flex;
	flex-flow:row;
	justify-content:center;
	align-items:center;
}

.uploadResult ul li{
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
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
	width:100%;
	height:100%;
	background-color: gray;
	z-index: 100;
	background:rgba(255,255,255,0.5);
}

.bigPicture{
	position: relative;
	display:flex;
	justify-content: center;
	align-items:  ;
}

.bigPicture img {
	width: 600px;
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
}

td.column-data {
	padding: 15 19;
}

div.button {
	text-align: right;
}

.nick{
	padding: 0px;
	width: 100%;
    height: 50px;
    border: none;
}
.subject{
	padding: 0px;
	width: 100%;
    height: 50px;
    border: none;
    
}
.reg_button{

	height:32px;
	width:100px;
	border:none;
	cursor:pointer;
	margin-top:10px;
	background:#1428a0;
	color:white;
}

</style>

<div class="container_new">
	<div>
		<div>
			<div style="text-align: center;">
				<h2> 게시글 등록</h2>
			

					<table style="text-align: center;">

						<form role="form" id="frm" action="/board/board_register" method="post" enctype="multipart/form-data">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<div class="form-group">
							<sec:authorize access="isAuthenticated()">
								<input type="hidden"  name='mb_email' value='<sec:authentication property="principal.member.mb_email"/>'>
							</sec:authorize>
							</div>
						
						
						<tr style="border-bottom: 1px solid #dcdcdc; border-top: 1px solid blue;  ">
							<td class="column" style="width: 15%; ">닉네임</td>
							<td class="column-data"  style="padding:0px; ">
							<sec:authorize access="isAuthenticated()">	
								<input style ="outline:none;" class="nick" name='mb_nick' value='<sec:authentication property="principal.member.mb_nick"/>' readonly="readonly">
							</sec:authorize>
							</td>
						</tr>
	
						<tr style="border-bottom: 1px solid #dcdcdc; border-top: 1px solid blue; ">
							<td class="column" >제목</td>
							<td class="column-data" style="padding:0px;"><input style ="outline:none;" class="subject" name='brd_subject'></td>
						</tr>

						<tr style="border-bottom: 1px solid gray; text-align: left; height: auto;">
							<td colspan="2">
							<textarea name='brd_content' id="ir1" rows="10" cols="100"  style="display: block; "></textarea>
							</td>
						</tr>
	
						<tr style="border-bottom: 1px solid gray; text-align: center; height:auto;">
							<td class="column" colspan="2">첨부파일</td>
						</tr> 
					</form>
				</table>
			</div>
		</div>		
	</div>
</div>

<!-- 파일첨부 부분 -->
<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<div style="padding-top:20px; width:850px; text-align:left; margin:auto;">
	<div>
		<div>
		
				<div class="form-group uploadDiv"> 
					<input type="file" name='uploadFile' multiple="multiple">
				</div>
				
				<div class='uploadResult'>
						<ul>
	
						</ul>
				</div>
			</div>
		</div>
	</div>


			<tr>
				<td>
					<div class="button">
						<button class= reg_button type="submit" onclick="submitContents();" id="save">등록</button>
						<button class= reg_button type="button" onclick="location.href='board_list'">목록</button>
					</div>
				</td>
			</tr>
			
			
	<!-- 파일 업로드 자바스크립트 -->

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
						 console.log("#######" + str);
						str += "<input type='hidden' name='attachList["+i+"].brd_attach_name' value='"
								+ jobj.data("filename")+ "'>";
						str += "<input type='hidden' name='attachList["+i+"].brd_attach_uuid' value='"
								+ jobj.data("uuid")+ "'>";
						str += "<input type='hidden' name='attachList["+i+"].brd_attach_path' value='"
								+ jobj.data("path")+ "'>";
						str += "<input type='hidden' name='attachList["+i+"].brd_attach_type' value='"
								+ jobj.data("type")+ "'>";
					   
					});
				
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
		
		var csrfHeaderName ="${_csrf.headerName}"; 
		var csrfTokenValue="${_csrf.token}";

		$("input[type='file']").change(
			function(e) {
	
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				
				var files = inputFile[0].files;
	
				for (var i = 0; i < files.length; i++) {
					
					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
					
					formData.append("uploadFile", files[i]);
				}
	
				$.ajax({
					url : '/uploadAjaxAction2',
					processData : false,
					contentType : false,
					beforeSend: function(xhr) {
				        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				    },
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
							str += "<button style=\"border: none; background-color: white;\" type='button' data-file=\'"+ fileCallPath +"\' "
							str += "data-type='image' ><i class='fa fa-times'><img style=\"width:16;\"src='/resources/img/bicon03_1.png'></i></button><br>";
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
							str += "<button style=\"border: none; background-color: white;\" type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
							str += "><i class='fa fa-times'><img style=\"width:16;\"src='/resources/img/bicon03_1.png'></i></button><br>";
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
				url : '/deleteFile2',
				data : {
					fileName : targetFile,
					type : type
				},
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
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

<!-- 네이버 스마트 에디터 자바스크립트 -->

<script type="text/javascript">
var oEditors = [];
var sLang = "ko_KR";
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "ir1",
sSkinURI : "<%=ctx%>/resources/editor/SmartEditor2Skin.html",
htParams : {
	bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
	//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
	fOnBeforeUnload : function(){
		//alert("완료!");
	}
}, //boolean
fOnAppLoad : function(){
	//예제 코드
	//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
},
fCreator: "createSEditor2"
});

</script>

<script type="text/javascript">

//저장버튼 클릭시 form 전송
/* $("#save").click(function(){
    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", [""]);
    $("#frm").submit();
});  */ 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
 // 에디터의 내용이 textarea에 적용된다.
 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
 //$("#frm").submit();
 // 에디터의 내용에 대한 값 검증은 이곳에서
 // document.getElementById("ir1").value를 이용해서 처리한다.

	try {
     elClickedObj.form.submit();
 } catch(e) {}
 } 

</script>

 <%@include file="../includes/footer.jsp" %>
