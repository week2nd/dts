<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateUser.jsp</title>
</head>
<body>
	<form action="./updateBoard" method="post" enctype="multipart/form-data">
	<input type="hidden" name="boardNumber" value="${board.boardNumber}">
	<div class="top-campaign">
	<div align="center">

			<h3>게시판수정</h3>

<script>
//게시판 입력시 알람 띄우는것
$(function() {
	
	$(".updatebo").click(function(){		
		alert("수정되었습니다");
	});
});

</script>

<div class="col-lg-45" style="height: 700px;">
			<div class="card-body card-block">			
					</div>
					<div class="row form-group">
						<div class="col col-md-1" style="font-size:20px;  margin-left:70px;">
							<label for="text-input" class=" form-control-label">제목</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="boardTitle" name="boardTitle"
							value="${board.boardTitle}"
								class="form-control"> <small
								class="form-text text-muted">제목을 입력하세요</small>
						</div>
					</div>
					<div class="row form-group">
						<div class="col col-md-1" style="font-size:20px;  margin-left:70px;">
							<label for="text-input" class=" form-control-label">내용</label>
						</div>
						<div class="col-12 col-md-9">
							<textarea name="boardContent" id="boardContent" rows="9"
								class="form-control">${board.boardContent}</textarea>							 
								<small class="form-text text-muted">내용을 입력하세요</small>
						</div>
					</div>			
							
							<input type="hidden" id="uId" name="uId"
							value="${membersession.uId}" readonly>		
														
					<div class="row form-group">
						<div class="col col-md-1" style="font-size:20px;  margin-left:70px;">
							<label for="file-input" class=" form-control-label"></label>
						</div>
						<div class="col-12 col-md-9">
							
							<input type="file" id="uploadFile" name="uploadFile"
								class="form-control-file">
						<input type="text" id="uploadFileName" name="uploadFileName" value="${board.uploadFileName}"> 
						
						</div>
					</div>
					<div class="btn btn-outline-secondary">
				<button name="boardType" value="${type}" class="updatebo">저장</button>
				</div>
				<div class="btn btn-outline-secondary">
				<a href="./getBoard?boardNumber=${board.boardNumber}&uId=${board.uId}">취소</a>
				</div>
			</div>
			
			<!-- <input	type="file" name="uploadFile"><br> -->
			

			</div>
			</div>
			</form>
</body>
</html>