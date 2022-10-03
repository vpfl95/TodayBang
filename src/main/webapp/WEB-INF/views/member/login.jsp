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
					        <a href="#">아이디 찾기</a>
					       	<a href="./join">회원가입</a>
				        </div>
				        
				        
				         <div id="naver_id_login"></div>
						    <!-- //네이버 로그인 버튼 노출 영역 -->
						   
				        <a id="naverIdLogin_loginButton" href="javascript:void(0)">
			         	 	<img alt="" src="http://static.nid.naver.com/oauth/small_g_in.PNG" style="width: 170px;">
			      		</a>
				        
				        
					</form>
		        
		        
		        
		        </div>
					
						
					
			      
				
			
	
			</div>
		</div>
	</section>
	
	

	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   	<script src="/resources/js/member.js"></script>
   <script type="text/javascript">
	
  
   login();
  
	/* sns 로그인 */
	/* naver */
	
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "wOUe01Nevp897Ykh0SFb",
				callbackUrl: "http://localhost/member/naverLogin",
				isPopup: false, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
			}
		);
		
		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
   
	 
	
	




	/* 아이디 저장 */
	
	$(document).ready(function() {
	    var cookieId = getCookie("cookieId");
	    var cookieChecked = getCookie("cookieChecked");
	    
	    if(cookieChecked == 'Y') {
	        $("#rememberId").prop("checked", true);
	    } else {
	        $("#rememberId").prop("checked", false);
	    }
	    
	    $("#userId").val(cookieId); 
	    
	    //로그인 버튼 클릭
	    $('#loginBtn').click(function() {
	        if($("#rememberId").is(":checked")){ 
	            var userInputId = $("#userId").val();
	            setCookie("cookieId", userInputId, 60); 
	            setCookie("cookieChecked", "Y", 60);
	        } else {
	            deleteCookie("cookieId");
	            deleteCookie("cookieChecked");
	        }
	        
	        document.loginForm.submit();
	    });
	});
	
	//쿠키값 Set
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + 
        exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }

    //쿠키값 Delete
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }

    //쿠키값 가져오기
    function getCookie(cookie_name) {
        var x, y;
        var val = document.cookie.split(';');
        
        for (var i = 0; i < val.length; i++) {
            x = val[i].substr(0, val[i].indexOf('='));
            y = val[i].substr(val[i].indexOf('=') + 1);
            x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
            
            if (x == cookie_name) {
            return unescape(y); // unescape로 디코딩 후 값 리턴
            }
        }
    }
	
	
	

</script>
   
</body>
</html>