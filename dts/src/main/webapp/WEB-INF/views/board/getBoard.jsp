<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getBoard.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	//댓글 목록조회 요청

	
	function loadCommentList() {
		var params = {
			boardNumber : '${board.boardNumber}'
		};
		$.getJSON("getCommentsList", params, function(datas) {
			for (i = 0; i < datas.length; i++) {
				var div = makeCommentView(datas[i]);
				$(div).appendTo("#commentsList");
			}

		});
	}

	function makeCommentView(comment) {
		var div = $("<div>");
		div.attr("id", "c" + comment.commentsSeq);
		div.addClass('comment');
		div[0].comment = comment; //{id:1,.... }
		var btn = "";
		if (comment.uid == "${membersession.uId}") {
			btn = "<button type=\"button\" class=\"btnUpdFrm\" id=\"btnUpd\">수정</button>"
					+ "<button type=\"button\" class=\"btnDel\">삭제</button>"
		}
		var str = "<strong class='uId'>" + comment.uid + "</strong>"
				+ "<strong class='commentName'>" + comment.commentsName
				+ "</strong>" + "<span class='commentContent'>"
				+ comment.commentsContent + "</span>" + btn

		div.html(str);

		return div;
	}

	$(function() {
	
    	$(".like1").click(function(){		// 가입버튼 누르면 뜨는 alert
    		alert("추천하셨습니다.");
    	});
		$(".likecancel1").click(function() {
			alert("추천취소하셨습니다.");
		});
		$(".boarddelete").click(function() {
			alert("삭제처리되었습니다.");
		});
		
		
		//단일 게시판 내용 엔터키 가능
		var text = $('#boardContent').html();
		var result = text.replace(/(\n|\r\n)/g, '<br>');
		$('#boardContent').html(result);
	
		loadCommentList();
		
		
		//댓글등록처리
		$("#btnAdd").click(function() { //버튼 클릭시 btnAdd 작업 수행.
			var params = $("#addForm").serialize(); //params 안에 값을 담는다.
				if( $('#commentsName').val() == ""){					
					alert("제목을 입력해주세요.");
					return false;
				} else if($('#commentsContent').val() == ""){
					alert("내용을 입력해주세요.");
					return false;
				}
				else if($('#commentsName').val() != ""){
					alert("입력되었습니다");
				}
			console.log(params); //params 값을 콘솔창에 출력해줌.
			$.getJSON("insertComments", params, function(datas) {
				console.log(datas)
				var div = makeCommentView(datas);
				$(div).prependTo("#commentsList");
			});
		}); // end btnAdd click event

		//댓글 삭제 이벤트
		$("#commentsList").on("click", ".btnDel", function() {
			var commentsSeq = $(this).parent().attr("id").substr(1);
			if (confirm("삭제할까요?")) {
				var params = "commentsSeq=" + commentsSeq; // { commentsSeq : commentsSeq };
				var url = "deleteComments";
				$.getJSON(url, params, function(datas) {
					$('#c' + datas.commentsSeq).remove();
				});
			}
		});

		//댓글 수정 이벤트
		$("#btnUpd").click(function() {
			var params = $("[name=updateForm]").serialize();
			if( $('#commentsName').val() == ""){					
				alert("제목을 입력해주세요.");
				return false;
			} else if($('#commentsContent').val() == ""){
				alert("내용을 입력해주세요.");
				return false;
			}
			else if($('#commentsName').val() != ""){
				alert("수정되었습니다");
			}
			var url = "updateComments";
			console.log("+++++++++++++++++++++++++++++")
			console.log(params);
			$.getJSON(url, params, function(datas) {
				console.log(datas)
				var newDiv = makeCommentView(datas);
				var oldDiv = $("#c" + datas.commentsSeq);
				$("#btnCancel").click();
				$(newDiv).replaceAll(oldDiv); // replaceAll 을 해버리면 수정 폼도 없어지게 된다.
			});
		});

		//수정폼 이벤트(수정할 댓글밑에 수정폼 보이게 함)
		$("#commentsList").on("click", ".btnUpdFrm", function() {
			console.log("===============================")
			console.log($(this).parent().children()[1].innerText)		
			var commentsSeq = $(this).parent().attr("id").substr(1);
			var commentsName = $(this).parent().children()[1].innerText;
			var commentsContent = $(this).parent().children()[2].innerText;
			
			$("#commentUpdate").css("display", "inline")

			//수정할 데이터 입력필드에 셋팅
			
 			$("#updateForm [name=commentsSeq]").val(commentsSeq);
			$("#updateForm [name=commentsName]").val(commentsName);
			$("#updateForm [name=commentsContent]").val(commentsContent); 
			//수정할 댓글밑으로 이동하고 보이게
			$("#c" + commentsSeq).append($('#commentUpdate'));
			$('#commentUpdate').show();
		});


	//수정 취소 이벤트
	$("#btnCancel").click(function() {
		$("[name=updateForm]")[0].reset(); //폼 필드 클리어
		$(document.body).append($('#commentUpdate')); //그래서 위쪽 body로 수정폼을 옮겨서 가능하게 해야 한다.
		$("#commentUpdate").hide(); // 수정폼 숨기기
	});
		
});
 //$() end ready event

	
</script>
</head>
<body>
<div align="center">
	<h1>게시글보기</h1>
	
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
								class="form-control" value="${board.boardTitle}" > <small
								class="form-text text-muted"></small>
						</div>
					</div>
					<div class="row form-group">
 						<div class="col col-md-1" style="font-size:20px; margin-left:70px;" >
							<label for="text-input" class=" form-control-label">내용</label> 
						</div>
						<div class="col-202 col-md-9" >
							<input type="text" name="boardContent" id="boardContent"
								class="form-control" value="${board.boardContent}" >
								<small class="form-text text-muted"></small>
						</div>
					</div>	
					
					
					<div style="display:inline;min-width:100%;">	
					<div class="row form-group">
 						<div class="col col-md-1" style="font-size:20px; margin-left:70px; float: left; width: 10%;
 						display:inline;float:left;width:10%">
							<label for="text-input" class=" form-control-label">작성일시</label> 
						</div>
						<div class="col-202 col-md-2" style="display:inline;float:left;width:100px;">
							<input type="text" name="postDate" id="postDate"
								class="form-control" value="${board.postDate}" >
								<small class="form-text text-muted"></small>
						</div>
					</div>		
					<div class="row form-group">
 						<div class="col col-md-1" style="font-size:20px; margin-left:70px; float: left; width: 10%;" >
							<label for="text-input" class=" form-control-label">아이디</label> 
						</div>
						<div class="col-202 col-md-2" style="display:inline;float:left;width:10%;">
							<input type="text" name="uId" id="uId"
								class="form-control" value="${board.uId}" >
								<small class="form-text text-muted"></small>
						</div>
					</div>		
					<div class="row form-group">
 						<div class="col col-md-1" style="font-size:20px; margin-left:70px; float: left; width: 10%;" >
							<label for="text-input" class=" form-control-label">조회수</label> 
						</div>
						<div class="col-202 col-md-2" style="display:inline;float:left;width:10%;">
							<input type="text" name="boardHits" id="boardHits"
								class="form-control" value="${board.boardHits}" >
								<small class="form-text text-muted"></small>
						</div>
					</div>		
						<div class="row form-group">
 						<div class="col col-md-1" style="font-size:20px; margin-left:70px; float: left; width: 10%;" >
							<label for="text-input" class=" form-control-label">추천수</label> 
						</div>
						<div class="col-202 col-md-2" style="fdisplay:inline;float:left;width:10%;">
							<input type="text" name="boardLike" id="boardLike"
								class="form-control" value="${board.boardLike}" >
								<small class="form-text text-muted"></small>
						</div>
					</div>
						</div>	
	</div>	
	
	<br> 게시판번호 : ${board.boardNumber }
	<br> 게시판제목 : ${board.boardTitle}
	<br> 게시판내용 : <span id="boardContent">${board.boardContent }</span>
	<br> 작성일시 : ${board.postDate }
	<br> 조회수 : ${board.boardHits }
	<br> 추천수 : ${board.boardLike}
	<br> 아이디 : ${board.uId }
	<c:if test="${membersession.uGrant=='admin'}">
	<br> 게시판타입 : ${board.boardType }
	</c:if>
	
	<br>
	<c:if test="${not empty board.uploadFileName}">
		<!-- 이미지 파일 보여주는것 -->
		<a href="FileDown?atchFileId=${board.uploadFileName}">${board.uploadFileName }</a>
		<img src="./img/${board.uploadFileName }" />
		<!-- 이미지 파일 보여주는것 -->
	</c:if>
	
	<br>
	<c:if test="${membersession.uId == board.uId}">			<!-- 작성자 id로 로그인시 수정 가능 -->
		<a href="updateBoardform?boardNumber=${board.boardNumber}&uId=${board.uId}&boardType=${board.boardType}&uploadFileName=${board.uploadFileName}"><input type="button" value="수정"  /></a>
	</c:if>
	<c:if test="${membersession.uId == board.uId}">			<!-- 작성자 id로 로그인시 삭제 가능 -->
		<a href="deleteBoard?boardNumber=${board.boardNumber}&uId=${board.uId}"><button class="boarddelete">삭제</button></a>
	</c:if>
	
	
	<a href="getBoardList?type=${board.boardType}"><input type="button" value="리스트"  /></a>
	
	<c:if test="${board.likeCheck == 0}">					<!-- 유저 ID 비교후 좋아요 기록 없으면 좋아요 1 추가 -->
		<a href="insertLikecheck?boardNumber=${board.boardNumber}&boardType=${board.boardType}&uId=${board.uId}"><button class="like1">♥</button></a>
	</c:if>
	<c:if test="${board.likeCheck == 1}">					<!-- 유저 ID 비교후 자신이 좋아요 한 기록 -1 -->
		<a href="deleteLikecheck?boardNumber=${board.boardNumber}&boardType=${board.boardType}&uId=${board.uId}"><button class="likecancel1">♡</button></a>
	</c:if>

	
	
	<%-- 삭제할때 type도 가져오는방법<a href="deleteBoard?boardNumber=${board.boardNumber}&boardType=${board.boardType }">삭제</a> --%>
	<!-- a 태그에서 파라미터를 두개 가져오는 방법 -->

	<hr>
	<h3>댓글</h3>
	
	<div id="commentsList"></div>

	<!-- 댓글등록시작 -->
	<div id="commentAdd" align="center">
		<form name="addForm" id="addForm">
			<input type="hidden" name="boardNumber" value="${board.boardNumber}">
			<input type="hidden" name="boardType" value="${board.boardType}">
			<input type="hidden" name="uId" value="${membersession.uId}">
			<br> 
			이름: <input type="text" id="commentsName" name="commentsName" size="10" maxlength=120><br /> 
			내용: <textarea id="commentsContent" name="commentsContent" cols="20" rows="2"></textarea>
			<br /> 
			<input type="button" value="등록" id="btnAdd" />
		</form>
	</div>
	<!-- 댓글등록끝 -->

	<!-- 댓글수정폼시작 -->
	<div id="commentUpdate" style="display: none" align="center">
		<form name="updateForm" id="updateForm">
			<input type="hidden" name="boardNumber" value="${board.boardNumber}">
			<input type="hidden" name="boardType" value="${board.boardType}" />
			<input type="hidden" name="uId" value="${membersession.uId}">
			<input type="hidden" name="commentsSeq"> 이름: <input
				type="text" id="commentsName" name="commentsName" size="10"><br /> 내용:
			<textarea id="commentsContent" name="commentsContent" cols="20" rows="2"></textarea>
			<br /> <input type="button" value="등록" id="btnUpd" maxlength=120/> <input
				type="button" value="취소" id="btnCancel" />
		</form>
	</div>
	<!-- 댓글수정폼끝 -->
	</div>	<!-- center로 보내는 div -->
	</div>
</body>
</html>
