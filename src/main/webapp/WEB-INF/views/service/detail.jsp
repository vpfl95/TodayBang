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
		<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
		<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <c:import url="../template/header.jsp"></c:import>

	<section class="container-fluid container-lg-8 mt-5">
			<div class = "row justify-content-center mt-5" >
				<div class = " col-lg-7 " id="boardSection">
						<table class="table " id="mainTable">
						  <thead>
						  </thead>
						  <tbody>
						  	<tr>
						      <th scope="row">글번호</th>
						      <td colspan="3">${boardList.boardNum }</td>
						    </tr>
						    <tr>
						      <th scope="row">조회수</th>
						      <td colspan="3">${boardList.hit }</td>
						    </tr>
						    <tr>
						      <th scope="row">제목</th>
						      <td colspan="3">${boardList.title }</td>
						    </tr>
						    <tr>
						      <th scope="row">작성자</th>
						      <td colspan="3">${boardList.userId }</td>
						    </tr>
						    <tr>
						      <th scope="row">작성일</th>
						      <td  colspan="3">${boardList.regDate }</td>
							</tr>
						    <tr>
						      <th scope="row">내용</th>
						      <td  colspan="3">${boardList.contents }</td>
						    </tr>
						    
						    <tr>
						      <th scope="row">파일</th>
						      
						      <c:if test="${not empty boardList.boardFileDTOs }">
							      <c:forEach items="${boardList.boardFileDTOs }" var="file">
							      	
							      	<c:if test="${not file.sort}">
							      		<td><a href="/resources/upload/${board }/${file.fileName }">${file.oriName }</a></td>
									
							      	</c:if>
							            
							      </c:forEach>
							      	
							      
						      </c:if>
						      
						      
						     
						    </tr>
						    
						    <tr>
						    	<c:if test="${boardList.userId eq member.userId }">
						    		<td><a href="./delete?boardNum=${boardList.boardNum }">삭제</a></td>
						    		<c:if test="${empty qnaAnswer }">
						    			<td><a href="./update?boardNum=${boardList.boardNum }">수정</a></td>
						    		</c:if>
						    		
						    	</c:if>
						    	
						    	
						    	
						    	
						    	
						    </tr>
						  </tbody>
						</table>
					
					
					
					<!-- QNA 추가 페이지 -->
					
					
					<c:if test="${board eq 'QNA' }">
						<c:choose>
							<c:when test="${not empty qnaAnswer}">
							
							
							<table class="table">
								  <thead>
								  </thead>
								  <tbody>
								    <tr>
								      <th scope="row">제목</th>
								      <td>${qnaAnswer.title }</td>
								    </tr>
								    <tr>
								      <th scope="row">작성자</th>
								      <td>${qnaAnswer.userId }</td>
								    </tr>
								    <tr>
								      <th scope="row">작성일</th>
								      <td >${qnaAnswer.regDate }</td>
									</tr>
								    <tr>
								      <th scope="row">내용</th>
								      <td >${qnaAnswer.contents }</td>
								    </tr>
								    <tr>
								    <th scope="row">파일</th>
								     <c:if test="${not empty qnaAnswer.boardFileDTOs }">
									      <c:forEach items="${qnaAnswer.boardFileDTOs }" var="file">
									      <c:if test="${not file.sort}">
									      		<td><a href="/resources/upload/QNAANSWER/${file.fileName }">${file.oriName }</a></td>
									      </c:if>
									      </c:forEach>
						    		  </c:if>
								    </tr>
								    <tr>
								    	<c:if test="${qnaAnswer.userId eq member.userId }">
													
								    		<td><a href="./deleteAnswer?boardNum=${boardList.boardNum }">답변 삭제</a></td>
								    		<td><a href="./updateAnswer?boardNum=${boardList.boardNum }">답변 수정</a></td>

							    		
								    	</c:if>
								    </tr>
								  </tbody>
								</table>
							
							
							
							</c:when>
							
							<c:otherwise>
							
							<c:if test="${member.roleDTOs[0].roleNum<3 }">
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
															<td><button id="boardBtn" class="w-100 btn btn-lg btn-primary" type="button" title = "add">게시</button></td>
														</c:when>
														<c:otherwise>
															<td><button id="boardBtn" class="w-100 btn btn-lg btn-primary" type="button" title = "update">수정</button></td>
														</c:otherwise>
													
													</c:choose>
													</tr>
													
													
													
												</tbody>
												
											</table>
											
										</form>
				    			</c:if>
							</c:otherwise>
						</c:choose>
						
					</c:if>
	
			</div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="/resources/js/board.js"></script>
    
   	<script src="/resources/js/summernote/summernote-lite.js"></script>
	<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
    <script type="text/javascript">
    
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
		            height : 300,
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