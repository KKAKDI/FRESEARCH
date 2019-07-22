<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">게시글 보기</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                                
                                <form role="form" action="/news_modify" method="post">
                                <div class="form-group">
                        			<label>글번호</label><input class="form-control" name='news_code'
                        			value=${news.news_code} readonly="readonly">
                        		</div>
                        		<div class="form-group">
                        			<label>제목</label><input class="form-control" name='news_subject'
                        			value=${news.news_subject} readonly="readonly">
                        		</div>
                        		<div class="form-group">
                        			<label>글 내용</label><textarea class="form-control" rows="6" name='news_content'
                        			readonly="readonly">${news.news_content}</textarea>
                        			
                        		</div>
                        		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 파일 첨부 추가 시 삭제 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                        		<div class="form-group">
                        			<label>첨부 파일</label><input class="form-control" name='news_file_name'
                        			value=${news.news_file_name} readonly="readonly">
                        		</div>
                        		<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
                        		<button type="submit" data-oper='remove' class="btn btn-default">삭제</button>
                        		<button type="submit" data-oper='list' class="btn btn-default">목록</button>
                        	</form>
                        	
                        </div>
                        <!-- end panel-body -->
                       </div>
                       <!-- end panel-body -->
                      </div>
                      <!-- end panel -->
                     </div>
                     <!-- /.row -->

                        	
                        	