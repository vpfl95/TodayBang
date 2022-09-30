<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인기상품 할인/단독 기획전 | 오늘의 직방 스토어</title>
    <link href="/resources/css/reset.css" rel="stylesheet">
	<link href="/resources/images/MiniLogo.png" rel="shortcut icon" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/store/exhibitionsHome.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
	<c:import url="../../template/header.jsp"></c:import>

    <section class="container-fluid container-lg-8 mt-5">
		<div class = "row justify-content-center mt-5">
			<div class = "col-lg-9 row d-flex justify-content-between exhibitions-item-wrap">
                <div class="col-6 exhibitions-item-product">
                    <a href="detail?exhibitionCode=2689">
                        <div class="exhibitions-item-title">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/Samsung_6.jpg" alt="">
                            <div>
                                <h4 class="exhibitions-item-text">삼성전자 슈퍼세일</h4>
                                <p class="exhibitions-item-subText">비스포크 인기가전 한정 특가</p>
                            </div>
                        </div>
                        
                        <div class="d-flex justify-content-center exhibitions-item-list">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/samsung_1.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/samsung_2.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/samsung_3.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/samsung_4.jpg" alt="">
                        </div>
                    </a>
                </div>

                <div class="col-6">
                    <a href="detail?exhibitionCode=2181">
                    	<div class="exhibitions-item-title">
	                        <img src="/resources/images/store/exhibitions/exhibitionsHome/ogoods_1.jpg" alt="">
	                        <div>
	                            <h4 class="exhibitions-item-text">오직 여기서만, O!Goods</h4>
	                            <p class="exhibitions-item-subText">오늘의 직방 큐레이션 편집샵 오!굿즈</p>
	                        </div>
	                    </div>
	                    <div class="d-flex justify-content-center exhibitions-item-list">
	                        <img src="/resources/images/store/exhibitions/exhibitionsHome/ogoods_2.jpg" alt="">
	                        <img src="/resources/images/store/exhibitions/exhibitionsHome/ogoods_3.jpg" alt="">
	                        <img src="/resources/images/store/exhibitions/exhibitionsHome/ogoods_4.jpg" alt="">
	                        <img src="/resources/images/store/exhibitions/exhibitionsHome/ogoods_5.jpg" alt="">
	                    </div>
                    </a>
                </div>
			</div>

            <div class = "col-lg-9 row d-flex justify-content-between exhibitions-item-wrap">
                <div class="col-6 exhibitions-item-product">
                	<a href="detail?exhibitionCode=1763">
	                	<div class="exhibitions-item-title">
	                        <img src="/resources/images/store/exhibitions/exhibitionsHome/fastDeli_1.jpg" alt="">
	                        <div>
	                            <h4 class="exhibitions-item-text">가구&가전 빠른배송 ~89%</h4>
	                            <p class="exhibitions-item-subText">오늘 주문하면, 내일 도착</p>
	                        </div>
	                    </div>
	                    <div class="d-flex justify-content-center exhibitions-item-list">
	                        <img src="/resources/images/store/exhibitions/exhibitionsHome/fastDeli_2.jpg" alt="">
	                        <img src="/resources/images/store/exhibitions/exhibitionsHome/fastDeli_3.jpg" alt="">
	                        <img src="/resources/images/store/exhibitions/exhibitionsHome/fastDeli_4.jpg" alt="">
	                        <img src="/resources/images/store/exhibitions/exhibitionsHome/fastDeli_5.jpg" alt="">
	                    </div>
                	</a>
                </div>

                <div class="col-6">
                    <a href="detail?exhibitionCode=1433">
                        <div class="exhibitions-item-title">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/refur_1.jpg" alt="">
                            <div>
                                <h4 class="exhibitions-item-text">빠른 품절! 리퍼마켓 ~85%</h4>
                                <p class="exhibitions-item-subText">전시, 반품, 스크래치 득템의 기회!</p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center exhibitions-item-list">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/refur_2.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/refur_3.jpeg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/refur_4.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/refur_5.jpg" alt="">
                        </div>
                    </a>
                </div>
			</div>

            <div class = "col-lg-9 row d-flex justify-content-between exhibitions-item-wrap">
                <div class="col-6 exhibitions-item-product">
                    <a href="detail?exhibitionCode=2394">
                        <div class="exhibitions-item-title">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/just_1.jpg" alt="">
                            <div>
                                <h4 class="exhibitions-item-text">[빠른배송] 저스트슬립 ~49%</h4>
                                <p class="exhibitions-item-subText">완벽한 숙면을 위한 매트리스</p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center exhibitions-item-list">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/just_2.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/just_3.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/just_4.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/just_5.jpg" alt="">
                        </div>
                    </a>
                </div>

                <div class="col-6">
                    <a href="detail?exhibitionCode=2393">
                        <div class="exhibitions-item-title">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/oat_1.jpg" alt="">
                            <div>
                                <h4 class="exhibitions-item-text">[빠른배송] 오트밀하우스 ~82%</h4>
                                <p class="exhibitions-item-subText">일상에 영감을 주는 가구</p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center exhibitions-item-list">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/oat_2.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/oat_3.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/oat_4.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/oat_5.jpg" alt="">
                        </div>
                    </a>
                </div>
			</div>

            <div class = "col-lg-9 row d-flex justify-content-between exhibitions-item-wrap">
                <div class="col-6 exhibitions-item-product">
                    <div class="exhibitions-item-title">
                        <img src="/resources/images/store/exhibitions/exhibitionsHome/newLine_1.jpg" alt="">
                        <div>
                            <h4 class="exhibitions-item-text">딩동~ 입점했어요! 이번주 신규 브랜드</h4>
                            <p class="exhibitions-item-subText">론칭기념 일주일간 단독 특가</p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center exhibitions-item-list">
                        <img src="/resources/images/store/exhibitions/exhibitionsHome/newLine_2.jpg" alt="">
                        <img src="/resources/images/store/exhibitions/exhibitionsHome/newLine_3.jpg" alt="">
                        <img src="/resources/images/store/exhibitions/exhibitionsHome/newLine_4.jpg" alt="">
                        <img src="/resources/images/store/exhibitions/exhibitionsHome/newLine_5.jpg" alt="">
                    </div>
                </div>

                <div class="col-6"> 
                    <a href="detail?exhibitionCode=1958">
                        <div class="exhibitions-item-title">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/light1.jpg" alt="">
                            <div>
                                <h4 class="exhibitions-item-text">한번 바꾸면 최소 3년! 우리집 조명 LED로 바꾸기</h4>
                                <p class="exhibitions-item-subText">지금 사면 반짝! 추가 할인</p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center exhibitions-item-list">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/light2.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/light3.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/light4.jpg" alt="">
                            <img src="/resources/images/store/exhibitions/exhibitionsHome/light5.png" alt="">
                        </div>
                    </a>
                </div>
			</div>

            <div class = "col-lg-9 row d-flex justify-content-between exhibitions-item-wrap">
                <div class="col-6">
                    <div class="exhibitions-item-title">
                        <img src="/resources/images/store/exhibitions/exhibitionsHome/premium_1.jpg" alt="">
                        <div>
                            <h4 class="exhibitions-item-text">럭셔리 가구, 조명도 오늘의 직방 프리미엄!</h4>
                            <p class="exhibitions-item-subText">최대 ~74% 할인중</p>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center exhibitions-item-list">
                        <img src="/resources/images/store/exhibitions/exhibitionsHome/premium_2.jpg" alt="">
                        <img src="/resources/images/store/exhibitions/exhibitionsHome/premium_3.jpg" alt="">
                        <img src="/resources/images/store/exhibitions/exhibitionsHome/premium_4.jpg" alt="">
                        <img src="/resources/images/store/exhibitions/exhibitionsHome/premium_5.jpg" alt="">
    
                    </div>
                </div>
            </div>
		</div>
	</section>
	
    <c:import url="../../template/footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>