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
    <section class="container-fluid container-lg-8">
        <div class="row justify-content-center">
    		<img src="/resources/images/store/storeHome/fabricSale.png" alt="" style="width: 100%; height: 340px; margin-top: 55px;">
            <div class="col-lg-9">
            	<!-- Carousel 이미지 변경 버튼 -->
	            <div class="exhibition">
	                <div class="d-flex justify-content-center menu" style="text-align: center;">
	                    <div>패브릭 세일</div>
	                    <div>인기가전 특가</div>
	                    <div>리퍼마켓</div>
	                    <div>프리미엄 핫딜</div>
	                    <div>오!굿즈</div>
	                    <div>빠른배송</div>
	                    <div>신규 브랜드</div>
	                    <div>삼성 가전</div>
	                    <div><</div>
	                    <div>></div>
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
	                        <div><a href="#"><img src="/resources/images/store/storeHome/newLine.jpg" alt=""></a></div>
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
	                <h5 class="d-inline-flex float-start"><b>👍오늘의 딜</b></h5>
	                <a href="/todayDeals" class="d-inline-flex float-end a_tag">📌더보기</a>
	            </div>
	
	            <div class="d-flex justify-content-center center_menu row" style="height: 343px;">
	                <div class="col d-sm-6 d-lg-6 menu-div">
	                    <div class="center_menu_img"><img src="/resources/images/test2.jpeg" alt=""></div>
	                    <div>
	                        <div class="brand">먼데이하우스</div>
	                        <div class="productName">오늘의 직방 최다리뷰! 인기 총합 가구 BIG SALE</div>
	                        <div>
	                            <div class="saleRate"><b>61%</b></div>
	                            <div class="price"><b>10300 외</b></div>
	                        </div>
	                        <div>
	                            <div class="grade"><b>4.6</b></div>
	                            <div class="reviewNum">리뷰 187350</div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col d-sm-6 d-lg-6 menu-div">
	                    <div class="center_menu_img"><img src="/resources/images/testProductImage.jpg" alt=""></div>
	                    <div>
	                        <div class="brand"></div>
	                        <div class="product"></div>
	                        <div class="saleRate"></div>
	                        <div class="price"></div>
	                        <div class="grade"></div>
	                        <div class="reviewNum"></div>
	                    </div>
	                </div>
	                <div class="col d-sm-6 d-lg-6 menu-div">
	                    <div class="center_menu_img"><img src="/resources/images/testProductImage.jpg" alt=""></div>
	                    <div>
	                        <div class="brand"></div>
	                        <div class="product"></div>
	                        <div class="saleRate"></div>
	                        <div class="price"></div>
	                        <div class="grade"></div>
	                        <div class="reviewNum"></div>
	                    </div>
	                </div>
	                <div class="col d-sm-6 d-lg-6 menu-div">
	                    <div class="center_menu_img"><img src="/resources/images/testProductImage.jpg" alt=""></div>
	                    <div>
	                        <div class="brand"></div>
	                        <div class="product"></div>
	                        <div class="saleRate"></div>
	                        <div class="price"></div>
	                        <div class="grade"></div>
	                        <div class="reviewNum"></div>
	                    </div>
	                </div>
	            </div>
	
	            <div style="height: 20px; width: 100%;" class="category">
	                <h5 class="d-inline-flex float-start"><b>🏷카테고리</b></h5>
	            </div>
	            
	            <div style="height: 122px;">
	                <div class="d-flex justify-content-between menu_cate">
	                    <div><img src="/resources/images/store/storeHome/furnitureIcon.png" alt=""></div>
	                    <div><img src="/resources/images/store/storeHome/fabricIcon.png" alt=""></div>
	                    <div><img src="/resources/images/store/storeHome/homeAppliancesIcon.png" alt=""></div>
	                    <div><img src="/resources/images/store/storeHome/lightIcon.png" alt=""></div>
	                    <div><img src="/resources/images/store/storeHome/drawerIcon.png" alt=""></div>
	                    <div><img src="/resources/images/store/storeHome/rentalIcon.png" alt=""></div>
	                </div>
	            </div>
	            <div class="d-flex justify-content-between menu_cate_bottom">
	                <div><b>가구</b></div>
	                <div><b>패브릭</b></div>
	                <div><b>가전</b></div>
	                <div><b>조명</b></div>
	                <div><b>서랍장</b></div>
	                <div><b>렌탈</b></div>
	            </div>
	
	            <div style="height: 20px; width: 100%;" class="popularItemText">
	                <h5 class="d-inline-flex float-start"><b>🔥인기 상품</b></h5>
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
	</script>
</body>
</html>