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
	
    	<c:import url="./template/header.jsp"></c:import>
	
	<section class="container-fluid container-lg-8 mt-5">
			<div class = "row justify-content-center mt-5"> 
               
			 <div class="col-12 pt-5"  style="height: 500px; background-image: url('/resources/images/Main.png');">
                        <div class="text-center">
                            
                            <h1 class="mb-5 mt-7">오늘의 직방 메인 페이지</h1>
                            
                            <form class="form-subscribe" id="contactForm" >
                                <!-- Email address input-->
                                <div class="row justify-content-center">
                                    <div class="col-5">
                                        <input class="form-control form-control-lg" id="textSearch" type="text" placeholder="검색" >
                                        </div>
                                    <div class="col-auto"><button class="btn btn-primary btn-lg" id="submitButton" type="submit">검색</button></div>
                                </div>
                               
                                <div class="d-none" id="submitSuccessMessage">
                                    <div class="text-center mb-3">
                                        <div class="fw-bolder">Form submission successful!</div>
                                        <p>To activate this form, sign up at</p>
                                        <a class="text-white" href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                                    </div>
                                </div>
                             
                                <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                            </form>
                        </div>
                    </div>
			 
			
				<div class = " col-lg-7 ">
				
					
				
            
       
            <div class="container features-icons bg-light text-center" style="height: 300px;">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3" style="background-color: blue;">
                            <div class="features-icons-icon d-flex"><i class="bi-window m-auto text-primary"></i></div>
                            <h3>스토어</h3>
                            <p class="lead mb-0">예시 1</p>
                        </div>
                    </div>
                  </div>
            </div>
             <div class="container features-icons bg-light text-center" style="height: 300px;">
                <div class="row">  
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3" style="background-color: red;">
                            <div class="features-icons-icon d-flex"><i class="bi-layers m-auto text-primary"></i></div>
                            <h3>방구하기</h3>
                            <p class="lead mb-0">예시 2</p>
                        </div>
                    </div>
                   </div>
            </div>
                    
                    
                    
             <div class="container features-icons bg-light text-center" style="height: 300px;">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-0 mb-lg-3" style="background-color: black;">
                            <div class="features-icons-icon d-flex"><i class="bi-terminal m-auto text-primary"></i></div>
                            <h3>커뮤니티</h3>
                            <p class="lead mb-0">예시 3</p>
                        </div>
                    </div>
                </div>
            </div>
        
       </div>
        
        
        
				
	</section>

	<c:import url="./template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    
   
</body>
</html>