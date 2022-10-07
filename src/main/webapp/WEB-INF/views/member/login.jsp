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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	
</head>
<body>
   
	
	<section class="container-fluid container-lg-8">
		<div class = "row justify-content-center mt-7 " style="overflow: hidden;">
			<div class = "col-3 mx-auto" style="width: 300px;">
				<a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none mx-4">
		         	<img alt="" src="/resources/images/MainLogoFA.png" width="230px">
		        </a>
		        <div style="margin-top: 50px;">
		        	<form action="./login" method="post" id = "loginForm" >
		        		<div id = "loginInput">
			        		<label for="userId" class="visually-hidden">ID</label>
					        <input type="text"  name = "userId" id="userId" class="form-control" placeholder="아이디" required autofocus>
					        
					        <label for="password" class="visually-hidden">Password</label>
					        <input type="password"   name = "password" id="password" class="form-control" placeholder="비밀번호" required>
					  
		        		</div>
						
				        <div class="checkbox mb-3">
				        	<label>
		           	 		<input type="checkbox" value="remember-me" id = "rememberId"> 아이디 저장
				        	</label>
				        </div>
				        <button id="loginBtn" class="w-100 btn btn-lg btn-primary" type="button">로그인</button>
				        
				        <div id = "joinPart" class="mx-auto">
					        <a href="#" id="findId">아이디 찾기</a>
					       	<a href="./joinCheck">회원가입</a>
				        </div>
				        
				        
				         <div id="naver_id_login"></div>
						    <!-- //네이버 로그인 버튼 노출 영역 -->
						   
				        <a id="naverIdLogin_loginButton" href="javascript:void(0)">
			         	 	<img alt="" src="http://static.nid.naver.com/oauth/small_g_in.PNG" style="width: 170px;">
			      		</a>
				        
				        
					</form>
					<form action="#" class = "" method="post" id = "emailJSform"  >
						<input type="hidden" id="name" name ="name" class="swal2-input">
						<input type="hidden" id="password1" name ="password1" class="swal2-input">
						<input type="hidden" id="email" name ="email" class="swal2-input">
						<input type="hidden" id="submit" name ="submit" class="swal2-input">
						
						
					</form>
				
					
					
					
		        </div>
			</div>
		</div>
	</section>
	
	

	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   	<script src="/resources/js/member.js"></script>
   	
   	 
	
  
   <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
	</script>
	 <script type="text/javascript">
	login();
	
	$(document).ready(function() {
		emailjs.init("Z4jJRE5kAUY6HTTME");		
        //"user_xxxxx"이 부분은 사용자마다 다르니 반드시 emailJS의 installation 화면을 확인
        $('input[name=submit]').click(function(){       	 
          
          var templateParams = {	
          //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
                name: $('input[name=name]').val(),
                phone: $('input[name=password1]').val(), 
                email : $('input[name=email]').val(),
                //message : $('textarea[name=message]').val()
          };
                	
         emailjs.send('TodayBang', 'template_qf37o2j', templateParams)
         //emailjs.send('service ID', 'template ID', 보낼 내용이 담긴 객체)
         	    .then(function(response) {
         	       console.log('SUCCESS!', response.status, response.text);
         	    }, function(error) {
         	       console.log('FAILED...', error);
         	    });
         	       


        });
        
	  });
    

	</script>
 
   </body>
</html>