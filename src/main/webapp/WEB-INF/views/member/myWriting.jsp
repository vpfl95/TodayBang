<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘의 직방</title>
		<link href="/resources/css/reset.css" rel="stylesheet">
		<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
	<link href= "/resources/css/member/myPage.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<section class="container-fluid container-lg-8 mt-4">
	
		<c:import url="./myPageCate.jsp"></c:import>
		
		<div class="container-fluid container-lg-8 ">
		<!-- 카테고리 2 -->
			<ul id = "myPage-2">
				
				<li id="myQna" class="submenuList menu2" data-a ="/member/myQna">내 문의</li>
				<li id="myPdReview" class="submenuList menu2" data-a ="/member/myPdReview">내 상품리뷰</li>
				<li id="myRoomReview" class="submenuList menu2" data-a ="/member/myRoomReview">내 방리뷰</li>
				
			</ul>
		<hr style="margin: 0;">
		</div>
		<div class = "row justify-content-center mt-5">
			<div class = " col-lg-10 d-flex justify-content-center" id = "profileDiv"  >
				


			</div>
		</div>
	</section>


	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="/resources/js/member.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
 
    	myPageMenu();
    	
    	$(document).ready(function(){
    		
    		$("#myQna").trigger("click");
			$("#myQna").addClass("selectMenu");
			$("#myQna").addClass("menu2after");
    	
    	});
    	$(document).on("click",".submenuList",function(){
    		$("#profileDiv").load(this.getAttribute('data-a'));
    	});
    	
    </script>
	
	
	
</body>
</html>