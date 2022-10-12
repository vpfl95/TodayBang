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
		        <div style="margin-bottom: -10px; font-size: 22px;font-weight: 600;">이용약관</div>
		        <hr>
		        	<form action="./join" method="get" id = "joinCheckForm" >
	        		<div class="bg-white" style="border: solid 1px #dbdbdb; padding: 15px;">
		        		<div style="width: 500px;">
                    	 <input type="checkbox" class="joinCheck mustCheck " name = "joinCheck" id = "joinCheck1">
		        		 <label class="checktxt" for ="joinCheck1" class = "">이용약관 동의 <span class="mustCheckText">(필수)</span> </label>
			             </div>
			             <div>
	                     <input type="checkbox" class="joinCheck mustCheck" name = "joinCheck" id = "joinCheck2">
			             <label class="checktxt" for ="joinCheck2">개인정보 수집, 이용 동의 <span class="mustCheckText" >(필수)</span></label>
			             </div>
			             <div>
	                     <input type="checkbox" class="joinCheck mustCheck" name = "joinCheck" id = "joinCheck3">
			             <label class="checktxt" for ="joinCheck3">개인정보 이용 동의 <span class="mustCheckText">(필수)</span></label>
			              </div>
			             <div>
	                     <input type="checkbox" class="joinCheck" name = "joinCheck" id = "joinCheck4">
			             <label for ="joinCheck4">이벤트, 광고 수신 동의 <span class="checkText">(선택)</span></label> 
			             </div>
			             
	                </div>  
			              
		            <div>
		            <hr>
	                      <input type="checkbox" id="joinAllCheck" name = "joinCheck">
			              <label for ="joinAllCheck">전체 동의</label> 
		            </div>
					
				       
				        <button id="nextBtn" class="w-100 btn btn-lg btn-primary" type="button" style="font-weight: 600;">다음</button>
				        
				      
					</form>
		        
		        
		        
		        </div>
			</div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="/resources/js/member.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   <script type="text/javascript">
   	joincheck();
   
   </script>
</body>
</html>