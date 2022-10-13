<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘의 직방</title>
		<link href="/resources/css/reset.css" rel="stylesheet">
		<link href="/resources/css/board/board.css" rel="stylesheet">
		
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
		<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
		<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <c:import url="../template/header.jsp"></c:import>

	<section class="container-fluid container-lg-8 mt-5">
			<div class = " justify-content-center mt-5" >
				<div class = "boardDetailbody">
				<div  id="boardSection" class="shadowBox">
				
					<div class="board-url">
						<c:if test="${board=='NOTICE'}">
							<div>
								공지사항
							</div>
						</c:if>
						<c:if test="${board=='QNA'}">
							<div>
								문의
							</div>
						</c:if>
					</div>
				
				
				
				
				
				
				
						<div class="board-title">
							${boardList.title }
						</div>
						
						<div  class="board-writerSection">
							<div  class="board-imgDiv">
								
								<c:choose>
									<c:when test="${not empty boardList.mfileName }">
										<img class="board-img" alt="" src="/resources/upload/member/${boardList.mfileName }" >
									</c:when>
									<c:otherwise>
										<img class="board-img" alt="" src="/resources/images/NoProfile.png" >
									</c:otherwise>
								</c:choose>
								
								
								
							</div>
							<div>
								<div  class="board-userId">
									${boardList.userId }
								</div>
								<div class="board-info">
									${boardList.regDate } 조회수 ${boardList.hit }
								</div>
							</div>
						</div>
						<hr>
						<div class="board-contents">
						     ${boardList.contents }
						</div>
					    <div>
					    
					    	
						      <c:if test="${not empty boardList.boardFileDTOs }">
						      	<div  class="board-filetitle">💾첨부 파일</div>
							      <c:forEach items="${boardList.boardFileDTOs }" var="file">
							      	<c:if test="${not file.sort}">
							      		<a href="/resources/upload/${board }/${file.fileName }">${file.oriName }</a>
							
							      	</c:if>
							      </c:forEach>
							      
						      </c:if>
					    </div>
						  
					<!-- QNA 추가 페이지 -->
					</div>
					
						<div class="boardBtnDiv">
						    	<c:if test="${boardList.userId eq member.userId }">
						    		
						    		<c:if test="${empty qnaAnswer }">
						    			<button id="boardUpdateBtn" class="boardUpdateBtn boardBlueBtn" data-a="./update?boardNum=${boardList.boardNum }" >수정</button>
						    			
						    		</c:if>
						    		<button id="boardDeleteBtn" class="boardDeleteBtn boardBlueBtn" data-a="./delete?boardNum=${boardList.boardNum }"  style="margin-left: 10px;">삭제</button>
						    		
						    	</c:if>
						    </div>
					
					
					
					<c:if test="${board eq 'QNA' }">
						
						<c:choose>
							<c:when test="${not empty qnaAnswer}">
							<div  id="boardSection" class="shadowBox">
							<div class="board-url">
								<div>문의 답변</div>
							</div>
							<div class="board-title">
							${qnaAnswer.title }
							</div>
							
							<div  class="board-writerSection">
								<div  class="board-imgDiv">
									<c:choose>
									<c:when test="${not empty qnaAnswer.mfileName }">
										<img class="board-img" alt="" src="/resources/upload/member/${qnaAnswer.mfileName }" >
									</c:when>
									<c:otherwise>
										<img class="board-img" alt="" src="/resources/images/NoProfile.png" >
									</c:otherwise>
								</c:choose>
								</div>
								<div>
									<div  class="board-userId">
										${qnaAnswer.userId }
									</div>
									<div class="board-info">
										${qnaAnswer.regDate }
									</div>
								</div>
							</div>
							<hr>
							<div class="board-contents">
							     ${qnaAnswer.contents }
							</div>
							
							<div> 
								
								   
								     <c:if test="${not empty qnaAnswer.boardFileDTOs }">
								     	<div class="board-filetitle">💾첨부 파일</div>
									      <c:forEach items="${qnaAnswer.boardFileDTOs }" var="file">
									      <c:if test="${not file.sort}">
									      		<a href="/resources/upload/QNAANSWER/${file.fileName }">${file.oriName }</a>
									      </c:if>
									      </c:forEach>
						    		  </c:if>
							</div>  
							
					    	</div>
					    	
					    	<div class="boardBtnDiv">
								<c:if test="${qnaAnswer.userId eq member.userId }">
									<button id="answerUpdateBtn" class="boardUpdateBtn boardBlueBtn" data-a="./updateAnswer?boardNum=${boardList.boardNum }" >답변 수정</button>
						    		<button id="answerDeleteBtn" class="boardDeleteBtn boardBlueBtn" data-a="./deleteAnswer?boardNum=${boardList.boardNum }" style="margin-left: 10px;">답변 삭제</button>
						    			
						    	</c:if>
					    	</div>
							</c:when>
							<c:otherwise>
							
							<c:choose>
								<c:when test="${member.roleDTOs[0].roleNum<3 }">
								
								<div  id="boardSection" class="shadowBox">
								    	<form action="./answer" method="post" id = "boardForm" enctype="multipart/form-data" >
								    		<input type="hidden"  id="boardNum" name="boardNum" value="${boardList.boardNum } " class="form-control" >
								    	
												<table class = "table">
													<thead>
													</thead>
													
													<tbody>
														<tr>
															<th>제목</th>
															<td>
													        	<input type="text" value = "${boardList.title }의 답변" id="title" name="title" class="form-control" placeholder="제목" required>
													        </td>
														</tr>
														<tr>
															<th>작성자</th>
															<td><input type="text" value="${member.userId }"  id="userId" name="userId"  readonly="readonly" class="form-control" placeholder="작성자" required></td>
														</tr>
														<tr>
															<th>내용</th>
															
															<td><textarea   id="summernote" name="contents"></textarea></td>
														</tr>
														<tr>
																<td><p id = "addFileBtn">파일추가</p></td>
																<td>
																	<div id = "fileInputDiv" title = "${updateSize }">
																		<!-- 파일선택 input -->
																		
																			<c:forEach items="${update.boardFileDTOs }" var="file" varStatus="status">
																			<c:if test="${not file.sort}">
																				<label for="file${status.count }">${file.fileName }</label>
																				<input type="file" id="file${status.count }" value="${file}" name="file" class="form-control boardFile hideBoardFile" title="${status.count }">
																				<button class="boardFileDelete" title="${status.count }">파일삭제</button>
																			</c:if>
																			</c:forEach>
																		
																		</div>
																</td>
															<td></td>
														</tr>
														<tr>
														<c:choose>
															<c:when test="${empty update }">
																<td><button id="boardBtn" class="submitBoardBtn boardBlueBtn" type="button" title = "add">게시</button></td>
															</c:when>
															<c:otherwise>
																<td><button id="boardBtn" class="submitBoardBtn boardBlueBtn"  type="button" title = "update">수정</button></td>
															</c:otherwise>
														
														</c:choose>
														</tr>
														
														
														
													</tbody>
													
												</table>
												
											</form>
											</div>
					    			
									</c:when>
								<c:otherwise>
								
									<div class="noQnaAnswer">
										<span class="noQnaAnswerComment" style="">아직 등록된 답변이 없습니다.</span>
										
									</div>
									
								
								
								
								
								
								</c:otherwise>
							
							</c:choose>
							
							
				    			
							</c:otherwise>
						</c:choose>
						
					</c:if>
				</div>
			</div>
		
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="/resources/js/board.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   	<script src="/resources/js/summernote/summernote-lite.js"></script>
	<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
    <script type="text/javascript">
    
    board2();
    
    if (${board eq 'QNA' && empty qnaAnswer}){
    	answer();
    	fileJs();
    }
    	
    $(document).ready(function() {
			
			var toolbar = [
				    // 글꼴 설정
				    ['fontname', ['fontname']],
				    // 글자 크기 설정
				    ['fontsize', ['fontsize']],
				    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    // 글자색
				    ['color', ['forecolor','color']],
				    // 표만들기
				    ['table', ['table']],
				    // 글머리 기호, 번호매기기, 문단정렬
				    ['para', ['ul', 'ol', 'paragraph']],
				    // 줄간격
				    ['height', ['height']],
				    // 그림첨부, 링크만들기, 동영상첨부
				    ['insert',['picture','link','video']],
				    // 코드보기, 확대해서보기, 도움말
				    ['view', ['codeview','fullscreen', 'help']]
				  ];

			var setting = {
		            height : 500,
		            minHeight : null,
		            maxHeight : null,
		            focus : true,
		            lang : 'ko-KR',
		            toolbar : toolbar,
		            callbacks : { //여기 부분이 이미지를 첨부하는 부분
		            onImageUpload : function(files, editor,
		            welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		            uploadSummernoteImageFile(files[i],
		            this);
		            		}
		            	}
		            }
		         };

		        $('#summernote').summernote(setting);
		     $('#summernote').summernote('pasteHTML', '${update.contents}');
		        });
		
		
		function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
    	
    </script>
    
   
</body>
</html>