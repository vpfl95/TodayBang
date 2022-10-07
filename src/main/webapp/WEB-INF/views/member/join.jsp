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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

	
	
</head>
<body>
   
	
	<section class="container-fluid container-lg-8">
		<div class = "row justify-content-center mt-7 " style="overflow: hidden;">
			<div class = "col-3 mx-auto" style="width: 500px;">
				<a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none mx-4">
		         	<img alt="" src="/resources/images/MainLogoFA.png" width="230px">
		        </a>
		        <div style="margin-top: 50px;">
		        <h3 style="margin-bottom: -15px">회원가입</h3>
		        	<form action="./join" class = "gform" method="post" id = "joinForm" >
		        		<div id = "joinInput">
			        		<label for="userId">아이디</label>
					        <input type="text"  id="userId" name = "userId" class="form-control nonOverlab" placeholder="아이디" required autofocus>
					        
					        
					        <label for="password" >비밀번호</label>
					        <input type="password"  id="password" name = "password" class="form-control" placeholder="비밀번호" required>
					  
					  		<label for="pwCheck" >비밀번호 확인</label>
					        <input type="password"  id="pwCheck" name = "pwCheck" class="form-control" placeholder="비밀번호 확인" required>
					        
					        <label for="nickname" >닉네임</label>
					        <input type="text"  id="nickname" name = "nickname" class="form-control nonOverlab" placeholder="닉네임" required>
					        
					        <label for="userName" >이름</label>
					        <input type="text"  id="userName" name = "userName" class="form-control " placeholder="이름" required>
					        
					        <label for="inputPhone" >핸드폰</label>
					        <div id= "phone">
					        	<input type="hidden" name = "phone" id="submitPhone">
						     
						        <select name="phone1" id="phoneFirst" class="form-control nonOverlab" required>
						         	<option value="010"  selected="selected">010</option>
						         	<option value="011"  >011</option>
						         	<option value="070"  >070</option>
						        
						        </select>
						        <label for="phone" class="nolabel">-</label>
						        <input type="text"  id="phoneMiddle" maxlength="4" name = "phone1" class="form-control nonOverlab" placeholder="0000" required>
						        <label for="phoneLast" class="nolabel">-</label>
						        <input type="text"  id="phoneLast" maxlength="4" name = "phone1" class="form-control nonOverlab" placeholder="0000" required>
					        </div>
					        
					        
					        
					        
					        
					        <label for="email" >이메일</label>
					        <div id= "email">
					        <input type="hidden" name = "email" id="submitEmail">
						        <input type="text"  id="emailFirst" name = "email1" class="form-control nonOverlab" placeholder="이메일" required>
						        <label for="emailAt" class="nolabel">@</label>
						        <select name="email1" id="emailAt" class="form-control nonOverlab" required>
						         	<option value="0" disabled selected="selected">선택해주세요</option>
						         	<option value="naver.com">naver.com</option>
								 	<option value="gmail.com">gmail.com</option>
								 	<option value="hanmail.net">hanmail.net</option>
								 	<option value="daum.net">daum.net</option>
								 	<option value="nate.com">nate.com</option>
								 	<option value="1">직접입력</option>
						        </select>
					        </div>
					        <div></div>
					        <div></div>
					        
		        		</div>
						<button id="emailBtn" class="w-100 btn btn-lg btn-primary" type="button">이메일 확인</button>
				       
				       
				       
				        <button id="joinBtn" class="w-100 btn btn-lg btn-primary" type="button">회원가입</button>
				        
				        <div id = "joinPart" class="mx-auto">
					        이미 아이디가 있으신가요?
					       	<a href="./login">로그인</a>
				        </div>
				        
				        
				        
					</form>
		        		<div style="display:none" class="thankyou_message">
						 <!-- You can customize the thankyou message by editing the code below -->
						 <h2><em>Thanks</em> for contacting us! We will get back to you soon!
						 </h2>
						</div>
		        
		        
		        </div>
					
						
					
	
			</div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="/resources/js/member.js"></script>
    
   <script type="text/javascript">
	join();

   </script>
</body>
</html>