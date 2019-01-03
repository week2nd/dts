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
	<div align="center">

			<h3>게시판수정</h3>

	<form action="./updateBoard" method="post" enctype="multipart/form-data">
	<input type="hidden" name="boardNumber" value="${board.boardNumber}">
<div class="col-lg-6">
		<div class="card">
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
							<label for="file-input" class=" form-control-label">파일 올리기</label>
						</div>
						<div class="col-12 col-md-9">
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