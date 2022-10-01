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
	
					
					<h1>${board }</h1>
					
					<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col">글 번호</th>
				      <th scope="col">글 제목</th>
				      
				      <th scope="col">작성자</th>
				      <th scope="col">게시일</th>
				      <c:if test="${board=='QNA' }">
				      		<th scope="col">답변상태</th>
			      	  </c:if>
				      
				      
				    </tr>
				  </thead>
				  <tbody>
				  
				  	<c:forEach items="${boardList }" var="dto">
				  		
				  		<tr>
						  	<th scope="row">${dto.boardNum}</th>
						  	<td><a href="./detail?boardNum=${dto.boardNum }">${dto.title }</a></td>
					        <td>${dto.userId }</td>
					         
    						 <td>${dto.regDate }</td>
    						 
    						<c:if test="${board=='QNA' }">
    							<c:choose>
    								<c:when test="${dto.checkAnswer}">
    									<td>답변 완료</td>
    								</c:when>
    								<c:otherwise>
    									<td>답변 중</td>
    								</c:otherwise>
    							
    							</c:choose>
    						
			      	  		</c:if>
			        	</tr>
				  	</c:forEach>
				  
				    <c:if test="${board=='QNA' }">
				      <tr>
				      	<td>
				      		 <a href="/service/qna/add">글 쓰기</a>
				      	</td>
				      </tr>
			      	</c:if>
				  </tbody>
				</table>
				
				
				
				
				<c:import url="../template/navPager.jsp"></c:import>
			</div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    
   
</body>
</html>