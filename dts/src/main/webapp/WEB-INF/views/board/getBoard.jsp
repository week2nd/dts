<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$.getJSON("getCommentsList", params,
				function(datas) {
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

		var str = "<strong class='commentName'>" + comment.commentsName + "</strong>"
				+ "<span class='commentContent'>" + comment.commentsContent + "</span>"
				+ "<button type=\"button\" class=\"btnUpdFrm\">수정</button>"
				+ "<button type=\"button\" class=\"btnDel\">삭제</button>"
		div.html(str);
		return div;
	}
	

	$(function() {
		loadCommentList();

		//댓글등록처리
		$("#btnAdd").click(function() {
			var params = $("#addForm").serialize();
			console.log(params);
			$.getJSON("insertComments", params, function(datas) {
				var div = makeCommentView(datas);
				$(div).prependTo("#commentsList");
			});
		});	// end btnAdd click event
		
		//댓글 삭제 이벤트
		$("#commentsList").on("click", ".btnDel", function(){
			var commentsSeq = $(this).parent().attr("id").substr(1);
			if(confirm("삭제할까요?")) {
				var params = "commentsSeq="+ commentsSeq;  // { commentsSeq : commentsSeq };
				var url = "deleteComments";
				$.getJSON(url, params, function(datas){
					$('#c'+datas.commentsSeq).remove();
				});
			}
		});
		
		
	});		//$() end ready event
</script>
</head>
<body>
<h3>게시판보기</h3>
	게시판번호 : ${board.boardNumber } <br>
	게시판제목 : ${board.boardTitle} <br>
	게시판내용 : ${board.boardContent } <br>
	작성일시 : ${board.postDate } <br>
	조회수 : ${board.boardHits } <br>
	추천수 : ${board.boardLike} <br>
	아이디 : ${board.uId } <br>
	게시판타입 : ${board.boardType } <br> 
	<a href="updateBoardform?boardNumber=${board.boardNumber}">수정</a> 
	<a href="deleteBoard?boardNumber=${board.boardNumber} ">삭제</a>
	<a href="getAnalysisBoard?type=${board.boardType}">게시판</a>


	 	<%-- 삭제할때 type도 가져오는방법<a href="deleteBoard?boardNumber=${board.boardNumber}&boardType=${board.boardType }">삭제</a> --%>
	 	<!-- a 태그에서 파라미터를 두개 가져오는 방법 -->
	 	
	 <hr>
	<h3>댓글</h3>
	<div id="commentsList"></div>

	<!-- 댓글등록시작 -->
	<div id="commentAdd">
		<form name="addForm" id="addForm">
			<input type="hidden" name="boardNumber" value="${board.boardNumber}">
			<input type="hidden" name="boardType" value="${board.boardType}">
			이름: <input type="text" name="commentsName" size="10"><br /> 
			내용: <textarea name="commentsContent" cols="20" rows="2"></textarea>
			<br /> <input type="button" value="등록" id="btnAdd" />
		</form>
	</div>
	<!-- 댓글등록끝 -->
</body>
</html>
