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
		<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <c:import url="../template/header.jsp"></c:import>

	<section class="container-fluid container-lg-8 mt-5">
			<div class = "row justify-content-center mt-5">
				<div class = " col-lg-7 ">
						<table class="table">
						  <thead>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">제목</th>
						      <td>${boardList.title }</td>
						    </tr>
						    <tr>
						      <th scope="row">작성자</th>
						      <td>${boardList.userId }</td>
						    </tr>
						    <tr>
						      <th scope="row">작성일</th>
						      <td >${boardList.regDate }</td>
							</tr>
						    <tr>
						      <th scope="row">내용</th>
						      <td >${boardList.contents }</td>
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
								    	
								    </tr>
								  </tbody>
								</table>
							
							
							
							</c:when>
							
							<c:otherwise>
							
							<c:if test="${member.roleDTOs[0].roleNum<3 }">
							    	<form action="./answer" method="post" id = "boardForm" >
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
														<td><input type="text"  id="contents"  name="contents"  class="form-control" placeholder="내용" required></td>
													</tr>
													<tr>
														<th>파일첨부</th>
														<td></td>
													</tr>
													<tr>
													<td><button id="boardBtn" class="w-100 btn btn-lg btn-primary" type="submit">게시</button></td>
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
    
   
</body>
</html>