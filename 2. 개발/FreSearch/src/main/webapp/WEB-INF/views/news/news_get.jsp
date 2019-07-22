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


<script>
$(function(){
	$("#modifyBtn").click(function(){
		modify_news();
	});
	
	$("#deleteBtn").click(function(){
		delete_news();
	});
	
	function modify_news() { // 수정 ajax
		
		var news_code = $("#news_code").val();
		var news_subject = $("#news_subject").val();
		var news_content = $("#news_content").val();
		var news_attach_name = $("#news_attach_name").val();
		
		$.ajax({
			url : "news_modify",
			type : "post",
			dataType : "json",
			data : {
				"news_code" : news_code,
				"news_subject" : news_subject,
				"news_content" : news_content,
				"news_attach_name" : news_attach_name
			},
			success : function(d) {
				console.log(d);
				if(d == 1) {
					alert("수정되었습니다.");
					location.href = "news_list";
				} 
			},
			error :  function(e) {
				console.log(e);
			}
			
		});
	}
	
	
	function delete_news() { // 삭제 ajax
		
		var news_code = $("#news_code").val();
		
		$.ajax({
			url : "news_remove",
			type : "post",
			dataType : "json",
			data : {
				"news_code" : news_code
			},
			success : function(d) {
				console.log(d);
				if(d == 1) {
					alert("삭제되었습니다.");
					location.href = "news_list";
				} 
			},
			error :  function(e) {
				console.log(e);
			}
			
		});
	}
});
	</script>
	
<script>
$(document).ready(function(){
	(function(){
		var news_code = ${news.news_code};
		
		$.getJSON("/news/getAttachList", {news_code: news_code}, function(arr){
	        
		       console.log(arr);
		       
		       var str = "";
		       
		       $(arr).each(function(i, attach){
		       
		         //image type
		         if(attach.news_attach_type){
		           var fileCallPath =  encodeURIComponent( attach.news_attach_path+ "/s_"+attach.news_attach_uuid +"_"+attach.news_attach_name);
		           
		           str += "<li data-path='"+attach.news_attach_path+"' data-uuid='"+attach.news_attach_uuid+"' data-filename='"+attach.news_attach_name+"' data-type='"+attach.news_attach_type+"' ><div>";
		           str += "<img src='/display?fileName="+fileCallPath+"'>";
		           str += "</div>";
		           str +"</li>";
		         }else{	             
		           str += "<li data-path='"+attach.news_attach_path+"' data-uuid='"+attach.news_attach_uuid+"' data-filename='"+attach.news_attach_name+"' data-type='"+attach.news_attach_type+"' ><div>";
		           str += "<span> "+ attach.news_attach_name+"</span><br/>";
		           str += "<img src='/resources/img/attach.png'></a>";
		           str += "</div>";
		           str +"</li>";
		         }
		       });
		       
		       $(".uploadResult ul").html(str);
		       
		       
		     });//end getjson

		    
		  })();//end function
		  
	$(".uploadResult").on("click", "li", function(e){
		console.log("view image");
		var liObj = $(this);
		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
		
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));
		}else{
			//download
			self.location = "/download?fileName="+path
		}
	});
		
	function showImage(fileCallPath){ // 이미지파일 보여주기
	    
	    alert(fileCallPath);
	    
	    $(".bigPictureWrapper").css("display","flex").show();
	    
	    $(".bigPicture")
	    .html("<img src='/display?fileName="+fileCallPath+"' >")
	    .animate({width:'100%', height: '100%'}, 500);
	    
	  }
		$(".bigPictureWrapper").on("click", function(e){ // 이미지 파일 닫기
	    $(".bigPicture").animate({width:'0%', height: '0%'}, 500);
	    setTimeout(function(){
	      $('.bigPictureWrapper').hide();
	    }, 500);
	  });
});

</script>


            <div>
                <div>
                    <h2>게시글</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div>
                <div>
                    <div>               
                        <div>
                                
                                <div class="form-group">
                        			<label>글번호</label><input id="news_code" class="form-control" name='news_code'
                        			value=${news.news_code} readonly="readonly">
                        		</div>
                        		<div class="form-group">
                        			<label>구분</label><input id="news_division" class="form-control" name='news_division'
                        			value=${news.news_division} readonly="readonly">
                        		</div>        
                        		<div class="form-group">
                        			<label>제목</label><input id="news_subject" class="form-control" name='news_subject'
                        			value=${news.news_subject} >
                        		</div>
                        		<div class="form-group">													
                        			<label>글 내용</label><textarea id="news_content" class="form-control" rows="6" name='news_content'
                        			>${news.news_content}</textarea>
                        		</div>         
                        		
                        		<div class='bigPictureWrapper'>
								  <div class='bigPicture'>
								  </div>
								</div>
								
								<div>
								  <div>
								    <div>
								
								      <div>첨부파일</div>
								      <!-- /.panel-heading -->
								      <div>
								        
								        <div class='uploadResult'> 
								          <ul>
								          </ul>
								        </div>
								      </div>
								      <!--  end panel-body -->
								    </div>
								    <!--  end panel-body -->
								  </div>
								  <!-- end panel -->
								</div>
								<!-- /.row -->
                        		
                        		
                        		
                        		       
                        	<%-- <button id="modifyBtn" data-oper='modify' class="btn btn-default" onclick="location.href='news_modify?news_code=${news.news_code}'">수정</button> --%>
                        		<button id="modifyBtn">수정</button>
                        		<button onclick="location.href='news_list'">목록</button>
								<button id="deleteBtn">삭제</button>
                        		

                        	
                        </div>
                        <!-- end panel-body -->
                       </div>
                       <!-- end panel-body -->
                      </div>
                      <!-- end panel -->
                     </div>
                     <!-- /.row -->

                        	
                        	