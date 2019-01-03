<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판등록</title>
</head>
<body>
		<div align="center">
		<c:if test="${type=='notice'}">
			<h3>공지게시판입력</h3>
		</c:if>
		<c:if test="${type=='free'}">
			<h3>자유게시판입력</h3>
		</c:if>
		<c:if test="${type=='analysis'}">
			<h3>분석게시판입력</h3>
		</c:if>
		<c:if test="${type=='suggestion'}">
			<h3>건의게시판입력</h3>
		</c:if>


<form action="./insertBoard" method="post"
			enctype="multipart/form-data">

	<div class="col-lg-6">
		<div class="card">
			<div class="card-body card-block">			
					</div>
 					<div class="row form-group">
						<div class="col col-md-1" style="font-size:20px; margin-left:70px;" >
							<label  for="text-input" class=" form-control-label">제목</label>	
						</div> 
						<div class="col-202 col-md-9">
							<input type="text" id="boardTitle" name="boardTitle"
								class="form-control" placeholder="제목을 입력하세요"> <small
								class="form-text text-muted"></small>
						</div>
					</div>
					<div class="row form-group">
 						<div class="col col-md-1" style="font-size:20px; margin-left:70px;" >
							<label for="text-input" class=" form-control-label">내용</label> 
						</div>
						<div class="col-202 col-md-9" >
							<textarea name="boardContent" id="boardContent" rows="9"
								class="form-control" placeholder="내용을 입력하세요"></textarea>
								<small class="form-text text-muted"></small>
						</div>
					</div>					
							<input type="hidden" id="uId" name="uId"
							value="${membersession.uId}" readonly>		
					</div>								
					<div class="row form-group">
						<div class="col col-md-1" style="font-size:20px; margin-left:100px;">
							<label for="file-input" class=" form-control-label">파일 올리기</label>
						</div>
						<div class="col-202 col-md-9" >
							<input type="file" id="uploadFile" name="uploadFile"
								class="form-control-file">
						</div>
					</div>
			</div>
			
			<!-- <input	type="file" name="uploadFile"><br> -->
			
				<button name="boardType" value="${type}">저장</button>
		

			</div>
			</form>
</body>
</html>