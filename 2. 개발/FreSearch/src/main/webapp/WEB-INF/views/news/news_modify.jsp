<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<%@include file="../includes/header.jsp"%>

<style>
body {
	font-family: "Open Sans", sans-serif;
	min-width: 850px;
	font-weight: 500;
	font-size: 16px;
}

.container_new {
	padding-top: 150px;
	min-height: 872px;
}

.button #modify, .button #delete, .button #list {
	height: 30px;
	border: none;
	width: 80px;
	cursor: pointer;
	margin-top: 20px;
	background: #1428a0;
	color: white;
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

th, td {
	font-size: 16px;
}

div.button {
	text-align: right;
	margin: auto;
	width: 850px;
}

.news-head h2 {
	text-align: left;
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

input, textarea {
	outline: none;
}

textarea {
	resize: none;
}
</style>


<div class="container_new">
	<div>
		<div style="text-align: center;">

			<div>
				<div class="news-head">
					<h2>새소식 수정</h2>
				</div>

				<table style="text-align: center;">
					<form name='f' role="form" action="/news/news_modify" method="post">
						<input id="token" type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type='hidden' name='pageNum'
							value=${cri.pageNum}> <input type='hidden' name='amount'
							value=${cri.amount}> <input type='hidden' name='type'
							value=${cri.type}> <input type='hidden' name='keyword'
							value=${cri.keyword}>
						<tr
							style="border-bottom: 1px solid #dcdcdc; border-top: 1px solid blue;">
							<td class="column" style="width: 15%;">구분</td>
							<td class="column-data" colspan="2" readonly>${news.news_division}</td>
							<td class="column" style="width: 15%;">작성자</td>
							<td class="column-data" colspan="2" readonly>FreSearch</td>
						</tr>
						<tr
							style="border-bottom: 1px solid #dcdcdc; border-top: 1px solid blue;">
							<td class="column" style="width: 15%;">제목</td>
							<td class="column-data" colspan="5" style="padding: 0px;"><input
								id="news_subject" class="form-control" name='news_subject'
								style="width: 100%; height: 52px; border: none; padding: 0px;"
								value=${news.news_subject}></td>
						</tr>
						<tr
							style="border-bottom: 1px solid gray; text-align: left; height: auto;">
							<td colspan="6"><textarea id="news_content"
									class="form-control" rows="6" name='news_content'
									style="display: block; width: 850px; height: 300px;">${news.news_content}</textarea>
							</td>
						</tr>
						<div>
							<input type='hidden' name='news_is_attach'
								value=${news.news_is_attach}> <input type='hidden'
								name='news_code' value=${news.news_code}> <input
								type='hidden' name='news_division' value=${news.news_division}>
						</div>
					</form>
				</table>
			</div>
		</div>
	</div>
	<div class='button'>
		<button type="submit" data-oper='modify' class="btn btn-success"
			id="modify">수정</button>
		<button type="submit" data-oper='remove' class="btn btn-danger"
			id="delete">삭제</button>
		<button type="submit" data-oper='list' class="btn btn-info" id="list">목록</button>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		
		var division = '<c:out value='${news.news_division}'/>';
		
		console.log(division);
		var formObj = $("form");
	
		$('button').on("click",function(e) {
	
			e.preventDefault();
			var operation = $(this).data("oper");
	
			console.log("operation:dddddd "+ operation);
			console.log("formObj: "+ formObj);
	
			if (operation === 'remove') {

				formObj.attr("action", "/news/news_remove");
				formObj.submit();
	
			} else if (operation === 'list') {
				//move to list
				$("#news_content").html(""); // 목록버튼 누를 시 content 내용 삭제
				if(division == "공지"){
					formObj.attr("action", "/news/news_list") .attr("method", "get");
				} else {
					formObj.attr("action", "/news/news_list_event") .attr("method", "get");
				}
				
				
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
	
				formObj.empty();
	
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
				
				formObj.submit();
	
			} else if (operation === 'modify') {
				
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
				   	   
					   formObj.submit();
				   
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
			}
		});
	});
</script>


<script>

$(document).ready(function() {
  (function(){   
	  
	  var news_code = ${news.news_code};
	  
    $.getJSON("/news/getAttachList", {news_code: news_code}, function(arr){
    
      console.log(arr);     
      var str = "";

      $(arr).each(function(i, attach){
          
          //image type
          if(attach.news_attach_type){
            var fileCallPath =  encodeURIComponent( attach.news_attach_path+ "/s_"+attach.news_attach_uuid +"_"+attach.news_attach_name);
            
            str += "<li data-path='"+attach.news_attach_path+"' data-uuid='"+attach.news_attach_uuid+"' "
            str +=" data-filename='"+attach.news_attach_name+"' data-type='"+attach.news_attach_type+"' ><div>";
            str += "<span> "+ attach.news_attach_name+"</span>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
            str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/display?fileName="+fileCallPath+"'>";
            str += "</div>";
            str +"</li>";
          }else{
              
            str += "<li data-path='"+attach.news_attach_path+"' data-uuid='"+attach.news_attach_uuid+"' "
            str += "data-filename='"+attach.news_attach_name+"' data-type='"+attach.news_attach_type+"' ><div>";
            str += "<span> "+ attach.news_attach_name+"</span><br/>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
            str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/resources/img/attach.png'></a>";
            str += "</div>";
            str +"</li>";
          }
       });
  
      $(".uploadResult ul").html(str);
      
    });//end getjson
  })();//end function
  
  
  $(".uploadResult").on("click", "button", function(e){
	    
    console.log("delete file");
      
    if(confirm("Remove this file? ")){
    
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
      url: '/uploadAjaxAction',
      processData: false, 
      contentType: false,
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
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/img/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		}
    });
    uploadUL.append(str);
  }
});

</script>

<%@include file="../includes/footer.jsp"%>
