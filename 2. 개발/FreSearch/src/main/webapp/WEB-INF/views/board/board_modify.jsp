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
   padding-top: 15px;
   font-weight: bold;
   text-align: center;
}

td.column-data {
   padding: 14 19;
}

div.button {
   text-align: right;
   margin: auto;
   width: 850px;
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
	display:flex;
	background-color: #e9ecef;
	}

.uploadResult ul li{
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
	display: inline-block;
}

.uploadResult ul li img {
	/* width: 100px; */
	width: 76px;
}

.uploadResult ul li span{
	color: #1428a0;
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
	
.modify_button{
 	height: 32px;
    border: none;
    width: 70px;
    cursor: pointer;
    margin-top: 10px;
    background: #1428a0;
    color: white;
}


</style>

<div class="container_new">
   <div>
   	
   	<div style="text-align: center;">
				<h2> 게시글 수정</h2>
				</div>
   
      <div style="text-align: center;">
         <table style="text-align: center;">
            <form role="form" id="frm" action="/board/board_modify" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type='hidden' name='pageNum' value='${cri.pageNum }'>
			<input type='hidden' name='amount' value='${cri.amount }'>
			<input type='hidden' name='keyword' value='${cri.keyword }'>
			<input type='hidden' name='type' value='${cri.type}'>
			
			<tr style="border-bottom: 1px solid #dcdcdc; border-top: 1px solid blue;">
                     <td class="column" style="width: 15%;" >No</td>
                      <td class="column-data" colspan="2" style="padding: 0px;"><input id="brd_code" class="form-control"
                      name='brd_code' value=${board.brd_code} 
                      readonly="readonly" style="width: 100%; height:52px; border: none; padding:0px; text-align: center; outline:none;">
                      </td>
                      
                      
                     <td class="column" style="width: 15%;">닉네임</td>
                     <td class="column-data" colspan="2" readonly>${board.mb_nick}</td>
           </tr>
           
           <tr style="border-bottom: 1px solid #dcdcdc; border-top: 1px solid blue;">
                  <td class="column" style="width: 15%;">제목</td>
                  <td class="column-data" colspan="5" style="padding: 0px;">
                  <input id="brd_subject" class="form-control"
                     name='brd_subject' style="width: 100%; height:52px; border:none; padding:0px; outline:none;" value=${board.brd_subject}></td>
               </tr>
               
               <tr style="border-bottom: 1px solid gray; text-align: left; height: auto;">
                  <td colspan="6">
                  <textarea  id="ir1" rows="10" cols="100" class="form-control" rows="6" name='brd_content' 
                     style="display: block; width: 848px; height: 300px;">${board.brd_content}</textarea>
                  </td>
               </tr>
               
                <tr style="border-bottom: 1px solid gray; text-align: left; height: auto;">
               		<td class="column" colspan="6">첨부파일</td>
               </tr>
               
               <div>
					<input type='hidden' name='brd_is_attach' value=${board.brd_is_attach}>
					<input type='hidden' name='brd_code' value=${board.brd_code}>
				</div>
					
					
				
			
				<div class="form-group">
  					<input  type="hidden" class="form-control" name='mb_email' value='${board.mb_email}' readonly="readonly">            
				</div>

				<div class="form-group">
  					<input   type="hidden" class="form-control" name='mb_nick' value='${board.mb_nick}' readonly="readonly">            
				</div>
				
				<div>
               		 <input type='hidden' name='brd_code' value=${board.brd_code}>
              
               </div>
				
				
			 </form>
         </table>        
      </div>
   </div>
</div>

<div class='bigPictureWrapper'>
   <div class='bigPicture'></div>
</div>


<div style="padding-top: 20px; width: 850px; text-align: left; margin: auto;">
   <div>
      <%-- <div>첨부 파일</div> --%>
      <div>
         <div class="form-group uploadDiv">
            <input type="file" name='uploadFile' multiple="multiple">
         </div>

         <div class='uploadResult'>
            <ul>

            </ul>
         </div>
      </div>

		<div style= "text-align:right; width: 850px;">
					<button class="modify_button" type="submit" data-oper='modify' onclick="submitContents();" id="modify">수정</button>
  				<button class="modify_button" type="submit" data-oper='delete'>삭제</button>
  				<button class="modify_button" type="submit" data-oper='list'>리스트</button>
		</div>

   </div>
</div>
		






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
			
		}else if (operation === 'modify') {
			
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
		}
		formObj.submit();
	});
});
</script>



<script type="text/javascript">
$(document).ready(function() {
	  (function(){   
		  
		  var brd_code = ${board.brd_code};
		  
	    $.getJSON("/board/getAttachList", {brd_code: brd_code}, function(arr){
	    
	      console.log(arr);     
	      var str = "";

	      $(arr).each(function(i, attach){
	          
	          //image type
	          if(attach.brd_attach_type){
	            var fileCallPath =  encodeURIComponent( attach.brd_attach_path+ "/s_"+attach.brd_attach_uuid +"_"+attach.brd_attach_name);	            
	            str += "<li data-path='"+attach.brd_attach_path+"' data-uuid='"+attach.brd_attach_uuid+"' "
	            str +=" data-filename='"+attach.brd_attach_name+"' data-type='"+attach.brd_attach_type+"' >";
	            str += "<span> "+ attach.brd_attach_name+"</span>";
	            str += "<button style=\"border: none; background-color: white;\" type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
	            str += "><i class='fa fa-times'></i><img style=\"width:16;\"src='/resources/img/bicon03_1.png'></button><br>";
	            str += "<img src='/display?fileName="+fileCallPath+"'>";
	            str +"</li>";
	          }else{
	              
	            str += "<li data-path='"+attach.brd_attach_path+"' data-uuid='"+attach.brd_attach_uuid+"' "
	            str += "data-filename='"+attach.brd_attach_name+"' data-type='"+attach.brd_attach_type+"' >";
	            str += "<span> "+ attach.brd_attach_name+"</span><br/>";
	            str += "<button style=\"border: none; background-color: white;\" type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
	            str += " ><i class='fa fa-times'><img style=\"width:16;\"src='/resources/img/bicon03_1.png'></i></button><br>";
	            str += "<img src='/resources/img/attach.png'></a>";	          
	            str +"</li>";
	          }
	       });
	  
	      $(".uploadResult ul").html(str);
	      
	    });//end getjson
	  })();//end function
  
  
	  $(".uploadResult").on("click", "button", function(e){
		    
		    console.log("delete file");
		      
		    if(confirm("파일을 삭제하시겠습니까?")){
		    
		      var targetLi = $(this).closest("li");
		      targetLi.remove();
		    }
		  });  
		  
		  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		  var maxSize = 5242880; //5MB
		  
		  function checkExtension(fileName, fileSize){
		    
		    if(fileSize >= maxSize){
		      alert("파일 사이즈 초과");
		      return false;
		    }
		    
		    if(regex.test(fileName)){
		      alert("해당 종류의 파일은 업로드할 수 없습니다.");
		      return false;
		    }
		    return true;
		  }
		  
		  var csrfHeaderName ="${_csrf.headerName}"; 
		  var csrfTokenValue="${_csrf.token}";
		  
		  $("input[type='file']").change(function(e){

		    var formData = new FormData();
		    
		    var inputFile = $("input[name='uploadFile']");
		    
		    var files = inputFile[0].files;
		    
		    for(var i = 0; i < files.length; i++){

		      if(!checkExtension(files[i].name, files[i].size) ){
		        return false;
		      }
		      formData.append("uploadFile", files[i]);
		      
		    }
		    
		    $.ajax({
		      url: '/uploadAjaxAction2',
		      processData: false, 
		      contentType: false,
		      beforeSend: function(xhr) {
			     xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			  },
		      data: formData,
		      type: 'POST',
		      dataType:'json',
		        success: function(result){
		          console.log(result); 
				  showUploadResult(result); //업로드 결과 처리 함수 

		      }
		    }); //$.ajax
		    
		  });    

		  function showUploadResult(uploadResultArr){
			    
		    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
		    
		    var uploadUL = $(".uploadResult ul");
		    
		    var str ="";
		    
		    $(uploadResultArr).each(function(i, obj){
				
				if(obj.image){
					var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"'";
					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
					str +" ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button style=\"border: none; background-color: white;\" type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type='image' ><i class='fa fa-times'><img style=\"width:16;\"src='/resources/img/bicon03_1.png'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str +"</li>";
				}else{
					var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
				    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				      
					str += "<li "
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button style=\"border: none; background-color: white;\" type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "><i class='fa fa-times'><img style=\"width:16;\"src='/resources/img/bicon03_1.png'></i></button><br>";
					str += "<img src='/resources/img/attach.png'></a>";
					str += "</div>";
					str +"</li>";
				}

		    });
		    
		    uploadUL.append(str);
		  }
		  
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

<%@include file="../includes/footer.jsp" %>	
