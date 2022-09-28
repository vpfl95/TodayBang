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
		<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <c:import url="../template/header.jsp"></c:import>

	<section class="container-fluid container-lg-8 mt-5">
			<div class = "row justify-content-center mt-5">
				<div class = " col-lg-7 ">
		
		
					<h3> ${board } 게시  </h3>
					<hr>
					<form action="./add" method="post" id = "boardForm"  enctype="multipart/form-data">
					<input type="hidden" value="${update.boardNum }"  id="boardNum" name="boardNum" class="form-control" >
						        
					
					<table class = "table">
						<thead>
						</thead>
						
						<tbody>
							<tr>
								<th>제목</th>
								<td>
						        	<input type="text" value="${update.title }"  id="title" name="title" class="form-control" placeholder="제목" required>
						        </td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><input type="text" value="${member.userId }"  id="userId" name="userId"  readonly="readonly" class="form-control" placeholder="작성자" required></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><input type="text"  value="${update.contents }" id="contents"  name="contents"  class="form-control" placeholder="내용" required></td>
							</tr>
							
							<tr>
								<th>파일</th>
								
								
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
								<td><p id = "addFileBtn">파일추가</p></td>
								
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
			</div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="/resources/js/board.js"></script>
   
   	<script type="text/javascript">
   	
   		board();
   		fileJs();
   		
   		
   		
   	</script>
   
</body>
</html>