<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<div class="myQna-body">
		내 문의 글 페이지
		<div class="myQna-div">
	
	
		<table class="table table-hover">
			  <thead>
				    <tr>
				      <th scope="col">글 번호</th>
				      <th scope="col">글 제목</th>
				      
				      <th scope="col">작성자</th>
				      <th scope="col">게시일</th>
					  <th scope="col">답변상태</th>
				    </tr>
			  </thead>
			  <tbody>
					  
			  	<c:forEach items="${list }" var="dto">
					  		
			  		<tr>
					  	<th scope="row">${dto.boardNum}</th>
						  	<td><a href="/service/qna/detail?boardNum=${dto.boardNum }">${dto.title }</a></td>
					        <td>${dto.userId }</td>
	   						<td>${dto.regDate }</td>
	    						 
	    						
	 							<c:choose>
	 								<c:when test="${dto.checkAnswer}">
	 									<td>답변 완료</td>
	 								</c:when>
	 								<c:otherwise>
	 									<td>답변 중</td>
	 								</c:otherwise>
	 							
	 							</c:choose>
	    						
				      	  		
				        	</tr>
					  	</c:forEach>
					  
					   
					  </tbody>
					</table>
					
					
					<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					  	<c:choose>
					  		<c:when test="${pager.startNum <= 1}">
					  			<li class="page-item disabled">
					      			<a class="page-link">Previous</a>
								</li>
					  		</c:when>
					  		<c:otherwise> 
					  		<li class="page-item"><a class="page-link" data-a="/member/myQna?page=${pager.startNum-1}">Previous</a></li>
					  		</c:otherwise>
					  	</c:choose>
					  	
					  		<c:forEach begin="${pager.startNum }" end="${pager.lastNum }" var="i">
							  			<li class="page-item"><a class="page-link" data-a="/member/myQna?page=${i}">${i}</a></li>
						  	</c:forEach>
					   	 	<c:choose>
					  		<c:when test="${pager.lastNum >= pager.totalPage}"> 
					  			<li class="page-item disabled">
					  			<a class="page-link" data-a="/member/myQna?page=${pager.lastNum+1}">Next</a>
							  </li>
					  		</c:when>
					  		<c:otherwise> 
					  		 	<li class="page-item">
					  		 	<a class="page-link" data-a="/member/myQna?page=${pager.lastNum+1}">Next</a>
							  </li>
					  		</c:otherwise>
					  	</c:choose>
					  </ul>
					</nav>
			</div>
	</div>
	
	
	<script type="text/javascript">
		
		
		$(document).on("click",".page-link",function(){
    		$("#profileDiv").load(this.getAttribute('data-a'));
    	});
	</script>
	
</body>
</html>