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
    <link href="/resources/css/member/login.css" rel="stylesheet">
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
		        	<form action="./login" method="post" id = "loginForm" >
		        		<div id = "loginInput">
			        		<label for="userId" class="visually-hidden">ID</label>
					        <input type="text" value="ID1" name = "userId" id="userId" class="form-control" placeholder="아이디" required autofocus>
					        
					        <label for="password" class="visually-hidden">Password</label>
					        <input type="password" value="PW1"  name = "password" id="password" class="form-control" placeholder="비밀번호" required>
					  
		        		</div>
						
				        <div class="checkbox mb-3">
				        	<label>
		           	 		<input type="checkbox" value="remember-me"> 아이디 저장
				        	</label>
				        </div>
				        <button id="loginBtn" class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
				        
				        <div id = "joinPart" class="mx-auto">
					        <a href="#">아이디 찾기</a>
					       	<a href="./join">회원가입</a>
				        </div>
				        
				        
				        <div id = "SNSLoginPart" class="mx-auto mt-1">
				        	SNS 간편 로그인
					        <a id="naverIdLogin_loginButton" href="javascript:void(0)">
			         	 	<img alt="" src="/resources/images/NaverLogin.png" style="width: 60px;">
			      			</a>
				        </div>
				        
				        
				        
					</form>
		        
		        
		        
		        </div>
					
						
					
			      
				
			
	
			</div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
   
   <script>

var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "wOUe01Nevp897Ykh0SFb", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost/member/naverLogin" // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			
		}
	);	

naverLogin.init();





</script>
   
</body>
</html>