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
	<link href= "/resources/css/member/myPage.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
</head>
<body>
    <c:import url="../template/header.jsp"></c:import>

	
<!--  내용 부  -->
	<section class="container-fluid container-lg-8 mt-4">
	
		<div class="container-fluid container-lg-8 pt-4">
		<!-- 카테고리 1  --> 
			<ul id = "myPage-1">
				<li class = "myPage-list" id = "myPage-profile" > 프로필 </li>
				<li class = "myPage-list" id = "myPage-shopping"> 나의 쇼핑</li>
				<li class = "myPage-list" id = "myPage-write"> 나의 글</li>
				
			</ul>
		<hr>
		</div>
		
		<div class="container-fluid container-lg-8 mt-4 ">
		<!-- 카테고리 2 -->
			<ul id = "myPage-2">
				
			
				
			</ul>
		<hr>
		</div>
		<div class = "row justify-content-center mt-5">
			<div class = " col-lg-10 d-flex justify-content-center" id = "profileDiv"  >
				


			</div>
		</div>
	</section>


	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="/resources/js/member.js"></script>
    <script type="text/javascript">
    	myPage();
    	
    	 $(document).ready(function(){
    		
    		$("#myPage-profile").trigger("click");
    		
    		
    		$("#profileDiv").load("/member/profile");

			

    		if(${not empty page}){
    			$("#${page}").trigger("click");
    		}
    		
    	});
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	$(document).on("click",".submenuList",function(){
    		$("#profileDiv").load(this.getAttribute('data-a'));
    	});
    	
    	
    	
    	
    	
    </script>
   
</body>
</html>