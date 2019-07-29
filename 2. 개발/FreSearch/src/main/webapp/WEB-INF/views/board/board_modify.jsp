<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <% 
String ctx = request.getContextPath(); //콘텍스트 명 얻어오기
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="<%=ctx %>/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<style>

h1{
text-align:center;
}

div{
text-align: left;

 }

form {
	width:850px;
	margin : auto;
}
body {

  padding-top: 70px;

  padding-bottom: 30px;
  
}
textarea{
	width:848px;
}
</style>
<div>
	<div>
		<h1>글 수정</h1>
	</div>
</div>
	
	<div>
		<div>
			
		</div>
	</div>
<form role="form" id="frm" action="/board/board_modify" method="post">
<input type='hidden' name='pageNum' value='${cri.pageNum }'>
<input type='hidden' name='amount' value='${cri.amount }'>
<input type='hidden' name='keyword' value='${cri.keyword }'>
<input type='hidden' name='type' value='${cri.type}'>

<div class="form-group">
  <label>번호</label> 
  <input class="form-control" name='brd_code' 
     value='${board.brd_code}' readonly="readonly">
</div>

<div class="form-group">
  <label>제목</label> 
  <input class="form-control" name='brd_subject' 
    value='${board.brd_subject }' >
</div>

<div class="form-group">
  <label>내용</label>
  <textarea name="brd_content" id="ir1" rows="10" cols="100" >${board.brd_content}</textarea>
</div>

<div class="form-group">
  <input  type="hidden" class="form-control" name='mb_email'
    value='${board.mb_email}' readonly="readonly">            
</div>

<div class="form-group">
  <input   type="hidden" class="form-control" name='mb_nick'
    value='${board.mb_nick}
    ' readonly="readonly">            
</div>

   <button class="btn btn-sm btn-success" type="submit" onclick="submitContents();" id="modify">수정</button>
  <button class="btn btn-sm btn-danger" type="submit" data-oper='delete'>삭제</button>
  <button class="btn btn-sm btn-primary" type="submit" data-oper='list'>리스트</button>

</form>

<script type="text/javascript">

$(document).ready(function() {

	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'delete'){
			formObj.attr("action", "/board/board_delete");
			
		}else if(operation === 'list'){
			formObj.attr("action", "/board/board_list").attr("method", "get");
			var pageNumTag =$("input[name='pageNum']").clone();
			var amountTag =$("input[name='amount']").clone();
			var keywordTag =$("input[name='keyword']").clone();
			var typeTag =$("input[name='type']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		formObj.submit();	
	});
	
});
</script>

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
$("#modify").click(function(){
    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", [""]);
    $("#frm").submit();
 
});  

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
 // 에디터의 내용이 textarea에 적용된다.
 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

 // 에디터의 내용에 대한 값 검증은 이곳에서
 // document.getElementById("ir1").value를 이용해서 처리한다.

 try {
     elClickedObj.form.submit();
 } catch(e) {}
 }

</script>
