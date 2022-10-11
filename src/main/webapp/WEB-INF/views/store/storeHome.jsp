<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑을 쉽게, 스타일링은 즐겁게! 오늘의직방 스토어</title>
    <link rel="stylesheet" href="/resources/css/store/storeHome.css">
    <link href="/resources/css/reset.css" rel="stylesheet">
    <link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
    <c:import url="../template/header.jsp"></c:import>
    <!-- Carousel -->
	<div id="carouselExampleDark" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
		  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
		  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" aria-label="Slide 4"></button>
		  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="4" aria-label="Slide 5"></button>
		  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="5" aria-label="Slide 6"></button>
		  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="6" aria-label="Slide 7"></button>
		  <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="7" aria-label="Slide 8"></button>
		</div>
		<div class="carousel-inner" style="margin-top: 150px;">
		  <div class="carousel-item active">
			<img src="/resources/images/store/storeHome/1+1main.webp" class="d-block w-100" alt="...">
		  </div>
		  <div class="carousel-item">
			<img src="/resources/images/store/storeHome/samsung.webp" class="d-block w-100" alt="...">
		  </div>
		  <div class="carousel-item">
			<img src="/resources/images/store/storeHome/refur.webp" class="d-block w-100" alt="...">
		  </div>
		  <div class="carousel-item">
			<img src="/resources/images/store/storeHome/premium.jpg" class="d-block w-100" alt="...">
		  </div>
		  <div class="carousel-item">
			<img src="/resources/images/store/storeHome/oGoods.webp" class="d-block w-100" alt="...">
		  </div>
		  <div class="carousel-item">
			<img src="/resources/images/store/storeHome/fastDeli.webp" class="d-block w-100" alt="...">
		  </div>
		  <div class="carousel-item">
			<img src="/resources/images/store/storeHome/newLine.webp" class="d-block w-100" alt="...">
		  </div>
		  <div class="carousel-item">
			<img src="/resources/images/store/storeHome/fur.webp" class="d-block w-100" alt="...">
		  </div>
		</div>
	</div>
    <section class="container-fluid container-lg-8" style="padding-top: 0px;">
        <div class="row justify-content-center">
            <div class="col-lg-9">
            	<!-- Carousel 이미지 변경 버튼 -->
	            <div class="exhibition">
	                <div class="d-flex justify-content-center menu" style="text-align: center;">
						<button class="ex-button" type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1">1+1Shop</button>
						<button class="ex-button" type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2">삼성 가전</button>
						<button class="ex-button" type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3">리퍼마켓</button>
						<button class="ex-button" type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" aria-label="Slide 4">프리미엄 핫딜</button>
						<button class="ex-button" type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="4" aria-label="Slide 5">오!굿즈</button>
						<button class="ex-button" type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="5" aria-label="Slide 6">빠른배송</button>
						<button class="ex-button" type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="6" aria-label="Slide 7">신규 브랜드</button>
						<button class="ex-button" type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="7" aria-label="Slide 8">가구 세일</button>
	                    <button class="ex-button" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev"><</button>
						<button class="ex-button" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">></button>
	                </div>       
	            </div>
	
	            <!-- 바로가기 아이콘 -->
	            <nav style="height: auto; overflow-y: hidden; overflow-x: auto;" class="mt-3">
	                <div class="d-flex justify-content-between exhibition-icon row">
	                    <div class="col">
	                        <div><a href="/exhibitions/detail?exhibitionCode=1552"><img src="/resources/images/store/storeHome/1+1shopIcon.jpg" alt=""></a></div>
	                        <div class="text">1+1 샵</div>
	                    </div>
	                    <div class="col">
	                        <div><a href="/exhibitions/detail?exhibitionCode=2181"><img src="/resources/images/store/storeHome/ogoodsIcon2.jpg" alt=""></a></div>
	                        <div class="text">오!굿즈</div>
	                    </div>
	                    <div class="col">
	                        <div><a href="/exhibitions/detail?exhibitionCode=1763"><img src="/resources/images/store/storeHome/fastDeliIcon.jpg" alt=""></a></div>
	                        <div class="text">빠른배송</div>
	                    </div>
	                    <div class="col">
	                        <div><a href="/exhibitions/detail?exhibitionCode=2415"><img src="/resources/images/store/storeHome/premiumIcon.jpg" alt=""></a></div>
	                        <div class="text">프리미엄</div>
	                    </div>
	                    <div class="col">
	                        <div><a href="/exhibitions/detail?exhibitionCode=1433"><img src="/resources/images/store/storeHome/refurbishedIcon.jpg" alt=""></a></div>
	                        <div class="text">리퍼마켓</div>
	                    </div>
	                    <div class="col">
	                        <div><a href="/exhibitions/detail?exhibitionCode=2746"><img src="/resources/images/store/storeHome/newLineIcon.jpg" alt=""></a></div>
	                        <div class="text">신상특가</div>
	                    </div>
						<!-- 카테고리 이동-->
						<div class="col">
	                        <div><a href="/category/main?category=1"><img src="/resources/images/store/storeHome/fallFabric.jpg" alt=""></a></div>
	                        <div class="text">가을이불</div>
	                    </div>
						<div class="col">
	                        <div><a href="/category/main?category=27"><img src="/resources/images/store/storeHome/bestLight.jpg" alt=""></a></div>
	                        <div class="text">인기조명</div>
	                    </div>
	                </div>       
	            </nav>
	
	            <div style="height: 20px;" class="todayDealStart">
	                <h5 class="d-inline-flex float-start"><b>오늘의 딜</b></h5>
	                <a href="/todayDeals" class="d-inline-flex float-end a_tag">더보기</a>
	            </div>
	
	            <div class="d-flex justify-content-center center_menu row" id="center_menu"></div>
	
	            <div style="height: 20px; width: 100%;" class="category">
	                <h5 class="d-inline-flex float-start"><b>카테고리</b></h5>
	            </div>
	            
	            <div style="height: auto;">
	                <div class="d-flex justify-content-between menu_cate">
	                    <a href="/category/main?category=0"><img src="/resources/images/store/storeHome/furnitureIcon.png" alt=""></a>
	                    <a href="/category/main?category=1"><img src="/resources/images/store/storeHome/fabricIcon.png" alt=""></a>
	                    <a href="/category/main?category=3"><img src="/resources/images/store/storeHome/homeAppliancesIcon.png" alt=""></a>
	                    <a href="/category/main?category=27"><img src="/resources/images/store/storeHome/lightIcon.png" alt=""></a>
	                    <a href="/category/main?category=11"><img src="/resources/images/store/storeHome/drawerIcon.png" alt=""></a>
	                    <a href="/category/main?category=25"><img src="/resources/images/store/storeHome/rentalIcon.png" alt=""></a>
	                </div>
	            </div>
	            <div class="d-flex justify-content-between menu_cate_bottom">
	                <a class="cateA" href="/category/main?category=0">가구</a>
	                <a class="cateA" href="/category/main?category=1">패브릭</a>
	                <a class="cateA" href="/category/main?category=3">가전</a>
	                <a class="cateA" href="/category/main?category=27">조명</a>
	                <a class="cateA" href="/category/main?category=11">서랍장</a>
	                <a class="cateA" href="/category/main?category=25">렌탈</a>
	            </div>
	
	            <div style="height: 20px; width: 100%;" class="popularItemText">
	                <h5 class="d-inline-flex float-start"><b>인기 상품</b></h5>
	            </div>
	
	            <div id="productList"></div>
	
	            <!--PageNation-->
	            <div class="paging">
	                <nav aria-label="Page navigation example">
	                <ul class="pagination">
	                    <li class="page-item">
	                    <a class="page-link text-success" href="#" aria-label="Previous">
	                        <span aria-hidden="true">&laquo;</span>
	                    </a>
	                    </li>
	                    <li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
	                    <li class="page-item"><a class="page-link text-success" href="#">2</a></li>
	                    <li class="page-item"><a class="page-link text-success" href="#">3</a></li>
	                    <li class="page-item"><a class="page-link text-success" href="#">4</a></li>
	                    <li class="page-item"><a class="page-link text-success" href="#">5</a></li>
	                    <li class="page-item">
	                    <a class="page-link text-success" href="#" aria-label="Next">
	                        <span aria-hidden="true">&raquo;</span>
	                    </a>
	                    </li>
	                </ul>
	                </nav>
	            </div>
            </div>
        </div>
    </section>

    <c:import url="../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
	<script src="/resources/js/store/storeHome.js"></script>
	<script>
		getList();
		getTodayList();
	</script>
</body>
</html>