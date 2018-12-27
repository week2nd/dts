<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
				+ "<button type=\"button\" class=\"btnUpdFrm\" id=\"btnUpd\">수정</button>"
				+ "<button type=\"button\" class=\"btnDel\">삭제</button>"
				
		div.html(str);
				
		return div;
	}
	

	$(function() {
		loadCommentList();



		//댓글등록처리
		$("#btnAdd").click(function() {					//버튼 클릭시 btnAdd 작업 수행.
			var params = $("#addForm").serialize();		//params 안에 값을 담는다.
			console.log(params);						//params 값을 콘솔창에 출력해줌.
			$.getJSON("insertComments", params, function(datas) {	
				console.log(datas)
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
	
		
		//댓글 수정 이벤트
		$("#btnUpd").click(function(){			
			console.log("===============================+++++++++++++")
			var params = $("[name=updateForm]").serialize();
			var url = "updateComments";
			console.log(params);
			$.getJSON(url, params, function(datas){
				 console.log(datas) 
				var newDiv = makeCommentView(datas);
				var oldDiv = $("#c"+datas.commentsSeq);
				$(document.body).append($('#commentUpdate')); //그래서 위쪽 body로 수정폼을 옮겨서 가능하게 해야 한다.
				$(newDiv).replaceAll(oldDiv);  // replaceAll 을 해버리면 수정 폼도 없어지게 된다.
				$("#btnCancel").click();
				

			});			
		});	 

		
		//수정폼 이벤트(수정할 댓글밑에 수정폼 보이게 함)
		$("#commentsList").on("click", ".btnUpdFrm", function(){
			console.log("===============================" )
			console.log($(this).parent().children()[1].innerText)    
			
  			var commentsSeq = $(this).parent().attr("id").substr(1);			
			var commentsName = $(this).parent().children()[0].innerText;		
			var commentsContent = $(this).parent().children()[1].innerText; 	 
 
 			$("#commentUpdate").css("display","inline")   
			
			//수정할 데이터 입력필드에 셋팅
 			$("#updateForm [name=commentsSeq]").val(commentsSeq);    
			$("#updateForm [name=commentsName]").val(commentsName);
			$("#updateForm [name=commentsContent]").val(commentsContent); 
			//수정할 댓글밑으로 이동하고 보이게
			$("#c"+commentsSeq).append($('#commentUpdate'));  
			$('#commentUpdate').show();   
		});
		
	});

	
	
	//수정 취소 이벤트
	$("#btnCancel").click(function(){
		$("[name=updateForm]")[0].reset();   //폼 필드 클리어
		$("#comments").append( $("#commentUpdate") );//수정 폼(div)를 이동
		$("#commentUpdate").hide();    // 수정폼 숨기기
	}); //$() end ready event
	
	
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
	<c:if test="${not empty board.uploadFileName}">		<!-- 이미지 파일 보여주는것 -->
	<a href="FileDown?atchFileId=${board.uploadFileName}">${board.uploadFileName }</a>
	<img src="./img/${board.uploadFileName }"/>	<!-- 이미지 파일 보여주는것 -->
	</c:if>
	<br>
	<a href="updateBoardform?boardNumber=${board.boardNumber}">수정</a> 
	
	
	<c:if test="${membersession.uId == board.uId} ">
	<a href="deleteBoard?boardNumber=${board.boardNumber} ">삭제</a>
	</c:if>
	
	
	<a href="getBoardList?type=${board.boardType}">게시판</a>


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
	
	<!-- 댓글수정폼시작 -->
<div id="commentUpdate" style="display:none">
	<form name="updateForm" id="updateForm">
	<input type="hidden" name="boardNumber" value="${board.boardNumber}">
	<input type="hidden" name="boardType" value="${board.boardType}"/>
	<input type="hidden" name="commentsSeq" >
	이름: <input type="text" name="commentsName" size="10"><br/>
	내용: <textarea name="commentsContent" cols="20" rows="2"></textarea><br/>
	<input type="button" value="등록" id="btnUpd"/>
	<input type="button" value="취소" id="btnCancel"/>
	</form>
</div>
<!-- 댓글수정폼끝 -->
</body>
</html>
