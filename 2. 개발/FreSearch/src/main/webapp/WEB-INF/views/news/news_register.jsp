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

<%--
label {
    display: inline-block;
    float: left;
    width: 100%;
    padding: 4px 5px 0 0;
    color: #666666;
    font-weight: bold;
    line-height: 16px;
    font-size: 14px;
}
    
    
textarea {
    width: 50%;
    height: 82px;
    border: 1px solid #cccccc;
    padding: 10px 0px 10px 10px;
    color: #666666;
}

input, select, textarea {
    color: #767676;
    font-family: Arial,sans-serif;
    font-size: 100%;
    }
--%>

</style>


            <div>
                <div>
                    <h2>등록하기</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div>
                <div>
                    <div>
  
                        <div>
                                           
								<form role="form" action="/news/news_register" method="post">
                        		<div class="form-group">
                        			<label>구분</label><select name='news_division'>
                        				<option value="공지사항">공지사항</option>
                        				<option value="이벤트">이벤트</option>                   			
                        			</select>
                        		</div>
                        		<div class="form-group">
                        			<label>제목</label><input class="form-control" name='news_subject'>
                        		</div>
                        		<div class="form-group">
                        			<label>글 내용</label><textarea class="form-control" rows="6" name='news_content' style="display: block;"></textarea>
                        		</div>
                        		<button type="submit">등록</button>
                        		<button type="reset">다시쓰기</button>
                        		<button type="button" onclick="location.href='news_list'">목록</button>
                        		
                        	</form>
                        	
                        </div>
                        <!-- end panel-body -->
                       </div>
                       <!-- end panel-body -->
                      </div>
                      <!-- end panel -->
                     </div>
                     <!-- /.row -->
                     
                     <!-- 파일첨부 부분 -->
                     <div>
                     	<div>
                     		<div>
                     			<div>File Attach</div>
                     			<div>
                     				<div>
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
                     
<script>
	$(document).ready(function(e){
		var formObj = $("form[role='form']"); // 등록 버튼 클릭 시 첨부파일 관련 처리
		
		$("button[type='submit']").on("click", function(e){
			e.preventDefault();
			
			console.log("submit clicked");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].news_attach_name' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].news_attach_uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].news_attach_path' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].news_attach_type' value='"+jobj.data("type")+"'>";
			});
			formObj.append(str).submit();
		});
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); // 업로드 버튼이 따로 없고 첨부파일 등록 시 자동 감지
		var maxSize = 5242880; // 5MB
		
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$("input[type='file']").change(function(e){
			
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;
			
			for(var i = 0; i < files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
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
				dataType: 'json',
					success: function(result){
						console.log(result);
						showUploadResult(result); // 업로드 결과 처리 함수
					}
			});
			
		});
		
		function showUploadResult(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length == 0){ return; }
			
			var uploadUL = $(".uploadResult ul");
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
				//image type
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
		
		$(".uploadResult").on("click", "button", function(e){ // 업로드 파일 삭제 이벤트
			console.log("delete file");
		
			var targetFile=$(this).data("file");
			var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url: '/deleteFile',
				data: {fileName: targetFile, type:type},
				dataType:'text',
				type: 'POST',
					success: function(result){
						alert(result);
						targetLi.remove();
					}
			});
		});
		
	});

</script>

                        	
                        	