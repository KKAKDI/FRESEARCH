<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
div {
   text-align: center;
}

table {
   width: 80%;
   border-top: 1px solid #444444;
   border-collapse: collapse;
   margin: auto;
}

th, td {
   border-bottom: 1px solid #444444;
   padding: 10px;
}

th {
   text-align: center;
   background-color: #0c4da2;
   font-family: "Times New Roman", Times, serif;
   font-style: oblique;
   font-size: 20px;
   color: white;
}

td {
   text-align: center;
}

button {
   margin-bottom: 10px;
}
</style>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">새소식</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">공지사항 / 이벤트</div>
                        <button id="regBtn" type="button">등록하기</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>글번호</th>
                                        <th>구분</th>
                                        <th>제목</th>
                                        <th>등록일</th>
                                        <th>조회</th>
                                        <th>첨부</th>
                                    </tr>
                                </thead>
                                
                                <c:forEach items="${list}" var="news">
                                	<tr>
                                		<td>${news.news_code}</td>
                                		<td>${news.news_division}</td>
                                		<td><a href='/news/news_get?news_code=${news.news_code}'>
                                		${news.news_subject}</a></td>
                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${news.news_regdate}" /></td>
                                		<td>${news.news_views}</td>
                                		<td></td>
                                	</tr>
                                </c:forEach>
                                
                            </table>
                           </div>
                           <!-- end panel-body -->
                          </div>
                          
                          
                          <!-- end panel -->
                         </div>
                        </div>
                        <!-- /.row -->

		

		<script type="text/javascript">
			$(document).ready(function(){
				
				//등록페이지 이동 버튼 스크립트
				$("#regBtn").on("click", function(){
					self.location = "news_register";
				});
				
				
				
				var result = '<c:out value="${result}" />';
				
				checkModal(result);
				
				function checkModal(result){
					
					if(result === ''){
						return;
					}
					
					if(parseInt(result)>0){
						$(".modal-body").html(
								"게시글" + parseInt(result) + "번이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}
			});
					
		</script>
	
 