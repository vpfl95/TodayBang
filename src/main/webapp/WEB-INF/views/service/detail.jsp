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
									      		<td><a href="/resources/upload/QNAANSWER/${file.fileName }">${file.oriName }</a></td>
									      
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
																			<label for="file${status.count }">${file.fileName }</label>
																			<input type="file" id="file${status.count }" value="${file}" name="file" class="form-control boardFile hideBoardFile" title="${status.count }">
																			<button class="boardFileDelete" title="${status.count }">파일삭제</button>
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
			$('#summernote').val("${update.contents }");
			//여기 아래 부분
			$('#summernote').summernote({
				  height: 500,                 // 에디터 높이
				  minHeight: 300,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: '내용'	//placeholder 설정
		          
			});
		});
    	
    </script>
    
   
</body>
</html>