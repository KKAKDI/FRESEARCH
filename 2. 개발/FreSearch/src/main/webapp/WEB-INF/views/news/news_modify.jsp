<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<style>
div {
	text-align: left;
	width: 850px;
	margin: auto;
}

body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>

<div>
	<div>
		<div>
			<div>

				<form role="form" action="/news/news_modify" method="post">

					<input type='hidden' name='pageNum' value=${cri.pageNum}> <input
						type='hidden' name='amount' value=${cri.amount}> <input
						type='hidden' name='type' value=${cri.type}> <input
						type='hidden' name='keyword' value=${cri.keyword}>


					<div class="form-group">
						<label>글번호</label><input id="news_code" class="form-control"
							name='news_code' value=${news.news_code} readonly="readonly">
					</div>
					<div class="form-group">
						<label>구분</label><input id="news_division" class="form-control"
							name='news_division' value=${news.news_division}
							readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label><input id="news_subject" class="form-control"
							name='news_subject' value=${news.news_subject}>
					</div>
					<div class="form-group">
						<label>글 내용</label>
						<textarea id="news_content" class="form-control" rows="6"
							name='news_content'>${news.news_content}</textarea>
					</div>

					<button type="submit" data-oper='modify' class="btn btn-success">수정</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
					<button type="submit" data-oper='list' class="btn btn-info">목록</button>
				</form>

			</div>
		</div>
	</div>
</div>

<div class='bigPictureWrapper'>
	<div class='bigPicture'></div>
</div>

<div>
	<div>
		<div>
			<div>첨부 파일</div>
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
</div>

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");
	
		$('button').on("click",function(e) {
	
			e.preventDefault();
			var operation = $(this).data("oper");
	
			console.log("operation:dddddd "+ operation);
	
			if (operation === 'remove') {
				formObj.attr("action", "/news/news_remove");
	
			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/news/news_list") .attr("method", "get");
	
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
	
				formObj.empty();
	
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
	
			} else if (operation === 'modify') {
	
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
				formObj.append(str).submit();
			}
			formObj.submit();
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
                        	
                        	