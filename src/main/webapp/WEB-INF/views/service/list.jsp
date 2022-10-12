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
			<div class = "row justify-content-center "  style="margin-top: 80px;">
				<div class = " col-lg-6 ">
	
					<c:if test="${board=='QNA'}">
						<div class = "boardList">
							<div class = "boardTitle">
								 <span class="questionMark">FAQ</span> 자주 묻는 질문  
							</div>
							<hr>
						
						
							<table class = "table table-hover">
								 <thead>
								    <tr>
								      <th scope="col" width="140px" align="center" >글 번호</th>
								      <th  scope="col" width="450px">글 제목</th>
								      
								      <th scope="col" width="150px">작성자</th>
								      <th scope="col" width="200px">게시일</th>
								      <c:if test="${board=='QNA' }">
								      		<th scope="col" width="150px">답변상태</th>
							      	  </c:if>
								      
								      
								    </tr>
								  </thead>
								<tbody>
								<c:forEach items="${oftenQna }" var="often">
									<tr>
										<td style="color: #676e74;">${often.boardNum }</td>
										<td><a href="./detail?boardNum=${often.boardNum }" style="color: black;">${often.title }</a></td>
										<td>${often.userId }</td>
										<td>${often.regDate }</td>
										<c:choose>
	    								<c:when test="${often.checkAnswer}">
	    									<td style="color: #676e74;">답변 완료</td>
	    								</c:when>
	    								<c:otherwise>
	    									<td style="color: #676e74;">답변 중</td>
	    								</c:otherwise>
    							
    									</c:choose>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</c:if>
	
	
	
	
				<div class = "boardList">
					<c:if test="${board=='NOTICE'}">
						<div class = "boardTitle">
							<span class="questionMark" style="font-size: 40px">!</span>공지사항
						</div>
					</c:if>
					<c:if test="${board=='QNA'}">
						<div class = "boardTitle">
							<span class="questionMark">QNA</span>문의하기
						</div>
					</c:if>
					<hr>
					
					<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col" width="140px">글 번호</th>
				      <th scope="col" width="450px">글 제목</th>
				      
				      <th scope="col" width="150px">작성자</th>
				      <th scope="col" width="200px">게시일</th>
				      <c:if test="${board=='QNA' }">
				      		<th scope="col" width="150px">답변상태</th>
			      	  </c:if>
				      
				      
				    </tr>
				  </thead>
				  <tbody>
				  
				  	<c:forEach items="${boardList }" var="dto">
				  		
				  		<tr>
						  	<td scope="row" style="color: #676e74;">${dto.boardNum}</td>
						  	<td><a href="./detail?boardNum=${dto.boardNum }" style="color: black;">${dto.title }</a></td>
					        <td>${dto.userId }</td>
					         
    						 <td>${dto.regDate }</td>
    						 
    						<c:if test="${board=='QNA' }">
    							<c:choose>
    								<c:when test="${dto.checkAnswer}">
    									<td style="color: #676e74;">답변 완료</td>
    								</c:when>
    								<c:otherwise>
    									<td style="color: #676e74;">답변 중</td>
    								</c:otherwise>
    							
    							</c:choose>
    						
			      	  		</c:if>
			        	</tr>
				  	</c:forEach>
				  
				  	
				  </tbody>
				</table>
				
				
					
				
			</div>
				
				
				<c:import url="../template/navPager.jsp"></c:import>
				<div class="boardsubtab" >
				
				<c:if test="${board=='NOTICE' && not empty ManagerRole }">
					
				      	<c:if test="${ManagerRole.roleNum eq 1 || ManagerRole.roleNum eq 2}">
				      		<div class = "boardBlueBtn boardAddBtn">
				      			 <a href="/service/notice/add" style="color: white; ">공지하기</a>
				      		</div>
				      	</c:if>
			      	</c:if>
				  
				    <c:if test="${board=='QNA' }">
				   			 <div class = "boardBlueBtn boardAddBtn">
				      		 	<a href="/service/qna/add" style="color: white;">질문하기</a>
				      		 </div>
		      	</c:if>
				
				<div >
				
				<form class="row row-cols-lg-auto g-3 align-items-center" action="./list" method="get">
					  <div class="col-12">
					    <label class="visually-hidden" for="kind">Kind</label>
					    <select name="kind" class="form-select"  id="kind">
					      <option class = "kinds" selected value="title">제목</option>
					      <option class = "kinds" value="contents">내용</option>
					      <option class = "kinds" value="userId">작성자</option>
					    </select>
					  </div>
						<div class="col-12">
				  	  		<label class="visually-hidden" for="search">검색어</label>
						    <div class="input-group">
						      <input type="text" name="search" class="form-control" id="search" value="${search.search }">
						    </div>
				 		 </div>
				
					  <div class="col-12">
					    <button type="submit" class="boardBlueBtn">검색</button>
					  </div>
				</form>
				</div>
				</div>
			</div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    
   	<script type="text/javascript">
   	
	let k = '${search.kind}';
	
	const kinds = document.getElementsByClassName("kinds");

	for(let i=0; i < kinds.length ; i ++)
	{
		
		if(kinds[i].value == k){
			kinds[i].selected = true;
		}


	}
   	
   	</script>
</body>
</html>