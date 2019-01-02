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


<%--  		<form action="./insertBoard" method="post"
			enctype="multipart/form-data">
			제목<input type="text" name="boardTitle"><br> 
			내용<textarea rows="9" cols="30" name="boardContent"></textarea>
			<br> 아이디<input type="text" name="uId"
				value="${membersession.uId}" readonly><br> 첨부파일<input
				type="file" name="uploadFile"><br>
			<!-- 파일업로드 -->
			
			<input type="hidden" name="boardType" value="${type}"><br>
			<button>저장</button>
		</form>
	</div>  --%>


<form action="./insertBoard" method="post"
			enctype="multipart/form-data">
	<div class="col-lg-6">
		<div class="card">
			<div class="card-body card-block">			
					</div>
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="text-input" class=" form-control-label">제목</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="text-input" name="text-input"
								class="form-control"> <small
								class="form-text text-muted">제목을 입력하세요</small>
						</div>
					</div>
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="textarea-input" class=" form-control-label">내용</label>
						</div>
						<div class="col-12 col-md-9">
							<textarea name="textarea-input" id="textarea-input" rows="9"
								class="form-control"></textarea>
								<small class="form-text text-muted">내용을 입력하세요</small>
						</div>
					</div>
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="text-input" class=" form-control-label">ID</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="text-input" name="uId"
							value="${membersession.uId}" readonly
								class="form-control"> <small
								class="form-text text-muted"></small>
						</div>
					</div>				
				
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="file-input" class=" form-control-label">File
								input</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="file" id="file-input" name="file-input"
								class="form-control-file">
						</div>
					</div>
			</div>
				<input type="hidden" name="boardType" value="${type}"><br>
			<button>저장</button>
		
				<button type="reset" class="btn btn-danger btn-sm">
					<i class="fa fa-ban"></i> Reset
				</button>
			</div>
			</form>
</body>
</html>