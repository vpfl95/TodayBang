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
		<link href="/resources/css/admin/admin.css" rel="stylesheet">
		<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
    <c:import url="../template/header.jsp"></c:import>

	<section class="container-fluid container-lg-8 mt-5">
			<div class = "row justify-content-center mt-5">
				<div class = " col-lg-7 ">
	
					<div style="font-size: 30px;font-weight: 600">관리자 페이지</div>
					<hr>
					<div class = "adminDiv">
						 
						 	<c:if test="${ManagerRole.roleNum <3 }">
	                            <div class="col-sm-6 col-lg-4 mb-5 mr-3">
	                                <a class="d-block ripple-gray rounded shadow-3 overflow-hidden mb-2 mdc-ripple-upgraded shadowAdmin" href="./member"><img class="img-fluid adminImg" src="/resources/images/admin/adminPage1.jpg" alt="..."></a>
	                                <div class="small font-monospace text-center adminText">회원 관리</div>
	                            </div>
	                            <div class="col-sm-6 col-lg-4 mb-5">
	                                <a class="d-block ripple-gray rounded shadow-3 overflow-hidden mb-2 mdc-ripple-upgraded shadowAdmin" href="../service/notice/add"><img class="img-fluid adminImg" src="/resources/images/admin/adminPage2.jpg" alt="..."></a>
	                                <div class="small font-monospace text-center adminText">공지사항 추가</div>
	                            </div>
                            </c:if>
                            <c:if test="${ManagerRole.roleNum eq 3 or ManagerRole.roleNum <3}">
	                            <div class="col-sm-6 col-lg-4 mb-5">
	                                <a class="d-block ripple-gray rounded shadow-3 overflow-hidden mb-2 mdc-ripple-upgraded shadowAdmin"  href="../product/add"><img class="img-fluid adminImg" src="/resources/images/admin/adminPage3.jpg" alt="..."></a>
	                                <div class="small font-monospace text-center adminText">상품 추가</div>
	                            </div>
	                            <div class="col-sm-6 col-lg-4 mb-5">
 	                                <a class="d-block ripple-gray rounded shadow-3 overflow-hidden mb-2 mdc-ripple-upgraded shadowAdmin" href="../product/todayDeal"><img class="img-fluid adminImg" src="/resources/images/admin/adminPage4.jpg" alt="..."></a> 
	                                <div class="small font-monospace text-center adminText">오늘의 딜 설정</div>
	                            </div>
                            </c:if>
                            <c:if test="${ManagerRole.roleNum eq 4 or ManagerRole.roleNum <3 }">
	                            <div class="col-sm-6 col-lg-4 mb-5">
	                                <a class="d-block ripple-gray rounded shadow-3 overflow-hidden mb-2 mdc-ripple-upgraded shadowAdmin" href="../realestate/add"><img class="img-fluid adminImg"  src="/resources/images/admin/adminPage5.jpg" alt="..."></a>
	                                <div class="small font-monospace text-center adminText">매물 추가</div>
	                            </div>
                          	</c:if>
                        
					</div>
					
			</div>
		</div>
	</section>
	

	<c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    
   
</body>
</html>