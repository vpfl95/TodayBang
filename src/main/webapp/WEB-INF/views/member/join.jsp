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
    <link href="/resources/css/member/join.css" rel="stylesheet">
	<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
   
	
	<section class="container-fluid container-lg-8">
		<div class = "row justify-content-center mt-7 " style="overflow: hidden;">
			<div class = "col-3 mx-auto" style="width: 300px;">
				<a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none mx-4">
		         	<img alt="" src="/resources/images/MainLogo.png" width="230px">
		        </a>
		        <div style="margin-top: 50px;">
		        <h3 style="margin-bottom: -15px">회원가입</h3>
		        	<form action="./join" method="post" id = "joinForm" >
		        		<div id = "joinInput">
			        		<label for="userId" class=>아이디</label>
					        <input type="text"  id="userId" name = "userId" class="form-control" placeholder="아이디" required autofocus>
					        
					        
					        <label for="password" class="">비밀번호</label>
					        <input type="password"  id="password" name = "password" class="form-control" placeholder="비밀번호" required>
					  
					  		<label for="pwCheck" class="">비밀번호 확인</label>
					        <input type="password"  id="pwCheck" name = "pwCheck" class="form-control" placeholder="비밀번호 확인" required>
					        
					        <label for="nickname" class="">닉네임</label>
					        <input type="text"  id="nickname" name = "nickname" class="form-control" placeholder="닉네임" required>
					        
					        <label for="userName" class="">이름</label>
					        <input type="text"  id="userName" name = "userName" class="form-control" placeholder="이름" required>
					        
					        
					        <label for="phone" class="">핸드폰</label>
					        <input type="text"  id="phone" name = "phone" class="form-control" placeholder="핸드폰" required>
					        
					        <label for="email" class="">이메일</label>
					        <input type="text"  id="email" name = "email" class="form-control" placeholder="이메일" required>
					        
		        		</div>
						
				       
				        <button id="joinBtn" class="w-100 btn btn-lg btn-primary" type="submit">회원가입</button>
				        
				        <div id = "joinPart" class="mx-auto">
					        이미 아이디가 있으신가요?
					       	<a href="./login">로그인</a>
				        </div>
				        
				        
				        
					</form>
		        
		        
		        
		        </div>
					
						
					
	
			</div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="/resources/js/member.js"></script>
   <script>
	join();

   </script>
</body>
</html>